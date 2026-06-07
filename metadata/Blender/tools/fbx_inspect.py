#!/usr/bin/env python3
"""
fbx_inspect.py - inspect a binary FBX without opening Blender or the game.

WHY THIS EXISTS
---------------
Foundation silently drops geometry that is structured in ways its importer
doesn't like (e.g. a mesh nested under a LOD_X node, or instanced geometry
whose transforms got mangled by Blender's "Apply Transform" export option).
The game gives no error - the parts just don't appear. This script lets you
look *inside* an exported .fbx and catch those problems before launching the
game, by printing:

  * the FBX version and the global axis/unit settings,
  * how many meshes / empties / lights it contains,
  * the node hierarchy and how deep it goes,
  * any nodes named like LOD_X,
  * (optionally) the per-node Translation/Rotation/Scale and the raw geometry
    bounding box, which is how you spot Apply-Transform damage.

USAGE
-----
  python3 fbx_inspect.py model.fbx                 # summary
  python3 fbx_inspect.py model.fbx --tree          # + full node hierarchy
  python3 fbx_inspect.py model.fbx --xform Window  # transforms+bbox for matching nodes

Requires only Python 3 (standard library). Works on Blender-exported binary
FBX (version 7100-7700). It does NOT handle the rare ASCII FBX text format.

Author: generated for The Arcanum Estate mod project, 2026-06-07.
"""

import sys, struct, zlib
from collections import Counter


# ---------------------------------------------------------------------------
# 1. LOW-LEVEL READER
# ---------------------------------------------------------------------------
# A binary FBX is: a 27-byte header, then a flat stream of "node records".
# Each record can contain "properties" (its data) and nested child records.
# We read it with a tiny cursor over the raw bytes.
class Reader:
    def __init__(self, data):
        self.d = data
        self.p = 0                       # current byte offset
    def take(self, n):
        b = self.d[self.p:self.p + n]; self.p += n; return b
    def u1(self): return struct.unpack('<B', self.take(1))[0]   # uint8
    def u4(self): return struct.unpack('<I', self.take(4))[0]   # uint32
    def u8(self): return struct.unpack('<Q', self.take(8))[0]   # uint64


# ---------------------------------------------------------------------------
# 2. PROPERTY DECODER
# ---------------------------------------------------------------------------
# Each property starts with a 1-char type code telling us how to read it:
#   Y=int16  C=bool  I=int32  F=float32  D=float64  L=int64
#   S=string R=raw-bytes
#   f/d/l/i/b = ARRAYS of float/double/long/int/bool (optionally zlib-deflated)
# We decode numeric arrays in full (we need vertex arrays for bounding boxes).
def read_props(r, count):
    out = []
    for _ in range(count):
        t = chr(r.u1())
        if   t == 'Y': out.append(struct.unpack('<h', r.take(2))[0])
        elif t == 'C': out.append(bool(r.u1()))
        elif t == 'I': out.append(struct.unpack('<i', r.take(4))[0])
        elif t == 'F': out.append(struct.unpack('<f', r.take(4))[0])
        elif t == 'D': out.append(struct.unpack('<d', r.take(8))[0])
        elif t == 'L': out.append(struct.unpack('<q', r.take(8))[0])
        elif t in 'fdlib':
            length = r.u4(); encoding = r.u4(); comp_len = r.u4()
            raw = r.take(comp_len)
            if encoding == 1:                 # 1 = zlib-deflated payload
                raw = zlib.decompress(raw)
            if   t == 'd': out.append(list(struct.unpack('<%dd' % length, raw)))
            elif t == 'f': out.append(list(struct.unpack('<%df' % length, raw)))
            else:          out.append('<%s-array len=%d>' % (t, length))
        elif t in 'SR':
            length = r.u4(); raw = r.take(length)
            # FBX object names are stored as "Name\x00\x01Class"; keep the name.
            out.append(raw.split(b'\x00\x01')[0].decode('utf-8', 'replace')
                       if t == 'S' else '<raw %d bytes>' % length)
        else:
            raise ValueError('unknown property type %r at byte %d' % (t, r.p))
    return out


# ---------------------------------------------------------------------------
# 3. NODE READER (recursive)
# ---------------------------------------------------------------------------
# A node record header stores the byte offset where the record ENDS, the number
# of properties, the length of the property block, then the node name. After the
# properties come nested child records, until we reach the end offset. A record
# of all-zero header fields is the "null record" that terminates a child list.
# FBX >= 7500 uses 64-bit offsets; older versions use 32-bit.
def read_node(r, ver):
    if ver >= 7500:
        end, nprops, _plen = r.u8(), r.u8(), r.u8()
    else:
        end, nprops, _plen = r.u4(), r.u4(), r.u4()
    name_len = r.u1()
    if end == 0 and nprops == 0 and name_len == 0:
        return None                                  # null terminator record
    name = r.take(name_len).decode('utf-8', 'replace')
    props = read_props(r, nprops)
    node = {'name': name, 'props': props, 'children': []}
    while r.p < end:
        child = read_node(r, ver)
        if child is None:
            break
        node['children'].append(child)
    r.p = end
    return node


def parse_fbx(path):
    data = open(path, 'rb').read()
    if data[:20] != b'Kaydara FBX Binary  ':
        sys.exit('Not a binary FBX (ASCII FBX is not supported).')
    version = struct.unpack('<I', data[23:27])[0]    # uint32 right after header
    r = Reader(data); r.p = 27                        # 27-byte header
    top = {}
    while True:
        n = read_node(r, version)
        if n is None:
            break
        top[n['name']] = n
        if r.p >= len(data) - 160:                    # stop before the footer
            break
    return version, top


# ---------------------------------------------------------------------------
# 4. HELPERS to pull meaning out of the parsed tree
# ---------------------------------------------------------------------------
def prop70(model, key):
    """Read a transform channel (e.g. 'Lcl Translation') from a Model node.
    These live as 'P' records inside a 'Properties70' block; the 3 values are
    the last 3 of the P record's properties."""
    for c in model['children']:
        if c['name'] == 'Properties70':
            for p in c['children']:
                if p['name'] == 'P' and p['props'] and p['props'][0] == key:
                    return [round(float(x), 3) for x in p['props'][4:7]]
    return None


def geom_bbox(geom):
    """Vertex count and axis-aligned bounding box of a Geometry node's raw
    vertices (the 'Vertices' child holds a flat [x,y,z, x,y,z, ...] array)."""
    for c in geom['children']:
        if c['name'] == 'Vertices' and c['props'] and isinstance(c['props'][0], list):
            v = c['props'][0]
            xs, ys, zs = v[0::3], v[1::3], v[2::3]
            return len(v) // 3, (round(min(xs), 2), round(max(xs), 2),
                                 round(min(ys), 2), round(max(ys), 2),
                                 round(min(zs), 2), round(max(zs), 2))
    return 0, None


def collect(top):
    """Index Models/Geometry, and rebuild parent->child links from the
    'Connections' block (FBX stores hierarchy as a flat list of OO edges)."""
    models, geoms = {}, {}
    for c in top['Objects']['children']:
        if c['name'] == 'Model':
            models[c['props'][0]] = c
        elif c['name'] == 'Geometry':
            geoms[c['props'][0]] = c
    edges = [(c['props'][0], c['props'][1], c['props'][2])
             for c in top['Connections']['children'] if c['name'] == 'C']
    children = {oid: [] for oid in models}; children[0] = []  # 0 = scene root
    geo_of = {}
    for ctype, a, b in edges:
        if ctype == 'OO' and a in models and (b in models or b == 0):
            children.setdefault(b, []).append(a)
        if ctype == 'OO' and a in geoms and b in models:
            geo_of[b] = a
    return models, geoms, children, geo_of


def name_of(model):
    return (model['props'][1] if len(model['props']) > 1 else '').split('::')[-1]
def subtype_of(model):
    return model['props'][2] if len(model['props']) > 2 else ''


# ---------------------------------------------------------------------------
# 5. REPORTS
# ---------------------------------------------------------------------------
def summary(version, top):
    print('FBX version :', version)
    gs = top.get('GlobalSettings')
    if gs:
        axes = {}
        for c in gs['children']:
            if c['name'] == 'Properties70':
                for p in c['children']:
                    if p['name'] == 'P' and p['props'] and p['props'][0] in (
                        'UpAxis','FrontAxis','CoordAxis','UnitScaleFactor'):
                        axes[p['props'][0]] = p['props'][4] if len(p['props']) > 4 else '?'
        # 0=X 1=Y 2=Z ; UnitScaleFactor 1.0 means cm in FBX terms
        print('Axes        : Up=%s Front=%s Coord=%s (0=X 1=Y 2=Z)  UnitScale=%s'
              % (axes.get('UpAxis'), axes.get('FrontAxis'),
                 axes.get('CoordAxis'), axes.get('UnitScaleFactor')))
    models, geoms, children, geo_of = collect(top)
    subs = Counter(subtype_of(m) for m in models.values())
    print('Models      :', len(models), dict(subs))
    print('Geometry    :', len(geoms))
    lods = [name_of(m) for m in models.values() if 'lod' in name_of(m).lower()]
    print('LOD_* nodes :', len(lods), lods[:20])

    def depth(oid):
        ch = children.get(oid, [])
        return 1 + max((depth(c) for c in ch), default=0)
    md = max((depth(c) for c in children.get(0, [])), default=0)
    hist = Counter()
    def walk(oid, d):
        hist[d] += 1
        for c in children.get(oid, []):
            walk(c, d + 1)
    for c in children.get(0, []):
        walk(c, 0)
    print('Max depth   :', md, '(levels of nodes below the scene root)')
    print('Per depth   :', dict(sorted(hist.items())), '(0 = top-level objects)')
    with_geo = set(geo_of.keys())
    empties = [name_of(models[m]) for m in models if m not in with_geo]
    print('Meshes w/geo:', len(with_geo), '/', len(models))
    print('Empties     :', len(empties), '->', empties[:15])
    return models, geoms, children, geo_of


def tree(top, models, children):
    def rec(oid, d):
        m = models.get(oid)
        nm = name_of(m) if m else 'SCENE_ROOT'
        sub = subtype_of(m) if m else ''
        print('  ' + '   ' * d + '- [%s] %s' % (sub, nm))
        for c in children.get(oid, []):
            rec(c, d + 1)
    print('\nHIERARCHY')
    for c in children.get(0, []):
        rec(c, 0)


def xform(top, models, geoms, geo_of, needle):
    print('\nTRANSFORMS matching %r  (T=translate R=rotate(deg) S=scale)' % needle)
    n = 0
    for oid, m in models.items():
        nm = name_of(m)
        if needle.lower() not in nm.lower():
            continue
        n += 1
        if n > 30:
            print('  ...(truncated)'); break
        line = '  [%s] %-32s T=%s R=%s S=%s' % (
            subtype_of(m), nm[:32],
            prop70(m, 'Lcl Translation'), prop70(m, 'Lcl Rotation'),
            prop70(m, 'Lcl Scaling'))
        if oid in geo_of:
            vc, bb = geom_bbox(geoms[geo_of[oid]])
            line += ' | verts=%d bbox=%s' % (vc, bb)
        print(line)
    if n == 0:
        print('  (no nodes matched)')


def main(argv):
    if len(argv) < 2:
        print(__doc__); return
    path = argv[1]
    version, top = parse_fbx(path)
    print('FILE:', path)
    models, geoms, children, geo_of = summary(version, top)
    if '--tree' in argv:
        tree(top, models, children)
    if '--xform' in argv:
        needle = argv[argv.index('--xform') + 1]
        xform(top, models, geoms, geo_of, needle)


if __name__ == '__main__':
    main(sys.argv)

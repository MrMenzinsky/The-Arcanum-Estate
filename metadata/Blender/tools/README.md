# FBX inspection tool (`fbx_inspect.py`)

A tiny, dependency-free Python script for looking *inside* a binary `.fbx`
without opening Blender or launching Foundation. It exists to catch the export
problems that the game fails on **silently** (no error, the part just doesn't
appear): geometry nested too deep, meshes parented under a `LOD_X` node, and
the transform damage that Blender's **Apply Transform** option does to
instanced / child-of-child geometry.

See the full background in [[blender-fbx-export-guide]].

## Requirements

- Python 3 (any recent version). **No Blender, no pip installs, no FBX SDK.**
- A **binary** FBX (what Blender exports by default). ASCII FBX is not supported.

## Usage

```bash
python3 fbx_inspect.py path/to/model.fbx                 # summary
python3 fbx_inspect.py path/to/model.fbx --tree          # + full node hierarchy
python3 fbx_inspect.py path/to/model.fbx --xform Window  # transforms + bbox for matching nodes
```

`--xform <text>` matches any node whose name contains `<text>` (case-insensitive)
and prints its Translation / Rotation / Scale plus the raw geometry bounding box.

## How to read the output

```
FBX version : 7400
Axes        : Up=1 Front=0 Coord=2 (0=X 1=Y 2=Z)  UnitScale=1.0
Models      : 371 {'Null': 87, 'Mesh': 283, 'Light': 1}
Geometry    : 207
LOD_* nodes : 0 []
Max depth   : 3 (levels of nodes below the scene root)
Per depth   : {0: 32, 1: 231, 2: 108} (0 = top-level objects)
Meshes w/geo: 283 / 371
Empties     : 88 -> [...]
```

- **Axes** — `Up`/`Front`/`Coord` use `0=X 1=Y 2=Z`. Foundation expects a **Y-up**
  source (`Up=1`). `UnitScale=1.0` is normal for a Blender export.
- **Models** — every node is a "Model": `Mesh` (carries geometry), `Null` (an
  empty / marker), or `Light` (Foundation ignores these — delete them).
- **Geometry vs Meshes** — there can be fewer Geometry datablocks than Mesh
  nodes when meshes are instanced (several nodes share one geometry).
- **LOD_\* nodes** — how many nodes are named like `LOD_0`. Zero here means no
  LODs are set up yet.
- **Max depth / Per depth** — `0` = top-level objects, `1` = their children, etc.
  Watch for meshes that sit deeper than you intend.
- **Empties** — counts Nulls + the stray Light (anything without geometry).

### Spotting the two failure modes

1. **Mesh under a `LOD_X`** (run `--tree`): a `LOD_X` node must be a *leaf*.
   If you see a mesh parented beneath a `LOD_X`, the importer will discard it.
2. **Apply-Transform damage to instances** (run `--xform <name>`): a healthy
   instanced part keeps the placement on its **empty** (e.g. `S=[100,100,100]`)
   with clean unit-local meshes (small bbox, `S=1`). The damaged version shows
   leaf meshes carrying `S=[0.01,...]` plus large translations and 100x-inflated
   bboxes - that mismatch is the fingerprint of Apply Transform mis-baking a
   child-of-child chain, and those meshes won't render correctly.

## How the code works (FBX binary format, briefly)

A binary FBX is a 27-byte header (`Kaydara FBX Binary  `, then a uint32 version)
followed by a flat stream of **node records**. The script walks it like this:

1. **`Reader`** is a cursor over the raw bytes with helpers for the little-endian
   integers FBX uses.
2. **`read_node`** reads one record header: the byte offset where the record
   *ends*, the property count, the name, then the properties, then it recurses
   into nested child records until it reaches that end offset. A record of
   all-zero header fields is the "null record" that ends a list of children.
   (FBX >= 7500 uses 64-bit offsets; older files use 32-bit - we handle both.)
3. **`read_props`** decodes each property by its 1-char type code
   (`I`=int32, `D`=float64, `S`=string, `d`=double-array, etc.). Numeric arrays
   may be zlib-compressed, so we inflate them; we fully decode vertex arrays so
   we can compute bounding boxes.
4. The interesting top-level records are **`Objects`** (all the Models and
   Geometry) and **`Connections`**. FBX does **not** nest objects directly -
   instead `Connections` holds a flat list of `OO` ("object-object") edges, e.g.
   "mesh 1234 is a child of empty 5678". `collect()` rebuilds the parent->child
   tree from those edges (parent id `0` is the scene root).
5. Per-node transforms live as `P` records inside a `Properties70` block
   (`Lcl Translation`, `Lcl Rotation`, `Lcl Scaling`); `prop70()` pulls them out.
   Raw vertices live in a `Vertices` child of each `Geometry`; `geom_bbox()`
   reads them to report vertex count + bounding box.

That's the whole format that matters for static models. Animation, materials,
and textures are present in the file but this tool ignores them on purpose -
it's a structural/transform sanity checker, not a full importer.

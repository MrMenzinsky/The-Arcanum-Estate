---
title: Blender → FBX Export Guide (Foundation / Hurricane)
tags:
  - meta
  - reference
  - asset-pipeline
  - blender
  - fbx
created: 2026-06-07
updated: 2026-06-07
status: reference
sources:
  - "Diagnosis of scholastic_houses_tier_1_005.fbx (renders) vs _006.fbx (broken), 2026-06-07"
  - "Anton's PoC: temp/ FBX experiments + notes.md + engine-generated .fbx.meta files"
  - "https://www.polymorph.games/foundation/modding/level-of-detail"
---

# Blender → FBX Export Guide (Foundation / Hurricane)

Practical reference for getting Blender models into Foundation, including the LOD pipeline, the **Apply Transform** trap, and the nested-hierarchy / collection-instance behaviour. Built from a direct byte-level comparison of the actual `scholastic_houses_tier_1` exports plus Anton's `temp/` proof-of-concept (the `Sphere_LOD` experiments, `notes.md`, and the engine's own `.fbx.meta` import records). Companion to [[3d-modeling-pipeline]]; resolves the **LOD blocker** in [[master-to-do]].

> [!IMPORTANT] The one-paragraph answer
> Two *separate* things were breaking your models, and neither is a broken FBX exporter or a reason to buy Maya:
> 1. **Apply Transform breaks deeply-nested / instanced geometry.** Your windows are collection instances. With Blender's **Apply Transform** export option **ON** (the community-recommended setting) Blender mis-bakes the transforms of child-of-child / instanced nodes, so the windows get a broken scale + offset and vanish. With Apply Transform **OFF** they render. That — not hierarchy depth — is the difference between your `005` (renders) and `006` (broken) exports; the two files have *identical* node hierarchies.
> 2. **`LOD_X` nodes are terminal.** Foundation consumes a `LOD_X` node as a level-of-detail mesh and will **not render anything parented beneath it**. That is why your test 3 (a sub-tree under each `LOD_X`) failed: a LOD level must be one mesh, not a tree.

---

## 1. Diagnosis: why `006` lost the windows but `005` didn't

Both files were parsed straight off disk. Structurally they are **identical**: 371 model nodes (283 mesh, 87 empty, 1 stray `Sun` light), 207 geometries, **three levels deep**, same 32 top-level objects. Depth did not change between them, so depth is not what dropped the windows. The difference is entirely in the **baked transforms**, which is the fingerprint of the **Apply Transform** export option.

Compare the *same* window (`Rustic_Stone_Window_Chubby_Small`, a collection instance) in each file:

| | `005` — Apply Transform **OFF** (renders) | `006` — Apply Transform **ON** (vanishes) |
| --- | --- | --- |
| Instancer empty | `T=[0, 26.7, -304]  R=[-90,180,0]  S=[100,100,100]` | `T=[0, 26.7, 304]  R=[0,90,0]  S=[1,1,1]` |
| Window meshes | local `T≈0`, `R=0`, **no scaling**, geometry bbox ≈ **±0.4** | each mesh `S=[0.01,0.01,0.01]`, `T≈[303,-27,3]`, baked `R=[-90,90,0]`, geometry bbox ≈ **±40** |
| Meaning | instancer empty holds the placement; meshes are clean unit-local copies → correct | the ×100 instancer scale was destroyed and smeared into the leaf meshes as a 0.01 scale + a ~300-unit offset + 100× geometry → mis-placed / mis-scaled → invisible |

The plain **wall** meshes (`Stone_Wall`, one level under their part-empty — *not* child-of-child) baked **cleanly** in `006`: identity transform, geometry simply scaled up (bbox `±200`), model upright. That is exactly why your walls render in `006` and your windows don't. **Apply Transform handles single-level parent→mesh chains fine, but cannot correctly flatten instancer→instance (child-of-child) chains** — a documented limitation. Your windows are the only child-of-child geometry in the model, so they are the only casualties.

> [!NOTE] Correction to the first version of this guide
> The first draft of this guide claimed the windows failed because they sit at "hierarchy level 3 and the engine drops anything that deep." That was **wrong**: `005` renders those exact level-3 instanced meshes. The real cause is Apply Transform mangling instanced transforms (this section). The genuine *structural* limit is the `LOD_X`-is-terminal rule in §3.

Also still worth cleaning up regardless of approach: there is a stray `Sun` **light** at the top of the scene (Foundation has no custom-light support — see [[foundation-mod-api-reference#No custom light sources]]), and the instanced meshes export with `|Dupli|` pipe characters in their names. Both are noise the importer has to skip.

---

## 2. The "Apply Transform" trade-off (the crux)

Your own experiment log (`temp/metadata/notes.md`) captured this perfectly:

- **Apply Transform unchecked** (Blender default): LOD and deep/instanced geometry work, **but the whole model is rotated 90° on X** (lying on its side).
- **Apply Transform checked** (the "easier to work with" community setting): model stands **upright**, **but deep / instanced geometry (your `LOD_X` and windows) stops showing**.
- Toggling Forward between `-Z` and `X` made **no difference** (experiments 1–3 were identical) — a known Blender quirk where the FBX exporter's Forward/Up dropdowns are largely ignored. **Apply Transform is the decisive switch.**

Why it happens: with Apply Transform **on**, Blender bakes the axis/parent transforms into vertices. For a simple `empty → mesh` chain that bake is exact (your walls). For an `empty → instancer → instance` chain (a "child of child", which every collection instance is) the bake is **not** computed correctly, so the leaf meshes are left with leftover scale/offset that misplaces them.

> [!WARNING] Myth check: "Apply Transform adds extra null nodes"
> A common claim (and one your notes flagged as unverified) is that Apply Transform inserts extra "null" nodes that push objects too deep for Foundation. **That is not what happens here.** `005` and `006` have the *same* node count (371) and the *same* depth. Apply Transform did not add a single node — it **re-baked transforms** incorrectly for child-of-child chains. The symptom looks like "deep objects disappear", but the cause is transform corruption, not added hierarchy.

### Two ways to get an upright model *and* visible windows

**Path A — keep the deep hierarchy / instances (your discovered workaround).**
Leave Blender at defaults (`-Z Forward`, `Y Up`, **Apply Transform OFF**). The model will import rotated, so fix orientation by **rotating the RootNode empty** instead of baking: rotate it so its `-Z` axis points along world `X` and its `Y` axis along world `Z`. Attach-point empties: rotate them to match the RootNode first, then to the direction you want; and **scale them to `0.01` without applying** (otherwise they import as giant snap-balls and rescale your whole building ~100× when it snaps onto a vanilla building's attach point). **This `0.01` is a Path-A-only fix** — see “The 100× / 0.01 scale system” in §3; on Path B you pre-apply all scaling, so attach empties stay `S=1`. Make the RootNode unselectable so you don't accidentally apply its rotation. This preserves instances and deep grouping but is fiddly — which is why you found it cumbersome.

**Path B — flatten the instances so Apply Transform works (recommended for most parts).**
Convert each collection-instance window to real geometry (`Object ▸ Apply ▸ Make Instances Real`, **Keep Hierarchy off**; for the linked `arched_window_*.blend` instances, `Make Local` / library-override first). **Join** each window's pieces into one mesh (`Ctrl+J`) and parent it as a **direct child of the part**, exactly like `Stone_Wall`. Now there are no child-of-child chains, so you can export with **Apply Transform ON** and everything bakes cleanly and upright — no RootNode-rotation dance. You lose Blender-side instancing, but the engine sets **`MergeDuplicateMeshes = true`** on import (confirmed in your `.meta` files), so identical window meshes are re-merged internally — you don't pay much runtime cost for realising them.

Pick per part: Path A when you genuinely need shared/instanced sub-assemblies; Path B (simpler, upright, robust) for everything else.

---

## 3. How Foundation reads the model (and the real structural limits)

The engine's own import record (the generated `models/<file>.fbx.meta`) is the ground truth for what it kept. From your PoC metas:

- The scene is parsed under a **`Prefab` → `<RootNode>` →** children layout, and you must register a processor to get attach points and the building skeleton read:

```lua
mod:registerAssetProcessor("models/" .. filename, { DataType = "BUILDING_ASSET_PROCESSOR" })
mod:registerAssetId("models/" .. filename .. "/Prefab/Sphere_Part", "PREFAB_SPHERE_PART")
```

- Importer defaults baked into the meta: `Scale = 0.01`, `FlipXAxis = true`, `ZUpSource = false` (it expects a **Y-up** source), `GenerateLod = false` (LODs are **not** auto-made — you author them), `MergeDuplicateMeshes = true`, `PatchMeshOffset = true`.

### The 100× / 0.01 scale system (and why attach points are special)

Foundation imports every model at **`Scale = 0.01`** (written in your `.fbx.meta`). To survive that ÷100 and end up the right size in-game, models are authored **~100× oversized** in Blender — which is why your mesh nodes sit at `S=100` (Path A) or carry 100×-inflated geometry baked into the vertices (Path B). Meshes net out correctly: `100 × 0.01 = 1`.

An **attach-point empty has no geometry**, so it isn't part of that “build it 100× big” trick — its scale is read more directly as the snap-marker's scale. That is why the two export paths treat it differently:

- **Path A (Apply Transform OFF):** scale lives on the nodes, so an attach empty left at `S=1` is ~100× too large relative to the down-scaled model. The engine then **rescales your whole building ~100×** when you snap that point onto a vanilla attach point. Fix: set attach empties to **`0.01` unapplied** so they stay in proportion.
- **Path B (Apply Transform ON):** you pre-apply *all* scaling in Blender before export, so every node — attach empties included — exports at **`S=1`** and the geometry carries the size. No per-node `0.01` needed.

So the `0.01` attach rule is a **Path-A-only** consequence of leaving scale on the nodes, not a universal requirement.

### AssetProcessor vs. registering by hand

`registerAssetProcessor(path, { DataType = "BUILDING_ASSET_PROCESSOR" })` is a **convenience, not a requirement**. Per the docs it only auto-adds *components* based on node names: `COMP_BUILDING_PART` to nodes containing `Part`, `COMP_BUILDING_ATTACH_NODE` to nodes containing `Attach` (type taken from `ATTACH_NODE_TYPE`, else `MINOR`), `PATH_A_1`-style nodes become entrances/exits, and same-named `ConstructionSteps/…` nodes become construction visuals.

You **can** skip it and add those components yourself via `registerAssetId` on individual nodes/meshes — more verbose, fully possible.

**But skipping it will not fix the nested-children problem.** The mesh/LOD parsing — including consuming `LOD_X` nodes and discarding anything beneath them — happens one layer below, in the FBX importer that generates the `.meta`, and it runs no matter how you register the asset. The processor sits on top and only adds building components. The levers that actually change nesting are: (1) **don't name nodes `LOD_X`** — the importer then keeps them as ordinary meshes you can nest (proven by `005`), at the cost of built-in LOD; or (2) the importer's per-node **`LodConfig`** field + `GenerateLod` flags hint at assigning LODs via a config object instead of `LOD_X` child-naming, which *might* allow a richer node tree — **undocumented**, so confirm on the modding Discord before relying on it. `[DESIGN QUESTION]`

### Rule A — `LOD_X` is a terminal node (the answer to your test 3)

Your test 3 put a child mesh (`Ball.00N`) under each `LOD_X`:

```text
Cube (mesh)
└─ LOD_0 (mesh)
   └─ Ball.001 (mesh)   ← child UNDER a LOD node
```

The FBX contained all of it (depth 4). But the engine's `.meta` for that export shows the `LOD_0..4` collapsed into a single LOD container (`Cube_0_LODA`) and the **`Ball` meshes are completely absent** — the importer consumed the `LOD_X` nodes as level-of-detail definitions and **discarded everything beneath them**. Test 2 (no children under `LOD_X`) rendered; test 3 did not.

**Conclusion: a `LOD_X` node must be a single mesh.** You cannot hang a parent-child sub-tree off a LOD level. If a LOD needs several pieces, **join them into one mesh** per `LOD_X`. (This is the limit that actually forced your revert — it is real and unavoidable, independent of Apply Transform.)

### Rule B — ordinary meshes can sit deeper than two levels

There is **no** hard "top two layers only" rule for normal meshes: in `005` the window meshes at the third level rendered fine. The earlier "two layers" impression was the Apply-Transform breakage (§1) masquerading as a depth limit. Keep hierarchies reasonable, but the genuine structural constraint is Rule A, not a blanket depth cap.

### LOD distance bands + naming (official)

Hurricane has **5 LOD levels** on fixed camera-distance bands; you have authored **none** yet (your files contain zero `LOD_X` nodes outside the PoC), which is the other half of "LODs don't work":

| Level | Min dist | Max dist |
| --- | --- | --- |
| 0 | 0 | 50 |
| 1 | 50 | 100 |
| 2 | 100 | 200 |
| 3 | 200 | 300 |
| 4 | 300 | ∞ |

**Where the `LOD_X` nodes go depends on your export path** (see §2):

- **Path B (Apply Transform ON / community settings) — recommended.** Merge *all* of a level's geometry into **one mesh per level**, placed **directly under the `Part`** root, named `LOD_0`, `LOD_1`, … So the whole part is `Part → LOD_0`, `Part → LOD_1`, … — every node a single level under the root. That keeps you at the one parent→mesh depth Apply Transform bakes cleanly (§2), which is exactly why a *deeper* LOD tree breaks under these settings. *(Reported by a senior Foundation modder; consistent with our `005`/`006` evidence; **not yet locally parsed** — `[DESIGN QUESTION]` confirm by inspecting one such export with `fbx_inspect.py`.)*
- **Path A (Apply Transform OFF + RootNode rotation).** The deeper form works too — a per-component base mesh with its own `LOD_X` children (`Part → Wall → LOD_0…`), and several such meshes in one part. This is what your PoC proved at three levels, but **only because Apply Transform was off**. Don't use this shape with Apply Transform on.

Naming and behaviour (both paths):

- A `LOD_X` node is named exactly that (`LOD_0`…`LOD_4`); the engine groups LODs by their **parent node**, not by any name prefix — so `Window_LOD_0` as a flat sibling is *not* recognised.
- One mesh can span levels: `LOD_23` covers levels 2–3; `LOD_012` + `LOD_34` is a common detailed/simplified split.
- Omit far levels to make a small prop disappear at distance (only `LOD_0`+`LOD_1` → stops drawing past 100 m).
- Each `LOD_X` is one mesh (Rule A) — no sub-tree beneath it.

> [!IMPORTANT] All LOD meshes must sit at the same position
> Every `LOD_X` must share one origin / pivot and occupy the *same* spot. This is a **universal LOD convention, not a Foundation quirk**: Unreal Engine's docs require that "all LOD meshes should be aligned and occupying the same space with the same pivot point," and Unity (and the FBX LOD-group concept) work the same way. The reason is structural everywhere — an object renders at its origin, so LODs with different pivots would jump to different places when swapped, causing visible **popping**. (Our PoC is merely consistent: all five LODs sat at `T=[0,0,0]`, differing only in vertex count.) A LOD node's transform is exported and applied, so to compare LODs while modelling, offset each one in **Object mode** (never Edit mode, and don't apply), then **clear location (`Alt+G`)** before export so they snap back onto the same origin with the geometry untouched.

---

## 4. Fact-check: the claims you'd heard

**"FBX is proprietary to Autodesk; Blender reverse-engineered it, so it's not 100%." — Mostly true, with nuance.** FBX is proprietary (Kaydara, then Autodesk since 2006). Autodesk's free FBX SDK (2007+) is GPL-incompatible, so Blender ships its own clean-room Python importer/exporter without the SDK. Historically that meant rough edges — but for **static architectural meshes with no armature** (your case) it exports correctly. Your `005` proves it: full hierarchy, instances, materials all came through. The window failure was an export *option* (Apply Transform), not an exporter defect.

**"Maya exports correctly; Blender doesn't." — Half-myth.** Maya uses Autodesk's own SDK and is more robust for rigs/skinning/animation round-trips. For static props there's no meaningful gap, and **Maya would not fix your windows** — it would export the same instanced/Apply-Transform issue or the same `LOD_X` limit. Stay on Blender.

**"Blender is Z-up/-Y-forward; Maya & FBX are Y-up." — True.** Blender is Z-up; FBX/Maya/most engines are Y-up. Blender's exporter converts for you, and Foundation's importer expects a Y-up source (`ZUpSource=false` in your `.meta`). The catch is *how* the conversion is applied — baked into vertices (Apply Transform on) vs. left on the nodes (off) — which is the whole §2 story.

**"Blender uses Z-up because it came from CAD." — False history, true convention.** Blender was never CAD software; it began in 1994 as the in-house tool of an animation studio (Ton Roosendaal / NeoGeo), later open-sourced as a general 3D suite. It *adopted* the Z-up convention standard in architecture/engineering/CAD, but it doesn't descend from CAD.

---

## 5. Recommended export recipe

### If using Path B (flatten — recommended default)

1. **Realise instances:** select the collection-instance windows → `Object ▸ Apply ▸ Make Instances Real` (Keep Hierarchy off; `Make Local`/override the linked `arched_window_*` first). Join each window into one mesh and parent it as a direct child of the part (sibling of `Stone_Wall`).
2. **Delete** the `Sun` light and any cameras.
3. **Author LODs** if needed: one reduced mesh per `LOD_X` child, single mesh each (Rule A), levels per the band table.
4. **Export** `File ▸ Export ▸ FBX` with:

| Setting | Value | Note |
| --- | --- | --- |
| Object Types | Mesh (+ Empty for attach points) | exclude lights/cameras |
| Forward / Up | `-Z Forward` / `Y Up` | engine expects Y-up source |
| Apply Scalings | All Local | |
| **Apply Transform** | **ON** | safe now — no child-of-child left to break; bakes upright |
| Apply Unit / Use Space Transform | ON | |
| Apply Modifiers | ON | bake modifiers into the mesh |

5. **Register** in Lua: `registerAssetProcessor(path, { DataType = "BUILDING_ASSET_PROCESSOR" })` then `registerAssetId(path .. "/Prefab/<RootNode>", "PREFAB_…")`.

### If using Path A (keep instances / deep grouping — your workaround)

Same as above **except**: leave **Apply Transform OFF**, and instead rotate the **RootNode empty** so its `-Z`→world `X` and `Y`→world `Z`; match attach empties to the RootNode rotation then aim them, and **scale attach empties to `0.01` without applying**. Make the RootNode unselectable. This keeps instances/child-of-child intact at the price of the manual orientation setup.

Save your chosen settings as an FBX **Operator Preset** so every part exports identically (the `005`↔`006` drift came from changing settings between exports).

---

## 6. Verify an export without launching the game

- **Re-import the FBX into a clean Blender scene** and check the Outliner: confirm no mesh is parented under a `LOD_X`, and that instances came through where you expect.
- **Diff the FBX against the engine's `.fbx.meta`** after a load: the `<NodeConfig>` tree lists exactly what Foundation kept. Anything in the FBX but missing from the meta was dropped (this is how the `LOD_X`-child loss was proven).
- **Use the saved inspector** (no Blender needed): `python3 metadata/Blender/tools/fbx_inspect.py models/<file>.fbx --tree` (and `--xform <name>` for transforms). It flags meshes-under-`LOD_X`, deep nesting, stray lights, and the Apply-Transform `0.01`-scale fingerprint. `metadata/Blender/tools/README.md` explains every number and how the parser works.
- Red flags: a mesh whose siblings are `LOD_X`; leaf meshes carrying `S=0.01` + large translations (the Apply-Transform-on-instances signature); stray `Light`/`Camera` nodes.

## 7. Pre-export checklist

- [ ] Decide Path A vs B per part; export settings match that path's preset.
- [ ] Collection instances realised + joined (Path B), or RootNode/attach workaround applied (Path A).
- [ ] No mesh parented beneath any `LOD_X` (each LOD level is one mesh).
- [ ] `LOD_X` levels authored if the part needs them (bands in §3).
- [ ] Lights/cameras deleted; clean node names (no `|`).
- [ ] `registerAssetProcessor` + `registerAssetId` present in Lua.
- [ ] Re-import / `.meta` sanity check passed.

## 8. Open questions `[DESIGN QUESTION]`

- Whether Apply-Transform-on can ever be made to flatten instanced chains correctly (e.g. via newer Blender versions or the `Object ▸ Apply ▸ Visual Geometry to Mesh` route) — worth a quick retest before committing to Path A everywhere.
- Confirm with Polymorph (modding Discord) whether `registerAssetProcessor`/`BUILDING_ASSET_PROCESSOR` is required for LOD activation, or only for attach-point parsing.

## Cross-links

- [[3d-modeling-pipeline]] — asset workflow, roof/LOD aesthetic targets, emissive rules
- [[foundation-mod-api-reference]] — `registerAssetId`, `registerAssetProcessor`, light-source constraint
- [[master-to-do]] — the LOD blocker this guide resolves
- [[project-brief]] — tech stack and current focus

## Sources

- Foundation LOD documentation — [polymorph.games/foundation/modding/level-of-detail](https://www.polymorph.games/foundation/modding/level-of-detail)
- Foundation FBX/material override + `registerAssetId` — [polymorph.games/foundation/modding/asset-override](https://www.polymorph.games/foundation/modding/asset-override)
- Foundation Building Asset Processor (Part/Attach/PATH auto-components) — [polymorph.games/foundation/modding/building-asset-processor](https://www.polymorph.games/foundation/modding/building-asset-processor)
- FBX ownership / SDK / reverse-engineering — [FBX (Wikipedia)](https://en.wikipedia.org/wiki/FBX), [FBX (Valve Developer Community)](https://developer.valvesoftware.com/wiki/FBX)
- Blender FBX exporter manual (axes, Apply Transform) — [docs.blender.org FBX](https://docs.blender.org/manual/en/latest/addons/import_export/scene_fbx.html)
- LOD share-one-pivot convention (Unreal/Unity/FBX LOD group) — [Unreal: Importing Static Mesh LODs](https://dev.epicgames.com/documentation/en-us/unreal-engine/importing-static-mesh-lods-using-fbx-in-unreal-engine), [Autodesk FbxLODGroup](https://help.autodesk.com/cloudhelp/2017/ENU/FBX-Developer-Help/cpp_ref/class_fbx_l_o_d_group.html)
- Apply Transform caveats with hierarchies / child-of-child — [devtalk.blender.org](https://devtalk.blender.org/t/fbx-exporter-apply-transform/26640)
- Primary evidence — direct parse of `scholastic_houses_tier_1_005.fbx` vs `_006.fbx`, the `temp/` PoC FBX experiments, `temp/metadata/notes.md`, and the engine-generated `temp/models/*.fbx.meta` import records (2026-06-07)

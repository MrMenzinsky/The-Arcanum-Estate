---
title: Kitbash & Asset-Library Primer (Blender → Foundation)
tags:
  - meta
  - reference
  - asset-pipeline
  - blender
  - kitbash
created: 2026-06-07
status: reference
sources:
  - "Blender Asset Browser (Blender 4.x manual)"
  - "Companion to [[blender-fbx-export-guide]]"
---

# Kitbash & Asset-Library Primer (Blender → Foundation)

A from-zero guide to building and using your own **kitbash asset library** in Blender, aimed squarely at producing Foundation building parts. It assumes no prior asset-library experience and explains **what each step does and why**, because that is how the pieces actually fit together. It is the companion to [[blender-fbx-export-guide]] — this doc is about *authoring and assembling* models; that doc is about *exporting* them.

> [!TIP] How to use this
> Read sections 1–4 once to build the mental model, then keep section 7 (the workflow) and section 9 (pitfalls) open while you work. Everything Foundation-specific is flagged so you can see where general Blender ends and engine quirks begin.

---

## 1. What "kitbashing" is, and why it's the right move for you

**Kitbashing** is building big things out of a library of small, reusable parts — the way a medieval town is "kit-bashed" from a handful of wall, window, door, roof, and trim pieces rearranged endlessly. Instead of modelling each Aethercourt building part from scratch, you model a **kit** of reusable components once, then assemble each part by dragging pieces together.

Why this matters for a solo hobby dev:

- **You model each piece once.** A window you perfect today is reused in every building forever.
- **Consistency for free.** Reused parts guarantee a coherent look — exactly the "reads as one estate" goal in [[3d-modeling-pipeline]].
- **Speed compounds.** The first few parts are slow (you're building the kit); after that, assembly is fast.
- **It dodges your export bug by design.** As you'll see in §4, building from *object* assets gives you plain single meshes — no collection-instance empties, so none of the Apply-Transform child-of-child breakage from [[blender-fbx-export-guide]].

The cost: up-front discipline (clean origins, scale, naming) and some library setup. This primer front-loads that discipline so the payoff is real.

---

## 2. The mental model: everything in Blender is a "data-block"

You can't understand assets without this, so here it is plainly. A `.blend` file is a database of **data-blocks** — independent chunks of data that reference each other. The ones that matter here:

- **Mesh** (`ME`) — the raw geometry: vertices, edges, faces, UVs. It has *no* position in the world.
- **Object** (`OB`) — a *placement* of some data in the scene: it holds the **transform** (location, rotation, scale) and points at a mesh (or an empty, light, camera…). This is the split that explains everything later: **the object carries the transform; the mesh carries the shape.** Two objects can point at the *same* mesh — that's "instancing".
- **Empty** — an object with no geometry: just a transform and a visual gizmo (plain axes, sphere, etc.). Used as markers — your `RootNode`, `Attach_*` points, and (importantly) collection-instance placeholders are empties.
- **Collection** (`GR`) — a *named group* of objects (like a folder). Collections can be **instanced**: an empty can say "draw this whole collection here", which is how Blender's collection instances work.
- **Material**, **Image/Texture**, **Node Group** — other data-blocks you can also turn into assets.

> [!IMPORTANT] Why this split matters for Foundation
> Foundation's FBX importer cares about the **object/node transforms** and the **mesh** under each. When Blender's exporter mis-bakes a transform (the Apply-Transform bug), it's corrupting the *object* side, not the mesh side — which is why the geometry is intact but mis-placed. And a "collection instance" is just *an empty object pointing at a collection*, which is why it adds an extra node layer. Hold onto this; it makes §4 obvious.

---

## 3. The Asset Browser: what it is and how Blender finds assets

The **Asset Browser** (Blender 3.0+, stable in 4.x) is an editor window — change any area's type to *Asset Browser*, or use the "Asset" workspace tab if your start file has one. It shows assets grouped by **library**.

**An "asset" is just a data-block you've marked as reusable.** Marking adds a bit of metadata (a preview image, a catalog, tags, a description); it doesn't move or copy anything. Until you mark something, it's a normal object/collection/material.

**How Blender discovers assets — this is the key "how":**

- **Current File** library = assets marked in the file you have open right now.
- **Custom libraries** = folders you register in `Edit ▸ Preferences ▸ File Paths ▸ Asset Libraries`. Blender **scans every `.blend` file in that folder (and subfolders)** and surfaces any marked assets it finds. So a "library" is literally *a folder full of `.blend` files that contain marked data-blocks* — there's no database to maintain; the folder *is* the library.

That means your kit library can simply be a folder like `metadata/Blender/Kit/` containing `windows.blend`, `doors.blend`, `roofs.blend`, etc., each holding marked objects. Point Blender's preferences at that folder once and every piece shows up in the browser, in every project.

**Catalogs, tags, previews — the "how" of staying organised:**

- **Catalog** = the folder-like hierarchy shown on the left of the browser (e.g. `Arcanum/Windows/Rustic`). Catalogs are stored in a plain text file `blender_assets.cats.txt` in the library folder, so they travel with it. Assign an asset to a catalog in its metadata sidebar.
- **Tags** = free-text labels for search (`stone`, `arched`, `T1`).
- **Preview** = the thumbnail. Blender can auto-generate one, render one from the viewport, or you can supply an image. Without a preview, an asset is hard to recognise — generate previews as you mark things.
- **Description / Author / License** = metadata fields; fill the description so future-you remembers a piece's intended use/scale.

---

## 4. Object assets vs Collection assets — the decision that fixes your export

This is the single most consequential choice, and it's the direct answer to "would the window be just a single mesh if it were an asset?"

**Mark an _object_ as an asset** → when you drag it into a scene it comes in as **a plain object** (a single mesh object, if that's what it is). No placeholder, no instancing wrapper. It exports as ordinary geometry, and Apply Transform can't break it because there's no child-of-child chain. **This is what you want for Foundation kit pieces.**

**Mark a _collection_ as an asset** → when you drag it in, Blender creates a **collection instance**: an *empty* that points at the collection, with the collection's meshes effectively hanging beneath it. That extra empty is exactly the child-of-child structure that the Apply-Transform export option mangled in your `006` windows (see [[blender-fbx-export-guide#1. Diagnosis: why `006` lost the windows but `005` didn't]]). Great for fast scene dressing, **bad for export-bound geometry**.

So the rule for your kit:

> [!IMPORTANT] Build the kit from OBJECT assets
> Mark individual mesh **objects** as assets (a window, a door, a pillar). Assemble building parts by dragging those objects in and **appending** them. Use collection assets only for throwaway scene dressing you'll never export. If a "piece" is genuinely several meshes (frame + glass), either join them into one object first, or keep them as plain sibling objects parented to the part — never wrap them in a collection instance destined for FBX.

A multi-piece window can still be one asset: select the pieces, `Ctrl+J` to **join** them into a single mesh object, *then* mark that object as the asset. One asset, one mesh, no instancing.

---

## 5. Append vs Link vs Append (Reuse Data) — how a piece enters your file

When you drag an asset in, Blender uses one of three **import methods** (set it in the Asset Browser header, or per-library in preferences). Understanding the difference is the "why" behind clean vs messy files:

| Method | What it does | Use it when |
| --- | --- | --- |
| **Append** | Copies the data-block *into* your current file. It's now local and fully editable; no link back to the source. | **Default for kitbashing** — you want to move/join/tweak the piece freely and export it. |
| **Link** | Keeps the data in the source `.blend` and references it (read-only; edit via a "library override"). Updates to the source propagate. | Set-dressing or shared assets you want to update centrally — **not** for export-bound parts. |
| **Append (Reuse Data)** | Appends, but if the same mesh was already appended, it reuses that mesh data instead of duplicating it. | Placing many copies of one piece while keeping file size down (the copies share one mesh = instancing). |

For building a Foundation part you'll mostly **Append** (clean, editable, exportable). "Append (Reuse Data)" is a nice middle ground when you place, say, twelve identical windows — they share one mesh in Blender, and Foundation re-merges duplicates on import anyway (`MergeDuplicateMeshes = true`), so you don't pay for the repetition.

---

## 6. Modelling kit pieces *clean* (the habits that make assets behave)

A reusable piece is only reusable if it's disciplined. Each of these has a concrete "why":

- **Apply scale & rotation** (`Ctrl+A`) on a finished piece so its transform is `1/0` — *why:* unapplied scale/rotation compounds unpredictably when you reuse and re-parent the piece, and it's half of the Apply-Transform export mess.
- **Set the origin deliberately** (`Object ▸ Set Origin`) to the natural snapping point — e.g. a window's origin at the centre of its opening, a wall's at a bottom corner — *why:* the origin is the handle you grab and snap by; a sensible origin makes assembly painless.
- **Model to a consistent scale/grid.** Pick your unit convention up front and stick to it (Foundation parts are authored ~100× oversized to survive the engine's `×0.01` import — see [[blender-fbx-export-guide#The 100× / 0.01 scale system (and why attach points are special)]]). *Why:* pieces only assemble cleanly if they share one scale; mixing scales is how you get the snap-to-vanilla rescale surprises.
- **Orient consistently.** Decide which way is "front" for every piece. *Why:* so a door and a wall agree on facing when snapped together.
- **Name meaningfully** (`Rustic_Window_Arched`, not `Cube.034`) — *why:* the FBX node names come straight from your object names, and Foundation's BUILDING_ASSET_PROCESSOR keys off names containing `Part`, `Attach`, `PATH_` (see [[blender-fbx-export-guide#AssetProcessor vs. registering by hand]]).
- **Keep topology and UVs export-ready** — apply modifiers (or rely on the exporter's "Apply Modifiers"), and unwrap UVs, because Foundation reads the mesh as-is.

---

## 7. The end-to-end kitbash workflow (general steps, Foundation-tuned)

This is the loop you'll actually run. General Blender on the left; the Foundation-specific reason on the right.

1. **Model a piece** clean (per §6). → It becomes a dependable building block.
2. **Mark it as an object asset** (`right-click ▸ Mark as Asset`), give it a preview, catalog (`Arcanum/Windows/...`), tags, and a description noting its scale/intent. → Findable and reusable in every project.
3. **Save it into a kit `.blend`** inside your registered library folder (e.g. `metadata/Blender/Kit/windows.blend`). → Blender's scan picks it up library-wide.
4. **Open the part you're building**, open an Asset Browser area, and **drag pieces in with Append**. → You get plain, editable mesh objects (no instance empties — §4).
5. **Position & snap** pieces together (snapping: `Shift+Tab` to toggle, snap to *Vertex* or *Increment*; `Alt+D` for linked duplicates if you want shared meshes). → Fast, precise assembly.
6. **Parent / group** the finished meshes under the part following Foundation's structure: top-level part objects, meshes as direct children, `Attach_*` empties for snap points, `PATH_*` empties for entrances. Keep it **shallow** (see the structural rules in [[blender-fbx-export-guide#3. How Foundation reads the model (and the real structural limits)]]).
7. **Author LODs if needed:** make reduced copies named `LOD_0…LOD_4`. Each `LOD_X` is **one merged mesh** (no sub-tree under it — the test-3 limit), and **where they sit depends on your export path**: on **Path B (Apply Transform ON)** merge each level into one mesh **directly under the `Part`** (two levels); on **Path A** you may nest `LOD_X` under per-component base meshes. All LODs must share the **same position** (offset in Object mode to compare, `Alt+G` to realign before export). Full details + caveats in [[blender-fbx-export-guide#LOD distance bands + naming (official)]].
8. **Pre-export cleanup:** delete lights/cameras, apply transforms (Path B) or set the RootNode rotation + `0.01` attach scaling (Path A), per [[blender-fbx-export-guide#5. Recommended export recipe]].
9. **Export FBX** with your saved preset, then **register in Lua** (`registerAssetProcessor` + `registerAssetId`).
10. **Verify** with `metadata/Blender/tools/fbx_inspect.py` *before* launching the game.

### Keep a master copy and an export copy (non-destructive)

Your instinct is right, with one freeing reframe: **you rarely need to merge into one "massive" object at all.** Ordinary *separate* meshes render fine in Foundation at the top couple of levels (your `005` windows proved depth-3 meshes render). Merging is only *forced* where a `LOD_X` node must be a single mesh — and even then it's per-component-per-level, not the whole building. So the editable version of your work can stay as many distinct meshes.

For the cases where you *do* prepare an export, separate **source** from **export**:

- **Source / WIP collection** — your real, editable part: kit pieces appended, kept as distinct meshes. This is the master; you never destructively join it.
- **Export collection** — a *disposable* prepared copy where you do only what export needs: merge per-LOD-level if you use LODs, name the `LOD_X` nodes, place `Attach_*` / `PATH_*` empties, apply transforms (Path B). Regenerate it from the source whenever the source changes.
- **Export only the Export collection** (FBX ▸ *Limit to: Selected/Active Collection*, or exclude the Source collection from the view layer so it isn't exported).

To make "regenerate the export copy" cheap instead of tedious:

- **Linked duplicates** (`Alt+D`) put copies in the Export collection that *share* mesh data with the source — edit the source and the copies update, right up until you join.
- **Geometry Nodes "Join Geometry"** is the fully non-destructive merge: one export object pulls the source objects' geometry in through a modifier; you keep editing the sources, the merged result updates live, and the FBX exporter's *Apply Modifiers* bakes it on the way out. This is the best long-term answer to "merge for export without destroying my sources."
- **A small pre-export script** (the bounded automation from §10) can duplicate-and-join on demand.

**Same pattern for the asset library:** keep editable component objects in a `source` collection inside the kit `.blend`; the asset you *mark and use* can be the joined single-mesh version, while the un-joined parts stay in the file for re-editing — or skip joining and mark the components as separate assets. Either way the source stays editable, so you're never locked into a frozen mega-mesh.

**LODs fit this naturally:** `LOD_1`–`LOD_4` are reduced copies derived from your full-detail mesh, so they're regenerated export artifacts by their nature — author the high-detail master once and let the reduced `LOD_X` meshes live in the Export collection.

---

## 8. Organising the library (a structure that scales)

A workable layout for this project — adjust freely:

```text
metadata/Blender/Kit/                 <- register THIS folder in Preferences ▸ File Paths ▸ Asset Libraries
├── blender_assets.cats.txt           <- catalog definitions (auto-created; commit it)
├── windows.blend                     <- marked window objects
├── doors.blend
├── walls_trim.blend
├── roof.blend
└── ornaments.blend
```

Guidance and the "why":

- **One `.blend` per category**, not one giant file — *why:* faster to open, easier to version in git, and the asset scan doesn't care how they're split.
- **Catalogs mirror your design language**, e.g. `Arcanum/Windows/Rustic`, `Arcanum/Roof/Diamond` — *why:* the catalog tree is your in-browser navigation; matching it to [[3d-modeling-pipeline]] keeps design and assets aligned.
- **Commit `blender_assets.cats.txt`** to git — *why:* it stores the catalog hierarchy; without it, catalogs show as "Unassigned" on another machine.
- **Keep kit sources in `metadata/`**, not in the mod's `models/` — *why:* `metadata/` is excluded from the shipped mod (see [[project-brief]]); only exported `.fbx` belongs in `models/`.
- **Thumbnails matter** — generate previews as you go; a wall of grey blanks is unusable.

---

## 9. Beginner → advanced progression

A realistic path so you're productive early and sophisticated later:

**Beginner — make the loop work once.**
- Model one simple piece (a single window), apply scale, set a sensible origin, name it.
- Mark it as an object asset, give it a preview + catalog.
- Register `metadata/Blender/Kit/` as a library; confirm the piece appears in the Asset Browser from a *different* file.
- Append it into a test part, export, and view in-game. Goal: prove the whole pipe end-to-end with one piece.

**Intermediate — build a real kit.**
- Author a coherent set: 2–3 window variants, a door, wall/trim pieces, a roof tile section, a couple of ornaments — all to one scale and orientation convention.
- Establish catalogs/tags and a naming scheme that matches the BUILDING_ASSET_PROCESSOR keywords (`Part`, `Attach`, `PATH_`).
- Assemble a full Aethercourt building part from the kit; set up `Attach_*` points and one `PATH_`.

**Advanced — make it fast and robust.**
- Add `LOD_0…LOD_4` for the heavy parts (merged-per-level, directly under the `Part` for Path B), tuned to the distance bands in [[blender-fbx-export-guide#LOD distance bands + naming (official)]].
- Use linked duplicates / "Append (Reuse Data)" for repeated pieces to keep files lean (the engine re-merges duplicates anyway).
- Standardise an export preset per path (A/B) and run `fbx_inspect.py` as a habit.
- Optional: a small pre-export **cleanup script** (realise instances, join, apply transforms, validate no mesh under `LOD_X`) — bounded automation, not a custom exporter (see §10).

---

## 10. Pitfalls & FAQ

- **"Should I ever use collection assets?"** Only for scene-dressing you won't export. For anything bound for FBX, use object assets (§4).
- **"What if I mark a *parent* object (one that has child meshes) as an asset?"** You capture **only the parent**. Parenting is stored on the *child*, so appending the parent brings its own mesh/materials but **not** its children — you'd place the piece and the child meshes would be missing. (Marking a *child* is the opposite: it drags its parent along as a dependency.) To bundle several meshes as one asset, **join them into one object** and mark that, or keep them as separate sibling object assets. The only built-in "group as one asset" is a *collection* asset — which reintroduces the instance-empty / child-of-child structure you're avoiding for export.
- **"My dragged-in piece is huge / tiny."** Scale convention mismatch. Author the whole kit at one scale (Foundation ≈100× oversized) and apply scale on every finished piece (§6).
- **"My piece snaps in rotated."** Unapplied rotation, or inconsistent "front". Apply rotation; pick one facing convention.
- **"Catalogs vanished on my other PC."** You didn't commit `blender_assets.cats.txt` (§8).
- **"Can a `LOD_X` contain a little hierarchy of objects?"** No — it's a terminal leaf; the engine drops children under it. Merge per level (this is the test-3 finding in [[blender-fbx-export-guide]]).
- **"Should I write a custom FBX exporter to avoid the child-of-child bug?"** No — that's a maintenance rabbit hole against a reverse-engineered binary format, and it solves the wrong layer. The bug is an *authoring* issue: build from object assets / flatten instances and it never occurs. If you want automation later, write a small **pre-export cleanup script** that normalises the scene and then calls Blender's stock exporter — bounded and safe. `[DESIGN QUESTION]` revisit only if manual assembly becomes a real bottleneck.

---

## Cross-links

- [[blender-fbx-export-guide]] — the export half of the pipeline (Apply Transform, LOD rules, scale system, AssetProcessor, the `fbx_inspect.py` tool)
- [[3d-modeling-pipeline]] — aesthetic targets, roof/LOD design language, emissive rules
- [[foundation-mod-api-reference]] — `registerAssetId` / `registerAssetProcessor`, engine constraints
- [[project-brief]] — what ships vs what stays in `metadata/`
- [[master-to-do]] — modelling tasks this kit feeds

## Sources

- Blender Asset Browser, catalogs, and import methods — Blender 4.x manual, [docs.blender.org Asset Libraries](https://docs.blender.org/manual/en/latest/files/asset_libraries/index.html)
- Foundation building-part structure, LOD, and processor behaviour — see the sources in [[blender-fbx-export-guide]]
- Pipeline diagnosis and the object-vs-collection / Apply-Transform findings — this project's `005`/`006` comparison and `temp/` PoC (2026-06-07)

---
title: Foundation Mod-API Reference
tags:
  - meta
  - reference
  - lua
  - modding-api
created: 2026-06-05
status: reference
sources:
  - "[[dh-notebooklm-mod-api-reference]]"
---

# Foundation Mod-API Reference

Navigable summary of the engine + Lua API mechanics, file conventions, debugging hooks, and engine constraints that touch implementation decisions across the mod. **Not authoritative** — the official source is the Polymorph Games modding wiki at https://www.polymorph.games/foundation/modding/start. Verify any specific call signature there before implementation.

The modding API itself is described by Polymorph as **"very embryonic"** — expect changes as development continues.

## Mod folder and core files

Mod folder location: `Documents\Polymorph Games\Foundation\mods\<your-mod-folder>`

Three required files at the mod root:

| File | Role |
| --- | --- |
| `mod.json` | Loaded early. Provides basic info about the mod and any custom maps. Read before any Lua executes. |
| `mod.lua` | The single entry-point Lua script. **The only script the engine loads automatically.** Every other Lua file must be brought in via `dofile` from `mod.lua`. |
| `generated_ids.lua` | Stores the mapping between mod naming strings and the engine-generated GUIDs for each registered asset / class / resource. **Distributing this file with the mod is required** for save-game portability. |

### `generated_ids.lua` — off-limits to AI editing

The engine auto-generates this file during playtest. Anton manages it manually. The AI assistant **never** edits this file (per [[project-brief]] project instructions).

### `metadata/` folder convention

A `metadata/` folder at the mod root holds files that should **not** be loaded by the engine — thumbnails, design docs, AI chat exports, concept art. This vault itself lives at `metadata/The Arcanum Estate Docs/`.

## Lua scripting model

- **Single-entry-point loading.** Only `mod.lua` is auto-loaded. Every other Lua file is brought in by calling `dofile`. Variables — including the main mod instance — can be passed through `dofile` calls into secondary scripts.
- `registerClass` defines ECS components for the mod's custom entities.
- `registerAssetId` registers 3D materials and other identified assets.
- `registerAssetProcessor` manages Level-of-Detail (LOD) transitions for modular monument parts. **Required** for performance with high-count Aethercourts. Touches the current 3D modeling work in [[3d-modeling-pipeline]].

## Workplace components

### `COMP_WORKPLACE` — dual-resource output (Apiary pattern)

A workplace can produce **more than one** output resource at the same time. The canonical vanilla example is the **Apiary / Beekeeper**, producing both **Wax** and **Honey**.

The engine constraint to verify: **filling one output's storage must not block production of the other**.

This pattern is required for:
- [[lapidary|Lapidary]] — Faceted Aether Crystals (primary) + [[aether-crystal-dust|Aether Crystal Dust]] (byproduct)
- [[aether-crystal-mining-camp|Aether Crystal Mining Camp]] — potentially, if the T2 prospecting-node upgrade adds a byproduct (`[TBD]`)
- [[artificer|Artificer]] — potentially, if Aether Lamps stay in the mod as a parallel output to empty containers (`[TBD]` — see [[master-to-do]])

**Developer task** (in [[master-to-do]]): read the vanilla Apiary Lua to confirm both the dual-output mechanic and the storage-full behavior. Pattern off it for the Lapidary first.

### GUID generation from custom names

The engine generates a GUID from the custom naming string used in registration calls. Two consequences:

- A compound name like `Aether Bindery` produces a different GUID than a plain `Bindery`, which is how the [[aether-bindery|Aether Bindery]] avoids collision with vanilla `Bindery`-named mods. Mod-author choice of naming directly controls collision avoidance.
- Renaming an asset after release changes its GUID, which **breaks save-game compatibility** unless the old name → new GUID mapping is preserved manually in `generated_ids.lua`. Treat any rename of a registered class/resource/asset post-release as a potentially-breaking change.

## Rendering and visual constraints

### No custom light sources

The modding API **does not support custom light sources** (per Polymorph documentation). Custom light code and glow shaders are forbidden.

### Emissive workaround — vertex colors / HDR-RGBA

Emissive effects must be handled via standard **vertex colors with HDR-capable RGBA channels (values > 1.0)** — the same technique vanilla uses for candles and forge fires.

This is the workaround for every "glowing", "luminous", or "shining" element in the design — Floating Arcane Rune, Vigilant's Brazier, Luminous Fungi Cluster, Bound-Spirit Lantern, Radiant Anchorstone, and many more. See [[3d-modeling-pipeline#Emissive treatment — vertex colors / HDR-RGBA (no light sources)|3D modeling pipeline]] for the full affected-decorations list and [[foundation-aesthetic-reference#Vanilla style rules (engine-aware)|vanilla style rules]] for the style-level rule.

## UI / UX rules surfaced by Polymorph design notes

Not strictly API but engine-imposed constraints on what designs are viable:

- **Avoid 4-resource recipes per workplace.** Polymorph design notes describe a "strict aversion to cluttering the UI" with complex 4-resource input recipes. The [[enchanted-tome|Enchanted Tomes]] recipe was capped at 3 (Glyphs + Planks + Faceted Aether Crystals) specifically for this reason; the Glyph ↔ Arcane Lore playtest swap is a one-or-the-other choice to keep the input count at 3 (see [[dh-notebooklm-aether-bindery]]).
- **UI sorting > thematic naming.** Alphabetical grouping in warehouse / granary / trade menus is a hard UX requirement. The Lore Bindery → Aether Bindery rename was driven by this principle: a misleading building name is a UX pitfall (see [[dh-notebooklm-charged-containers]]).

## Debugging and developer workflow

- **Log file:** mod-specific logs at `Documents/Polymorph Games/Foundation/mod-%NAME%.log`. Some indirect interactions may still appear in the global `foundation.log`.
- **Blocking message box:** programmable, but requires `ModMsgBoxEnabled` set to `true` in `usersetting.config`. Off by default.
- **Hot reload:** `Ctrl + Shift + R` reloads mods while the game is running.

## Distribution

- Mod-sharing platform: **`foundation.mod.io`**.
- Mods are uploaded as a zip; **`mod.lua` must sit at the root of the zip**. Folder structure inside the zip otherwise mirrors what's inside `Documents\Polymorph Games\Foundation\mods\<mod-folder>`.

## What this reference does NOT cover

NotebookLM was only given the **"start" page** of the modding wiki — it could see the sidebar / table of contents for other topics (Scripting API, Game Asset Override, Event documentation) but not the contents of those pages. Detailed signatures for `registerClass`, `registerAssetId`, `registerAssetProcessor`, `COMP_WORKPLACE`, and related calls are **not** captured here.

**Verify against the live wiki** at https://www.polymorph.games/foundation/modding/start and its child pages before implementation. Update this note when deeper API material gets added to the vault.

## Cross-links

- [[project-brief]] — external modding wiki link + tech-stack context
- [[3d-modeling-pipeline]] — asset-pipeline implications of the engine API calls
- [[foundation-aesthetic-reference]] — vanilla style rules that interact with the rendering constraints
- [[master-to-do]] — Lua/code developer-task list
- Design history: [[dh-notebooklm-mod-api-reference]]

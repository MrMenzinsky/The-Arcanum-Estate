---
title: Foundation Mod-API Reference — Paper Trail (NotebookLM)
tags:
  - design-history
  - notebooklm
  - reference
  - lua
  - modding-api
created: 2026-06-05
status: reference
sources:
  - notebooklm-conversation.md lines 152-207
  - notebooklm-conversation.md lines 444-466 (COMP_WORKPLACE / Apiary dual-output)
  - notebooklm-conversation.md lines 613-618 (GUID generation from custom naming strings)
  - notebooklm-conversation.md lines 679-681 (4-resource UI penalty)
  - notebooklm-conversation.md lines 1554-1556 (UI clarity > thematic naming)
  - notebooklm-report.md lines 174-191 (Technical Implementation section)
  - "[[_notebooklm-chat-index]]"
---

# Foundation Mod-API Reference — Paper Trail (NotebookLM)

## Why this dh exists

The NotebookLM chat captured a number of concrete Lua-API mechanics, file conventions, debugging hooks, and engine constraints that touch implementation decisions across the mod. Most of these are not design *choices* but **engine facts** the dh files keep referring back to — so they belong in one place rather than being repeated everywhere.

Treat this as a snapshot reference, not as authoritative documentation. The official source is the Polymorph Games modding wiki (linked from [[project-brief]]); verify any specific call signature there before implementation. NotebookLM was working from a *single page* of the wiki it had been seeded with (the "start" page only — see L158); its coverage of the wider API is partial.

The modding API itself is described as **"very embryonic"** (L162) — expect changes as development continues.

## Mod folder layout and core files

### Mod folder location

`Documents\Polymorph Games\Foundation\mods\<your-mod-folder>` (L164)

### Three required files at the mod root

| File | Role |
| --- | --- |
| **`mod.json`** | Loaded early. Provides basic info about the mod and any custom maps. Read before any Lua executes. |
| **`mod.lua`** | The single entry-point Lua script. **The only script the engine loads automatically.** Every other Lua file must be brought in by `dofile` from `mod.lua` (L170, L176). |
| **`generated_ids.lua`** | Stores the mapping between mod naming strings and the engine-generated GUIDs for each registered asset / class / resource (L172). |

### `generated_ids.lua` — load-bearing for save-game compatibility

The engine auto-generates a GUID for each asset/class/resource at first load, and persists the mapping in `generated_ids.lua`. **Distributing this file with the mod is required** — without it, every player would generate fresh GUIDs locally and save games would not be portable between machines.

> [!IMPORTANT] Off-limits to AI editing (per [[project-brief|project instructions]])
> `generated_ids.lua` is auto-written by the game during playtest and is managed manually by Anton. The AI assistant must never edit this file. It's distributed as part of the mod purely for save-game portability.

### `metadata/` folder convention

A `metadata/` folder at the mod root holds files that should **not** be loaded by the engine — e.g. thumbnails, design docs, AI chat exports, concept art (L174). This vault itself lives at `metadata/The Arcanum Estate Docs/`; the existing `metadata/Docs/` NotebookLM staging area also follows this convention.

## Lua scripting model

- **Single-entry-point loading.** Only `mod.lua` is auto-loaded. Every other Lua file is brought in by calling `dofile` from `mod.lua` (or transitively from a file that was `dofile`-d earlier). Variables — including the main mod instance — can be passed through `dofile` calls into secondary scripts (L176).
- **`registerClass`** is used to define ECS components for the mod's custom entities. Used to register the Aetherian Entity-Component System components specifically (notebooklm-report L182).
- **`registerAssetId`** is used for registering 3D materials and other identified assets (notebooklm-report L182).
- **`registerAssetProcessor`** is used to manage Level-of-Detail (LOD) transitions for modular monument parts. Necessary to keep performance acceptable with high-count Aethercourts (notebooklm-report L190). Touches the current 3D modeling work in [[3d-modeling-pipeline]] and [[master-to-do]] — the LOD pipeline issue currently blocking the first Aethercourt part is on this surface.

## Workplace components

### `COMP_WORKPLACE` — dual-resource output (Apiary pattern)

A workplace can produce more than one output resource at the same time. The canonical vanilla example is the **Apiary / Beekeeper**, which produces both **Wax** and **Honey**. The engine constraint to verify is that **filling one output's storage does not block production of the other** (L444-466, notebooklm-report L186).

This pattern is required for at least three Arcanum workplaces:
- **Lapidary** — primary output Faceted Aether Crystals + byproduct Aether Crystal Dust (see [[dh-notebooklm-inter-estate-goods]]).
- *(Possibly)* Aether Crystal Mining Camp — if the T2 prospecting-node mine has byproducts. `[TBD]`
- *(Possibly)* Artificer — if Aether Lamps stay in the mod as a parallel output to the empty containers, the Artificer would also need dual output. Currently `[TBD]` per the Artificer-pivot orphaning of Aether Lamps (see [[dh-notebooklm-artificer]]).

**Developer task:** read the vanilla Apiary Lua to confirm both the dual-output mechanic and the "storage full does not block other output" behavior. Pattern off it for the Lapidary first.

### GUID generation from custom names

The engine generates a GUID from the custom naming string used in registration calls. Two consequences:

- A compound name like **"Aether Bindery"** produces a different GUID than a plain "Bindery", which is how the Cluster 4 mod-name-collision concern (vanilla "Bindery" used by other mods) was resolved (L617). Mod-author choice of naming directly controls collision avoidance.
- Renaming an asset later changes its GUID, which **breaks save-game compatibility** unless the old name → new GUID mapping is preserved manually in `generated_ids.lua`. Treat any rename of a registered class/resource/asset post-release as a potentially-breaking change.

## Rendering and visual constraints

### No custom light sources

The modding API **does not support custom light sources** (L272 from [[dh-notebooklm-aesthetic-corrections]]; reiterated at notebooklm-report L188).

> "Custom light code and glow shaders are strictly forbidden. Emissive effects must be handled via standard vertex colors and HDR-capable RGBA channels (values >1.0) within existing rendering limits." (notebooklm-report L188)

This is the workaround for everything in the mod that wants to "glow" — luminous decorations, Floating Arcane Rune, Bound-Spirit Lantern, etc. (see [[dh-notebooklm-expansion-monument-decorations]]).

### Vertex colors for emissive treatment

The engine supports HDR-capable RGBA channels where values >1.0 act as emissive. This is how vanilla Foundation handles its own glow-adjacent effects (candles, forge fires) without exposing a light-source API.

**Developer task (entered to [[master-to-do]]):** define a single consistent emissive vertex-color treatment that all glowing-described decorations can share, so the look reads as one design language rather than per-asset improvisation.

## UI / UX rules surfaced

Two implementation-relevant UI rules emerged from the chat that are not strictly API but are engine-imposed constraints on what designs are viable:

- **Avoid 4-resource recipes per workplace.** At L681 and L1556 the design notes are described as having "a strict aversion to cluttering the UI" with complex 4-resource input recipes. The Enchanted Tomes recipe was capped at 3 (Glyphs + Planks + Faceted Aether Crystals) for this reason; the Glyphs ↔ Arcane Lore swap is a one-or-the-other choice precisely to keep the input count at 3 (see [[dh-notebooklm-aether-bindery]]).
- **UI sorting > thematic naming.** Alphabetical grouping in warehouse/granary/trade menus is a hard UX requirement, formalized at L1552-1560 (see [[dh-notebooklm-charged-containers]]).

## Debugging and developer workflow

- **Log file:** mod-specific logs live at `Documents/Polymorph Games/Foundation/mod-%NAME%.log`. Some indirect interactions may still appear in the global `foundation.log` instead (L180).
- **Blocking message box:** triggered programmatically, but only if `ModMsgBoxEnabled` is set to `true` in `usersetting.config`. Default is off (L182).
- **Hot reload:** `Ctrl + Shift + R` reloads mods while the game is running. Useful for tight iteration (L184).

## Distribution

- Mod-sharing platform: **`foundation.mod.io`** (L186).
- The mod is uploaded as a zip; **`mod.lua` must sit at the root of the zip** (L186). Folder structure inside the zip otherwise mirrors what's inside `Documents\Polymorph Games\Foundation\mods\<mod-folder>`.

## What NotebookLM did NOT have access to

At L158 NotebookLM stated it was only given the **"start" page** of the modding wiki — it could see the sidebar/TOC for other topics (Scripting API, Game Asset Override, Event documentation) but not the contents of those pages. At L207 Anton asked NotebookLM to "do a deep research" of the wiki to pull in the rest; NotebookLM declined ("NotebookLM can't answer this question").

Practical implication: the API content captured in this dh is the public "getting started" surface only. Detailed signatures for `registerClass`, `registerAssetId`, `registerAssetProcessor`, `COMP_WORKPLACE` and similar are not in NotebookLM's context. **Verify against the live wiki** at https://www.polymorph.games/foundation/modding/start (and its child pages) before implementation.

## Implications for existing vault notes

- [[project-brief]] — the external API wiki link is already noted; no change needed.
- [[3d-modeling-pipeline]] — should cross-reference the `registerAssetProcessor` LOD-management call as the engine entry point for the LOD pipeline.
- [[master-to-do]] — three developer tasks belong on the Lua/code list: (a) verify Apiary dual-output behaviour and pattern the Lapidary off it; (b) define a consistent emissive vertex-color treatment for glow-described decorations; (c) check whether the current LOD blocker on the first Aethercourt part is on the Blender side or the `registerAssetProcessor` side.
- New final note candidate (Phase 5): `foundation-mod-api-reference.md` directly under `00_Global_Meta/`, mirroring the existing `foundation-aesthetic-reference.md` and `3d-modeling-pipeline.md`. It would surface this content as a navigable reference rather than burying it in the paper trail.

## Cross-links

- [[dh-notebooklm-artificer]] — references `COMP_WORKPLACE` dual-output need
- [[dh-notebooklm-inter-estate-goods]] — Lapidary dual-output Apiary pattern
- [[dh-notebooklm-aether-bindery]] — GUID collision avoidance, 3-resource input cap
- [[dh-notebooklm-charged-containers]] — UI sorting principle
- [[dh-notebooklm-aesthetic-corrections]] — no-light-sources constraint
- [[3d-modeling-pipeline]] — LOD pipeline entry point
- [[project-brief]] — modding API wiki link
- [[_notebooklm-chat-index]]
- [[_notebooklm-merge-plan]]
- [[master-to-do]] — Lua/code task list

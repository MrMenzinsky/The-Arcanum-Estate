---
title: 3d Modeling Pipeline
tags:
  - concept
  - meta
  - asset-pipeline
created: 2026-06-04
status: living-document
sources:
  - "[[dh-notebooklm-aesthetic-corrections]]"
  - "[[dh-notebooklm-tier1-room-parts]]"
  - "[[dh-notebooklm-mod-api-reference]]"
---

# 3d Modeling Pipeline

The asset workflow for the Arcanum Estate is **Blender → .fbx export → Foundation in-game**. Aesthetic targets live in [[foundation-aesthetic-reference]]. Active blockers and dev tasks are tracked in [[master-to-do]].

## Asset-naming conventions tied to design locks

- **Aethercourt Tier 1 Room parts** — 8-part roster with `Scholastic` prefix. See [[the-aethercourt#Tier 1 Room parts|the locked list]].
- **Building-part prefix progression** — T1+T2 use `Scholastic`, T3+ core mod uses `Arcane`. Expansion mods choose their own.

## Vertical-scale asset strategy (Aethercourt-specific)

Aethercourt parts deliberately avoid vanilla's separate Wooden vs Stone variants for the same part. Instead each part is a **single asset where the player can vertically scale the stone foundation or the timber upper section independently**.

Implications for modeling:

- One mesh per part, with the stone foundation block and the timber-upper block as **separately-scalable submeshes / scaled groups**.
- The scaling axis is vertical only — width and depth follow Foundation's standard placement grid.
- Reduces UI clutter — one part where vanilla would need two.
- `Wooden` / `Stone` material descriptors are used **sparingly**, only for parts that genuinely come in just one material.

See [[the-aethercourt#Asset modeling strategy — vertical scale, not material-variant pairs]] for full rationale.

## Roof geometry — diamond-tile signature

The Aethercourt's roof texture uses **interlocking diamond-shaped tiles**, distinct from the rectangular tiles of the Manor / Monastery / Castle. This is the at-a-glance identifier for the estate. The geometry must:

- Tile seamlessly across modular roof parts at all roof angles.
- Match vanilla's UV grid density so the diamond pattern reads at the same scale as vanilla roof tile patterns.
- Render legibly at all LOD levels (LOD0 through whatever LOD distance the engine uses for distant monument silhouettes).

## Color-variant scheme

Every player-customisable colored asset in the Aethercourt — roofs and Faceted Aether Crystals — uses a **5-color variant set**:

| Variant | Notes |
| --- | --- |
| **Light purple** (default) | The estate's signature heraldry color, rendered washed-out per the vanilla color rule |
| **Brown** | Hued to avoid clash with the Labor / Kingdom palettes |
| **Black** | Hued to avoid clash with the Clergy palette |
| **Green** | Hued to avoid clash with the Druid expansion (when shipped) |
| **Blue** | Hued to avoid clash with the Paladin / heraldry blues |

All five variants must be authored as **washed-out tones**, not full saturation — see [[foundation-aesthetic-reference#Vanilla style rules (engine-aware)|the vanilla color rule]]. Player choice between variants is a runtime swap, not a separate asset per variant — the engine's color-variant system handles this.

## Emissive treatment — vertex colors / HDR-RGBA (no light sources)

The modding API **does not support custom light sources**. Anything the design describes as "glowing", "luminous", "shining", or "emissive" must use **vertex colors with HDR-capable RGBA channels (values > 1.0)** — the same technique vanilla uses for candles and forge fires. There is no light-source API to fall back on.

Decorations affected (non-exhaustive list, will grow as design progresses):

- Aethercourt: Floating Arcane Rune (held aloft by charged Anchorstone; "glow" effect via vertex emissive only).
- Atheneum Tower (Mage): Flame Forger's Brazier ("perpetually burning").
- Citadel of Light (Paladin): Vigilant's Brazier, Consecrated Banners ("bright holy"), Divine Seal Pedestal ("glowing"), Radiant Anchorstone ("glowing golden").
- Sacred Grove (Druid): Luminous Fungi Cluster, Ancient Evertree Sapling ("glowing"), Primal Monolith ("glowing moss").
- Bloodforged Spire (Sorcerer): Bound-Spirit Lantern, Supreme Binding Obelisk ("glowing chaotic runes"), Void-Tear Fissure.

**Design task tracked in [[master-to-do]]:** define a single consistent emissive vertex-color treatment so the look reads as one estate design language, not per-asset improvisation.

## Engine API entry points

Asset-pipeline work touches these Foundation modding API calls (see [[foundation-mod-api-reference]] for the navigable summary; [[dh-notebooklm-mod-api-reference]] for the design-history paper trail):

- **`registerAssetId`** — registers 3D materials and identified assets.
- **`registerAssetProcessor`** — manages Level-of-Detail (LOD) transitions for modular monument parts. Required for performance with high-count Aethercourts.

## Active blockers

- **LOD pipeline blocker on the first Aethercourt building part.** **Diagnosed 2026-06-07** (see [[blender-fbx-export-guide]]): the FBX export is fine and Blender isn't losing nesting. Two separate causes confirmed by comparing the `005`/`006` exports and the `temp/` PoC: (1) the **Apply Transform** export option (the community-recommended setting) mis-bakes the transforms of the collection-instance windows — a child-of-child case — so they vanish in `006` but render in `005` where it was off; (2) `LOD_X` nodes are **terminal** — the engine discards any mesh parented under a `LOD_X` (proven by the PoC test 3 `.meta`), so each LOD level must be a single mesh. Fix: flatten/realise instances (then Apply Transform is safe) or use the Apply-Transform-off + RootNode-rotation workaround; merge geometry per `LOD_X`. Not a Blender/Maya FBX-quality issue. Diagnose-the-blocker task is in [[master-to-do]] Lua/code section.

## Cross-links

- [[blender-fbx-export-guide]] — full Blender→FBX export recipe, LOD setup, and the collection-instance fix (resolves the active blocker below)
- [[foundation-aesthetic-reference]] — aesthetic targets and vanilla style rules
- [[foundation-mod-api-reference]] — Lua API surface and engine constraints
- [[the-aethercourt]] — monument-specific architectural language and Tier 1 parts list
- [[arcane-lyceum]] — most ambitious asset; full exercise of the geometric vocabulary
- [[dh-notebooklm-aesthetic-corrections]], [[dh-notebooklm-tier1-room-parts]], [[dh-notebooklm-mod-api-reference]] — design history
- [[project-brief]], [[master-to-do]] — context and active issues

---
title: Aethercourt Tier 1 Room Parts — Decision Log (NotebookLM)
tags:
  - design-history
  - notebooklm
  - core
  - monuments
  - building-parts
created: 2026-06-05
status: locked
sources:
  - notebooklm-conversation.md lines 1600-2123
  - "[[_notebooklm-chat-index]]"
  - "[[dh-notebooklm-tech-unlock-naming]]"
---

# Aethercourt Tier 1 Room Parts — Decision Log (NotebookLM)

## Final state

The Aethercourt launches with **8 unique Tier 1 Room parts**, matching the variety of the vanilla Monastery and Castle (which also start with 8). All use the **Scholastic** prefix (inherited from the [[dh-notebooklm-tech-unlock-naming|locked T2 tech-unlock name]]).

| # | Building part | Notes |
| --- | --- | --- |
| 1 | **Scholastic Study Hall, Minor** | Core structure. Primary block for the Academy sub-building. Mirrors vanilla `Manor Hall, Minor` and `Rustic Hall`. |
| 2 | **Scholastic Tower, Minor** | Modest vertical element; deliberately not a massive spire at Tier 1. Mirrors vanilla `Manor Tower, Minor`. |
| 3 | **Scholastic Quarters, Minor** | Lodging — Annex use. Mirrors `Rustic Quarters` setup. |
| 4 | **Scholastic Quarters, Major** | Larger lodging variant. Pair with the Minor for early-game population flexibility. |
| 5 | **Scholastic Passageway** | Connector for modular assembly between halls. |
| 6 | **Scholastic Vestibule** | Entrance / transition piece. Mirrors `Simple Vestibule` from the Manor House. Most likely final choice. Alternative names floated but not chosen: `Scholastic Antechamber` or `Scholastic Foyer`. |
| 7 | **Scholastic Study Nook, Minor** | Small modular pop-out room. Functions like vanilla's `Manor Boudoir` — attached side-room for breaking up flat walls. |
| 8 | **Scholastic Study Nook, Major** | Larger Study Nook variant. |

Anton's lock at L2086-L2090 specified Study Nook (Minor + Major) and Vestibule as the additions to his initial 5; final 8-part roster confirmed by NotebookLM at L2104-L2120.

## Asset modeling note (Anton's approach)

Anton's modeling strategy (L1731-1734) deliberately differs from vanilla: instead of separate Wooden vs Stone variants for the same part (as Castle/Monastery do), each Aethercourt part is a single asset where the player can vertically scale the stone foundation or the timber upper section independently. This:

- Consolidates UI clutter (one part where vanilla would need two).
- Lets the same Scholastic-prefixed part double-duty across what would otherwise be material-variant sub-buildings.
- Means the Aethercourt won't use the vanilla `Wooden / Stone` naming convention except for parts that genuinely come in only one material.

Established vanilla suffixes (`, Minor`, `, Major`, `, Elevated`, etc.) are still in use — see #3/#4 and #7/#8 above.

## Sub-buildings that are NOT modular

Locked at L2051: the **Aether Hold** and **Archive** are single-building placements (mirroring the Castle Armoury or the Monastery Monastic Grange), NOT modular constructions. They are dropped from a single tile and do not consume any of the 8 Tier 1 Room parts above. This is a load-bearing decision: the modular Room-part pool is dedicated to the Academy, the Annex, and general Aethercourt footprint shaping.

## Prefix decision history

Anton arrived at `Scholastic` as the T1 prefix after rejecting several alternatives. Paper-trail:

- **Rustic** (vanilla default) — rejected at L1735. Anton chose to find "my own voice."
- **Wooden / Stone** material descriptors — dropped because the vertical-scale modeling approach makes per-material variants unnecessary (L1733).
- **Aspirant / Aspirant's, Scholar / Scholar's** (status/job prefixes) — explicitly rejected at L1735. Reason: the Tier 1 parts are a *shared pool* across all sub-buildings; tying them to a single villager rank would mislead the player.
- **Academic, Collegiate, Faculty, Campus** — academic-campus prefixes, evaluated at L1745-1753. Strong candidates but not chosen.
- **Foundational, Preparatory, Standard, Common** — tier-1-feeling prefixes (L1755-1763). Not chosen.
- **Arcane, Aetheric, Hermetic** — magical/thematic prefixes (L1765-1771). Not chosen for T1.
- **Study** — Anton liked this as a distinct identifier for specific parts ("Study Hall", "Study Nook") rather than as a global prefix (L1735). Kept as a noun, not a prefix.

`Scholastic` won implicitly when Anton locked it as the Tier 2 architecture-unlock prefix (L1996) and stated that T1 building parts will also use the Scholastic prefix to match how Castle and Monastery do it ("Rustic" for both their T1 parts and their T2 architecture unlock).

## Rejected initial-list parts

NotebookLM's first-pass suggestions at L1610-1622 used generic vanilla-style names. Most got renamed when Anton clarified at L1671 that he wanted entirely unique parts (not reskinned vanilla). Of NotebookLM's second-pass list at L1685-1697 (7 parts), most were either renamed or didn't make the final cut:

- **Rustic Scholar Lodge** — superseded by `Scholastic Quarters` (status/job prefix rejected).
- **Rustic Repository** — covered by the Aether Hold and Archive being single-building placements.
- **Rustic Workshop** — not in final roster.
- **Rustic Observation Turret** — covered by `Scholastic Tower, Minor`.
- **Rustic Colonnade** — superseded by `Scholastic Passageway`.
- **Rustic Excavation Tent / Pavilion Tent** — rejected at L2051; tents not used.
- **Scholastic Gallery** — moved to a future Tier 2 unlock at Anton's request (L2053).
- **Scholastic Cabin** — considered as Manor-Boudoir-equivalent but Study Nook chosen instead (L2077-2079, L2088).
- **Scholastic Hut** — proposed as a utilitarian square structure (L2030, L2081); not picked up since the Archive and Aether Hold use single-building placements instead.

## Open questions

- Door / Monument Decoration / Estate Decoration / custom-category Tier 1 parts are all `[TBD]`. The chat covered Doors and the Aether Bloom Garden custom category at NotebookLM's L1624-1666 but Anton's "I don't want to reuse any other estate monument building parts" instruction at L1671 effectively reset that work — the unique-naming exercise was done only for the Room category by the time the conversation moved on. (Aether Bloom Garden is alive as a sub-building — see [[master-to-do]] forgotten-items list and Phase 5 work.)

## Implications for existing vault notes and 3D work

- [[the-aethercourt]] — needs an explicit "Tier 1 Room parts" subsection listing the 8 locked names.
- [[core-buildings]] — locked language at L2051 that Aether Hold and Archive are single-building placements (not modular) should be reflected here.
- [[3d-modeling-pipeline]] — the vertical-scale-stone-vs-timber asset strategy belongs here as an asset-design convention.
- [[arcane-lyceum]] — Gallery being saved for T2 is adjacent to the Lyceum's pivot question; flag for awareness.

## Cross-links

- [[dh-notebooklm-tech-unlock-naming]] — Scholastic / Arcane tech-unlock progression
- [[dh-the-aethercourt]]
- [[dh-core-buildings]]
- [[the-aethercourt]]
- [[core-buildings]]
- [[3d-modeling-pipeline]]
- [[_notebooklm-chat-index]]
- [[_notebooklm-merge-plan]]

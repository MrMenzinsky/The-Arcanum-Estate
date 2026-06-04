---
title: Core Economy
tags:
  - core
  - economy
  - resource
created: 2026-06-04
status: design-locked
sources:
  - "[[dh-core-economy]]"
---

# Core Economy

The Arcanum Estate's economy runs two parallel resource loops — one for **knowledge** and one for **physical material**. Both loops feed each other through the [[aetherian-progression|progression ladder]]: Aspirants generate the raw resource, Arcanists refine it.

## Resource map

| Resource | Tier | Produced by | At | Stored in |
| --- | --- | --- | --- | --- |
| **Glyph** | T1 | Scholar (Aspirant) | Academy | Archive |
| **Arcane Lore** | T2 | Caster (Arcanist) | Aetherium | Archive |
| **Aether Crystal** | T1 | Serf | Aether Crystal Mining Camp (external, not part of the Aethercourt) | Aether Hold |
| **Faceted Aether Crystal** | T2 | Lapidarist (Aspirant/Arcanist) | Lapidary | Aether Hold |

See [[core-buildings]] for the buildings; [[aetherian-progression]] for who works each one.

## The two loops

### Knowledge loop — Glyph → Arcane Lore

Scholars at the Academy produce **Glyphs** — raw, unrefined units of magical writing. Casters at the Aetherium consume Glyphs and produce **Arcane Lore**, the estate's prestige resource.

Arcane Lore is the abstract output of the entire estate, parallel to the Kingdom's Royal Treasures or the Clergy's Piety. It drives splendor and is the **promotion currency** that turns an Arcanist into a specialist (Mage / Paladin / Druid / Sorcerer) or a [[aetherian-progression#The Loremaster — late addition, load-bearing|Loremaster]]. This is the structural sink that ties expansion content to the Core mod — expansions cannot promote their specialists without core-mod-produced Arcane Lore.

### Physical loop — Aether Crystal → Faceted Aether Crystal

**Aether Crystal** is mined by Serfs at a standalone **Aether Crystal Mining Camp** — this building sits *outside* the Aethercourt, like vanilla resource camps (Stonecutter, Lumber). The Serf workforce parallels the Labor Estate's gathering economy.

Raw Aether Crystal is hauled to the **Lapidary** (a sub-building inside the Aethercourt) where the **Lapidarist** refines it into **Faceted Aether Crystal**. This loop mirrors the vanilla **Stone → Polished Stone** progression handled by the Mason Hut at T2.

Faceted Aether Crystal is the common building material for the Aethercourt's sub-buildings and (likely) the expansion monuments. `[TBD]` — confirm whether expansions also accept vanilla Polished Stone alongside Faceted Aether Crystal, or whether the magical material is mandatory.

## Storage split

The estate's storage is intentionally split along the knowledge/matter axis — the same split that runs through the [[aetherian-progression|status/profession split]]:

- **Archive** — knowledge storage (Glyphs, Arcane Lore)
- **Aether Hold** — physical storage (Aether Crystal, Faceted Aether Crystal, any future material components)

See [[core-buildings#Archive (T1 / T2)|Archive]] and [[core-buildings#Aether Hold (T1 / T2)|Aether Hold]] for naming history.

## Naming notes

- **Glyph** chosen over Sigil, Imprint, Inscription, Cipher, Schema, Hypothesis. Sigil retained on the backup list. Earliest working names "Research Paper" and "Formula" were rejected as too generic / cross-discipline.
- **Lapidary / Lapidarist** chosen over Crystal Refinery (too industrial — "Refinery" implies chemical/oil/sugar processing), Crystal Forge, Aether Cuttery, Facetorium. The Lapidary/Lapidarist pair was selected for its archaic, formal, thematically precise feel — a lapidary is literally a gem-cutting workshop, exactly the tone the Aethercourt aims for.
- **Gemcutter** was explicitly rejected as a job title — too common for an estate built on archaic-academic prestige.

## Open questions

- Exact Arcane Lore promotion costs per specialization. `[TBD]`.
- Whether expansion monuments accept Polished Stone alongside Faceted Aether Crystal as a building material. `[TBD]`.
- Whether Faceted Aether Crystal also has trade value (sold to the Kingdom or Clergy as a luxury) or is purely an internal building material. `[TBD]`.

## Cross-links

- [[estate-identity]] — Arcane Lore as the estate's prestige resource
- [[aetherian-progression]] — who works each step of the chain
- [[core-buildings]] — Academy, Aetherium, Lapidary, Archive, Aether Hold
- [[_the-aethercourt]] — the monument that houses the production / storage chain
- Design history: [[dh-core-economy]]

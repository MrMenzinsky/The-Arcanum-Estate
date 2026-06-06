---
title: Paladin — Specialization Design
tags:
  - expansion-paladin
  - design
  - ranks
created: 2026-06-04
status: planned
sources:
  - "[[dh-paladin-ranks]]"
  - "[[dh-paladin-workplaces]]"
---

# Paladin — Specialization Design

> **Out of scope for current development.** This expansion mod is documented but not implemented until the Core Arcanum mod ships. See [[master-to-do]].

## Theme

The Paladin specialization is the **militant holy** branch of the Arcanum Estate — disciplined sanctity in service of a deity, expressed through martial training and consecrated craftsmanship. Where the Mage represents pure scholarship and the Druid represents nature-aligned wisdom, the Paladin represents **applied faith**.

## Status progression

Aspirants who reach Arcanist may branch into the Paladin path. The Paladin rank ladder follows a spiritual-ascension arc: discipline → sanctity → divinity → consecrated authority.

| Tier | Rank | Job levels | Description |
| --- | --- | --- | --- |
| T1 | **Paladin** | 1–5 | Entry-level specialist, sworn to the order |
| T2 | **Holy Paladin** | 6–10 | Mastery of the work profession; sanctity through service |
| T3 | **Divine Paladin** | 11–15 | Directly empowered by the deity; spiritual apex of standard ranks |
| T4 | **Hallow Lord** | 16+ (hidden) | Hidden quest-unlocked apex; consecrated leader of the order |

The Hallow Lord is locked behind a hidden quest, paralleling the structure of the [[aetherian-progression|Loremaster]] in the core mod (though the Loremaster is universal, the Hallow Lord is Paladin-specific).

## Promotion

- Arcanist → Paladin: costs [[core-economy|Arcane Lore]] (Core mod resource)
- Paladin → Holy Paladin → Divine Paladin: costs **Divine Seal** (Paladin-specific resource, produced at the [[military-workplaces|Divine Forge]])
- Divine Paladin → Hallow Lord: hidden quest; cost `[TBD]`

## Workplaces

The Paladin monument [[citadel-of-light]] contains:

- **The Sanctum** — Need Fulfillment for the Paladin's spiritual need (working name: *Holy Reflection*; `[TBD]`)
- **The Divine Forge** — Production workplace where the Reliquary Smith job `[tentative]` produces Divine Seals
- **Military training workplace** — `[TBD]` — name not yet decided

Full detail in [[military-workplaces]].

## Needs

Paladins consume **two** needs distinct from base Aetherians:

1. **[[need-discourse|Discourse]]** — same as other specialists; fulfilled by Loremasters at the [[arcane-lyceum]]
2. **Holy Reflection** (working name, `[TBD]`) — Paladin-specific spiritual need; fulfilled at the Sanctum

## Naming notes

The progression went through several iterations before locking. **Justicar, Guardian, Ascended Paladin, Venerated Paladin, Grandmaster, Exemplar, Vindicator, Hierarch, Consecrator, Sacred Prime, Paladin Supreme, Hallow Paladin, Paladin Ascendant** — all considered and rejected. See [[dh-paladin-ranks]] for the iteration log.

The "Hallow Lord" title was chosen over "Paladin Supreme" specifically to avoid title-reuse with the **Supreme Sorcerer** hidden rank (see [[sorcerer-design]]) — each path's hidden T4 must be uniquely named.

## Open questions

- Lock the spiritual-need name (currently *Holy Reflection*).
- Confirm or replace the Reliquary Smith job name (Gemini hedged it as tentative throughout).
- Decide the military training workplace name and whether it splits into multiple jobs.

See [[master-to-do#Paladin (Citadel of Light)|TODO list for this expansion]] for the open items.

## Cross-links

- [[citadel-of-light]] — the monument
- [[military-workplaces]] — Sanctum, Divine Forge, military training workplace
- [[aetherian-progression]] — shared Aspirant/Arcanist ladder
- [[estate-identity]] — parent estate
- [[dependency-logic]] — how this mod gates on Core
- Design history: [[dh-paladin-ranks]], [[dh-paladin-workplaces]]

---
title: Mage — Specialization Design
tags:
  - expansion-mage
  - design
  - ranks
  - jobs
created: 2026-06-04
status: planned
sources:
  - "[[dh-mage-ranks]]"
  - "[[dh-mage-path-jobs]]"
---

# Mage — Specialization Design

> **Out of scope for current development.** This expansion mod is documented but not implemented until the Core Arcanum mod ships. See [[master-to-do]].

## Theme

The Mage specialization is the **studied / academic** branch of the Arcanum Estate — the deepest expression of the estate's core fantasy. Where the Sorcerer represents *innate / inherited* magic, the Paladin represents *applied faith*, and the Druid represents *ancient wisdom*, the Mage represents **pure scholarship turned into elemental mastery**.

The Mage path is, by design, the **template** for the other three: it was the first specialization Anton workshopped, the cleanest naming iteration, and the canonical reference for how a specialization is structured.

## Status progression

| Tier | Rank | Job levels | Description |
| --- | --- | --- | --- |
| T1 | **Mage** | 1–5 | Entry-level specialist |
| T2 | **High Mage** | 6–10 | Mastery of the work profession (e.g., Wind Weaver) |
| T3 | **Grand Mage** | 11–15 | Intermediate optional rank |
| T4 | **Archmage** | 16+ (hidden) | Hidden quest-unlocked apex rank |

The rank ladder uses an academic-hierarchy progression — High / Grand / Arch — that mirrors real-world scholarly title escalation. This was the **template** for the cross-path constraint that `Arch-*` is reserved for the Mage (so the Druid can't have an Arch-Druid, etc.). Spelling note: **Archmage** is one word.

## Work professions — the four elemental jobs

The Mage path is the only specialization with **four parallel work professions** at the T1/T2 tier, one per element. The naming follows a strict two-rule structure:

1. **Each job is a two-word title** (like military Spearman/Bowman, but more poetic)
2. **Each pair alliterates internally**, AND each pair starts with a **unique consonant** — W, S, F, M

| Element | Work Profession | Building (T3 sub of Atheneum Tower) |
| --- | --- | --- |
| Wind | **Wind Weaver** | `[TBD]` |
| Earth | **Stone Shaper** | `[TBD]` |
| Fire | **Flame Forger** | `[TBD]` |
| Water | **Mist Maker** | `[TBD]` |

A Mage chooses one element to specialize in upon promoting from Arcanist. The element determines which sub-building the Mage works in inside the [[_atheneum-tower]] (currently `[TBD]` — four element-specific sub-buildings not yet designed).

Note the **water specialization specifically picks Mist** (a form of water), mirroring how Earth specifically picks Stone (a form of earth). This is intentional — it avoids the bland generic "Water Mage" feel and gives each path more specific architectural and tonal identity.

## Promotion

- Arcanist → Mage: costs [[core-economy|Arcane Lore]] (Core mod resource); element is chosen at this promotion
- Mage → High Mage → Grand Mage: costs `[TBD]` — likely element-aligned material produced at the Mage's own sub-building
- Grand Mage → Archmage: hidden quest; cost `[TBD]`

## Needs

Mages consume the universal specialist **[[need-discourse|Discourse]]** need (fulfilled at the Arcane Lyceum by Loremasters). A Mage-specific need is `[TBD]` — likely study/research-related to mirror the academic theme.

## Naming notes

The rank progression locked in **a single iteration** — fastest of all four paths. Anton already had the Mage → Archmage anchor before discussion started; the intermediate slots filled cleanly. **Grand Mage** beat **Master Mage** for the cleaner High → Grand → Arch ladder.

The elemental-job naming took **~360 lines** of iteration — by far the longest individual naming pass in the entire chat. Rejected approaches included single-word sets (Skycaller, Hydros, Pyron, Terran; or Aeronaut, Aquaflow, Cinder, Geomancer), generic descriptive titles (Wave Worker, Storm Caller), and ice-themed variants (Ice Carver, Ice Invoker, etc.) that broke the unique-consonant rule. The final W/S/F/M set emerged once the alliteration AND unique-consonant constraints were both imposed.

See [[dh-mage-ranks]] and [[dh-mage-path-jobs]] for full iteration logs.

## Open questions

- Four element-specific sub-buildings inside the Atheneum Tower (`[TBD]` names and functions).
- Element-aligned resources for promotion costs.
- Mage-specific need name.
- Whether all four element specializations share a single building each (Wind/Stone/Flame/Mist Workshop) or have unique architectural treatments.

## Cross-links

- [[_atheneum-tower]] — the monument
- [[aetherian-progression]] — shared Aspirant/Arcanist ladder; status/profession-split discipline that this path exemplifies
- [[estate-identity]] — parent estate
- [[dependency-logic]] — how this mod gates on Core
- Sibling specializations: [[paladin-design]], [[druid-design]], [[sorcerer-design]]
- Design history: [[dh-mage-ranks]], [[dh-mage-path-jobs]]

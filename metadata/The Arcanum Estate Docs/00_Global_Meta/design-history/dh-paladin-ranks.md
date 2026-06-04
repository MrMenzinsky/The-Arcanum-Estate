---
title: Paladin Ranks — Decision Log
tags:
  - design-history
  - expansion-paladin
  - ranks
created: 2026-06-04
status: locked
sources:
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 2704-2861"
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 3270-3314"
final_note: "[[paladin-design]]"
---

# Paladin Ranks — Decision Log

## Final state

The Paladin path uses a spiritual-ascension progression (Holy → Divine →
Hallow) that escalates from disciplined sanctity to consecrated authority.

| Tier | Rank | Lvl Range | Note |
| --- | --- | --- | --- |
| Tier 1 | **Paladin** | 1–5 | Entry-level specialist. |
| Tier 2 | **Holy Paladin** | 6–10 | Mastery of the Work Profession (e.g. Aether Guard). Sanctity through service. |
| Tier 3 | **Divine Paladin** | 11–15 | Direct empowerment by the deity. Spiritual apex of the standard ranks. |
| Tier 4 | **Hallow Lord** | 16+ (hidden) | Hidden, quest-unlocked apex. The consecrated leader of the order. |

## Iteration history

The Paladin path settled the first three tiers fast but cycled through the
Tier-4 (hidden) title several times.

- L2620 — earliest proposal (cross-path table) offered **Justicar** and **Guardian** as Tier 2 alternatives to Holy Paladin.
- L2710–2727 — initial proposal: Paladin / Holy Paladin / Ascended Paladin / Grandmaster. Gemini at L2724 also floated **Venerated Paladin** as a Tier 3 alternative.
- L2731–2734 — Anton swaps Ascended → **Divine Paladin**, questions whether the order should reverse, raises Grandmaster as too generic.
- L2736–2753 — Gemini confirms Holy → Divine order is correct (sanctity then deity-link); offers alternatives to Grandmaster: Exemplar, Vindicator, Justicar.
- L2768–2785 — Anton rejects all three (not spiritual enough). Gemini offers **Hallow Lord** and **Hierarch**.
- L2789–2804 — Anton likes Hallow Lord but asks for more. Gemini offers **Consecrator** and **Sacred Prime**.
- L2808–2829 — Anton asks about a variant that keeps "Paladin" in the title. Gemini offers **Paladin Supreme**.
- L2833–2852 — Anton flags title-reuse concern (Supreme is reserved for Sorcerer). Asks if **Hallow Paladin** works. Gemini argues against — it feels weaker than Holy/Divine — and offers final two: **Hallow Lord** or **Paladin Ascendant**.
- L2856–2862 — Anton locks in **Hallow Lord**.
- L3263–3268 — final consolidated rank table confirms Paladin → Holy Paladin → Divine Paladin → Hallow Lord.

## Abandoned options

- **Justicar / Guardian** (T2, L2620) — earliest cross-path alternatives to Holy Paladin; superseded once Holy Paladin was confirmed.
- **Ascended Paladin** (T3) — replaced by Divine Paladin for cleaner Holy → Divine escalation.
- **Venerated Paladin** (T3, L2724) — Gemini's alternative offered alongside Divine; not pursued.
- **Grandmaster** — too generic, applies to too many fields outside martial-spiritual orders.
- **Exemplar / Vindicator / Justicar** — strong but disconnected from the Holy/Divine spiritual theme.
- **Hierarch** — viable but less evocative than Hallow Lord.
- **Consecrator / Sacred Prime** — rejected in favor of the Hallow theme.
- **Paladin Supreme** — collides with **Supreme Sorcerer**; reuse rejected on design grounds.
- **Hallow Paladin** — Anton felt it didn't carry the same weight as Holy/Divine.
- **Paladin Ascendant** — viable runner-up but lost to Hallow Lord on uniqueness.

## Cross-links

- [[paladin-design]]
- [[dh-aetherian-progression]] (shared T1 status: Aspirant → specialization at Tier 1 Paladin)
- [[dh-mage-ranks]]
- [[dh-druid-ranks]]
- [[dh-sorcerer-ranks]]

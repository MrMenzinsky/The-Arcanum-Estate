---
title: Aetherian Progression
tags:
  - core
  - progression
  - unit
created: 2026-06-04
status: design-locked
sources:
  - "[[dh-aetherian-progression]]"
  - "[[dh-loremaster-tier-3]]"
  - "[[dh-aspirant-arcanist-jobs]]"
---

# Aetherian Progression

## The three statuses

| Tier | Status | Work profession | Building | Job levels |
| --- | --- | --- | --- | --- |
| T1 | **Aspirant** | Scholar | Academy | 1–5 |
| T2 | **Arcanist** | Caster | Aetherium | 6–10 |
| T3 | **Loremaster** | (Lecture service — see below) | [[arcane-lyceum]] | 11+ |

The progression ladder mirrors the vanilla Kingdom-Estate pattern (Militiaman → Soldier → Knight): work-profession job levels span statuses (1–5 / 6–10 / 11+), and a unit can only be promoted to the next status once it reaches the top of its current tier's job range.

## Status vs. profession (foundational distinction)

Foundation separates two concepts and the Arcanum Estate mirrors that separation strictly:

- **Status** = what the villager *is* (their place in society). Vanilla examples: Serf, Commoner, Militiaman, Soldier, Knight.
- **Work profession** = what they *do* (their job, tied to a building). Vanilla examples: Farmer, Scribe, Spearman.

In the Arcanum Estate:

- **Aspirant** is a status. **Scholar** is the job that Aspirants hold at the Academy. They are *not* the same word.
- **Arcanist** is a status. **Caster** is the job that Arcanists hold at the Aetherium.
- **Loremaster** is a status. The Loremaster's "job" is providing the [[need-discourse|Discourse]] lecture service — a service, not a produced good.

This separation is the single most important constraint on naming inside the estate. Words like "Mage" or "Paladin" name a status, never a profession. Specialist *professions* (Elementalist, Sentinel, Incantator, etc.) are separate role names.

## The Loremaster — late addition, load-bearing

The Loremaster status was added late in the design, after the core ladder (Aspirant → Arcanist) and the four specialist branches had already been defined. It exists to solve a structural problem: without it, the [[the-aethercourt|Aethercourt]] becomes mechanically irrelevant in the late game once specialists are trained and move to their expansion monuments.

The Loremaster fixes this by giving the Aethercourt a permanent late-game role: it produces Loremasters who deliver the **Lecture Service** that fulfills the [[need-discourse|Discourse]] need for all T2+ Aetherians and specialists (High Mage, Holy Paladin, Elder Druid, Awakened Sorcerer, and beyond). Without Loremasters, late-game units cannot satisfy their need; without the Aethercourt, no Loremasters exist.

The Lecture Service is **the Arcanum Estate's replacement** for the Clergy's religious-service need for the non-Clergy specialists. Mages, Paladins, Druids, and Sorcerers do not consume the vanilla church/chapel need — they consume Discourse from a Loremaster instead.

### Loremaster's mechanical cost

Promoting an Arcanist to Loremaster is **opportunity cost**: the Arcanist was producing Arcane Lore at the Aetherium; the Loremaster occupies a slot in the Arcane Lyceum providing a service. No new resource is introduced — only reallocation of high-tier labor. This is intentional; the design avoids resource bloat.

## Specialist branches off the Arcanist tier

At the Arcanist tier (T2), a villager may branch into one of four specialization paths if the relevant expansion mod is enabled:

- **Mage** → see [[mage-design]] (Atheneum Tower expansion)
- **Paladin** → see [[paladin-design]] (Citadel of Light expansion)
- **Druid** → see [[druid-design]] (Sacred Grove expansion)
- **Sorcerer** → see [[sorcerer-design]] (Bloodforged Spire expansion)

Each specialization has its own three-rank status progression and its own work professions, captured in the relevant expansion note. The Loremaster tier remains accessible regardless of specialization — a Loremaster sits **outside** the specialization branches as the universal service provider.

## Promotion costs

| Promotion | Cost |
| --- | --- |
| Aspirant → Arcanist | Gold (vanilla precedent) |
| Arcanist → Specialist (Mage/Paladin/Druid/Sorcerer) | Arcane Lore |
| Arcanist → Loremaster | Arcane Lore (`[TBD]` exact amount) |

The Arcane Lore cost for specialization promotion is the structural sink that ties [[core-economy|the core economy]] to expansion content — expansions consume Core mod resources.

## Job and status descriptions (locked)

### Aspirant — Scholar

- Status description: *"Aspirants are eager to study and learn about magic, aether and the arcane arts."*
- Job description: *"Researches the science and fundamentals of magic."*

### Arcanist — Caster

- Status description: *"Arcanists satisfy their thirst for knowledge and are granted the authority to channel arcane energy."*
- Job description: *"Applies mastered principles to manipulate and channel arcane energy."*

The Arcanist descriptions deliberately echo the vanilla Serf/Commoner pattern (Serfs are satisfied with… / Commoners enrich their lives with…) and deliberately avoid baking specific resource names into the text so renames stay safe.

### Loremaster

- Status description: `[TBD]` — to be drafted alongside the [[arcane-lyceum]] implementation.
- Job role: delivers the [[need-discourse|Discourse]] lecture service. No produced resource.

## Design notes

- The "Aspiring" intermediate rank from the original four-step proposal was cut. Three statuses are sufficient; four felt grindy and inconsistent with the base game's streamlined progression.
- Specialist work-profession naming must obey the status/profession split. "Wind Mage" / "Fire Mage" are rejected as they conflate the two; the convention is a single profession name (e.g., **Elementalist**) with an element-bound sub-profession at the sub-building level. See [[dh-aetherian-progression]] for the full reasoning.

## Cross-links

- [[estate-identity]] — the estate this progression anchors
- [[the-aethercourt]] — the monument housing T1/T2 progression
- [[core-buildings]] — the sub-buildings each tier works in
- [[arcane-lyceum]] — where the Loremaster works
- [[need-discourse]] — the need the Loremaster fulfills
- [[core-economy]] — Arcane Lore as the specialization-promotion currency
- Expansion designs: [[mage-design]], [[paladin-design]], [[druid-design]], [[sorcerer-design]]
- Design history: [[dh-aetherian-progression]], [[dh-loremaster-tier-3]], [[dh-aspirant-arcanist-jobs]]

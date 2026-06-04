---
title: Aether Envoy and the Grand Council
tags:
  - core
  - external-affairs
  - jobs
created: 2026-06-04
status: design-locked
sources:
  - "[[dh-aether-envoy]]"
---

# Aether Envoy and the Grand Council

## What this is

The Arcanum Estate's external-affairs role. Two pieces:

1. **The Aether Envoy** — the Aethercourt's chief administrative role for handling communication with outside factions, receiving visiting dignitaries, and triggering quests. This is the Arcanum Estate's equivalent of the vanilla **Bailiff** (Labor), **Emissary** (Clergy), or **Royal Courtier** (Kingdom).
2. **The Grand Council** — the umbrella external authority the Envoy liaises with. Vague by design so it can host quest givers for the Aethercourt and for every expansion monument under one banner.

The Envoy lives at the Aethercourt. The Grand Council does not have a physical presence in-game — its members visit through the Envoy.

## Why the umbrella matters

The five-monument structure (one core + four expansions; see [[monument-architecture]]) means each monument needs its own external-quest hook. Rather than designing four separate factions, the Grand Council is a single named authority with **member roles** that can be customized per monument:

- One Council member visits the Aethercourt for general Aetherian affairs
- One visits the [[_citadel-of-light]] for Paladin matters
- One visits the [[_sacred-grove]] for Druid matters
- And so on for [[_bloodforged-spire]] and [[_atheneum-tower]]

Analogous to vanilla quests where the Abbess, Seneschal, or King visit specific monuments.

## Reserved roles

- **The Arch-Seer** — reserved as a potential high-ranking Grand Council member name. Not yet committed.

## Flavor reservoir (alternate Council member factions)

When fleshing out individual Council members or designing alternate quest givers, three thematic buckets remain available as a naming/flavor reservoir:

| Bucket | Example names | Quest flavor |
| --- | --- | --- |
| **High Magic Authority** (the chosen direction) | The Grand Council, The Conclave of Mages, The Arch-Seer, The High Coven | Retrieving forbidden knowledge; managing magical crises |
| **Ancient Institutions** | The Royal Academy, Ancient University Senate, Library of Alexandria-equivalent | Research, discovery, archiving |
| **Wealth / Patronage** | The Scholarly Patron, Wealthy Dynasties, The Sponsoring Duchess | Securing funding, undertaking high-cost projects |

## Naming notes

"Aether Envoy" was chosen over Loremaster (too internal — librarian feel), Magister (strong but less role-specific), Archon (too absolutist, sounded like an internal ruler), and Provost (strong academic-administrative fit but lacked the external connotation). "Envoy" is a direct synonym for Emissary; the "Aether" prefix anchors it to the estate identity without naming a specific magical discipline.

## Open questions

- Specific quest types the Aether Envoy unlocks. `[TBD]`.
- Which Grand Council member name maps to which monument. `[TBD]` — to be decided alongside each expansion's design.
- Whether the Envoy is a worker unit (consumes a job slot in the Aethercourt) or an abstract role. `[TBD]`.

## Cross-links

- [[_the-aethercourt]] — where the Envoy operates
- [[estate-identity]] — estate context
- Expansion monuments where the Council also visits: [[_citadel-of-light]], [[_sacred-grove]], [[_bloodforged-spire]], [[_atheneum-tower]]
- Design history: [[dh-aether-envoy]]

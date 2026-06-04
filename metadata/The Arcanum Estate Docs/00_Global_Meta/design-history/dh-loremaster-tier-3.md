---
title: Loremaster (Tier 3) — Decision Log
tags:
  - design-history
  - core
  - late-addition
created: 2026-06-04
status: locked
sources:
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 4907-4960"
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 5025-5190"
final_note: "[[loremaster]]"
---

# Loremaster (Tier 3) — Decision Log

## Final state
- **Loremaster** is the T3 Aetherian villager status, promoted from Arcanist. Completes the ladder: Aspirant → Arcanist → **Loremaster**.
- Gender-neutral form, following vanilla precedent (e.g., *Field Marshal*) — explicitly chosen over a "Loremistress" split (L4924).
- Works in the **Arcane Lyceum**, a T3 sub-building of the **Aethercourt** (locked at L5114).
- Job = **need fulfillment**, not resource production. Loremasters deliver a **Lecture Service** ("Arcane Instruction" / "Scholarly Contemplation").
- The Lecture Service fulfills a new need (the [[dh-discourse-need]]) for **T2+ Aetherians and specialists**: High Mage, Holy Paladin, Elder Druid, Awakened Sorcerer and beyond (L4954).
- Tier ranges follow the Militiaman/Soldier/Knight pattern: Aspirant 1-5, Arcanist 6-10, **Loremaster 11+** (L4939-4941).

## Iteration history
- **LATE ADDITION** — Loremaster was not part of the original progression design. The core ladder was already locked at Aspirant → Arcanist (L818-822, much earlier in the conversation), and the four specialist branches had been defined off the Arcanist tier.
- **L4907-4910** — User reopens the design and proposes promoting Aspirant → Arcanist → **Loremaster** as a third status, reusing the name Gemini had suggested earlier. Conceived from the start as a *service-providing* role: Loremasters give "presentations/demonstrations" (lectures) to higher magic users, analogous to how villagers need a chapel for religion service.
- **L4913-4928** — Gemini frames the addition as a **"Critical Necessity"** because it solves a structural problem: the specialized monuments (Mage tower, Paladin sanctum, Druid grove, Sorcerer spire) had **no mechanical reason to interact with the Aethercourt** once their specialists were trained. The Aethercourt risked becoming irrelevant in the late game. The Loremaster + Lecture need wires the Aethercourt back into the late-game loop as the "engine" servicing every specialist estate. **This is the load-bearing justification for the whole T3 tier.**
- **L4931-4956** — Implementation sketch locked: new T3 status, new T3 sub-building in the Aethercourt (auditorium/lecture-hall flavor; candidate names included The Lecture Hall, The Assembly Hall, The Grand Lecture), and a new unit need served only by Loremasters.
- **L4926** — Gemini frames the Lecture Service explicitly as the **replacement for the religious service need** for the highly specialized, non-Clergy units (Mage, Paladin, Druid, Sorcerer and their higher ranks). The Aetherian specialists do not consume the vanilla church/chapel need; instead they consume Lecture Service from a Loremaster.
- **L4939-4941 (tier ranges)** — User confirms the Militiaman/Soldier/Knight split applies: Aspirant 1-5, Arcanist 6-10, **Loremaster 11+**. This requires the Loremaster sub-building to support job levels 11+ as the third tier of the work-profession ladder, parallel to a Knight's required subordinate count.
- **L5111-5114** — Sub-building name finalized as **The Arcane Lyceum**, serving Aetherians, Mages, Druids, and Sorcerers. (Paladins are served by **The Sanctum**, a sibling structure.)
- Balancing intent (L4927): the cost of running the system is the **opportunity cost** of promoting a productive Arcanist (who makes Arcane Lore) into a Loremaster (who consumes a slot to provide service). No new resource is added — only reallocation of high-tier labor.

## Abandoned options
- **Loremistress** as a gendered female form — rejected in favor of a single gender-neutral title to match vanilla conventions (L4924).
- **Adding a new resource** to back the T3 tier — explicitly rejected; the design intentionally avoids resource bloat and instead uses unit reallocation as the balancing lever (L4927).
- **Leaving the Aethercourt as a T1/T2-only monument** — implicitly rejected once Gemini surfaced the late-game irrelevance problem (L4925).
- **Alternate sub-building names**: The Lecture Hall, The Assembly Hall, The Grand Lecture — all considered but dropped in favor of **The Arcane Lyceum** (L4947 vs. L5114).
- **Alternate need names**: "Arcane Instruction", "Scholarly Contemplation" — superseded by the locked [[dh-discourse-need]] terminology.

## Cross-links
- [[dh-aetherian-progression]] — the underlying Aspirant → Arcanist → Loremaster ladder this tier completes
- [[dh-discourse-need]] — the T2+ need fulfilled by the Lecture Service
- [[_the-aethercourt]] — parent monument
- [[dh-arcane-lyceum]] — the T3 sub-building where the Loremaster works
- [[specialist-paths]] — the Mage / Paladin / Druid / Sorcerer units that consume the Lecture Service

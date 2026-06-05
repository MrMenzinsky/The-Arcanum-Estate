---
title: Military Workplaces (Citadel of Light Sub-Buildings)
tags:
  - expansion-paladin
  - building
  - jobs
created: 2026-06-04
status: planned-with-open-todos
sources:
  - "[[dh-paladin-workplaces]]"
---

# Military Workplaces (Citadel of Light Sub-Buildings)

> **Out of scope for current development.** Documented design; implementation deferred until Core Arcanum ships.

## Hard constraint

In Foundation's modding model, **a sub-building has exactly one function**. The Paladin's needs span need fulfillment + production + military training, so they require **three separate sub-buildings**, not one multi-purpose building.

## Sub-buildings

| Sub-building | Function | Worker / job | Output | Status |
| --- | --- | --- | --- | --- |
| **The Sanctum** | Need Fulfillment | (the Paladin themselves visits) | Satisfies Holy Reflection need | Locked |
| **The Divine Forge** | Production | Reliquary Smith `[tentative]` | **Divine Seal** (also the Paladin promotion cost) | Building locked; job name tentative |
| **Military training workplace** | Training | Field Marshal (working name) | Combat training / unit buffs | **`[TBD]` — name not decided** |

## The Sanctum

Function: **Need Fulfillment**. Paladins visit the Sanctum to satisfy their spiritual need (working name: *Holy Reflection*; `[TBD]`).

The Sanctum's name was workshopped early — alternatives **Vigil Sanctum**, **Divine Chapter**, **Aegis Hall** were considered as modifiers to make the name read more martial. Anton kept the bare name with the option to add a modifier later. See [[dh-sub-building-renames]] for the full Sanctum history (originally an Aethercourt sub-building, then promoted to the Citadel's centerpiece).

## The Divine Forge

Function: **Production**. Houses the **Reliquary Smith** job `[tentative]`, which produces **Divine Seals** — a Tier-3 holy component that also serves as the Paladin promotion cost (Paladin → Holy Paladin → Divine Paladin).

"Reliquary Smith" was used throughout the Gemini chat with hedge language ("Reliquary Smith *or similar*") — Anton never explicitly locked it. **The job name is open**; see open TODOs below.

"Divine Forge" was chosen from a 10-option Forge-themed shortlist. Alternatives considered: Consecration Forge, Hallowed Forge, Vow-Forge, Light-Wrought Forge, Virtue Forge, Covenant Forge, Aegis Forge, Templar Forge, Anointed Forge. Earlier naming rounds also considered The Chantry, Forge of Vows, Consecration Chamber. See [[dh-paladin-workplaces]].

A naming alternative — **Holy Armorer** (producing *Consecrated Plate* instead of Divine Seals) — was floated but discarded. The Seal pattern (small, magical, used as currency) fit better than the Plate pattern (large, physical, used as armor) for the Paladin promotion economy.

## Military training workplace — `[TBD]`

Conversation was **deferred** during the original chat at lines 4869-4905, when Anton paused the Paladin track to focus on the core mod. Name remains undecided.

Candidates on the table from the original exploration:

- **The Watch Post**
- **The Commandery**
- **The Marshal's Ward**
- **The Hall of Arms** (Gemini's suggestion at L4335 for a dedicated training sub-building)

Job (working name): **Field Marshal**.

Also flagged at L4285: the military function could potentially split into multiple jobs (combat training + garrison/aura buffer + spiritual support). Decision deferred. Alternate Paladin job names considered but never locked: **Aether Guard** (garrison/aura), **Vow Keeper** (spiritual buff).

## Open TODOs

- [ ] Decide the **military training workplace** sub-building name. Candidates: Watch Post, Commandery, Marshal's Ward, Hall of Arms.
- [ ] Decide whether to split the military function into multiple jobs.
- [ ] Confirm or replace the **Reliquary Smith** job name.
- [ ] Lock the **Holy Reflection** need name.

See [[master-to-do#Paladin (Citadel of Light)|master TODO]] for these items as actionable bullets.

## Cross-links

- [[paladin-design]] — full specialization design
- [[citadel-of-light]] — the monument that contains these workplaces
- [[the-aethercourt]] — core monument
- [[need-discourse]] — the universal specialist need (Discourse, fulfilled at Arcane Lyceum)
- Design history: [[dh-paladin-workplaces]]

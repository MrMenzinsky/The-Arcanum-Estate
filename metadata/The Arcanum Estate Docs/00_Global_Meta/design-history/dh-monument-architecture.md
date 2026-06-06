---
title: Monument Architecture — Decision Log
tags:
  - design-history
  - core
  - architecture
created: 2026-06-04
status: locked
sources:
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 3315-3385"
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 4123-4147"
final_note: "[[monument-architecture]]"
---

# Monument Architecture — Decision Log

## Final state
The Arcanum Estate is split into **five distinct monuments** rather than a single Aether Court container:

- **Tier 1/2 — The Aethercourt** (core hub: Aspirants, Arcanists)
- **Tier 3 — [[dh-atheneum-tower]]** (Mage specialization)
- **Tier 3 — [[dh-citadel-of-light]]** (Paladin specialization)
- **Tier 3 — [[dh-sacred-grove]]** (Druid specialization)
- **Tier 3 — [[dh-bloodforged-spire]]** (Sorcerer specialization)

This is **the central structural pivot** of the entire mod design — every later content decision branches from this five-monument layout (L4123-4134).

## Iteration history
- **L3319-3320** — Initial proposal: split monument into one base (Aspirants/Arcanists) plus one each for Mages, Paladins, Druids, Sorcerers.
- **L3326-3332** — Gemini initially pushed back, recommending a single invisible `Aether Court` container with named Tier 3 sub-buildings instead, citing vanilla precedent (one Monument per Estate: Church, Keep).
- **L3351-3357** — **Decisive correction:** the Labour Estate actually has **three monuments** (Manor House at T1, Tavern at T2, City Market at T4). Vanilla precedent for multiple specialized monuments per estate confirmed. Gemini reversed its position; five-monument split locked in as "structurally sound and highly thematic."
- **L3365-3383** — Naming sweep started for the core monument (`The Aethercourt` / `The Arcanum` / `The Grand Academy`) and the four specialist Tier 3 monuments.

## Abandoned options
- **Single invisible `Aether Court` container** with all specialization handled by sub-buildings — abandoned after Labour Estate precedent was raised.
- **Core monument alternative names:** `The Arcanum`, `The Grand Academy` — both rejected in favor of `The Aethercourt` (one word).

## Cross-links
- [[dh-atheneum-tower]] — Mage monument decision log
- [[dh-citadel-of-light]] — Paladin monument decision log
- [[dh-sacred-grove]] — Druid monument decision log
- [[dh-bloodforged-spire]] — Sorcerer monument decision log
- [[dh-sub-building-renames]] — knock-on renames triggered by the split (Aether Tower etc.)

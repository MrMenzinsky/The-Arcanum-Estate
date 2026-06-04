---
title: Core Economy (Glyph, Aether Crystal, Arcane Lore) — Decision Log
tags:
  - design-history
  - core
  - economy
  - resources
created: 2026-06-04
status: locked
sources:
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 2177-2326"
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 2327-2460"
final_note: "[[core-economy]]"
---

# Core Economy — Decision Log

The Arcanum Estate's economy has two parallel resource loops: a knowledge
loop (Glyph -> Arcane Lore) and a physical-material loop
(Aether Crystal -> Faceted Aether Crystal).

## Final state

| Resource | Tier | Produced By | At | Stored In |
| --- | --- | --- | --- | --- |
| **Glyph** | T1 | Scholar (Aspirant) | Academy | Archive |
| **Arcane Lore** | T2 | Caster (Arcanist) | Aetherium | Archive |
| **Aether Crystal** | T1 | Serf | Aether Crystal Mining Camp (outside Aethercourt) | Aether Hold |
| **Faceted Aether Crystal** | T2 | **Lapidarist** (Aspirant/Arcanist) | **Lapidary** | Aether Hold |

Faceted Aether Crystal is intended as the common building material used
to construct sub-buildings of the Aethercourt across the whole game.

## Iteration history

### Glyph (basic intellectual resource)
- Started as **Research Paper**, then briefly **Formula** — both rejected
  for being generic / cross-discipline (lines 2177-2178).
- Rejected: Cipher, Schema, Hypothesis (line 2196) — all rejected as
  "in the right area" but not landing; Hypothesis specifically pulled too
  hard toward the scientific method.
- User suggested **Aether Findings** but worried about overusing "Aether",
  and asked for Rune-related ideas (line 2201). "Aether Findings" was
  never formally re-proposed but is the bridge that pivoted the
  conversation away from generic science terms toward magical-writing
  terms (Glyph / Inscription / Rune-adjacent).
- Considered: Glyph, Inscription, Observation (line 2220).
- More options floated: Vector, Fragment, Analysis, Paradigm (lines 2232-2245).
- Down to Glyph + Sigil + Imprint (lines 2263-2270).
- Locked tentatively: **Glyph**, with Sigil kept as the key alternative
  (line 2275).

### Aether Crystal economy
- Parallels vanilla **Stone -> Polished Stone (Mason Hut)** at T2
  (lines 2333-2354).
- Aether Crystal is mined by serfs at a standalone T1 Aether Crystal
  Mining Camp (NOT part of the Aethercourt) (line 2333).
- Faceted Aether Crystal is produced inside the Aethercourt at T2 by
  Aspirants/Arcanists.

### Lapidarist (refiner job)
- Building candidates: Lapidary, Crystal Forge, Aether Cuttery,
  Facetorium, Crystal Refinery (lines 2373-2407). **Crystal Refinery**
  was the user's initial pre-discussion working name (line 2384), but
  rejected as too industrial — "Refinery" implies chemical / oil / sugar
  processing and clashes with the scholarly, magical feel.
- Job-title candidates: Crystallist, Facetor, Cutter, **Gemcutter**
  (rejected as "too common"), Aether Shaper (line 2373).
- User asked if Lapidary's natural job-title pair "Lapidarist" was the
  right move (line 2383). Gemini confirmed: Lapidary/Lapidarist are
  archaic, formal, and thematically precise (a lapidary is exactly a
  gem-cutting workshop), matching the tone of Aethercourt / Scholar /
  Arcanist.
- Locked: **Lapidary** + **Lapidarist**. Facetorium/Facetor/Crystallist
  retained as side options (line 2419).

## Abandoned options

- Research Paper, Formula (early names for Glyph).
- Cipher, Schema, Hypothesis, Vector, Analysis, Paradigm, Inscription,
  Observation, Sigil (Sigil kept on backup list), Imprint.
- Crystal Refinery, Crystal Forge, Aether Cuttery, Facetorium (kept as
  side option).
- Crystallist, Facetor, Cutter, Gemcutter, Aether Shaper (kept as side
  options).

## Cross-links

- [[glyph]] — basic intellectual resource
- [[arcane-lore]] — refined intellectual resource
- [[aether-crystal]] — basic physical resource
- [[faceted-aether-crystal]] — refined physical resource
- [[lapidary]] / [[lapidarist]]
- [[dh-core-buildings]] — Archive & Aether Hold storage split
- [[aether-crystal-mining-camp]] — external T1 mining site

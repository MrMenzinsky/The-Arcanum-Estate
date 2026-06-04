---
title: Core Aethercourt Sub-Buildings — Decision Log
tags:
  - design-history
  - core
  - buildings
  - aethercourt
created: 2026-06-04
status: locked
sources:
  - Foundation-The-Arcanum-Estate-gemini-conversation.md lines 709-729
  - Foundation-The-Arcanum-Estate-gemini-conversation.md lines 2027-2176
  - Foundation-The-Arcanum-Estate-gemini-conversation.md lines 2327-2603
  - Foundation-The-Arcanum-Estate-gemini-conversation.md lines 4225-4267
  - Foundation-The-Arcanum-Estate-gemini-conversation.md lines 4720-4755
  - Foundation-The-Arcanum-Estate-gemini-conversation.md lines 4930-5010
final_note: "[[_the-aethercourt]]"
---

# Core Aethercourt Sub-Buildings — Decision Log

The Aethercourt monument is an invisible container holding the estate's
sub-buildings. The five core sub-buildings below are locked in.

## Aethercourt monument description

The Aethercourt itself is an *invisible container object* (lines 2331-2333) —
it does not render as a building; it simply groups its sub-buildings under one
monument game object and grants access to the special monument build menu.
Two candidate one-line descriptions were workshopped against the vanilla
estate descriptions (Manor House / Castle / Monastery) at lines 709-729:

1. *"A grand complex of halls and courtyards dedicated to the mastery and
   preservation of arcane knowledge."* — scholarly / secretive framing.
2. *"Allows the specialization and advanced training of scholars to channel
   and command magical energy."* — function-first framing, mirrors the
   vanilla Castle / Manor descriptions.

Final selection between the two was deferred at this point in the chat.

## Final state

| Sub-Building | Tier | Function | Notes |
| --- | --- | --- | --- |
| **Annex** | T1 | Lodging for Aspirants and Arcanists | Description: "A place for your Aetherians to study and rest." (lines 4720-4755) |
| **Lapidary** | T2 | Workshop: Aether Crystal -> Faceted Aether Crystal | Worked by Lapidarist. See [[dh-core-economy]] (lines 2327-2460) |
| **Archive** | T1/T2 | Storage for intellectual resources (Glyph, Arcane Lore) | Single-noun, scholarly (lines 2461-2484) |
| **Aether Hold** | T1/T2 | Storage for physical resources (Aether Crystal, Faceted Aether Crystal, future materials) | Backup name: Materia Reserve (lines 2507-2587) |
| **Arcane Lyceum** | T3 | Loremaster workplace; fulfils the Discourse need for all T3+ specialists | See [[dh-arcane-lyceum]] (lines 4930-5010); working name in source was "Arcane Instruction", later finalized to **Discourse** |

The Academy (Aspirant work site) is a sixth core T1 sub-building and is
covered separately under its own design notes.

## Iteration history

### Annex (lodging)
- Rejected: "The Chambers", "The Alcoves", "The Commons", "The Student Hall"
  — user wanted a name without "The" prefix (lines 2086-2126).
- Rejected: Solarium (reserved for future mechanic), Aery (lines 2133-2144).
- Locked: **Annex**. Both Aspirants and Arcanists sleep here; specialists
  (Mage/Druid/etc.) will get their own lodging (line 2176).
- Five additional alternatives floated after Annex was locked, "for
  arguments' sake" (lines 2152-2158): **Refuge**, **Retreat**, **Halls**,
  **Aery** (repeat), **Vesper**. None overturned Annex.
- Annex description was locked separately at lines 4720-4755:
  *"A place for your Aetherians to study and rest."* — chosen against the
  vanilla pattern (Manor House "call home" / Monk Dorms "pray and rest" /
  Barracks "rest and heal"). This is also the canonical place where the
  collective term **Aetherians** (the population of the Arcanum Estate) is
  introduced.

### Lapidary
- Job-title candidates considered: Crystallist, Facetor, Cutter,
  **Gemcutter** (explicitly flagged as "too common"), Aether Shaper
  (line 2373).
- Building candidates: Lapidary, Crystal Forge, Aether Cuttery, Facetorium,
  Crystal Refinery (rejected as too industrial — "Refinery" implies
  chemical/oil/sugar processing, lines 2374-2407). The user volunteered
  **Crystal Refinery** as their initial pre-discussion idea (line 2384).
- Locked: **Lapidary** + **Lapidarist** (line 2419). Facetorium / Facetor
  / Crystallist kept as side options.

### Archive
- Considered: Archive, Repository, Registrum (lines 2473-2479).
- Locked: **Archive** (line 2484).

### Aether Hold
- Rejected (round 1): Crystallary, Depot, Trove (line 2503).
- Rejected (round 2, single-noun constraint dropped): Arcanarium, Repertory
  (lines 2524-2531).
- Considered: Aether Hold, Relic Storage, Component Vault (lines 2551-2553).
- Rejected (round 3): Arcane Cache, Component Chamber, Materia Reserve,
  Geode Storage, Mystic Strongbox (lines 2573-2577).
- Locked: **Aether Hold**, with **Materia Reserve** as backup (line 2584).

### Arcane Lyceum
- Considered: The Grand Lecture, The Assembly Hall, The Arcane Lyceum,
  The Aetherian Forum, The Great Rotunda (lines 4970-4984).
- Locked: **The Arcane Lyceum** (line 4992). Tied to T3 Loremaster unit
  and the need that the chat called *Arcane Instruction* — later
  finalized as **Discourse**. See [[dh-arcane-lyceum]].

### Sanctum (re-confirmation inside Citadel of Light)
- At lines 4225-4267 the Sanctum name was revisited in the context of
  the Tier-3 Paladin monument [[dh-citadel-of-light]]. Gemini suggested
  modifiers (**The Vigil Sanctum**, **The Divine Chapter**, **The
  Aegis Hall**) on the grounds that bare "Sanctum" might read too
  quiet/monastic for a martial holy order.
- User reaffirmed the bare name: locked as **Sanctum**, with the option
  to add a modifier later if needed (line 4263). The Sanctum thus
  remains a sub-building but functions as the architectural core of
  Citadel of Light — see [[dh-sub-building-renames]].

## Abandoned options

See iteration history above. No locked option was later overturned for
these five sub-buildings.

Note that the **Sorcerer specialization sub-building** was abandoned
entirely — see [[dh-sorcerer-subbuilding-abandoned]].

## Cross-links

- [[_the-aethercourt]] — parent monument
- [[dh-core-economy]] — resources processed and stored here
- [[dh-arcane-lyceum]] — architectural vision
- [[dh-sub-building-renames]] — Sacred Grove, Sanctum and Aether Tower were
  later promoted out of the sub-building list

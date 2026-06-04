---
title: Abandoned Ideas
tags:
  - meta
  - paper-trail
  - abandoned
created: 2026-06-04
status: living-document
sources:
  - "[[dh-sorcerer-subbuilding-abandoned]]"
  - "[[dh-sub-building-renames]]"
  - "[[dh-aetherian-progression]]"
  - "[[dh-monument-architecture]]"
---

# Abandoned Ideas

A log of design ideas that were considered and rejected, or initially adopted and later revised. Maintained so future-Anton (and future-Claude) doesn't waste effort re-exploring dead ends.

For exhaustive per-topic naming alternatives, see the `dh-*` decision logs in `design-history/`. This note captures only the **structurally significant** abandonments — the ones that changed the shape of the design.

## Structural

### No Sorcerer sub-building inside the Aethercourt

**Status:** Permanently abandoned during initial brainstorm.

Every name proposed for a Sorcerer-themed sub-building inside the Aethercourt was rejected: Vortex, Crucible, Chasm, Forge, Crypt, Catacomb, Atelier, Menagerie, Conduit, Arena, Kiln, Foundry, Cistern, Barrow.

After ~14 rejected options Anton decided not to force a fourteenth-attempt name. The Sorcerer path expresses itself at monument scale via [[_bloodforged-spire]] instead — the asymmetry is intentional. The other three specialist paths (Mage, Paladin, Druid) each had an Aethercourt sub-building during early design; the Sorcerer never did, by deliberate choice.

**Do not revisit:** unless someone has a sub-building concept derived from monument lore (i.e., something that emerges naturally from the Bloodforged Spire's identity), not from name-first brainstorm. See [[dh-sorcerer-subbuilding-abandoned]].

### Single monument for the entire Arcanum Estate

**Status:** Initially Gemini's recommendation, abandoned at lines 3351-3357 of the chat.

Gemini originally pushed for a single invisible "Aether Court" container with all specialization handled by sub-buildings, citing one-monument-per-estate as vanilla precedent. This was overturned when the Labour Estate's actual three-monument structure (Manor House / Tavern / City Market) was raised.

Outcome: five-monument structure locked. See [[monument-architecture]].

### Four-step status progression

**Status:** Abandoned in favor of three-step.

Original proposal: Student → Arcane Scholar → Aspiring [Specialist] → final Specialist. The "Aspiring" intermediate rank was cut — three statuses match the base game's pace and avoid feeling grindy. Final ladder is Aspirant → Arcanist → Loremaster ([[aetherian-progression]]).

### Hidden quest system for a Master-tier post-cap rank

**Status:** Conceived early, replaced by Loremaster.

Original concept: hidden quests unlock a post-cap Master tier (Master Mage, Radiant Paladin, etc.). The Loremaster T3 mechanism superseded this — same goal (late-game depth) but achieved through unit reallocation rather than a hidden gating mechanic. See [[aetherian-progression#The Loremaster — late addition, load-bearing|Loremaster overview]] and [[dh-aetherian-progression]].

## Naming renames (structural)

| Name | Originally | Now | See |
| --- | --- | --- | --- |
| **Aether Tower** | Mage sub-building inside Aethercourt | Retired entirely; replaced by [[_atheneum-tower]] | [[dh-sub-building-renames]] |
| **Sacred Grove** | Druid sub-building inside Aethercourt | Promoted to Tier-3 Druid monument [[_sacred-grove]] | [[dh-sub-building-renames]] |
| **Sanctum** | Paladin sub-building inside Aethercourt | Kept as a sub-building, but now inside [[_citadel-of-light]], not Aethercourt | [[dh-sub-building-renames]] |
| **Aether Court** (two-word) | Working spelling | Locked as single-word **The Aethercourt** | [[dh-the-aethercourt]] |
| **Scribe / Researcher / Theorist / Practitioner** | Working names for Aspirant/Arcanist work professions | Locked as **Scholar (Aspirant)** + **Caster (Arcanist)** | [[dh-aspirant-arcanist-jobs]] |
| **Arcane Instruction** | Working name for the T2+ need | Locked as **[[need-discourse\|Discourse]]** | [[dh-discourse-need]] |
| **Crystal Refinery** | Anton's initial working name for the Lapidary | Rejected as too industrial — locked as **Lapidary** + **Lapidarist** | [[dh-core-economy]] |
| **Research Paper / Formula** | Working names for the basic intellectual resource | Locked as **Glyph** (with Sigil as backup) | [[dh-core-economy]] |

## Naming dead ends (don't re-explore)

If a future brainstorm reaches for any of these, check the linked decision log before adopting — they were already considered and rejected.

- **Estate name alternatives:** Arcane Estate, Arcana Estate, Scholarly Estate, Mystical Estate, Esoteric Estate, Arcane Order/Council/Conclave — see [[dh-estate-identity]]
- **Aethercourt name alternatives:** Academy, Sanctum, Nexus, Spire, Vault, Citadel, Locus, Aetherium, Aetherhall, Aetherhold, Aetherfort, Aethergarth, Aetherclave, Aetherhaven, Caelum, Crucible, Observatory, Reliquary, Scholarium, Collegium, Lyceum (the last three came back at sub-building scale) — see [[dh-the-aethercourt]]
- **Entry-level status name alternatives:** Student, Initiate, Acolyte, Prentice, Novitiate, Pupil, Postulant, Warder, Junior Scholar, Novice Arcanist, Magic Aspirant — see [[dh-aetherian-progression]]
- **Arcanist profession name alternatives:** Researcher, Scribe, Archivist, Librarian, Channeler, Rune Crafter, Theorist, Practitioner, Apprentice, Attuner, Tutor, Experimenter, Lector — see [[dh-aspirant-arcanist-jobs]]
- **Discourse need name alternatives:** Contemplation, Enlightenment, Erudition, Insight, Scholarly Pursuit, Meditation, Intellectualism, Reflection, Instruction — see [[dh-discourse-need]]

## Cross-links

- [[master-to-do]] — actionable open items (distinct from abandoned ones)
- [[_chat-index]] — line ranges in the raw Gemini chat for each topic
- All `dh-*` files in `00_Global_Meta/design-history/` — full per-topic decision logs

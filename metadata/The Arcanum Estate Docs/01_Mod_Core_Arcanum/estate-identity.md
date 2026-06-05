---
title: Estate Identity
tags:
  - core
  - estate-identity
created: 2026-06-04
status: design-locked
sources:
  - "[[dh-estate-identity]]"
  - "[[project-brief]]"
---

# Estate Identity

## What this is

The Arcanum Estate is the **fourth social estate** for Foundation, parallel to the vanilla Labor, Clergy, and Kingdom estates. It represents the intellectual and scientific pillar of medieval society — scholars, magic-users, and the institutions they build.

## Core fantasy

A society of scholars and magic-users (collectively: **Aetherians** — see [[aetherian-progression]]) cultivating the intersection of medieval science, academic study, and high magic. The estate feels deliberately different from the rugged-regal vanilla estates: more constructed, more geometric, more intellectual.

## Visual identity

| Property | Value | Rationale |
| --- | --- | --- |
| Splendor color | **Metallic purple / lavender** | Distinct from Labor yellow/gold, Clergy silver, Kingdom orange/bronze. Purple over blue for accessibility — blue is too close to Clergy silver under color-vision impairment. |
| Heraldry shape | **Flared top with sharp points** | Conveys a dynamic, high-magic, specialized seal. See [[project-brief]] for the shield silhouette spec. |
| Internal symbol | `[TBD]` | Open; tracked in [[master-to-do]]. |

## Naming

**The Arcanum Estate.** Singular collective noun, matching the vanilla pattern (Labor / Clergy / Kingdom — all singular collective nouns). "Arcane" was rejected because it's an adjective and breaks the pattern. "Arcana" was rejected because it reads as plural.

## Base unit

The base Aetherian unit is the **Aspirant** (a scholar in training). Aspirants are promoted through the Aetherian progression ladder and may branch into four specializations once the relevant expansion mod is enabled. See [[aetherian-progression]].

The earlier working term "Scholar" survives as the **work profession** of an Aspirant (their job), not as their status. See [[dh-aspirant-arcanist-jobs|the work-profession decision log]] for why.

## Base resource

**Arcane Lore.** The Arcanum Estate's parallel to the Kingdom's Royal Treasures or the Clergy's Piety — the abstract estate-prestige resource that drives splendor and unlocks higher-tier content. Full economy in [[core-economy]].

## Specializations

The base Arcanum Estate stands on its own. Four optional expansion mods add specialization paths an Aspirant can branch into after reaching the Arcanist tier:

- [[paladin-design]] (Citadel of Light)
- [[druid-design]] (Sacred Grove)
- [[sorcerer-design]] (Bloodforged Spire)
- [[mage-design]] (Atheneum Tower)

See [[dependency-logic]] for how expansions gate on the core mod.

## Design principles

- **Visual distinction over visual harmony with vanilla.** The Arcanum should not feel like a fourth flavor of the existing three.
- **Intellectual over physical.** Where Kingdom needs satisfy by feasting and Labor needs satisfy by entertainment, Arcanum needs satisfy through [[need-discourse|Discourse]] — lectures and debate.
- **Geometric architectural language.** Domes, formalized nodes, icosahedrons mixed into the medieval base — see [[the-aethercourt]] and [[arcane-lyceum]] for the architectural vocabulary.

## Cross-links

- [[the-aethercourt]] — the core monument
- [[aetherian-progression]] — unit progression
- [[core-economy]] — resources
- [[core-buildings]] — sub-buildings
- [[need-discourse]] — custom need
- [[aether-envoy]] — external-affairs role
- Design history: [[dh-estate-identity]]

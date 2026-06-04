---
title: Monument Architecture
tags:
  - meta
  - architecture
  - core
created: 2026-06-04
status: design-locked
sources:
  - "[[dh-monument-architecture]]"
---

# Monument Architecture

## The five-monument structure

The Arcanum Estate is split across **five distinct monuments** rather than a single Aether Court container:

| Tier | Monument | Mod | Status |
| --- | --- | --- | --- |
| T1 / T2 | **[[_the-aethercourt]]** | Core (`01_Mod_Core_Arcanum`) | Required |
| T3 | **[[_citadel-of-light]]** | Paladin expansion (`02_Mod_Citadel_of_Light`) | Optional |
| T3 | **[[_sacred-grove]]** | Druid expansion (`03_Mod_Sacred_Grove`) | Optional |
| T3 | **[[_bloodforged-spire]]** | Sorcerer expansion (`04_Mod_Bloodforged_Spire`) | Optional |
| T3 | **[[_atheneum-tower]]** | Mage expansion (`05_Mod_Atheneum_Tower`) | Optional |

**This is the central structural pivot of the entire mod design.** Every later content decision branches from this five-monument layout — sub-building assignments, status progression, expansion gating, and the monument-naming patterns all stem from it.

## Why five, not one

The original recommendation was a **single invisible "Aether Court" container** with all specialization handled by sub-buildings, on the grounds that vanilla Foundation gives each estate one monument (Church for Clergy, Keep/Castle for Kingdom). That was wrong.

The decisive correction: **the Labour Estate actually has three monuments** — Manor House at T1, Tavern at T2, City Market at T4. Vanilla precedent allows multiple specialized monuments per estate. With that constraint removed, the five-monument layout became the obviously cleaner design.

## What each monument contains

- **The Aethercourt** (Tier 1/2) is the entry point and shared base — Aspirants and Arcanists work here, the core economy runs here, and the [[arcane-lyceum|Arcane Lyceum]] sits here as the T3 sub-building serving all specializations. See [[_the-aethercourt]] and [[core-buildings]].
- **Each expansion monument** (Tier 3) hosts one specialization's higher-tier units, their specialist sub-buildings, and their progression to the hidden T4 apex rank. None can function without the Aethercourt — see [[dependency-logic]].

## Asymmetry — the Sorcerer

The Sorcerer specialization is unique: **it has no Aethercourt sub-building.** Every name proposed for one was rejected during early design. The Sorcerer's architectural home is exclusively [[_bloodforged-spire]]. The other three paths each had an Aethercourt sub-building during the original design (Sacred Grove for Druid, Sanctum for Paladin, Aether Tower for Mage — but two of these were later promoted to monuments themselves). This asymmetry is intentional. See [[abandoned-ideas#Structural|abandoned ideas]].

## Promotion / rename history

Three names originally workshopped as Aethercourt sub-buildings shifted role when the five-monument structure was locked in:

| Name | Originally | Now |
| --- | --- | --- |
| **Sacred Grove** | Druid sub-building inside Aethercourt | Promoted to Tier-3 monument |
| **Sanctum** | Paladin sub-building inside Aethercourt | Kept as sub-building, but inside [[_citadel-of-light]] |
| **Aether Tower** | Mage sub-building inside Aethercourt | Retired entirely; replaced by [[_atheneum-tower]] |

See [[dh-sub-building-renames]] for the full rename log.

## Cross-links

- [[project-brief]] — the overall mod structure
- [[dependency-logic]] — how expansions gate on Core
- [[_the-aethercourt]] — the core monument
- Expansion monuments: [[_citadel-of-light]], [[_sacred-grove]], [[_bloodforged-spire]], [[_atheneum-tower]]
- [[abandoned-ideas]] — what got rejected during this structural decision
- Design history: [[dh-monument-architecture]], [[dh-sub-building-renames]]

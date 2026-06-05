---
title: Aetherian Status Progression — Decision Log
tags:
  - design-history
  - core
  - progression
created: 2026-06-04
status: locked
sources:
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 562-931"
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 5025-5190"
final_note: "[[aetherian-progression]]"
---

# Aetherian Status Progression — Decision Log

## Final state
- Three core villager statuses: **Aspirant → Arcanist → Loremaster**.
- Status = *what they are* (villager type). Work profession = *what they do* (job tied to a building).
- **Aspirant** works as a **Scholar** — job description: "Researches the science and fundamentals of magic."
- **Arcanist** works as a **Caster** — job description: "Applies mastered principles to manipulate and channel arcane energy." (locked L5105-5107).
- **Loremaster** profession and need-fulfillment role are tracked in [[dh-loremaster-tier-3]].
- Aspirant status description: "Aspirants are eager to study and learn about magic, aether and the arcane arts."
- Arcanist status description (locked L5182): "Arcanists satisfy their thirst for knowledge and are granted the authority to channel arcane energy."
- Promotion cost pattern: Aspirant → Arcanist (gold), Arcanist → specialist (Arcane Lore), modeled on Kingdom/Clergy precedent.
- Job levels split across statuses on the Militiaman → Soldier → Knight pattern (1-5 / 6-10 / 11+).

## Iteration history
- **L562-589** — Initial proposal: a **four-step** chain Student → Arcane Scholar → Aspiring Mage/Paladin/Druid/Sorcerer → final specialist, with hidden quests for a Master tier. Resources: Research Paper (made by Students at the Academy) refined into Arcane Lore (made by Arcane Scholars at the Aetherium).
- **L592-609** — Gemini pushback: four ranks is one more than any other estate, "Aspiring" tier risks feeling grindy and inconsistent with base-game streamlined progression.
- **L650-684** — User introduces the **status-vs-profession distinction** (foundational): in Foundation, *villager type* (Serf, Commoner, Militiaman, Soldier, Knight) is separate from *work profession* (Farmer, Scribe, Spearman). Mod must mirror this layering. Gemini flags pitfall of using the same word for both (e.g., "Mage" as status AND profession).
- **L687-705** — User locks the Kingdom-Estate-style mechanic: a villager type must reach **profession level 5** in a sub-building to be eligible for villager-type promotion, mirroring Militiaman → Soldier → Knight including subordinate requirement at the top tier. Gemini proposes three candidate Arcane Scholar professions: **Librarian** (in Archives, converts Research Paper → Arcane Lore, paralleling Winemaker), **Channeler** (in Focusing Chamber / Channelling Spire, active magic role also producing Arcane Lore), and **Rune Crafter** (in Runic Hall, produces Runic Stones / Inscribed Talismans).
- **L617-646** — Final-rank naming pass: Gemini proposes **Arch-Mage**, **Champion Paladin**, **Arch-Druid**, **High Sorcerer**, plus the **Hidden Quest System** for a post-cap **Master** tier (Master Mage, Radiant Paladin, Elder Druid, ??? Sorcerer). At L646 Gemini suggests **Grand Sorcerer** as the Sorcerer endgame name.
- **L709-728** — Aethercourt monument description drafted in parallel to vanilla monument descriptions (Manor House, Castle, Monastery). Two options: (1) "A grand complex of halls and courtyards dedicated to the mastery and preservation of arcane knowledge." and (2) "Allows the specialization and advanced training of scholars to channel and command magical energy."
- **L732-771** — Wider entry-level name search (after first round): tables of pairings — Initiate/Transcriber, Acolyte/Tender, Prentice/Indexer, Novitiate/Curator, then Pupil/Archivist, Postulant/Refiner, Warder/Lighter. User responds at L775-776 that none feel right.
- **L775-822** — Entry-level naming search. Rejected: Initiate, Acolyte, Prentice, Novitiate, Pupil, Postulant, Warder, Junior Scholar, Novice Arcanist, Magic Aspirant. User settles on single-word statuses to match vanilla naming. **L818-822: locks Aspirant and Arcanist** as the two single-word villager statuses.
- **L824-854 — REVISED progression structure**: collapses to three core tiers (Aspirant 1-5 → Arcanist 6-10 → specialist 11+), eliminating the "Aspiring" intermediate rank from the original four-step plan. Specialist branches: Mage/Paladin/Druid/Sorcerer, each with a final master tier (Archmage, Champion, Archdruid, High Sorcerer). Gemini's table at L849-852 proposes specialist *professions*: **Alchemist** (Mage, in Laboratory, producing Potions/Elixirs), **Vigilant** (Paladin, in Sanctum / Hall of Heroes, producing Combat Buffs), **Harvester** (Druid, in Sacred Grove, producing Herbs/Magical Blooms), **Incantator** (Sorcerer, in Ritual Circle, converting Arcane Lore into Global Buffs).
- **L858-931** — Specialist path naming and profession-vs-status hygiene pass. Gemini calls out that "Wind/Water/Fire/Earth Mage" conflates status and profession; profession should be a single role name (e.g., **Elementalist**) with the element as a **sub-profession** tied to the sub-building (Wind Channel etc.), and output (Wrought Air, Wrought Stone, etc.) determines the element path (L887-896). Paladin profession revised suggestion: **Sentinel** as an alternative to Vigilant, in a Sanctum producing Blessings or Holy Wards (L907). Druid profession suggestion: **Rootshaper** in Sacred Grove (L918). Sorcerer profession: **Incantator** in Ritual Circle (L929). Sorcerer final status: **Grand Sorcerer** or **High Sorcerer** (L924). Promotion costs locked at L876: Aspirant → Arcanist (gold), Arcanist → Specialist (Arcane Lore). Final-master rank named distinctly from the 6-10 status (e.g., **Arch Mage** at 6-10 vs. **Master Mage** post-10, L878).
- **L5025-5107** — Caster job description finalized; user refuses to bake the resource name "Arcane Lore" into the description so it survives future resource renames. First round (L5036-5041) options all mentioned "Arcane Lore" or specific resources; revised round (L5063-5068) dropped resource names. User picks a shortened option 2 at L5079 ("Applies mastered principles to manipulate and channel arcane energy.") and locks it at L5105-5107.
- **L5126-5189** — Arcanist *status* description finalized, deliberately patterned on vanilla Serf/Commoner descriptions ("Serfs are satisfied with...", "Commoners enrich their lives with...") to match base-game tone. First round (L5138-5143) options focused on "skilled practitioners entrusted with applying their discipline" — rejected for not matching vanilla tone. Revised round (L5164-5171) reframed around fulfillment of the Aspirant's "thirst for knowledge"; option 3 locked at L5182.
- **Late addition** — Loremaster added as a third status; see [[dh-loremaster-tier-3]].

## Abandoned options
- **Four-step ladder** (Student → Arcane Scholar → Aspiring X → final X) — dropped as too long vs. other estates (L608, simplified at L818-843).
- **"Aspiring" intermediate rank** — explicitly cut to keep progression streamlined (L843).
- **Student / Scribe** as entry names — replaced by Aspirant / Scholar; rejected as too overtly academic and not matching vanilla single-word status convention (L818).
- **Alternate entry names**: Initiate, Acolyte, Prentice, Novitiate, Pupil, Postulant, Warder, Junior Scholar, Novice Arcanist, Magic Aspirant (L740-814) — all "didn't feel right" (L776).
- **"Researcher" / "Archivist" / "Librarian" / "Channeler" / "Rune Crafter"** as the Arcanist profession — set aside in favor of **Caster** (final pick referenced L5025+).
- **Using element name as profession** (Wind Mage, Fire Mage) — rejected as redundant with status (L887-897).
- **"Paladin / Cleric / Holy Priest"** as Paladin profession — rejected for stealing Clergy terminology and conflating status with profession (L903-907).
- **Resource names inside job descriptions** — rejected by user at L5051-5052 to keep descriptions resource-agnostic.
- **Specialist profession proposals**: Alchemist (Mage in Laboratory), Harvester (Druid in Sacred Grove), Rootshaper (Druid alt.), Sentinel (Paladin alt. to Vigilant), Spell Weaver, Rite Weaver, Herb Gatherer, Woodshaper (early L673-681 brainstorm) — all set aside pending final specialist-path lock.
- **Final-master tier names**: Master Mage, Radiant Paladin, Elder Druid (Druid endgame), Grand Sorcerer, ??? Sorcerer — superseded once the Archmage/Champion/Archdruid/High Sorcerer 6-10 names were locked (L624-628, L646).
- **Hidden quest system for Master tier** — original concept at L631-644; not carried forward into the locked progression (replaced by the Loremaster T3 mechanism, see [[dh-loremaster-tier-3]]).
- **First Arcanist-status description round** (L5138-5143): "skilled practitioners entrusted with applying their discipline to estate affairs" and variants — rejected by user at L5153-5155 for not matching vanilla Serf/Commoner pattern.
- **First Caster-job round** with resource names (L5036-5041): all three options referenced "Arcane Lore" or "magical materials" — rejected at L5051-5052.

## Cross-links
- [[dh-loremaster-tier-3]] — the late-added T3 status that completes the ladder
- [[dh-discourse-need]] — the T2+ need that Loremasters fulfill
- [[the-aethercourt]] — the core monument
- [[dh-arcane-lyceum]] — sub-building where the Loremaster works
- [[specialist-paths]] — Mage / Paladin / Druid / Sorcerer branches off Arcanist

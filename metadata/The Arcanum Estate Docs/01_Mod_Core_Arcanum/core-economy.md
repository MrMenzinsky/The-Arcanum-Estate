---
title: Core Economy
tags:
  - core
  - economy
  - resource
created: 2026-06-04
status: design-locked
sources:
  - "[[dh-core-economy]]"
  - "[[dh-notebooklm-aether-bindery]]"
  - "[[dh-notebooklm-inter-estate-goods]]"
  - "[[dh-notebooklm-artificer]]"
  - "[[dh-notebooklm-charged-containers]]"
---

# Core Economy

The Arcanum Estate's economy runs two parallel resource loops — one for **knowledge** and one for **physical material**. Both loops feed each other through the [[aetherian-progression|progression ladder]]: Aspirants generate the raw resource, Arcanists refine it.

## Resource map

| Resource | Tier | Produced by | At | Stored in |
| --- | --- | --- | --- | --- |
| **Glyph** | T1 | Scholar (Aspirant) | Academy | Archive |
| **Arcane Lore** | T2 | Caster (Arcanist) | Aetherium | Archive |
| **Aether Crystal** | T1 | Serf | Aether Crystal Mining Camp (external, not part of the Aethercourt) | Aether Hold |
| **Faceted Aether Crystal** | T2 | Lapidarist (Aspirant/Arcanist) | Lapidary | Aether Hold |
| **[[aether-crystal-dust\|Aether Crystal Dust]]** | T2 | Lapidarist (byproduct of Faceted Crystal production) | Lapidary | Aether Hold |
| **[[aether-bloom\|Aether Bloom]]** | T1 | (gardener `[TBD]`) | [[aether-bloom-garden\|Aether Bloom Garden]] | (depot — Aether Bloom Garden Hut) |
| **[[scholar-vestments\|Scholar's Vestments]]** | T2 | [[arcane-weaver\|Arcane Weaver]] (Serf/Commoner) | Arcane Weaver workplace | exported / consumed |
| **[[aetherial-elixir\|Aetherial Elixir]]** | T2 | (`[TBD job name]`) | [[apothecary\|Apothecary]] | consumed (buff) |
| **[[runic-talisman\|Runic Talisman]]** | T3 | Rune Crafter | [[rune-crafter\|Rune Crafter]] workplace | consumed / exported |
| **[[arcane-anchorstone\|Arcane Anchorstone]]** (empty) | T3 | Artificer (Serf/Commoner) | [[artificer\|Artificer]] | (consumed at infusion workplaces) |
| **[[arcane-pure-anchorstone\|Arcane Pure Anchorstone]]** (charged — core unaligned) | T3 | Aetherian infusion (workplace `[TBD]`) | Aethercourt infusion workplace `[TBD]` | premium-decoration material |
| **Path-specific charged Anchorstones** (Mage Fire / Wind / Earth / Water; Paladin Radiant; Druid Life; Sorcerer Blood) | T3-T5 | Each specialization's infusion job | Each T3 specialization monument | premium-decoration material per path |
| **Enchanted Tome** | T4 | [[tomebinder\|Tomebinder]] (Loremaster) | [[aether-bindery\|Aether Bindery]] | exported via trade (not stockpiled) |

See [[core-buildings]] for the buildings; [[aetherian-progression]] for who works each one.

## The two loops

### Knowledge loop — Glyph → Arcane Lore

Scholars at the Academy produce **Glyphs** — raw, unrefined units of magical writing. Casters at the Aetherium consume Glyphs and produce **Arcane Lore**, the estate's prestige resource.

Arcane Lore is the abstract output of the entire estate, parallel to the Kingdom's Royal Treasures or the Clergy's Piety. It drives splendor and is the **promotion currency** that turns an Arcanist into a specialist (Mage / Paladin / Druid / Sorcerer) or a [[aetherian-progression#The Loremaster — late addition, load-bearing|Loremaster]]. This is the structural sink that ties expansion content to the Core mod — expansions cannot promote their specialists without core-mod-produced Arcane Lore.

### Physical loop — Aether Crystal → Faceted Aether Crystal

**Aether Crystal** is mined by Serfs at a standalone **Aether Crystal Mining Camp** — this building sits *outside* the Aethercourt, like vanilla resource camps (Stonecutter, Lumber). The Serf workforce parallels the Labor Estate's gathering economy.

Raw Aether Crystal is hauled to the **Lapidary** (a sub-building inside the Aethercourt) where the **Lapidarist** refines it into **Faceted Aether Crystal**. This loop mirrors the vanilla **Stone → Polished Stone** progression handled by the Mason Hut at T2.

Faceted Aether Crystal is the common building material for the Aethercourt's sub-buildings and (likely) the expansion monuments. `[TBD]` — confirm whether expansions also accept vanilla Polished Stone alongside Faceted Aether Crystal, or whether the magical material is mandatory.

### Inter-estate goods family — Cross-economy bridge (Tier 2 / Tier 3)

The core economy is extended with a family of three locked production chains that each combine **one Arcanum input** with **one vanilla input**, deliberately forcing cross-estate dependency. Each prevents the Arcanum Estate from becoming a closed system:

| Chain | Tier | Workplace | Recipe |
| --- | --- | --- | --- |
| **Scholar's Vestments** | T2 | [[arcane-weaver|Arcane Weaver]] (Serf/Commoner workforce) | vanilla **Cloth** (Labor) + **Aether Crystal Dust** (Lapidary byproduct) |
| **Aetherial Elixir** | T2 | [[apothecary|Apothecary]] | **Aether Bloom** (Aether Bloom Garden) + vanilla **Berries / Herbs** (Labor / Clergy) |
| **Runic Talisman** | T3 | [[rune-crafter|Rune Crafter]] | **Glyph** + vanilla **Polished Stone** (Labor) |

**Recurring design principle:** every new Arcanum trade / consumable good combines one Arcanum input with one vanilla input. This rule kept the proposed but rejected **Arcane Ink** and **Blank Vellum** chains out of the mod — they would have piled on too much internal Arcanum complexity instead of bridging out to other estates.

The Aether Crystal Dust → Vestments chain is what keeps the Lapidary economically relevant past peak monument construction. The Aether Bloom Garden bed cost is what keeps raw Aether Crystals consumed before the Lapidary unlocks at T2.

### Charged-container family — Premium decoration material (Tier 3+)

A separate Tier-3 resource family that runs in parallel to the building-material loop. Drives premium / anti-gravity / luminous decoration:

1. **Mine** — raw Aether Crystal (from the [[aether-crystal-mining-camp|Aether Crystal Mining Camp]], scaled by the T2 prospecting upgrade).
2. **Craft** — empty [[arcane-anchorstone|Arcane Anchorstones]] at the [[artificer|Artificer]] (Serf/Commoner workforce, raw crystal + iron, iron-heavy recipe).
3. **Infuse** — at each specialization monument's infusion workplace, the empty Anchorstone becomes a path-specific charged variant ([[arcane-pure-anchorstone|Pure]] at the Aethercourt, [[arcane-fire-anchorstone|Fire]] / [[arcane-wind-anchorstone|Wind]] / [[arcane-earth-anchorstone|Earth]] / [[arcane-water-anchorstone|Water]] at the Atheneum Tower, [[arcane-radiant-anchorstone|Radiant]] at the Citadel of Light, [[arcane-life-anchorstone|Life]] at the Sacred Grove, [[arcane-blood-anchorstone|Blood]] at the Bloodforged Spire).

The charged Anchorstones are the building material for **floating arcane runes, anti-gravity building parts, and luminous decoration elements** — analogous to how vanilla Stained Glass and Sculptures act as premium decoration material. They are **not** required for basic monument construction; players can build the Aethercourt without any charged Anchorstones at all. The point is to reward a complex production setup with Splendor.

**Naming convention is locked but specifics are open.** Format `X <magic type> Y` (e.g. `Arcane Fire Anchorstone`); the `X Y` pair `Arcane Anchorstone` is the working convention, with `Crystalfocus` as the alternative still on the table. The unaligned-magic and per-path modifiers are mostly placeholders pending decision — see [[arcane-anchorstone]] and [[dh-notebooklm-charged-containers]]. Cross-mod consistency is a load-bearing principle (one `X Y` line across all paths).

The no-custom-light-sources engine constraint applies: any "luminous" or "glowing" decoration built with charged Anchorstones must use the vertex-color / HDR-RGBA emissive workaround — see [[dh-notebooklm-aesthetic-corrections]].

### Trade loop — Enchanted Tomes (Tier 4)

At Tier 4 the [[aether-bindery|Aether Bindery]] opens as a Loremaster's secondary workplace. Tomebinders combine **Glyphs + Planks + Faceted Aether Crystals** into **Enchanted Tomes**, which are sold via trade routes rather than consumed inside the estate. This gives Loremasters an economic output beyond their primary Lyceum role, and gives the player a late-game gold sink for both Glyphs and Faceted Aether Crystals (so neither resource stagnates once their primary consumers are saturated).

Deliberately **does not consume Arcane Lore** — keeps the promotion-cost economy unstrained. A playtest-driven swap to Arcane Lore is an open balancing option; if it happens, the workplace must rename accordingly. See [[dh-notebooklm-aether-bindery]].

## Storage split

The estate's storage is intentionally split along the knowledge/matter axis — the same split that runs through the [[aetherian-progression|status/profession split]]:

- **Archive** — knowledge storage (Glyphs, Arcane Lore)
- **Aether Hold** — physical storage (Aether Crystal, Faceted Aether Crystal, any future material components)

See [[core-buildings#Archive (T1 / T2)|Archive]] and [[core-buildings#Aether Hold (T1 / T2)|Aether Hold]] for naming history.

## Naming notes

- **Glyph** chosen over Sigil, Imprint, Inscription, Cipher, Schema, Hypothesis. Sigil retained on the backup list. Earliest working names "Research Paper" and "Formula" were rejected as too generic / cross-discipline.
- **Lapidary / Lapidarist** chosen over Crystal Refinery (too industrial — "Refinery" implies chemical/oil/sugar processing), Crystal Forge, Aether Cuttery, Facetorium. The Lapidary/Lapidarist pair was selected for its archaic, formal, thematically precise feel — a lapidary is literally a gem-cutting workshop, exactly the tone the Aethercourt aims for.
- **Gemcutter** was explicitly rejected as a job title — too common for an estate built on archaic-academic prestige.

## Open questions

- Exact Arcane Lore promotion costs per specialization. `[TBD]`.
- Whether expansion monuments accept Polished Stone alongside Faceted Aether Crystal as a building material. `[TBD]`.
- Whether Faceted Aether Crystal also has trade value (sold to the Kingdom or Clergy as a luxury) or is purely an internal building material. `[TBD]`.

## Cross-links

- [[estate-identity]] — Arcane Lore as the estate's prestige resource
- [[aetherian-progression]] — who works each step of the chain
- [[core-buildings]] — Academy, Aetherium, Lapidary, Archive, Aether Hold
- [[the-aethercourt]] — the monument that houses the production / storage chain
- Design history: [[dh-core-economy]]

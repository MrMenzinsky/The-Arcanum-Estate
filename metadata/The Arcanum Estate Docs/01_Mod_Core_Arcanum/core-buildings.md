---
title: Core Buildings — Aethercourt Sub-Buildings
tags:
  - core
  - building
  - aethercourt
created: 2026-06-04
status: design-locked
sources:
  - "[[dh-core-buildings]]"
  - "[[dh-arcane-lyceum]]"
  - "[[dh-sub-building-renames]]"
  - "[[dh-sorcerer-subbuilding-abandoned]]"
  - "[[dh-notebooklm-aether-bindery]]"
  - "[[dh-notebooklm-inter-estate-goods]]"
  - "[[dh-notebooklm-artificer]]"
  - "[[dh-notebooklm-charged-containers]]"
  - "[[dh-notebooklm-tier1-room-parts]]"
  - "[[dh-notebooklm-tech-unlock-naming]]"
---

# Core Buildings — Aethercourt Sub-Buildings

The [[the-aethercourt|Aethercourt]] is an invisible container monument. It does not render as a single building — it groups the sub-buildings below under one monument game-object and grants access to the special monument build menu.

## Sub-buildings overview

| Building | Tier | Function | Worker / job |
| --- | --- | --- | --- |
| **Academy** | T1 | Aspirant workplace; produces [[core-economy\|Arcane Lore]] and Glyphs | Scholar (the work-profession of an Aspirant) |
| **Annex** | T1 | Lodging for Aspirants and Arcanists | — |
| **Aetherium** | T2 | Arcanist workplace | Caster (the work-profession of an Arcanist) |
| **Lapidary** | T2 | Refines Aether Crystal → Faceted Aether Crystal | Lapidarist |
| **Archive** | T1 / T2 | Storage for intellectual resources (Glyph, Arcane Lore) | — |
| **Aether Hold** | T1 / T2 | Storage for physical resources (Aether Crystal, Faceted Aether Crystal) | — |
| **[[aether-bloom-garden\|Aether Bloom Garden]]** | T1 | Custom modular category — cultivates [[aether-bloom\|Aether Blooms]] | (Gardener `[TBD]`) |
| **Arcane Lyceum** | T3 | Loremaster's lecture hall; fulfils [[need-discourse\|Discourse]] for T2+ Aetherians | Loremaster |
| **[[arcane-weaver\|Arcane Weaver]]** | T2 | Weaves [[scholar-vestments\|Scholar's Vestments]] from Cloth + [[aether-crystal-dust\|Aether Crystal Dust]] | Arcane Weaver (Serf / Commoner — Labor workforce) |
| **[[apothecary\|Apothecary]]** | T2 | Brews [[aetherial-elixir\|Aetherial Elixirs]] from [[aether-bloom\|Aether Blooms]] + Berries/Herbs | `[TBD job name]` |
| **[[rune-crafter\|Rune Crafter]]** | T3 | Carves [[runic-talisman\|Runic Talismans]] from Glyphs + Polished Stone | Rune Crafter |
| **[[artificer\|Artificer]]** | T3 | Crafts empty [[arcane-anchorstone\|Arcane Anchorstones]] from raw Aether Crystal + Iron | Artificer (Serf / Commoner — Labor workforce) |
| **Aether Bindery** | T4 | Produces [[enchanted-tome\|Enchanted Tomes]] for high-value export | [[tomebinder\|Tomebinder]] (Loremaster's secondary workplace) |

See [[aetherian-progression]] for status / work-profession structure, and [[core-economy]] for the resource flows these buildings produce, refine, and store.

---

## Academy (T1)

The first workplace unlocked by the estate. Aspirants come here to study and produce Arcane Lore and Glyphs. The Academy is the practical entry point for the estate's intellectual economy — without it, no Arcane Lore is generated.

The name "Academy" was Anton's first preference for the monument itself, but was rejected at that scope as "too close to normal academies, doesn't give the magic feeling." It remained available for sub-building use.

## Annex (T1)

Aetherian housing. Both Aspirants and Arcanists sleep at the Annex. Specialists (Mage / Paladin / Druid / Sorcerer) will get their own lodging via their respective expansion mods.

In-game description: *"A place for your Aetherians to study and rest."* — modelled against the vanilla pattern (Manor House "call home" / Monk Dorms "pray and rest" / Barracks "rest and heal").

This is the canonical place the collective term **Aetherians** is introduced in the design.

## Aetherium (T2)

Arcanist workplace. Where Casters apply mastered principles to manipulate and channel arcane energy. The name "Aetherium" surfaced during Aethercourt naming as too fantastical for the monument itself, but was reassigned as a sub-building where its mystical tone fits.

## Lapidary (T2)

Refines raw Aether Crystal into Faceted Aether Crystal. Worked by the **Lapidarist**.

Naming alternatives considered and rejected: Crystal Forge, Aether Cuttery, Facetorium, Crystal Refinery (rejected as too industrial — "Refinery" implies chemical/oil/sugar processing). For the job title, "Gemcutter" was explicitly flagged as too common; "Lapidarist" was chosen for its specificity to gem-work in a medieval-academic register.

## Archive (T1 / T2)

Storage for the estate's intellectual resources — Glyphs and Arcane Lore. Single-noun naming for a scholarly tone; rejected alternatives were Repository and Registrum (too clerical).

**Placement style:** the Archive is a **single-building placement** (mirroring the Castle's Armoury or the Monastery's Monastic Grange), not a modular construction assembled from monument parts. Players drop it from a single tile and it does not consume any of the Aethercourt's modular [[the-aethercourt#Tier 1 Room parts|Tier 1 Room parts]].

## Aether Hold (T1 / T2)

Storage for physical resources — Aether Crystal, Faceted Aether Crystal, and any future material components. Backup name reserved: **Materia Reserve**.

This is paired with the Archive (knowledge storage) to keep the estate's storage split clean: knowledge in the Archive, matter in the Hold. The split mirrors the broader status/profession theory/practice split that runs through [[aetherian-progression]].

**Placement style:** like the Archive, the Aether Hold is a **single-building placement**, not modular. Drop-from-a-tile only; does not consume any of the Aethercourt's modular [[the-aethercourt#Tier 1 Room parts|Tier 1 Room parts]].

## Arcane Lyceum (T3)

The third-tier sub-building. **The architecturally most ambitious building in the Core Arcanum mod.** A Pantheon-inspired domed lecture hall over an open amphitheater, with icosahedron roof parts as a signature motif. Worked by the **Loremaster**, who delivers lectures that fulfil the **[[need-discourse|Discourse]]** need for T2+ Aetherians (and for the specialists from expansion mods).

This single building is the structural glue that keeps the Aethercourt relevant in the late game — see [[arcane-lyceum]] for the full architectural brief.

Naming alternatives considered: The Grand Lecture (too plain), The Assembly Hall (too administrative), The Aetherian Forum (debate-focused, not lecture-focused), The Great Rotunda (architectural shape baked into name — locks design too early).

## Aether Bloom Garden (T1)

A custom modular sub-building category — Anton's framing at L445: "similar to the Monastery herb and berry garden sub-buildings." Not a single building but a *collection* of placeable parts: planter beds in Square / Round / Trellis shapes (mirroring the Monastery's Herb / Berry Planter shape family) plus an **Aether Bloom Garden Hut** as the resource depot.

Construction cost: planter beds are built mostly out of raw **Aether Crystals** — deliberately an early-game crystal sink before the Lapidary unlocks at T2.

Tier placement read from the chat: T1 planters + Garden Hut → feeds the T2 [[apothecary|Apothecary]]. Mirrors the Monastery's T1 Herb/Berry Garden → T2 production-building flow.

The category's part names ("Aether Bloom Planter, Square / Round / Trellis", "Aether Bloom Garden Hut") are NotebookLM's first-pass suggestions and were not part of the Tier 1 Room-parts unique-naming pass — see [[dh-notebooklm-tier1-room-parts]] for context and [[master-to-do]] for the pending re-naming task.

See [[aether-bloom-garden]] for the per-building stub.

## Arcane Weaver (T2)

Weaves [[scholar-vestments|Scholar's Vestments]] from **vanilla Cloth + [[aether-crystal-dust|Aether Crystal Dust]]** (Lapidary byproduct). **Staffed by Serfs / Commoners** (Labor Estate workforce), not Aetherians — mirrors how Kingdom Estate weaponsmiths are normal Labor villagers, not estate-specific soldiers. This is a deliberate design choice to tie the Arcanum Estate into the broader village economy.

Workplace and job share the same name (vanilla pattern, e.g. `Tailor / Tailor Workshop`).

## Apothecary (T2)

Brews [[aetherial-elixir|Aetherial Elixirs]] from [[aether-bloom|Aether Blooms]] (cultivated in the Aether Bloom Garden) and vanilla **Berries / Herbs**. The recipe bridges Arcanum magic with standard village agriculture.

Job name `[TBD]` — the chat referred to "the Apothecary worker" but never assigned a profession name. See [[master-to-do]] forgotten-items.

## Rune Crafter (T3)

Carves [[runic-talisman|Runic Talismans]] from **Glyphs + vanilla Polished Stone**. Polished Stone is highly thematic for rune-carving and creates a direct economic dependency on the Labor Estate's Stonecutters and Masons.

Use-case for the Talismans `[TBD]` — either required by Paladins, or sold at market stalls for a temporary efficiency buff to regular Labor villagers.

## Artificer (T3)

Where **Serfs / Commoners** craft empty [[arcane-anchorstone|Arcane Anchorstones]] from **raw Aether Crystal + Iron**. The recipe is iron-heavy and crystal-light (e.g. 3 Iron : 1 Raw Aether Crystal — ratios `[TBD]`) so the Artificer doesn't starve the Lapidary at T2. Surfaced with the T2 prospecting upgrade to the [[aether-crystal-mining-camp|Aether Crystal Mining Camp]], which scales raw-crystal output to feed both downstream consumers.

Production-chain length is deliberately capped at 3 steps: Mine → Craft (Artificer empty container) → Infuse (at each T3 specialization monument's infusion workplace). Matches vanilla 3-step chains.

Output: empty Arcane Anchorstones. The empty containers are *not* used directly; they must be **infused** at a designated workplace (either at the Aethercourt for the unaligned [[arcane-pure-anchorstone|Pure variant]], or at each T3 specialization monument for the path-specific variants). The infused Anchorstones act as a **premium decoration building material** (floating runes, anti-gravity parts) — analogous to vanilla Stained Glass / Sculpture decoration materials. They are not required for basic monument construction.

**Originally** the Artificer was a luxury-goods workplace producing Aether Lamps (Faceted Crystals + Iron + Glass); that recipe is orphaned by the Tier-3 pivot. Aether Lamps' fate is `[TBD]` (see [[master-to-do]]).

See [[artificer]] for the per-building stub, [[arcane-anchorstone]] for the empty resource, and the per-path charged variants ([[arcane-pure-anchorstone|Pure]], [[arcane-fire-anchorstone|Fire]], [[arcane-wind-anchorstone|Wind]], [[arcane-earth-anchorstone|Earth]], [[arcane-water-anchorstone|Water]], [[arcane-radiant-anchorstone|Radiant]], [[arcane-life-anchorstone|Life]], [[arcane-blood-anchorstone|Blood]]).

## Aether Bindery (T4)

Where Loremasters work as **Tomebinders** to produce [[enchanted-tome|Enchanted Tomes]] — the estate's high-value trade export. Recipe: **Glyphs + Planks + Faceted Aether Crystals** (deliberately uses Tier-1 Glyphs to keep Arcane Lore free for promotions).

The "Aether" prefix ties the building to the Aethercourt and to the Faceted Aether Crystal that seals the magical energy into each tome. The Aether Bindery is a Loremaster's *secondary* workplace alongside the [[arcane-lyceum|Arcane Lyceum]], giving them an economic output once the village's Discourse need is met.

Workplace description: *"Crafts Enchanted Tomes by forging heavy wooden covers from planks to safely bind volatile glyphs, sealed with a faceted aether crystal."*

Naming alternatives considered and rejected: **Bindery** alone (mod-name collision), **Scriptorium** (vanilla Clergy collision), **Lore Bindery** (would mislead players into thinking it consumes Arcane Lore — load-bearing UX rejection), **Arcane Bindery** (UI collision with Arcane Lyceum), **Runic Bindery** (too low/common for a Loremaster), **Tome Workshop** (too crude for delicate book-making). Job-title alternatives **Tomecrafter** (kept as runner-up) and **Illuminator** (rejected — implies light-bringing).

If a playtest-driven balancing swap moves the recipe from Glyphs to Arcane Lore, the workplace must be renamed accordingly. See [[dh-notebooklm-aether-bindery]] for full history.

---

## Reserved / promoted / abandoned

Three names originally workshopped as Aethercourt sub-buildings shifted role during the design. The Sorcerer sub-building was abandoned. Full log: [[dh-sub-building-renames]] and [[dh-sorcerer-subbuilding-abandoned]].

| Name                      | Originally                              | Now                                                                                                                                                                                                                                                                                                              |
| ------------------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Sanctum**               | Paladin sub-building inside Aethercourt | Remains a sub-building, but lives inside the Tier-3 Paladin monument [[citadel-of-light]], not inside the Aethercourt                                                                                                                                                                                            |
| **Sacred Grove**          | Druid sub-building inside Aethercourt   | Promoted to Tier-3 Druid monument: [[sacred-grove]]                                                                                                                                                                                                                                                              |
| **Aether Tower**          | Mage sub-building inside Aethercourt    | Name retired; replaced by Tier-3 Mage monument [[atheneum-tower]]                                                                                                                                                                                                                                                |
| **Sorcerer sub-building** | —                                       | The sorcerer never got to be a sub-building inside the Aethercourt. Every proposed name (Vortex, Crucible, Chasm, Forge, Crypt, Catacomb, Atelier, Menagerie, Conduit, Arena, Kiln, Foundry, Cistern, Barrow) was rejected.<br><br>The Sorcerer path expresses itself as Tier-3 monument  [[bloodforged-spire]]. |

## Cross-links

- [[the-aethercourt]] — parent monument
- [[aetherian-progression]] — who works and lives in these buildings
- [[core-economy]] — what they produce, refine, and store
- [[need-discourse]] — what the Arcane Lyceum fulfils
- [[arcane-lyceum]] — architectural detail for the T3 building
- [[dh-monument-architecture]] — why specialization buildings became monuments
- Design history: [[dh-core-buildings]], [[dh-sub-building-renames]], [[dh-sorcerer-subbuilding-abandoned]], [[dh-arcane-lyceum]]

---
title: Expansion-Monument Decorations T3-T5 — Decision Log (NotebookLM)
tags:
  - design-history
  - notebooklm
  - decorations
  - monuments
  - expansion
created: 2026-06-05
status: design-captured-deferred
sources:
  - notebooklm-conversation.md lines 2307-2407
  - "[[_notebooklm-chat-index]]"
---

# Expansion-Monument Decorations T3-T5 — Decision Log (NotebookLM)

## Why this dh exists

Each of the four Tier 3 specialization monuments gets a thematic decoration roster from this NotebookLM exchange. None of this is in-scope implementation work (expansion mods are deferred until the Core Arcanum mod ships), but the design intent is worth capturing so it isn't lost.

Per Anton's framing at L2263, **expansion-monument decorations lean heavily into their specific magical domains** in contrast to the [[dh-notebooklm-aethercourt-decorations|Aethercourt's foundational/unspecialized roster]]. All entries cover Tier 3 (initiation) → Tier 4 (mastery) → Tier 5 (apex).

These are creative-direction candidates, not locked names. Use as a starting palette when the corresponding expansion mod enters active design.

## The Atheneum Tower (Mage path — elemental, scientific, structured)

### Tier 3 — Initiation

| Decoration | One-line description |
| --- | --- |
| **Wind Chime Array** | Intricate metallic chimes that sway and catch atmospheric currents studied by [[wind-weaver|Wind Weavers]]. |
| **Stone Shaper's Block** | Half-carved granite block on a sturdy wooden table, surrounded by precise chisels. |
| **Apprentice's Astrolabe** | Modest brass tool on a stone plinth for mapping early celestial alignments. |

### Tier 4 — Mastery

| Decoration | One-line description |
| --- | --- |
| **Flame Forger's Brazier** | Contained perpetually-burning iron brazier for volatile creation and heat manipulation. |
| **Mist Maker's Basin** | Shallow ornate stone pool that continuously spills decorative vapor over its edges. |
| **Elemental Focusing Crystal** | Distinctly colored, highly faceted Aether Crystal on a metallic stand to channel specific elemental energies. |

### Tier 5 — Apex

| Decoration | One-line description |
| --- | --- |
| **Elemental Convergence Sphere** | Hovering multifaceted crystal sphere representing mastery of the four elements. |
| **Archmage's Orrery** | Massive intricately-detailed brass astronomical instrument centerpiecing the Tower's highest courtyard. |

Notes:
- All four elemental jobs ([[flame-forger]], [[mist-maker]], [[stone-shaper]], [[wind-weaver]]) get a thematic T3/T4 anchor decoration.
- "Hovering" Elemental Convergence Sphere uses the anti-gravity principle established by the Artificer charged-container pivot.
- "Perpetually burning brazier" — needs the no-light-sources vertex-color / HDR-RGBA workaround per [[dh-notebooklm-aesthetic-corrections]].

## The Citadel of Light (Paladin path — holy, martial, defensive)

### Tier 3 — Initiation

| Decoration | One-line description |
| --- | --- |
| **Paladin's Weapon Rack** | Sturdy wooden frame holding polished shields and halberds for the Citadel's defenders. |
| **Vigilant's Brazier** | Tall wrought-iron torch stand designed to light the defensive perimeters. |
| **Initiate's Kneeling Mat** | Simple woven mat placed before a small stone shrine for holy reflection. |

### Tier 4 — Mastery

| Decoration | One-line description |
| --- | --- |
| **Consecrated Banners** | Tall majestic flags bearing the bright holy symbols of the Paladin order. |
| **Divine Seal Pedestal** | Stone pillar displaying a glowing, masterfully forged [[divine-seal]] as testament to the Reliquary Smiths. |
| **Holy Armament Display** | Decorative suit of consecrated plate armor standing sentinel near the [[sanctum]] entrance. |

### Tier 5 — Apex

| Decoration | One-line description |
| --- | --- |
| **Hallow Lord's Statue** | Towering marble carving of an ancient revered Paladin holding a protective aegis. |
| **Radiant Anchorstone** | Uniquely charged golden anchorstone hovering above the Citadel entrance to project an aura of safety. |

Notes:
- **Hallow Lord** confirms the T5 Paladin mastery rank (matches the Phase 1 finding from the NotebookLM report).
- **Radiant Anchorstone** is the per-specialization charged-container variant for the Paladin path — a concrete example of the [[dh-notebooklm-artificer]] pivot's per-monument infusion model. Uses the Anchorstone naming line.
- **Vigilant's Brazier / Consecrated Banners / Divine Seal Pedestal** described as "glowing" or carrying "bright" / "shining" elements — vertex-color / HDR-RGBA workaround required.
- **Divine Seal Pedestal** ties to the existing [[reliquary-smith]] job + Divine Forge workplace from the [[dh-paladin-workplaces|Paladin workplaces design]].

## The Sacred Grove (Druid path — nature, life, ancient wisdom)

### Tier 3 — Initiation

| Decoration | One-line description |
| --- | --- |
| **Root-Bound Bench** | Resting place naturally shaped from thick living roots of surrounding ancient trees. |
| **Herb-Drying Rack** | Rustic wooden frame hung with bundles of rare herbs and magical blooms cultivated by Rootshapers. |
| **Mossy Cairn** | Small weathered pile of stones serving as a quiet marker for ancient nature spirits. |

### Tier 4 — Mastery

| Decoration | One-line description |
| --- | --- |
| **Crystal-Fused Roots** | Massive gnarled tree roots that have naturally grown around and encapsulated large Faceted Aether Crystals. |
| **Offering Stone** | Moss-covered boulder where natural offerings and gathered essences are laid out for ancient rituals. |
| **Luminous Fungi Cluster** | Large glowing mushrooms that thrive in the deep magical shade of the Evertree canopy. |

### Tier 5 — Apex

| Decoration | One-line description |
| --- | --- |
| **Ancient Evertree Sapling** | Glowing, magically dense sapling representing the profound life-giving power of the Earthparent. |
| **Primal Monolith** | Towering unhewn menhir covered in ancient glowing moss that hums with the deep magic of the earth. |

Notes:
- **Earthparent** confirms the T5 Druid mastery rank (matches Phase 1 finding).
- **Rootshaper** — the Druid path's profession name from the NotebookLM report (Phase 1 finding) is reused here.
- **Evertree** appears as both a top-tier life-tree and (in the [[master-to-do|forgotten-items list]]) a deferred signature tree-building inside the Sacred Grove. The decoration "Ancient Evertree Sapling" is the smaller decorative cousin of that signature building, not a duplicate.
- **Luminous Fungi Cluster** / **glowing moss** / **glowing sapling** — all need the no-light-sources workaround.

## The Bloodforged Spire (Sorcerer path — innate, ritual, summoning)

### Tier 3 — Initiation

| Decoration | One-line description |
| --- | --- |
| **Chalk Ritual Circle** | Complex esoteric summoning circle drawn hastily in dirt or on paving stones. |
| **Familiar's Perch** | Twisted dark wood stand designed as a resting place for summoned creatures and mystical beasts. |
| **Scattered Reagents Table** | Messy unstructured workbench covered in rare bones, dark inks, and strange vials. |

### Tier 4 — Mastery

| Decoration | One-line description |
| --- | --- |
| **Incantator's Altar** | Dark stone slab stained with arcane reagents, used for forging formal covenants and binding rituals. |
| **Floating Blood-Crystal** | Jagged crimson-hued faceted crystal suspended in mid-air by the erratic energy of the Spire. |
| **Bound-Spirit Lantern** | Heavy iron lantern containing a swirling, chaotic, colorful magical anomaly instead of a flame. |

### Tier 5 — Apex

| Decoration | One-line description |
| --- | --- |
| **Supreme Binding Obelisk** | Dark monolithic pillar etched with glowing chaotic runes representing absolute mastery over summoned entities. |
| **Void-Tear Fissure** | Decorative floor piece resembling a localized, stable rupture in reality where raw unstructured magic leaks through. |

Notes:
- **Incantator** confirms the Sorcerer profession name from the Phase 1 finding.
- **Supreme Sorcerer** isn't explicitly named here but is implied by the "absolute mastery" framing of the Supreme Binding Obelisk — consistent with Phase 1 finding.
- **Floating Blood-Crystal** is the Sorcerer path's charged-container variant analogue (using "Crystal" instead of "Anchor"). Hints that the per-path charged-container modifier may also affect the base noun, not just the elemental modifier. Worth flagging for the [[dh-notebooklm-charged-containers|charged-container naming work]].
- **Bound-Spirit Lantern** / **Void-Tear Fissure** / **glowing chaotic runes** — all need the no-light-sources workaround.

## Cross-cutting observations

### Per-path charged-container variants demonstrated

This cluster is the first place where per-specialization charged-container variants appear concretely:

| Path | Variant shown | Naming style |
| --- | --- | --- |
| Mage (Tower) | (none explicitly; Elemental Convergence Sphere is decoration-only) | — |
| Paladin (Citadel) | **Radiant Anchorstone** | Arcane Anchorstone family |
| Druid (Grove) | (none explicitly) | — |
| Sorcerer (Spire) | **Floating Blood-Crystal** | Crystal Core / Crystal Blood Core family |

The Paladin uses the Anchorstone line. The Sorcerer uses the Crystal line. **This is internally inconsistent — Anton's stance (2026-06-05):** the Charged Container resource family should be consistently named across the core mod *and* all expansion mods, with only the per-path modifier varying. The [[dh-notebooklm-charged-containers|charged-container naming]] decision must pick **one** `X Y` line (Anchorstone OR Crystalfocus) that propagates everywhere. Once the line is locked, the decorations above need a sweep-pass to reconcile (e.g., "Floating Blood-Crystal" → "Floating Blood Anchorstone" if Anchorstone wins, or "Radiant Anchorstone" → "Radiant Crystal" / "Radiant Crystalfocus" if Crystal/Crystalfocus wins).

### T5 mastery rank names reaffirmed

The decorations confirm the four mastery rank names from the Phase 1 NotebookLM report:

- **Archmage** (Mage) → Archmage's Orrery
- **Hallow Lord** (Paladin) → Hallow Lord's Statue
- **Earthparent** (Druid) → Ancient Evertree Sapling references "the Earthparent"
- **Supreme Sorcerer** (Sorcerer) → implied by Supreme Binding Obelisk

These names are now triple-cited (report + chat decorations + cross-references). Treat as design-captured though not yet locked into expansion-mod final notes.

### "Glowing / luminous" descriptions recurring

Many proposed decorations involve glow, light, or luminescence. Every one of them must use the vertex-color / HDR-RGBA workaround (per [[dh-notebooklm-aesthetic-corrections]]). Worth a single sweep-pass when these decorations enter implementation: enumerate the affected items and design a consistent emissive-vertex-color treatment.

## Implications for existing vault notes

- [[atheneum-tower]] — gains decoration palette; T5 confirms Archmage as mastery rank.
- [[citadel-of-light]] — gains decoration palette; T5 confirms Hallow Lord as mastery rank.
- [[sacred-grove]] — gains decoration palette; T5 confirms Earthparent as mastery rank; Evertree referenced from forgotten-items.
- [[bloodforged-spire]] — gains decoration palette; Supreme Sorcerer implied as mastery rank.
- [[dh-notebooklm-charged-containers]] — internal inconsistency in per-path container naming flagged here.
- [[master-to-do]] — Aetherwood species, Evertree signature building, T5 mastery ranks, and per-path container-naming consistency all live here as open items.

## Cross-links

- [[dh-notebooklm-aethercourt-decorations]] — sibling for the core monument
- [[dh-notebooklm-aesthetic-corrections]] — no-glow constraint
- [[dh-notebooklm-artificer]] / [[dh-notebooklm-charged-containers]] — charged-container per-path variants demonstrated here
- [[dh-mage-path-jobs]] / [[dh-paladin-workplaces]] / [[dh-druid-ranks]] / [[dh-sorcerer-ranks]] — existing expansion-mod design histories
- [[atheneum-tower]], [[citadel-of-light]], [[sacred-grove]], [[bloodforged-spire]]
- [[_notebooklm-chat-index]]
- [[_notebooklm-merge-plan]]
- [[master-to-do]]

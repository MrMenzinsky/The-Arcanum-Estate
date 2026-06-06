---
title: The Aethercourt
tags:
  - core
  - monument
  - building
created: 2026-06-04
status: design-locked
sources:
  - "[[dh-the-aethercourt]]"
  - "[[dh-monument-architecture]]"
  - "[[dh-aether-envoy]]"
  - "[[dh-notebooklm-tech-unlock-naming]]"
  - "[[dh-notebooklm-tier1-room-parts]]"
  - "[[dh-notebooklm-aesthetic-corrections]]"
---

# The Aethercourt

## What this is

The **Tier-1 core monument** of the Arcanum Estate. The Aethercourt is the entry point: every Aetherian career starts here, and every specialization expansion mod ([[citadel-of-light]], [[sacred-grove]], [[bloodforged-spire]], [[atheneum-tower]]) extends from it. Without the Aethercourt, the Arcanum Estate doesn't exist.

## Form

The Aethercourt is **not a single building**. It's a grand, sprawling, modular complex with a ceremonial courtyard at its center — closer to a campus or college quadrangle than a hall or fortress. Single-word spelling ("Aethercourt", not "Aether Court") because it's a proper-noun place name, in the tradition of Winterfell or Starfall, not a literal description.

The name fits the vanilla pattern: Labor has the **Manor**, Clergy has the **Monastery**, Kingdom has the **Castle**, Arcanum has the **Aethercourt** — each a singular collective noun that names the estate via its monument.

## Architectural language

Geometric forms (icosahedrons, domes, formalized nodes) mixed with the standard Foundation medieval-provincial base. The architectural set piece is the **[[arcane-lyceum]]**: a Pantheon-inspired domed lecture hall over an open amphitheater, with icosahedron roof parts as a signature motif.

Aesthetic reference: see [[foundation-aesthetic-reference]] for how the Aethercourt's geometry sits inside Foundation's broader visual language.

### Signature visual marker — custom diamond-tile roof

The single most distinguishing visual element of the Aethercourt is its **custom roof texture**: interlocking **diamond-shaped tiles**, distinct from the rectangular tiles used by the Manor, Monastery, and Castle. The diamond geometry is the at-a-glance identifier that signals "Arcanum Estate" before any other architectural element registers.

**Color palette — washed-out, player-selectable variants:**

- **Default:** non-intrusive **light purple** — the estate's signature heraldry color rendered in washed-out form per the vanilla color rule (see [[foundation-aesthetic-reference#Vanilla style rules (engine-aware)|vanilla style rules]]).
- **Variants:** brown, black, green, blue — each hued specifically so they don't clash with the other estates' roof colors. Player-selectable like vanilla's roof-color customisation.

### Faceted Aether Crystals — decorative accent only

(Faceted) Aether Crystals are **not** used as a core building material — explicit prohibition. They may appear as decorative accents (window inlays, engraved-rune inserts) but are never the primary structural material for a wall, foundation, or roof. If used in any building part or decoration, the crystals are **color-customisable** in the same player-choice way as the roof tiles.

The earlier Gemini framing called for "polished white/light grey limestone" walls and glowing Faceted Aether Crystal windows. Both are **retired as hallucinations** — the Aethercourt uses the same field-stone / plaster / timber palette as the rest of vanilla Foundation, with crystals as small accents only.

### Doors and windows

The Aethercourt has its own door and window designs (not reused from other estates), but these must strictly follow the vanilla artstyle, look and feel. Specific geometry `[TBD]` and left for future part-design work.

## Tech-unlock progression

Tech-tree unlock names follow the vanilla `[Monument Name] [Style Descriptor] Architecture` pattern but use academic descriptors instead of vanilla's Rustic / Modest:

| Tier | Unlock name |
| --- | --- |
| Tier 2 | **Aethercourt Scholastic Architecture** |
| Tier 3 | **Aethercourt Arcane Architecture** |

The progression tells a thematic story: at T2 Aetherians are still bound by mortal academic methods (Scholastic = the rigorous medieval dialectical method); at T3 the architecture has transcended study and become infused with magic itself. See [[dh-notebooklm-tech-unlock-naming]] for the full alternative-naming history.

**Building-part prefix progression:** T1 + T2 use the `Scholastic` prefix; T3+ (core mod) use the `Arcane` prefix. Expansion-mod monuments will choose their own prefixes per their own designs.

## Tier 1 Room parts

The Aethercourt launches with **8 unique Tier 1 Room parts**, matching the variety of the vanilla Monastery and Castle. All use the `Scholastic` prefix.

| # | Part | Role |
| --- | --- | --- |
| 1 | **Scholastic Study Hall, Minor** | Core block for the Academy |
| 2 | **Scholastic Tower, Minor** | Modest vertical element |
| 3 | **Scholastic Quarters, Minor** | Annex lodging |
| 4 | **Scholastic Quarters, Major** | Larger Annex lodging |
| 5 | **Scholastic Passageway** | Modular connector between halls |
| 6 | **Scholastic Vestibule** | Entrance / transition piece (most-likely-locked; alternatives `Scholastic Antechamber` / `Scholastic Foyer` recorded as paper trail) |
| 7 | **Scholastic Study Nook, Minor** | Small modular pop-out room (Manor Boudoir analog) |
| 8 | **Scholastic Study Nook, Major** | Larger Study Nook variant |

A `Scholastic Gallery` part is reserved for the **T2 unlock** rather than T1.

See [[dh-notebooklm-tier1-room-parts]] for the prefix-selection history (Rustic / Wooden / Stone / status-name prefixes all considered and rejected).

### Asset modeling strategy — vertical scale, not material-variant pairs

The Aethercourt's parts deliberately avoid the vanilla Castle/Monastery convention of separate Wooden vs Stone variants of the same part. Instead, each Aethercourt part is a **single asset where the player can vertically scale the stone foundation or the timber upper section independently**. This:

- Halves the part-count compared to the vanilla per-material approach.
- Consolidates UI clutter — one part where vanilla would need two.
- Lets the same `Scholastic`-prefixed part double-duty across what would otherwise be material-variant sub-buildings.

`Wooden` / `Stone` material descriptors are still used sparingly for parts that only come in one material.

See [[3d-modeling-pipeline]] for the asset-pipeline implications.

## Non-modular sub-buildings

Two of the Aethercourt's sub-buildings — the **Archive** and the **Aether Hold** — are **single-building placements** (mirroring the Castle's Armoury or the Monastery's Monastic Grange) rather than modular constructions. They are dropped from a single tile and do not consume any of the 8 Tier 1 Room parts above. The modular Room-part pool is dedicated to the Academy, the Annex, and general Aethercourt footprint shaping.

## Sub-buildings

The Aethercourt contains the following sub-buildings — see [[core-buildings]] for full details:

| Sub-building | Function | Tier |
| --- | --- | --- |
| Academy | Aspirant work-profession lodging (Scholar job) | 1 |
| Annex | Aetherian housing (both Aspirants and Arcanists) | 1 |
| Aetherium | Arcanist work-profession lodging (Caster job) | 2 |
| Lapidary | Refines Aether Crystal → Faceted Aether Crystal (Lapidarist job) | 2 |
| Archive | Storage for Glyphs and Arcane Lore (knowledge resources) | 2 |
| Aether Hold | Storage for Aether Crystal and physical resources | 2 |
| [[arcane-lyceum\|Arcane Lyceum]] | Loremaster's lecture hall; fulfils [[need-discourse\|Discourse]] for T2+ Aetherians | 3 |

Note: the **Sorcerer** specialization has **no Aethercourt sub-building** by design — Sorcerers operate exclusively out of their Tier-3 monument [[bloodforged-spire]]. See [[dh-sorcerer-subbuilding-abandoned]] for the rationale.

Three names also reserved during the Aethercourt naming discussion went elsewhere:
- **Sanctum** — kept as a sub-building, but lives inside [[citadel-of-light]], not inside Aethercourt.
- **Aether Tower** — originally an Aethercourt sub-building; abandoned and replaced by the Tier-3 monument [[atheneum-tower]].
- **Sacred Grove** — originally a sub-building name; promoted to the Tier-3 Druid monument.

See [[dh-sub-building-renames]] for the full promotion log.

## External-affairs role

The Aethercourt's external-affairs role (the equivalent of Labor's Bailiff, Clergy's Abbot, Kingdom's Knight) is the **[[aether-envoy|Aether Envoy]]**, who liaises with the umbrella **Grand Council** quest authority. The Envoy's office sits within the Aethercourt.

## Place in the five-monument structure

This is the **Tier-1 / Tier-2** monument. The Arcanum Estate has **five monuments total** — one core (the Aethercourt) plus four Tier-3 specialization monuments unlocked through the expansion mods. See [[dh-monument-architecture]] for the structural rationale and the Labour Estate precedent (Manor / Tavern / City Market) that justifies multiple monuments per estate.

## Cross-links

- [[estate-identity]] — the estate this monument anchors
- [[core-buildings]] — sub-buildings in detail
- [[aetherian-progression]] — who lives and works here
- [[core-economy]] — what's produced and stored here
- [[need-discourse]] — what the Arcane Lyceum fulfils
- [[aether-envoy]] — external-affairs role
- [[dh-monument-architecture]] — five-monument structure
- [[arcane-lyceum]] — signature interior architecture
- [[aethercourt-decorations]] — decoration roster (T1-T5)
- Tier-3 expansion monuments: [[atheneum-tower]], [[citadel-of-light]], [[sacred-grove]], [[bloodforged-spire]]
- Design history: [[dh-the-aethercourt]], [[dh-monument-architecture]]

---
exported: 2026-06-04T19:50:28.229Z
source: NotebookLM
type: report
title: "Technical Design Specification: The Arcanum Estate"
---

# Technical Design Specification: The Arcanum Estate

6/4/2026, 9:50:28 PM

---

# Technical Design Specification: The Arcanum Estate

## 1\. Executive Vision and Design Philosophy

The strategic importance of "Vanilla Integration" is the cornerstone of the Arcanum Estate. In a gridless, organic simulation like _Foundation_, the introduction of magical elements must avoid the "high-fantasy trap"—oversaturated glows and static, immersion-breaking spires. Instead, the Arcanum Estate fills the "Knowledge" niche by treating magic as a scholarly, medieval pursuit. This ensures the estate feels like a natural extension of the game's provincial architecture rather than an isolated island of hallucinations.

The core identity of the estate is established via the following parameters:

**Estate Name:** The Arcanum Estate

**Estate Color:** Metallic Purple (Hex: #8E44AD)

**Collective Term:** Aetherians

**Splendor Icon:** Metallic Purple (Selected specifically to ensure high contrast and accessibility against the Clergy’s Silver and Labor’s Gold).

The chief administrator of this estate is the **Aether Envoy**, a high-level delegate responsible for external affairs and the "Grand Council" quests. This role functions as the player's primary interface with the estate's progression, grounding mystical advancement in the game’s existing political and social simulation loops.

\--------------------------------------------------------------------------------

## 2\. Aesthetic Standards and Material Rules

Visual consistency is a strategic necessity to prevent "mod-clash." By adhering to the vanilla artstyle, we maintain player immersion and ensure that the Aetherian structures evolve organically with the village. The architectural language must prioritize modularity over monolithic assets.

### Material Constraint Table

To maintain a grounded medieval look, all assets must comply with the following rendering and material rules:

| Material Category | Invalid Concepts (Forbidden) | Official Specifications (Approved) |
| --- | --- | --- |
| Wall Textures | Polished Limestone / Marbled Slabs | Exposed Field Stone, White Plaster |
| Support Elements | Floating Orbs / Glowing Beams | Dark Oak Half-Timber, Rough-hewn Beams |
| Lighting Logic | Custom Light Code / Glow Effects | Standard Vanilla Vertex Lighting |
| Architectural Accents | Massive Pre-built Spires | Modular Parts with Faceted Crystal Inlays |

### Custom Roof Specification

The signature visual marker of the Aethercourt is the custom roof texture.

**Geometry:** Custom interlocking diamond-shaped tiles, distinct from the standard rectangular tiles of the Manor or Monastery.

**Color Palette:** Strictly "washed-out" tones to match vanilla intensity.

**Variants:** The default is a non-intrusive **Light Purple**. Variations provided include Brown, Black, Green, and Blue, specifically hued to prevent clashing with existing estate color coding.

### The Role of Aether Crystals

Faceted Aether Crystals are decorative accents, not core structural materials. While they provide the estate's mystical flair, they are utilized as window inlays or engraved runes. To enhance player agency, crystals are color-customizable, mirroring the roof variant system to ensure the settlement remains aesthetically cohesive.

\--------------------------------------------------------------------------------

## 3\. The Aethercourt: Modular Monument Architecture

The Arcanum Estate rejects the "Massive Spire" fallacy. In _Foundation_, monuments are living structures that grow piece-by-piece. The Aethercourt uses a modular system that mirrors the Monastery’s visual evolution, allowing players to scale their academic hubs based on local geography and economic capacity.

### Tiered Progression Naming Convention

Building parts utilize a naming convention that signals both prestige and material refinement:

| Tier | Naming Convention | Design Logic |
| --- | --- | --- |
| Tier 1 | Rustic [Part Name] | Rough stone, basic timbers, functional silhouettes. |
| Tier 2 | Modest [Part Name] | Cleaner plaster finishes, sharper roof lines, academic prestige. |

### Required Sub-Buildings

**Academy (T1):** The primary workplace for Aspirant Scholars. It serves as the "Scribe" hub for Glyph production.

**Annex (T1):** Essential shared lodging and study spaces. It reduces villager travel time by housing Aetherians near the monument.

**Archive (T1/T2):** Specialized storage units for intellectual resources (Glyphs and Arcane Lore).

**Aetherium (T2):** An advanced workplace where Arcanists process Glyphs into Arcane Lore.

### Sub-Building Connection Logic

Functional integrity relies on the "Linked Plans" system. Every sub-building must have **Interior Access** (functional doors and snap-points). If a part lacks a door or a connection to a part with a door, the workplace will fail to register, preventing production stalls and ensuring the simulation engine recognizes the monument as a singular entity.

\--------------------------------------------------------------------------------

## 4\. Multi-Tiered Production Chains and Economic Integration

The Arcanum economy is a dual-chain system that balances physical extraction with intellectual refinement. This creates high-value gameplay loops that force dependencies on the Labor and Clergy estates, preventing the mod from becoming a closed system.

### Physical Production: The Crystal Chain

| Tier | Workplace | Primary Output | Byproduct |
| --- | --- | --- | --- |
| Tier 1 | Mining Camp | Raw Aether Crystals | N/A |
| Tier 2 | Lapidary | Faceted Aether Crystals | Aether Crystal Dust |

### Intellectual Production: The Knowledge Chain

| Tier | Workplace | Primary Output | Input Requirement |
| --- | --- | --- | --- |
| Tier 1 | Academy | Glyphs | Research (Labor-intensive) |
| Tier 2 | Aetherium | Arcane Lore | Glyphs |

### Inter-Estate Synergy and Social Fulfillment

To deepen village integration, the following goods bridge the gap between estates:

**Scholar’s Vestments:** Produced by the **Arcane Weaver** using **Cloth** (Labor) and **Aether Crystal Dust** (Lapidary byproduct).

**Runic Talismans:** Crafted by the **Rune Crafter** using **Glyphs** and **Polished Stone** (Labor).

**Aetherial Elixirs:** Brewed at the **Apothecary** using **Aether Blooms** (grown in the Aethercourt) and **Herbs/Berries** (Labor/Clergy).

**Enchanted Tomes:** Produced at the **Aether Bindery** using **Glyphs**, **Leather** (Labor), and **Planks** (Labor).

**Strategic Bottleneck Solution:** Arcane Lore has been removed from the Enchanted Tome recipe. By requiring Tier 1 Glyphs instead, players are not forced to choose between generating high-value trade income and promoting their Arcanists. This ensures villager promotion paths remain viable in both gold-focused and prestige-focused playstyles.

**The "Discourse" Need:** At Tier 2 and above, Aetherians develop a social need for **Discourse**. This replaces the standard "Entertainment" (Tavern) need and is fulfilled at the **Arcane Lyceum** (an open-air or domed lecture hall) by a **Loremaster**.

\--------------------------------------------------------------------------------

## 5\. Social Stratification and Specialized Paths

The Arcanum Estate mirrors the Kingdom Estate’s military promotion logic but introduces higher complexity through branching specializations at Tier 3.

### Base Progression Path

**Aspirant (Tier 1):** Villager Status. Works as a **Scholar** (Scribe) at the Academy to produce Glyphs.

**Arcanist (Tier 2):** Villager Status. Works as a **Caster** (Aetherium) or **Lapidarist**. At this level, they require **Discourse** fulfillment.

### Specialized Tier 3 Monuments and Professions

Upon promotion to Tier 3, Arcanists branch into one of four paths, requiring five subordinates to support the new elite rank:

**The Mage Path (Elemental):**

**Monument:** The Atheneum Tower.

**Profession:** Elementalist (Workplace: Aether Tower).

**The Paladin Path (Martial):**

**Monument:** The Sanctum.

**Profession:** Sentinel (Produces combat buffs/Blessings).

**The Druid Path (Nature):**

**Monument:** The Sacred Grove.

**Profession:** Rootshaper (Workplace: Evertree/Heartwood).

**The Sorcerer Path (Ritual):**

**Monument:** The Bloodforged Spire.

**Profession:** Incantator (Workplace: Ritual Grounds).

**The Loremaster Rank:** A prestigious administrative/service rank working at the Arcane Lyceum. The Loremaster is responsible for satisfying the **Discourse** need for all high-tier Aetherians.

**Hidden Quest Ranks:** Mastery level ranks unlocked via narrative events: **Archmage**, **Hallow Lord**, **Earthparent**, and **Supreme Sorcerer**.

\--------------------------------------------------------------------------------

## 6\. Technical Implementation and API Requirements

All implementation must ground itself in the Foundation Lua API to ensure save-game stability and performance across large populations.

### Developer Checklist

**Infrastructure:** Strict adherence to `mod.json` (metadata) and `mod.lua` (entry point).

**Class Registration:** Utilize `registerClass` to define the Aetherian Entity-Component System (ECS) components and `registerAssetId` for all 3D materials.

**Persistence:** Mandatory use of `generated_ids.lua` for GUID stability. This is non-negotiable for cross-environment compatibility.

**Byproduct Logic:** The Lapidary must use the `COMP_WORKPLACE` dual-resource output logic (similar to the vanilla Apiary). This prevents the production of Faceted Crystals from stalling if the Aether Crystal Dust storage is full.

**API Constraints:** Custom light code and glow shaders are strictly forbidden. Emissive effects must be handled via standard vertex colors and HDR-capable RGBA channels (values \>1.0) within existing rendering limits.

**Asset Processing:** All modular parts must utilize `registerAssetProcessor` to manage Level of Detail (LOD) transitions, ensuring the Hurricane engine can handle high-count Aethercourts without performance degradation.

The Arcanum Estate represents a high-value, balanced expansion. By merging mystical themes with the game’s core economic and social logic, it offers a sophisticated "Vanilla Plus" experience that respects the architectural soul of _Foundation_.
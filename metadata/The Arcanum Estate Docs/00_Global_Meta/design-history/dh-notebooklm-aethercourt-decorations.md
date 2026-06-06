---
title: Aethercourt Decorations T1-T5 — Decision Log (NotebookLM)
tags:
  - design-history
  - notebooklm
  - core
  - decorations
  - monuments
created: 2026-06-05
status: design-iterating
sources:
  - notebooklm-conversation.md lines 2176-2305
  - "[[_notebooklm-chat-index]]"
---

# Aethercourt Decorations T1-T5 — Decision Log (NotebookLM)

## Final state

A first-pass roster of Aethercourt decorations spanning Tier 1 through Tier 5. Per Anton's framing at L2263, **the Aethercourt's decorations are deliberately foundational, unspecialized, and academic** — the four specialization monuments lean into their specific magical domains (see [[dh-notebooklm-expansion-monument-decorations]]).

These are creative-direction candidates, not final-locked names. Status `design-iterating` until decoration-naming convention is established (see Open questions).

### Tier 1 — Aspirant level (rustic, academic, slightly wild)

| Decoration | One-line description |
| --- | --- |
| **Rustic Scholar's Bench** | Simple wooden bench with a stack of parchment and ink on one side. |
| **Raw Aether Crystal Cluster** | Jagged, unrefined pile of Aether Crystals embedded in dirt near foundations. |
| **Aspirant's Chalkboard** | Freestanding wooden board covered in chalk diagrams of foundational magic theory. |
| **Wild Aether Bloom Patch** | Untamed clusters of Aether Blooms growing naturally in the grass. |

### Tier 2 — Arcanist level (cultivated, intentional, academic)

| Decoration | One-line description |
| --- | --- |
| **Faceted Crystal Sconce** | Purely decorative wall attachment with a refined Faceted Aether Crystal set in iron. |
| **Arcanist's Reading Pavilion** | Small open-air wooden canopy covering a high-quality desk and reading chair. |
| **Aether-Laced Topiary** | Bushes trimmed into geometric shapes (spheres, diamonds, pyramids) reflecting the mathematical bent of the Arcanists. |
| **Aetherium Archive Shelves** | Modular bookshelves placed against exterior walls under porches, representing Arcane Lore overflow. |

### Tier 3-5 — Loremaster level / grand campus (premium, anti-gravity, prestige)

| Decoration | One-line description |
| --- | --- |
| **Floating Arcane Rune** | Static anti-gravity stone rune held aloft by the unaligned power of charged Arcane Anchorstones. |
| **Loremaster's Lectern** | Prestigious carved stone podium for outdoor academic discourse. |
| **Grand Orrery Model** | Large metallic decorative cosmos model for the Arcane Lyceum courtyards. |
| **Aetherial Fountain** | Stone water feature with water cascading over a central, massive Faceted Aether Crystal. |

## First-pass candidates not in the final roster (paper trail)

NotebookLM's first iteration (L2192-2258) included several items that did not survive into the cleaner second pass at L2273-2304:

- **Aether Bloom Ivy, Wild** + **Aether Bloom Ivy, Trimmed** — wall-attachable ivy variants for T1 / T2. Not picked up in the second pass.
- **Potted Aether Fern** — T1 doorway planter.
- **Scholar's Clothesline** — T1, civilian counterpart to the Castle's "Warlike Clothesline".
- **Cultivated Aether Bloom Planter** — T2; likely consolidated into the [[master-to-do#Forgotten / parked items from the NotebookLM merge (Anton to adjudicate)|Aether Bloom Garden]] planter family rather than as a standalone decoration.
- **Aetherwood Sapling** — T2 young tree with light-purple/teal foliage (matures into the Sacred Grove's Ancient Aetherwood Tree at T3+).
- **Stone Pedestal with Astrolabe** — T2 academic instrument; possibly absorbed into the T3-5 Grand Orrery Model.
- **Specialized Bloom Beds (per-path color variants)** — T3 color-variant beds (crimson for Bloodforged Spire, golden for Citadel of Light); moved to per-specialization design.
- **Hovering Crystal Accent** — small floating crystal shards for roof peaks or above archways.

These remain available for re-adoption if Anton wants more variety per tier.

## Constraints inherited from other clusters

- **No custom light sources (modding-API constraint).** Anything described as "glowing", "luminous", or "shining" must use the vertex-color / HDR-RGBA workaround per [[dh-notebooklm-aesthetic-corrections]]. The T1-T5 Aethercourt list above is mostly safe — Faceted Crystal Sconce is explicitly described as non-light-emitting (L2230). The Floating Arcane Rune is anti-gravity (held aloft) rather than emissive, so it's fine.
- **Charged Anchorstones drive the T3-5 anti-gravity decorations.** The Floating Arcane Rune is the first concrete demonstration of the [[dh-notebooklm-artificer|Artificer pivot's]] premium-decoration use-case. The decoration uses the "Arcane Anchorstone" naming line (L2240, L2297) — incidental textual lean toward Anchorstone over Crystalfocus in the [[dh-notebooklm-charged-containers]] open question. Not a lock; record the bias.
- **No re-use of vanilla decorations from other estates.** Per Anton's broader unique-naming stance (L1671) for the Aethercourt monument, decorations should also be Arcanum-original where possible. NotebookLM's "Scholar's Clothesline as civilian counterpart to the Castle's Warlike Clothesline" follows this — same archetype, distinct asset.

## Open questions

- **Decoration naming convention.** Building parts are locked to `Scholastic` prefix (T1+T2) and `Arcane` prefix (T3+ core), per [[dh-notebooklm-tech-unlock-naming]]. The T1 decorations in this chat use the older Gemini-era `Rustic` prefix (`Rustic Scholar's Bench`) and status/job names (`Aspirant's Chalkboard`, `Arcanist's Reading Pavilion`, `Loremaster's Lectern`). **Two questions for Phase 5:**
  1. Should the Aethercourt's *decorations* follow the same prefix progression as its *building parts* (Scholastic / Arcane)? Or are decorations free to use varied prefixes?
  2. Are status/job prefixes acceptable for decorations even though they were rejected for building parts (L1735)? Vanilla precedent: decorations like "Knight's Sword" or "Scholar's Clothesline" are named after their depicted user.
- **Splendor values per decoration.** Not addressed in chat.
- **Construction-cost balancing.** T3-5 decorations using charged Anchorstones could double as an economic sink for the Artificer's output. Cost tuning is `[TBD]`.

## Resources / items mentioned but not yet captured elsewhere

The following item names surfaced in this cluster. Most are decoration-internal but a few hint at new resources or buildings:

- **Aetherwood** — a magically altered tree species with light-purple/teal foliage. Used in "Aetherwood Sapling" (T2) → "Ancient Aetherwood Tree" (T3+, Sacred Grove). Could be a decoration species only, or could become a new resource (Aetherwood logs / planks). Added to [[master-to-do]] forgotten-items.
- **Aetherial Fountain** — stone water feature. Implies water as a vanilla resource the Arcanum can incorporate, no new resource needed.
- **Grand Orrery / Astrolabe** — celestial-instrument decoration family. Could expand into more variations.

## Implications for existing vault notes

- [[the-aethercourt]] — does not currently have a decorations section; would gain one with the 12 candidate items above.
- [[arcane-lyceum]] — explicitly hosts the Grand Orrery Model in its courtyards (L2301); worth noting.
- New final note candidates (Phase 5, per Decision 6 — decorations are roughly resources/decorations category):
  - The decoration set may not warrant per-decoration notes; more likely a single rolled-up decorations note under `01_Mod_Core_Arcanum/` root once naming is settled.

## Cross-links

- [[dh-notebooklm-expansion-monument-decorations]] — sibling for the four specialization monuments
- [[dh-notebooklm-aesthetic-corrections]] — no-glow constraint that decorations must respect
- [[dh-notebooklm-charged-containers]] — anti-gravity decorations consume the Artificer's charged containers
- [[dh-notebooklm-artificer]] — production source for those containers
- [[the-aethercourt]], [[arcane-lyceum]]
- [[_notebooklm-chat-index]]
- [[_notebooklm-merge-plan]]
- [[master-to-do]] — Aetherwood / Aether Bloom Garden / decoration-naming convention all live here

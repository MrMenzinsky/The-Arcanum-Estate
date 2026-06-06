---
title: Aether Bindery + Enchanted Tomes — Decision Log (NotebookLM)
tags:
  - design-history
  - notebooklm
  - core
  - buildings
  - jobs
  - economy
created: 2026-06-05
status: locked
sources:
  - notebooklm-conversation.md lines 430-682
  - "[[_notebooklm-chat-index]]"
---

# Aether Bindery + Enchanted Tomes — Decision Log (NotebookLM)

## Final state

The Arcanum Estate's Tier 4 high-value trade good is the **Enchanted Tome**, produced at the **Aether Bindery** sub-building by a Loremaster working as a **Tomebinder**.

| Field | Value |
| --- | --- |
| Output | **Enchanted Tome** (T4 high-value trade good — exported, not consumed by villagers) |
| Workplace | **Aether Bindery** |
| Job | **Tomebinder** |
| Villager status | Tier 3 **Loremaster** |
| Recipe | **Glyphs + Planks + Faceted Aether Crystals** |
| Building description | "Crafts Enchanted Tomes by forging heavy wooden covers from planks to safely bind volatile glyphs, sealed with a faceted aether crystal." |

Anton's lock at L655: "Then I want you to lock it in!" — confirmed by NotebookLM at L660: "Aether Bindery and Tomebinder are officially locked in!"

## Design rationale

### Why a *secondary* Loremaster job (not just Lyceum work)

Anton's prompt at L509 framed it: "as it is a high-value trade good, we could have the Lore Masters produce it, so they have something else to do apart from providing Discourse in the Arcane Lyceum." The Loremaster's primary role remains Lyceum service for the [[need-discourse|Discourse need]]; the Tomebinder is a second viable job assignment that keeps Loremasters economically useful once the village's Discourse need is fully met. This makes the Loremaster status genuinely multi-role.

### Why Glyphs not Arcane Lore in the recipe (strategic bottleneck solution)

NotebookLM's L486-492 reasoning: Arcane Lore is consumed for promotions across all four Tier 3 specializations (Mages, Paladins, Druids, Sorcerers — analogous to how the Clergy uses Manuscripts to promote brothers/sisters and priors/prioresses). Including Arcane Lore in the Tome recipe would force the player to choose between **money** (making tradeable tomes) and **prestige** (promoting Arcanists). Using the Tier 1 base resource (Glyphs) instead keeps Tomes profitable without starving the promotion economy.

### Balancing note (developer-tuning task)

Anton at L657 raised a balancing concern: the Monastery produces Manuscripts excruciatingly slow early-game but ends up with an abundance by mid-game. The Arcanum may behave similarly with Glyphs. Decision (L677-681): **keep Glyphs as the input for now**; during playtest, if Glyphs become over-abundant in late game, swap them for Arcane Lore. Explicitly **avoid using both** Glyphs AND Arcane Lore in the same recipe — a 4-input building would clutter the UI and overcomplicate logistics.

### Why Planks (justifying it to the player)

Historically, medieval tomes used wooden boards for covers. To avoid relying on player background knowledge, the workplace description (locked above) explicitly states the planks are used for the physical book covers — "forging heavy wooden covers from planks to safely bind volatile glyphs." This is a load-bearing UX choice: the recipe must read intuitively in-game.

## Naming history

### Workplace — why "Aether Bindery" beat the alternatives

| Candidate | Verdict |
| --- | --- |
| **Bindery** (standalone) | Rejected — collides with existing mods that already use this name (L509). |
| Scriptorium | Rejected — used by the vanilla Clergy Estate (L521). |
| Illumination Chamber | Anton liked it but felt it wasn't "spot on" (L562). |
| Tomecrafter's Study | Anton liked it but same as above (L562). |
| Lore Vault | Considered, not picked. |
| Engraving Studio / Engraving Workshop | Considered, not picked. |
| Tome Workshop | NotebookLM's "vanilla naming" recommendation (L587) — Anton rejected at L611 because "Workshop sounds too non-delicate and not book-like enough." |
| Tomecrafter Hut, Arcane Press, Lore Forge | All considered; not picked. |
| **Lore Bindery** | **Explicit rejection** at L638. Anton's intuition (L634): "it feels like it should then use Arcane Lore instead of basic Glyphs as the resource, no?" NotebookLM confirmed: "Naming a building after a resource it *doesn't* use is a major UX pitfall." Scratched. |
| **Arcane Bindery** | Rejected. Loremasters also work at the Arcane Lyceum; the "Arcane" prefix creates UI repetition with the Lyceum and doesn't highlight the physical crafting aspect of the building (L640). |
| **Runic Bindery** | Rejected by Anton at L634: "feels too common/low for a Loremaster." |
| **Aether Bindery** | **Locked.** Ties to (a) the Aethercourt monument identity and (b) the Faceted Aether Crystal that locks each tome's magic into place. Distinct from the Arcane Lyceum (clean UI separation despite shared workforce). |

The **Lore Bindery rejection** at L638 elevated to a mod-wide design principle that recurs in [[dh-notebooklm-charged-containers]]: never name a building / resource for something it doesn't actually consume — UI clarity beats thematic appeal.

### Job — why "Tomebinder" beat "Tomecrafter" and "Illuminator"

- **Tomebinder** (locked) — "specialized, academic, perfectly fits a task performed by a Tier 3 Loremaster" (L615). Avoids the mod-conflict of the building term "Bindery" while keeping the same root.
- **Tomecrafter** — strong vanilla-style alternative (mirrors Stonecutter, Rune Crafter). Passed on but kept as a paper-trail candidate.
- **Illuminator** — Anton's pushback at L563: "Illuminator sounds more like someone who brings light (at least for me)." Rejected.
- **Rune Engraver** — considered (lean-into-physical-engraving framing). Not picked.

## Recipe alternatives considered

NotebookLM offered three options at L535-545 before Anton picked Option B at L557:

- **Option A (Gilded Tome):** Glyphs + Cloth + Gold Coins/Bars. Heavily vanilla-economy-integrated. Not chosen.
- **Option B (Crystal-Bound Tome):** Glyphs + Planks + Faceted Aether Crystals. **CHOSEN.** Keeps Tomes within the mod's own resource loop while still pulling in vanilla Planks.
- **Option C (Sealed Tome):** Glyphs + Cloth + Wax. Cross-estate Clergy-dependency variant. Not chosen.

## Open questions

- **Playtest-driven recipe swap.** Glyphs → Arcane Lore conditional swap (per the L677 developer note). Decision deferred to playtest.

> [!IMPORTANT] Workplace rename if recipe input changes
> If the recipe is ever swapped from **Glyphs** to **Arcane Lore**, the workplace name **must change accordingly** — `Aether Bindery` would become misleading, just as `Lore Bindery` was rejected here for the inverse reason. The naming principle locked in this cluster (never name something for what it doesn't consume) cuts both ways. A swap to Arcane Lore should also reopen the workplace-name brainstorm at L619-629, where `Lore Bindery` was actually the most thematically apt candidate.

### Recipe-input iteration history (for context)

The Glyph-vs-Arcane-Lore question moved back and forth across the chat before the lock:

1. **L384** (NotebookLM's first sketch, before the cluster crystallized): Recipe was `Glyphs + Leather + Gold` — Glyphs was the original base.
2. **L434** (NotebookLM's second pass): Recipe shifted to `Arcane Lore + Blank Vellum + Leather` — Arcane Lore as base.
3. **L449** (Anton's pushback): "I am worried that it will cost too much to make and that the Glyph -> Arcane Lore -> Enchanted Tome will be too costly and hard to keep going, especially since the Arcane Lore will be used as a promotion cost for Casters up to Lore Masters and the other specializations." — surfaced the promotion-economy bottleneck explicitly.
4. **L486-492** (NotebookLM's "Bottleneck Solution"): Recipe corrected back to Glyphs. The phrase "Arcane Lore strictly reserved for promotions and advanced research" became the durable rationale.
5. **L657** (Anton): explicitly logged the playtest-driven swap as a known balancing risk — Glyphs may turn out to be over-abundant late-game (Monastery Manuscript pattern), in which case a swap to Arcane Lore would make Tomes feel more premium.
6. **L677-681** (final lock): Glyphs is the recipe input; Arcane Lore is the swap candidate; **never both** in the same recipe (4-input UI penalty).

## Implications for existing vault notes

- [[loremaster]] — needs the secondary-job note: Loremasters can be assigned as Tomebinders at the Aether Bindery in addition to working at the [[arcane-lyceum]].
- [[core-buildings]] — Aether Bindery needs to be added as a T4 (or "late mid-tier") sub-building.
- [[core-economy]] — Enchanted Tome needs to be added as a T4 high-value trade resource.
- [[glyph]] — needs note as an input to the Tome recipe.
- [[faceted-aether-crystal]] — needs note as the magic-sealing input to the Tome recipe.
- [[arcane-lore]] — record the deliberate non-use of Arcane Lore in the Tome recipe (the bottleneck-solution rationale).
- New final notes anticipated (Phase 5):
  - `01_Buildings/aether-bindery.md`
  - `03_Villager_Jobs/tomebinder.md`
  - `04_Resources/enchanted-tome.md`

## Cross-links

- [[dh-notebooklm-inter-estate-goods]] — sibling cluster; the Tome was item 4 of that brainstorm before branching off
- [[dh-notebooklm-charged-containers]] — UI-over-theme naming principle precedent
- [[dh-loremaster-tier-3]] — existing Loremaster design history
- [[dh-discourse-need]] — Lyceum is the Loremaster's primary job
- [[loremaster]], [[arcane-lyceum]]
- [[glyph]], [[arcane-lore]], [[faceted-aether-crystal]]
- [[_notebooklm-chat-index]]
- [[_notebooklm-merge-plan]]

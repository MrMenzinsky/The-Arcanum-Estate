---
title: Inter-Estate Goods Family — Decision Log (NotebookLM)
tags:
  - design-history
  - notebooklm
  - core
  - economy
  - buildings
  - jobs
created: 2026-06-05
status: design-iterating
sources:
  - notebooklm-conversation.md lines 388-507
  - "[[_notebooklm-chat-index]]"
---

# Inter-Estate Goods Family — Decision Log (NotebookLM)

## Final state

The Arcanum Estate's economy is extended with a family of three locked production chains that bridge to the Labor and Clergy estates. Each chain pairs an Arcanum input (Aether Crystal Dust, Aether Blooms, or Glyphs) with a vanilla input (Cloth, Berries/Herbs, Polished Stone), forcing cross-estate dependency.

| Chain | Tier | Workplace | Job | Recipe |
| --- | --- | --- | --- | --- |
| Scholar's Vestments | T2 consumable | **Arcane Weaver** | Serf / Commoner (Labor-Estate workforce, not an Aetherian) | Cloth + Aether Crystal Dust |
| Aetherial Elixirs | T2 consumable | **Apothecary** | `[TBD job name]` — see [[master-to-do#Forgotten / parked items from the NotebookLM merge (Anton to adjudicate)]] | Aether Blooms + Berries/Herbs |
| Runic Talismans | T3 consumable / buff | **Rune Crafter** | `[TBD job name]` — `Rune Crafter` likely used as both workplace + job; needs confirmation | Glyphs + Polished Stone |

Anton's lock at L507: "I think that 1, 2, 3, and 5 are good enough for now. So commit them to the official Game Design Document or sources in this notebook." (Item 4 — Enchanted Tomes — was branched off into its own thread and is recorded in [[dh-notebooklm-aether-bindery]].)

(Item 3 in the original brainstorm was the **Aether Lamps** at the Artificer; that whole production chain was subsequently superseded by the [[dh-notebooklm-artificer|Artificer pivot to a base-resource workplace]]. The Aether Lamps recipe is now orphaned — see [[master-to-do]] forgotten-items list.)

## Per-chain detail

### Scholar's Vestments → Arcane Weaver (L444, L458-466)

- Anton chose **Aether Crystal Dust** over raw Aether Crystals or Glyphs as the magical input — "more thematically logical for clothing than consuming an abstract intellectual resource like a Glyph" (L394).
- **Aether Crystal Dust is a Lapidary byproduct.** This means the Lapidary will produce both Faceted Aether Crystals (its primary output) AND Aether Crystal Dust simultaneously. The L444 instruction includes a load-bearing developer task:
  > Verify Foundation API regarding `COMP_WORKPLACE` to confirm dual-resource output works correctly, and that filling the Aether Crystal Dust storage does not block production of Faceted Aether Crystals. **Reference: the vanilla Apiary / Beekeeper, which produces both Wax and Honey** — that's the canonical example to pattern off.
- **Workforce was Anton's specific design choice:** Serf / Commoner (Labor Estate workforce), not an Aetherian. Mirrors the Kingdom Estate's pattern where weaponsmiths are normal serfs/commoners, not estate-specific soldiers (L444). This ties the Arcanum Estate to the broader village economy.

### Aetherial Elixirs → Apothecary (L445, L468-474)

- Anton's framing at L445: the planter beds are analogous to the **Monastery's herb and berry garden sub-buildings**.
- Planter beds visually incorporate raw Aether Crystals as construction cost — economic + visual tie to the estate (L474).
- This creates an "early-game sink for raw Aether Crystals before the Lapidary is fully operational" — the construction cost of the beds is an Aether Crystal consumer that doesn't compete with the Lapidary's later Faceted-Crystal demand.

**Aether Bloom Garden sub-building** — the planter-bed system itself is its own custom sub-building category, separate from the Apothecary (which is the workshop where the Elixirs are brewed). The category is alive but had its unique-naming pass reset (the Tier 1 unique-naming exercise at notebooklm-conversation L1671 only covered Room parts before the chat moved on). Tier placement: **best read from the chat is T1 for the planters + Garden Hut, T2 for the Apothecary consumer**, mirroring the Monastery's Herb/Berry Garden at T1 feeding T2 production. Not explicitly locked. See [[master-to-do]] forgotten-items list.

### Runic Talismans → Rune Crafter (L450, L494-502)

- Anton liked the concept at L450 but flagged that the base material needed to balance against other estates. NotebookLM settled on **Polished Stone** at L496 — direct dependency on the Labor Estate's Stonecutters and Masons; thematic for rune-carving.
- Glyphs (T1 Arcanum) + Polished Stone (vanilla Labor) → mid-tier buff item.
- Talismans can either be required by Paladins or sold at market stalls for a temporary efficiency buff to regular Labor Estate workers (L440). Use-case `[TBD]`.

## Rejected from this cluster

- **Arcane Ink** (NotebookLM L412-416) — scratched by Anton at L446: "too complex and doesn't mirror the Monastery Scriptorium where monks/nuns generate Manuscripts out of thin air."
- **Blank Vellum** (NotebookLM L418-422) — scratched by Anton at L447 for the same reason.

## Cross-resource design principle (load-bearing across the mod)

This cluster established a recurring economic pattern: **every new Arcanum trade/consumable good combines one Arcanum input with one vanilla input**, forcing cross-estate dependency. Articulated implicitly across L394, L408, L502 and reaffirmed later in the chat. This pattern is what kept Arcane Ink / Blank Vellum scratched — they would have piled on too much internal Arcanum complexity instead of bridging out to other estates.

## Implications for existing vault notes

- [[core-economy]] — needs three new T2/T3 goods added (Scholar's Vestments, Aetherial Elixirs, Runic Talismans) and the Aether Crystal Dust byproduct from the Lapidary.
- [[core-buildings]] — needs three new sub-buildings (Arcane Weaver, Apothecary, Rune Crafter) plus the Aether Bloom Garden custom category.
- [[lapidary]] — needs the dual-resource-output note (Aether Crystal Dust as byproduct) and the COMP_WORKPLACE developer reference.
- [[aether-crystal]] — needs to note the new "early sink" use as Aether Bloom Garden bed construction material.
- New final notes anticipated (Phase 5, per Decision 6 routing):
  - `01_Buildings/`: arcane-weaver.md, apothecary.md, rune-crafter.md, aether-bloom-garden.md
  - `03_Villager_Jobs/`: arcane-weaver.md (or labelled with job name if separated from workplace name), apothecary-worker.md (`[TBD job name]`), rune-crafter.md, plus any planter-bed gardener job
  - `04_Resources/`: aether-crystal-dust.md, aether-bloom.md, scholar-vestments.md, aetherial-elixir.md, runic-talisman.md

## Cross-links

- [[dh-notebooklm-aether-bindery]] — Enchanted Tomes (item 4 of the original brainstorm)
- [[dh-notebooklm-artificer]] — Aether Lamps were originally part of this brainstorm (item 3); now orphaned
- [[dh-notebooklm-charged-containers]] — naming-convention sibling
- [[dh-core-economy]] — existing economy spec to extend
- [[dh-core-buildings]] — existing buildings list to extend
- [[lapidary]], [[aether-crystal]]
- [[_notebooklm-chat-index]]
- [[_notebooklm-merge-plan]]
- [[master-to-do]] — forgotten-items list for unresolved sub-questions

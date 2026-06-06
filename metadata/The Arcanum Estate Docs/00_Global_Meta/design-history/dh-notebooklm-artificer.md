---
title: Artificer Workplace — Decision Log (NotebookLM Pivot)
tags:
  - design-history
  - notebooklm
  - core
  - buildings
  - jobs
created: 2026-06-05
status: design-iterating
sources:
  - notebooklm-conversation.md lines 1059-1593
  - "[[_notebooklm-chat-index]]"
  - "[[dh-notebooklm-charged-containers]]"
---

# Artificer Workplace — Decision Log (NotebookLM Pivot)

## Final state

The Artificer is repositioned from a Tier 2 luxury-goods workplace (the original Gemini-era design making Aether Lamps) into a **Tier 3 base-resource workplace** producing empty magical containers. The containers are then infused at each Tier 3 specialization monument into charged containers used as **premium decoration material** in the Arcanum Estate.

| Field | Value |
| --- | --- |
| Tier unlock | **Tier 3** (moved from initial Tier 2 proposal during the pivot — L1129, L1175) |
| Workforce | **Serfs / Commoners** (Labor Estate workforce), not Aspirants / Arcanists (L1127, L1145-1148, L1573) |
| Inputs | **Raw Aether Crystals + Iron** (heavy-iron, light-crystal balance — L1133-1134, L1169, L1577) |
| Output | Empty magical container (specific name `[TBD]` — see [[dh-notebooklm-charged-containers]]) |
| Output use | Charged at each T3 specialization monument into premium-decoration material (floating runes, anti-gravity building parts) — L1131, L1155-1159, L1579 |
| Production chain length | 3 steps: Harvest → Craft (Artificer) → Infuse (T3 monument). Mirrors vanilla 3-step chains (L1163-1165, L1577). |

The Artificer is gated behind the Tier 2 [[lapidary]] in the broader production graph — Lapidary keeps producing Faceted Aether Crystals as the primary high-tier building material; Artificer pulls raw crystals separately for containers (L1102, L1167).

## Pivot rationale

NotebookLM's critical-feedback exchange at L1086-1119 surfaced three concrete problems with Anton's initial Tier 2 + scholar-workforce proposal (L1076-1083):

1. **Lapidary resource starvation** — at Tier 2, Artificer and Lapidary would compete for the same raw Aether Crystals (L1102).
2. **Construction complexity overload** — requiring charged containers for *base* buildings forces a four-step supply chain just to construct anything (L1104).
3. **Thematic worker clash** — academic scholars hammering iron breaks the researcher framing (L1106).

Anton's pivot at L1123-1135 resolved all three:

1. Moved unlock to Tier 3 → containers come online when T3 monuments (the chargers) come online (L1129).
2. Reframed output from **mandatory construction material** to **premium decoration material**, analogous to how vanilla uses Stained Glass or Sculptures (L1131, L1157).
3. Swapped workforce to Serfs/Commoners, matching the Arcane Weaver pattern (L1127, L1147).

Anton then pushed back on NotebookLM's "use Faceted Crystals" suggestion (L1110) at L1133, choosing **raw Aether Crystals** instead — to keep the chain to 3 steps and match a "solid raw crystal in iron hardware" visual rather than a hollow vessel.

## Resource-flow balancing — Stone-mining mirror

To prevent the Lapidary/Artificer starvation NotebookLM raised at L1167, Anton committed to mirroring vanilla's Stone progression (L1217, L1581):

- **Tier 1:** Aether Crystal Mining Camp uses **surface nodes** (like vanilla Stonecutter Camp).
- **Tier 2:** Unlock **Aether Crystal prospecting nodes** for deeper, more efficient mining (like vanilla Quarry/Mines).

This means raw-crystal supply scales just as Lapidary (T2) and Artificer (T3) demand grows. The [[aether-crystal-mining-camp]] note will need to be updated to reflect the surface/prospecting split.

## Open questions

- **Final container resource names.** Two candidate lines remain (L1585-1589): Anchorstone (`Arcane Anchorstone` empty → `Arcane Pure Anchorstone`, `Arcane Fire Anchorstone`, etc. charged) or Crystalfocus (same modifier pattern). Naming format itself is locked — see [[dh-notebooklm-charged-containers]].
- **Recipe ratios.** Iron-heavy, crystal-light balance is the principle (e.g., 3 Iron : 1 Raw Aether Crystal at L1169). Exact numbers `[TBD]` (L1591).
- **Aether Lamps.** The original Artificer design made Aether Lamps from Faceted Crystals + Iron + Glass (L1063-1071). After the pivot the Aether Lamp recipe is orphaned. Three options surfaced but not chosen (L1593):
  1. Drop Aether Lamps entirely.
  2. Move them to a different workplace.
  3. Add them as a higher-tier extension sub-building of the Artificer (Anton floated this at L1082).
- **Charging workplace inside each T3 monument.** The pivot implies every Tier 3 specialization monument needs a workplace where containers get infused (Wind Weaver at Atheneum Tower, etc.). The mapping of "infusion workplace per specialization" is not yet documented. Touches every expansion mod.

## Implications for existing vault notes

- [[aether-crystal-mining-camp]] — needs surface-node / prospecting-node tier split.
- [[lapidary]] — unchanged mechanically; the Artificer pivot was designed *around* keeping the Lapidary intact.
- [[core-buildings]] — needs Artificer added as a Tier 3 sub-building (location `[TBD]`: inside the Aethercourt? standalone? — design pivot question parallel to [[arcane-lyceum]]).
- [[core-economy]] — needs the empty/charged container family added to the resource list.
- Every expansion mod (Citadel of Light, Atheneum Tower, Sacred Grove, Bloodforged Spire) — each needs a "container infusion" workplace + job + the per-specialization charged-container variant.
- [[dh-foundation-aesthetic-reference]] — visual treatment of charged decorations (floating runes, anti-gravity parts) is `[NEW]` and will need a section.

## Adjacent decisions noted in the same passage

- **Lore Bindery → Aether Bindery rename** (L1554) — confirms the "thematic name that misleads is a UX pitfall" principle for resource-related naming. Indirectly supports the charged-container UI-sorting decision.

## Cross-links

- [[dh-notebooklm-charged-containers]] — naming format + UI sorting principle
- [[dh-core-economy]] — existing core economy spec to extend
- [[dh-core-buildings]] — existing core buildings list to extend
- [[aether-crystal-mining-camp]]
- [[lapidary]]
- [[aether-crystal]]
- [[faceted-aether-crystal]]
- [[_notebooklm-chat-index]]
- [[_notebooklm-merge-plan]]

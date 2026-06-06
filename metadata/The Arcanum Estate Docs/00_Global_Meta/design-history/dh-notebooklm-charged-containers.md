---
title: Charged Container Naming + UI Convention — Decision Log (NotebookLM)
tags:
  - design-history
  - notebooklm
  - core
  - resources
  - naming
created: 2026-06-05
status: design-iterating
sources:
  - notebooklm-conversation.md lines 1223-1593
  - "[[_notebooklm-chat-index]]"
  - "[[dh-notebooklm-artificer]]"
---

# Charged Container Naming + UI Convention — Decision Log (NotebookLM)

## Final state

The empty/charged container resource family (introduced by the [[dh-notebooklm-artificer|Artificer pivot]]) uses the **`X <magic type> Y` three-word naming format** (L1281-1319). The format is **locked**; the specific `X` and `Y` words are still open between two candidate lines.

| Slot | Role | Example |
| --- | --- | --- |
| `X` | Shared estate adjective (groups items alphabetically in UI) | `Arcane`, `Aetheric`, `Crystal` |
| `<magic type>` | Empty (unaligned) or per-specialization modifier | `Pure`, `Fire`, `Wind`, `Storm`, `Blood`, `Holy`, … |
| `Y` | Heavy/industrial noun for the physical container | `Anchor`, `Anchorstone`, `Core`, `Crystalfocus` |

Two candidate lines remain (both UI-grouped under "Arcane" — L1518-1532):

1. **Anchorstone line:** `Arcane Anchorstone` (empty) → `Arcane Pure Anchorstone`, `Arcane Fire Anchorstone`, `Arcane Wind Anchorstone`, etc.
2. **Crystalfocus line:** `Arcane Crystalfocus` (empty) → `Arcane Pure Crystalfocus`, `Arcane Fire Crystalfocus`, etc.

Final selection `[TBD]` pending Anton.

## Why this format

NotebookLM walked through three rejected formats before landing here:

| Format | Example | Reason rejected |
| --- | --- | --- |
| `<magic type>-infused XXX` | "Wind-infused Anchor" | Scatters items alphabetically (E, F, W, …) across warehouse / trade UI — L1239 |
| `Charged XXX (<magic type>)` | "Charged Anchor (Wind)" | Parentheses feel like a developer debug tag, not medieval (L1245) |
| `Base, <variant>` comma syntax | "Aetheric Anchor, Wind-infused" | Vanilla resources do **not** use commas — that pattern is exclusive to **building parts** like "Rustic Gate, Minor" (L1266-1272) |

The `X <magic type> Y` format wins because:

- Every variation starts with the same `X` prefix → all empty and charged variants group together alphabetically in UI (L1287).
- Reads naturally; avoids clinical parentheses (L1289).
- Matches the existing 3-word Arcanum precedent: `Raw Aether Crystal` vs. `Faceted Aether Crystal` (L1291).

## UI sorting principle (load-bearing for the mod)

NotebookLM's L1550-1560 exchange locks a broader design principle that applies beyond just this resource family:

> In *Foundation*, prioritizing **UI sorting optimization and User Experience (UX) clarity is more important** than relying solely on thematic or "good" resource names.

Justifications cited:

- The **Lore Bindery → Aether Bindery rename** (L1554): "Lore Bindery" was thematically tempting but misleading because the workplace doesn't consume Arcane Lore — players would expect it to. Aether Bindery clearly signals the actual mechanics.
- Foundation's warehouse, granary, and trade-route UIs sort resources alphabetically; scattering related items across the alphabet creates frustrating logistics (L1556).
- The same principle drives the avoidance of 4-resource recipes — UI clutter penalty (L1556).

**Mod-wide implication:** any future resource family with variants should adopt the `X <modifier> Y` format. Phase 5 may introduce a vault-level naming convention note. `[TBD]`

## Modifier vocabulary (parked candidates)

Brainstormed but not locked. Most will be settled when each specialization-mod's "container infusion" workplace is designed.

**Core estate — unaligned / flavorless magic** (L1454-1496):

- Foundational / root angle: `Origin`, `Source`, `Root`, `Genesis`, `Prime` (note: avoid colliding with the Sorcerer-path "Prime Sorcerer" rank).
- Flavorless / unaligned angle: `Raw`, `Neutral`, `Unaligned`, `Clear`, `Stark`, `Pure`.
- Structural / foundational angle: `Essence`, `Ley`, `Formative`, `Fundamental`.
- Decorative-function angle: `Resonant` (humming with energy holding parts aloft), `Kinetic`, `Luminous`, `Astral`.

**Specialization paths** — the magic-type modifier is the specialization's elemental/thematic word (L1324-1368):

- Mage path: `Fire`, `Wind`, `Earth`, `Water` (one per elemental job).
- Paladin path: `Light` / `Holy` `[TBD]`.
- Druid path: `Nature` / `Life` / `Wild` `[TBD]`.
- Sorcerer path: `Chaos`, `Blood`, `Prime`, `Void`, `Surge`, etc. — multiple candidates surfaced; selection deferred to the Sorcerer-mod design pass.

## Open questions

- Pick the `X` `Y` pair: Anchorstone line or Crystalfocus line.
- Pick the unaligned-magic modifier for the core estate variant.
- Whether `X` should be `Arcane` (NotebookLM's recommendation for UI grouping under "A") or `Aetheric` / `Crystal` (Anton's earlier candidates).
- **Cross-mod consistency (Anton's stance 2026-06-05).** Charged Container resources should most likely use a **single** `X Y` line consistently across the core mod and all four expansion mods, with only the per-path modifier varying. The expansion-monument decorations brainstorm in [[dh-notebooklm-expansion-monument-decorations]] currently uses **both** lines — Paladin's T5 "Radiant Anchorstone" follows the Anchorstone line, while Sorcerer's T4 "Floating Blood-Crystal" follows the Crystal line. This discrepancy must be addressed: once the line is locked here, sweep every dh-notebooklm file that names a charged container and reconcile. Tracked in [[master-to-do]].

## Adjacent (non-charged-container) discussion in the same chat range

At L1371-1405 NotebookLM misunderstood Anton's question and brainstormed **alternative names for the existing `Arcane Lore` resource itself** (Arcane Praxis, Prime Arcana, Aetheric Theorem, Aetheric Method, Arcane Rite, Pure Arcana, Fundamental Aether, Arcane Principle, Arcane Precept). Anton corrected the misunderstanding at L1410 — he was asking about the *new* charged-container variant for the core estate, not renaming Arcane Lore. The Arcane Lore rename tangent is therefore not a charged-container decision, but the brainstormed alternatives are recorded in [[master-to-do]] as a parked-design item should Anton ever reopen the Arcane Lore name.

## Cross-links

- [[dh-notebooklm-artificer]] — the system that creates this resource family
- [[dh-core-economy]] — existing economy spec to extend with the new resource family
- [[arcane-lore]] — naming-precedent comparison (the existing core knowledge resource)
- [[aether-crystal]], [[faceted-aether-crystal]] — naming-precedent comparison (raw / processed pair)
- [[_notebooklm-chat-index]]
- [[_notebooklm-merge-plan]]

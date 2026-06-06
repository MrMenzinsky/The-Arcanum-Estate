---
title: Aethercourt Tech-Unlock Architecture Naming — Decision Log (NotebookLM)
tags:
  - design-history
  - notebooklm
  - core
  - monuments
  - naming
created: 2026-06-05
status: locked
sources:
  - notebooklm-conversation.md lines 1790-1993
  - "[[_notebooklm-chat-index]]"
---

# Aethercourt Tech-Unlock Architecture Naming — Decision Log (NotebookLM)

## Final state

The Aethercourt tech-tree unlock names follow the vanilla `[Monument Name] [Style Descriptor] Architecture` syntax, but use academic descriptors instead of vanilla's Rustic / Modest:

| Tier | Unlock name |
| --- | --- |
| Tier 2 | **Aethercourt Scholastic Architecture** |
| Tier 3 | **Aethercourt Arcane Architecture** |

The progression tells a thematic story: at T2 Aetherians are still bound by mortal academic methods (Scholastic = the rigorous medieval dialectical method); at T3 the architecture has transcended study and become infused with magic itself (L1987-1989, L1996).

Anton's lock at L1996: "let's lock in Scholastic -> Arcane for the tier 2 and 3 architecture unlocks."

The Scholastic prefix also propagates downstream to building-part names: it becomes the prefix for Tier 1 building parts themselves — see [[dh-notebooklm-tier1-room-parts]]. **Building-part prefix progression (locked 2026-06-05 by Anton):**

| Tier | Building-part prefix |
| --- | --- |
| Tier 1 | `Scholastic` |
| Tier 2 | `Scholastic` |
| Tier 3 (core mod) | `Arcane` |

The T2 unlock name (`Aethercourt Scholastic Architecture`) governs T2 part naming directly. The T3 unlock name (`Aethercourt Arcane Architecture`) governs T3+ core-mod part naming. Expansion-mod monuments will choose their own prefixes per their respective designs.

## Adjacent decision — Arcane Lyceum as its own Tier 2 unlock

At L1963 Anton states the Arcane Lyceum will be its own separate Tier 2 tech unlock, mirroring how the Clergy Estate has the **Rustic Cloister** and the Labor Estate has the **Tavern** as standalone T2 unlocks.

NotebookLM endorsed this at L1979-1983 on two grounds:

- **Vanilla synergy.** Matches the Rustic Cloister / Tavern pattern.
- **Need-pacing.** Since the Lyceum fulfills the unique Discourse need (see [[need-discourse]]), gating it behind a dedicated unlock forces the player to choose when their estate is ready to consume high-level services.

This new framing — "its own Tier 2 unlock" — is **consistent with both readings of the Arcane Lyceum pivot** (free-standing monument vs Aethercourt sub-building). A standalone tech unlock does not, on its own, settle the structural placement question. Per the merge plan's Decision 8, this dh-file preserves both readings.

## Rejected alternatives (with reasoning)

NotebookLM brainstormed five thematic pairings before Scholastic → Arcane was chosen. Recorded here as paper trail.

| Tier 2 → Tier 3 candidate | Family | Notes |
| --- | --- | --- |
| `Aethercourt Rustic Architecture` → `Aethercourt Modest Architecture` | Vanilla mirror | Rejected at L1829 — Anton wanted "my own voice" rather than the default vanilla naming. |
| `Aethercourt Campus Architecture` → `Aethercourt Collegiate Architecture` | Academic Scale | Anton initially leaned this way at L1888 but moved on to Scholastic at L1961. |
| `Aethercourt Scholastic Architecture` → `Aethercourt Magister Architecture` | Medieval University | Anton's initial Scholastic candidate; rejected because Magister focuses on the person teaching rather than the architecture (L1971). |
| `Aethercourt Scholastic Architecture` → `Aethercourt Erudite Architecture` | NotebookLM's alternative to Magister | Strong runner-up. Anton ultimately chose Arcane over Erudite for stronger fantasy transition (L1987, L1993). |
| `Aethercourt Trivium Architecture` → `Aethercourt Quadrivium Architecture` | Classical Curriculum | Considered; not chosen. |
| `Aethercourt Philosophic Architecture` → `Aethercourt Empirical Architecture` | Natural Philosophy | Considered; not chosen. |
| `Aethercourt Hermetic Architecture` → `Aethercourt Alchemical Architecture` | Hermetic / Alchemical | Considered; not chosen. |
| `Aethercourt Lyceum Architecture` → `Aethercourt Collegium Architecture` | Reusing established terms | Collides with the Arcane Lyceum sub-building name (L1948-1952). Rejected on naming-collision grounds. |
| `Awakened Aethercourt Architecture` → `Ascendant Aethercourt Architecture` | Magical Awakening | NotebookLM's "fantasy" angle. Not chosen. |
| `Formative Aethercourt Architecture` → `Refined / Faceted Aethercourt Architecture` | Structural Refinement | Tied to Lapidary chain but not chosen. |
| `Esoteric Aethercourt Architecture` → `Enlightened Aethercourt Architecture` | Arcanum Mystery | Not chosen. |
| `Aethercourt Arcanistic Architecture` | Anton's musing | Explicitly rejected at L1991 — clunky, manufactured-sounding. Use **Arcane** (clean and authoritative). |

## Open questions

- Whether Tier 1 unlock has its own architecture name. Vanilla T1 is just "the estate unlock itself" with no architecture name (L1792). Probably nothing to do here.

## Implications for existing vault notes

- [[the-aethercourt]] — needs a "Tech-unlock progression" section reflecting Scholastic / Arcane.
- [[arcane-lyceum]] — needs the "own Tier 2 unlock" framing recorded. Pivot status remains open.
- [[dh-arcane-lyceum]] — should be updated with a NotebookLM-additions section noting the standalone-T2-unlock framing.
- [[dh-notebooklm-tier1-room-parts]] — directly downstream; Tier 1 parts use the locked Scholastic prefix.

## Cross-links

- [[dh-notebooklm-tier1-room-parts]] — Tier 1 parts that use the Scholastic prefix
- [[dh-arcane-lyceum]] — existing Lyceum design history
- [[dh-the-aethercourt]] — existing Aethercourt design history
- [[the-aethercourt]]
- [[arcane-lyceum]]
- [[need-discourse]]
- [[_notebooklm-chat-index]]
- [[_notebooklm-merge-plan]]

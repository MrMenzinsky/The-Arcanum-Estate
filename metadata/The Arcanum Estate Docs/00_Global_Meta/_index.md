---
title: Map of Content — The Arcanum Estate
tags:
  - meta
  - moc
  - index
created: 2026-06-04
status: living-document
---

# Map of Content — The Arcanum Estate

Vault navigation hub. Every note in the vault should be reachable from here.

This vault documents the design of **The Arcanum Estate** — a fourth-estate mod for the city-builder *Foundation*. Built as **one core mod + four optional expansion mods**. See [[project-brief]] for the high-level overview.

---

## Start here

- [[project-brief]] — high-level overview, tech stack, current focus
- [[master-to-do]] — what's open, what's in scope, what's deferred
- [[abandoned-ideas]] — what was tried and rejected; don't revisit
- [[dependency-logic]] — how the five mods relate
- [[foundation-aesthetic-reference]] — vanilla Foundation visual language
- [[_chat-index]] — line-range map of the original Gemini chat
- [[_pass-3-plan]] — Pass 3 composition checklist (this work session's tracker)

---

## 01 — Core Arcanum mod (required)

The base mod. Everything else builds on this.

- [[estate-identity]] — who and what the Arcanum Estate is
- [[the-aethercourt]] — the Tier-1/2 core monument
- [[core-buildings]] — Aethercourt sub-buildings (Academy, Annex, Aetherium, Lapidary, Archive, Aether Hold, Arcane Lyceum)
- [[arcane-lyceum]] — standalone note for the architectural set-piece T3 building
- [[aetherian-progression]] — Aspirant → Arcanist → Loremaster
- [[core-economy]] — Glyph, Arcane Lore, Aether Crystal, Faceted Aether Crystal
- [[need-discourse]] — the custom T2+ need
- [[aether-envoy]] — external-affairs role + Grand Council

## 02 — Citadel of Light (Paladin expansion)

- [[paladin-design]] — specialization design and rank ladder
- [[citadel-of-light]] — the Tier-3 monument
- [[military-workplaces]] — Sanctum + Divine Forge + (TBD) military training workplace

## 03 — Sacred Grove (Druid expansion)

- [[druid-design]] — specialization design and rank ladder
- [[sacred-grove]] — the Tier-3 monument (originally a sub-building, promoted)

## 04 — Bloodforged Spire (Sorcerer expansion)

- [[sorcerer-design]] — specialization design and rank ladder
- [[bloodforged-spire]] — the Tier-3 monument (note: Sorcerer has no Aethercourt sub-building by design)

## 05 — Atheneum Tower (Mage expansion)

- [[mage-design]] — specialization design, rank ladder, and the four elemental jobs
- [[atheneum-tower]] — the Tier-3 monument (originally "Aether Tower" sub-building; abandoned and replaced)

---

## Design history (paper trail)

25 decision-log files in `00_Global_Meta/design-history/`. These capture the iteration process from the original Gemini chat — alternatives considered, why they were rejected, line citations into the raw chat. Each final note above cites its design-history sources in frontmatter.

Organized roughly by topic:

### Core mod
- [[dh-estate-identity]], [[dh-the-aethercourt]], [[dh-core-buildings]], [[dh-core-economy]]
- [[dh-aetherian-progression]], [[dh-aspirant-arcanist-jobs]], [[dh-loremaster-tier-3]]
- [[dh-arcane-lyceum]], [[dh-discourse-need]], [[dh-aether-envoy]]
- [[dh-foundation-aesthetic-reference]]

### Architecture
- [[dh-monument-architecture]] — the five-monument structural decision
- [[dh-sub-building-renames]] — Sacred Grove, Sanctum, Aether Tower promotion history
- [[dh-sorcerer-subbuilding-abandoned]] — why there's no Sorcerer sub-building in the Aethercourt

### Expansion mods
- Paladin: [[dh-paladin-ranks]], [[dh-paladin-workplaces]], [[dh-citadel-of-light]]
- Druid: [[dh-druid-ranks]], [[dh-sacred-grove]]
- Sorcerer: [[dh-sorcerer-ranks]], [[dh-bloodforged-spire]]
- Mage: [[dh-mage-ranks]], [[dh-mage-path-jobs]], [[dh-atheneum-tower]]

### Reference (pending validation)
- [[dh-mermaid-master-diagram-source]] — verbatim copy of Gemini's end-of-chat Mermaid diagram. **Treated as a paper-trail artifact, not a source of truth.** Validation against the written design is an open task; see [[master-to-do]].

---

## Conventions

- **Filenames:** lowercase-kebab-case. Folders use the numeric `NN_Mod_Name/` prefix to maintain visual order.
- **Frontmatter:** every note has `title`, `tags`, `created`, `status`, `sources`. Expansion notes also carry `status: planned`.
- **Wikilinks:** bare `[[note]]` for final notes; `[[dh-note]]` for design-history references. The `dh-` prefix is the disambiguation convention to avoid filename collisions.
- **`[TBD]`:** anything genuinely undecided is marked with this. Open items also live in [[master-to-do]] as actionable bullets.
- **Vault editing guidelines:** see [[obsidian-ai-editing-guidelines]] for rules the AI follows when editing notes directly on disk.

## Cross-vault notes

- The original Gemini chat lives at `metadata/Docs/Foundation-The-Arcanum-Estate-gemini-conversation.md`. Pass 4 of the parsing work will Obsidianify it (neutralize active wikilink/tag syntax) and move it to `00_Global_Meta/_raw/`. Tracked in [[master-to-do]].
- NotebookLM design snippets (additional source material flagged by Anton) are still to be incorporated. Tracked in [[master-to-do]].

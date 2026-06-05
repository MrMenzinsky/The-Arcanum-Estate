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
- [[monument-architecture]] — the five-monument structural decision
- [[3d-modeling-pipeline]] — Blender → FBX → game asset workflow notes
- [[foundation-aesthetic-reference]] — vanilla Foundation visual language
- [[_chat-index]] — line-range map of the original Gemini chat
- [[_notebooklm-merge-plan]] — plan for merging NotebookLM exports into the vault

---

## 01 — Core Arcanum mod (required)

The base mod. Organized into subfolders by entity type.

### Root-level overview notes

- [[estate-identity]] — who and what the Arcanum Estate is
- [[aetherian]] — collective term for Arcanum Estate villagers (stub)
- [[aetherian-progression]] — Aspirant → Arcanist → Loremaster
- [[core-buildings]] — Aethercourt sub-buildings overview (Academy, Aetherium, Lapidary, Annex, Archive, Aether Hold; Arcane Lyceum pivot open)
- [[core-economy]] — Glyph, Arcane Lore, Aether Crystal, Faceted Aether Crystal
- [[need-discourse]] — the custom T2+ need
- [[aether-envoy]] — external-affairs role (also exists as job; see below)
- [[external-quests]] — Grand Council quest delivery (stub)
- [[specialist-paths]] — links from Arcanist into the four expansion specializations (stub)

### `00_Monuments/`

- [[the-aethercourt]] — the Tier-1/2 core monument
- [[arcane-lyceum]] — T3 architectural set-piece (monument-vs-sub-building pivot still open)

### `01_Buildings/`

- [[academy]]
- [[aetherium]]
- [[lapidary]]
- [[aether-crystal-mining-camp]]

### `02_Villager_Statuses/`

- [[aspirant]]
- [[arcanist]]
- [[loremaster]]

### `03_Villager_Jobs/`

- [[scholar]]
- [[caster]]
- [[lapidarist]]
- [[aether-envoy]] (the job; same name as the role note above)

### `04_Resources/`

- [[aether-crystal]]
- [[glyph]]
- [[faceted-aether-crystal]]
- [[arcane-lore]]
- [[lecture-service]]

### `05_Grand_Council/`

- [[_grand-council]] — front-door overview
- [[arch-seer]]

## 02 — Citadel of Light (Paladin expansion)

- [[paladin-design]] — specialization design and rank ladder
- [[citadel-of-light]] — the Tier-3 monument
- [[military-workplaces]] — Sanctum + Divine Forge + (TBD) military training workplace
- [[sanctum]] — Paladin sub-building (relocated from Aethercourt to Citadel of Light)
- [[divine-seal]]
- [[reliquary-smith]]

## 03 — Sacred Grove (Druid expansion)

- [[druid-design]] — specialization design and rank ladder
- [[sacred-grove]] — the Tier-3 monument (originally a sub-building, promoted)

## 04 — Bloodforged Spire (Sorcerer expansion)

- [[sorcerer-design]] — specialization design and rank ladder
- [[bloodforged-spire]] — the Tier-3 monument (note: Sorcerer has no Aethercourt sub-building by design)

## 05 — Atheneum Tower (Mage expansion)

- [[mage-design]] — specialization design, rank ladder, and the four elemental jobs
- [[atheneum-tower]] — the Tier-3 monument (originally "Aether Tower" sub-building; abandoned and replaced)
- [[mage]] — collective term for Mage-path villagers
- [[arch-mage]] — top-rank Mage status
- [[flame-forger]], [[mist-maker]], [[stone-shaper]], [[wind-weaver]] — the four elemental jobs

---

## Design history (paper trail)

25 decision-log files in `00_Global_Meta/design-history/`. These capture the iteration process from the original Gemini chat — alternatives considered, why they were rejected, line citations into the raw chat. Each final note above cites its design-history sources in frontmatter.

NotebookLM-derived design-history files (added during the NotebookLM merge) use the `dh-notebooklm-<topic>.md` prefix to keep them visually distinct from Gemini-derived ones; they live flat in the same folder.

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

### Reference (paper trail only)
- [[dh-mermaid-master-diagram-source]] — verbatim copy of Gemini's end-of-chat Mermaid diagram. Closed 2026-06-04 without repair; kept as a historical snapshot. Obsidian's graph view replaces it.

---

## Archive

- `Archive/` — abandoned drafts kept only for paper trail (e.g. `aether-tower.md`, `formulas.md`). Do not cite as authoritative.

---

## Completed plans

- [[_pass-3-plan]] — Pass 3 composition checklist (✓ complete 2026-06-04)
- [[_pass-4-progress]] — Pass 4 Obsidianify-raw-chat plan (✓ complete 2026-06-04)

---

## Conventions

- **Filenames:** lowercase-kebab-case. Folders use the numeric `NN_Mod_Name/` prefix to maintain visual order.
- **Core mod subfolders:** organized by entity type (`00_Monuments`, `01_Buildings`, `02_Villager_Statuses`, `03_Villager_Jobs`, `04_Resources`, `05_Grand_Council`). Expansion mods are flat for now.
- **Frontmatter:** every note has `title`, `tags`, `created`, `status`, `sources`. Expansion notes also carry `status: planned`.
- **Wikilinks:** bare `[[note]]` for final notes; `[[dh-note]]` for design-history references. The `dh-` prefix is the disambiguation convention to avoid filename collisions. NotebookLM-derived design-history files use `[[dh-notebooklm-<topic>]]`.
- **`[TBD]`:** anything genuinely undecided is marked with this. Open items also live in [[master-to-do]] as actionable bullets.
- **Vault editing guidelines:** see [[obsidian-ai-editing-guidelines]] for rules the AI follows when editing notes directly on disk.

## Cross-vault notes

- The original Gemini chat lives at `00_Global_Meta/_raw/gemini-conversation.md` (the only copy; the prior `metadata/Docs/` copy has been deleted).
- `metadata/Docs/` is now the staging area for four NotebookLM source files (chat, report, two saved-response notes) awaiting merge. See [[_notebooklm-merge-plan]]. After the merge they will be renamed and moved to `00_Global_Meta/_raw/`.

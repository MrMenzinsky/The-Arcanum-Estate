---
title: Pass 3 — Execution Plan
tags:
  - meta
  - plan
created: 2026-06-04
status: draft
---

# Pass 3 — Execution Plan

Compose the final Obsidian vault notes from the 25 decision-log files in `design-history/`. Each subtask below is **atomic** — one file, no dependencies on running memory. If a session cutoff hits mid-Pass-3, only one task's work is lost.

Subtasks are ordered by priority. Core Arcanum (in-scope work) ships first, expansions last, MOC absolute last.

**File-naming convention:** lowercase-kebab-case throughout.
**Frontmatter convention:** every note has `title`, `tags`, `created: 2026-06-04`, `status`, `sources` (array). Expansion notes also have `status: planned`.
**Wikilink discipline:** wikilinks may point to not-yet-written notes — those are valid forward-references.

---

## Group 1 — Foundation files (00_Global_Meta)

3 tasks. Small. Done first because they bootstrap the structure.

- [x] **1.1** Write `00_Global_Meta/project-brief.md` — copy the existing `metadata/Docs/Project-brief.md`, add Obsidian frontmatter, convert any path references to wikilinks where notes will exist. ✓ 2026-06-04
- [x] **1.2** Write `00_Global_Meta/master-to-do.md` — TWO sections: "In scope (Core Arcanum)" and "Out of scope (expansion mods)". Pull TODOs from `_chat-index.md` + project brief. ✓ 2026-06-04
- [x] **1.3** Write `00_Global_Meta/dependency-logic.md` — Lua-based dependency-enforcement note. Sourced from parsing-instructions intent; chat has little on this. Mark as `[TBD]` where the Lua API specifics are unknown. ✓ 2026-06-04

## Group 2 — Core Arcanum mod notes (01_Mod_Core_Arcanum)

7 tasks. In-scope. Highest value.

- [x] **2.1** `01_Mod_Core_Arcanum/estate-identity.md` ← sources `design-history/estate-identity.md` ✓ 2026-06-04
- [x] **2.2** `01_Mod_Core_Arcanum/the-aethercourt.md` ← sources `design-history/the-aethercourt.md`, `monument-architecture.md`, `aether-envoy.md` ✓ 2026-06-04
- [x] **2.3** `01_Mod_Core_Arcanum/core-buildings.md` ← sources `design-history/core-buildings.md`, `arcane-lyceum.md`, `sub-building-renames.md`, `sorcerer-subbuilding-abandoned.md` ✓ 2026-06-04
- [x] **2.4** `01_Mod_Core_Arcanum/aetherian-progression.md` ← sources `design-history/aetherian-progression.md`, `loremaster-tier-3.md`, `aspirant-arcanist-jobs.md` ✓ 2026-06-04
- [x] **2.5** `01_Mod_Core_Arcanum/core-economy.md` ← sources `design-history/core-economy.md` ✓ 2026-06-04
- [x] **2.6** `01_Mod_Core_Arcanum/need-discourse.md` ← sources `design-history/discourse-need.md`, `loremaster-tier-3.md` ✓ 2026-06-04
- [x] **2.7** `01_Mod_Core_Arcanum/aether-envoy.md` ← sources `design-history/aether-envoy.md` ✓ 2026-06-04

## Group 3 — Standalone Core notes (added value, not in parsing instructions)

2 tasks. Worth doing because the chat content justifies them.

- [x] **3.1** `01_Mod_Core_Arcanum/arcane-lyceum.md` ← sources `design-history/arcane-lyceum.md` (architectural vision: Pantheon dome + amphitheater + icosahedron roof — this is referenced in 3D modeling work, deserves its own note) ✓ 2026-06-04
- [x] **3.2** `00_Global_Meta/abandoned-ideas.md` ← sources `design-history/sorcerer-subbuilding-abandoned.md`, `sub-building-renames.md` (and any other abandoned/superseded ideas) ✓ 2026-06-04

## Group 4 — Reference notes

1 task. Useful but lowest priority within in-scope work.

- [x] **4.1** `00_Global_Meta/foundation-aesthetic-reference.md` ← sources `design-history/foundation-aesthetic-reference.md` ✓ 2026-06-04

## Group 5 — Expansion mods (out of scope, but design captured)

9 tasks. Lower priority than Core. Each gets `status: planned` in frontmatter.

### 5A — Citadel of Light (Paladin)
- [x] **5.1** `02_Mod_Citadel_of_Light/paladin-design.md` ← sources `design-history/paladin-ranks.md`, `paladin-workplaces.md` ✓ 2026-06-04
- [x] **5.2** `02_Mod_Citadel_of_Light/citadel-of-light.md` ← sources `design-history/citadel-of-light.md` ✓ 2026-06-04
- [x] **5.3** `02_Mod_Citadel_of_Light/military-workplaces.md` ← sources `design-history/paladin-workplaces.md` (Sanctum + Divine Forge + deferred military training workplace) ✓ 2026-06-04

### 5B — Sacred Grove (Druid)
- [x] **5.4** `03_Mod_Sacred_Grove/druid-design.md` ← sources `design-history/druid-ranks.md` ✓ 2026-06-04
- [x] **5.5** `03_Mod_Sacred_Grove/sacred-grove.md` ← sources `design-history/sacred-grove.md` ✓ 2026-06-04

### 5C — Bloodforged Spire (Sorcerer)
- [x] **5.6** `04_Mod_Bloodforged_Spire/sorcerer-design.md` ← sources `design-history/sorcerer-ranks.md` ✓ 2026-06-04
- [x] **5.7** `04_Mod_Bloodforged_Spire/bloodforged-spire.md` ← sources `design-history/bloodforged-spire.md` ✓ 2026-06-04

### 5D — Atheneum Tower (Mage)
- [x] **5.8** `05_Mod_Atheneum_Tower/mage-design.md` ← sources `design-history/mage-ranks.md`, `mage-path-jobs.md` ✓ 2026-06-04
- [x] **5.9** `05_Mod_Atheneum_Tower/atheneum-tower.md` ← sources `design-history/atheneum-tower.md` ✓ 2026-06-04

## Group 6 — Map of Content (absolute last)

1 task. Needs everything else to exist.

- [x] **6.1** `00_Global_Meta/_index.md` — Map of Content with wikilinks to every note in every folder. Becomes the navigation hub. ✓ 2026-06-04

---

## Total: 23 atomic subtasks

**Resumability rule:** every task writes exactly one file. If the session dies mid-task, that one file is lost; re-running the task is safe. Already-completed tasks are not affected.

**Voice + format for every Pass 3 note:**

- Synthesized into Anton's terse design-doc voice (per Pass 2 voice choice)
- Frontmatter on line 1, lowercase-kebab-case throughout
- Cross-links via `[[wikilink]]` — forward-references are allowed
- `sources:` array lists which `design-history/*.md` files informed the note (NOT raw chat lines — those are already cited inside design-history)
- For expansion notes: `status: planned`
- For Core notes: `status: design-locked` or `design-iterating` as appropriate
- Mark anything genuinely undecided with `[TBD]` (no bracketed verbiage otherwise)
- Preserve any Mermaid blocks verbatim — but only if they appear in design-history. We are NOT regenerating diagrams.

**What I am NOT doing in Pass 3:**

- Not reading the raw 5414-line chat. Everything sources from design-history.
- Not validating the master Mermaid diagram (that's task #8, separate verification).
- Not editing the raw chat file (that's Pass 4).

---

## Progress tracker

Tick boxes above as tasks complete. This file is the source of truth for "what's done in Pass 3".

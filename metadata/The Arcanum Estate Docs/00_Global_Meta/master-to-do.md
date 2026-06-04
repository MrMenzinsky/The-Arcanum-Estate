---
title: Master To-Do
tags:
  - meta
  - todo
created: 2026-06-04
status: living-document
sources:
  - "[[project-brief]]"
  - "[[_chat-index]]"
  - "[[dh-paladin-workplaces]]"
---

# Master To-Do

Two sections: in-scope work for the Core Arcanum mod, and design-captured-but-deferred items for the expansion mods. Tick items as they complete; move stale ones to a "Done" subsection or strike through.

## In scope — Core Arcanum mod

### Design

- [ ] **UI internal symbol** for the Arcanum Estate heraldry shield. Heraldry shape and color are locked (see [[estate-identity]]); the internal symbol is open. (From [[project-brief]].)

### 3D modeling / asset pipeline

- [ ] Finish the **first building part** (Blender) with working **LODs** and **textures** in-game. Currently blocked on Blender .fbx export quirks — partial LOD breakage suspected to be export-pipeline issues, not Blender source. (From [[project-brief]].)
- [ ] Model all remaining **Aethercourt sub-building parts**, texture, and verify in-game. (From [[project-brief]].)
- [ ] Architectural execution of the [[arcane-lyceum]]: Pantheon-style dome + amphitheater + icosahedron roof parts. Design is locked; modeling is open.

### Lua / code

- [ ] Implement the **core monument and its sub-buildings** in Lua (Aethercourt + Academy, Aetherium, Lapidary, Annex, Archive, Aether Hold, Arcane Lyceum, Sanctum — see [[core-buildings]]).
- [ ] Implement **unit progression** (Aspirant → Arcanist → Loremaster — see [[aetherian-progression]]).
- [ ] Implement **resource economy** (Aether Crystal, Glyph, Faceted Aether Crystal, Arcane Lore — see [[core-economy]]).
- [ ] Implement the **Discourse** Need for T2+ Aetherians (replaces Entertainment; fulfilled at Arcane Lyceum by Loremasters — see [[need-discourse]]).
- [ ] Implement the **Aether Envoy** external-affairs role and its tie to the **Grand Council** quest authority (see [[aether-envoy]]).

### Documentation / vault hygiene

- [x] Run **Pass 4** (Obsidianify raw Gemini chat) and move the resulting file into `00_Global_Meta/_raw/`. ✓ 2026-06-04 — no content transformation needed; raw chat had zero active Obsidian syntax. File copied byte-identical to `00_Global_Meta/_raw/gemini-conversation.md`; original preserved at `metadata/Docs/`. See [[_pass-4-progress]].
- [x] Validate the **master Mermaid diagram** at `design-history/dh-mermaid-master-diagram-source.md` against the written design notes; fix or replace. ✓ 2026-06-04 — **closed without repair.** The Gemini-generated diagram has Mermaid syntax errors and tries to show everything in one 74-line block. All its information is now in the structured notes, and Obsidian's graph view provides a live equivalent. The block is kept in design-history as a historical snapshot only. See the callout in [[dh-mermaid-master-diagram-source]] for full rationale.
- [ ] Programmatic vault check: all wikilinks resolve, frontmatter parses, no orphan notes outside the MOC.
- [ ] Incorporate **NotebookLM** material — 4 files now in `metadata/Docs/` (conversation 2412 lines, report 191 lines, two saved-response notes). Merge plan drafted in [[_notebooklm-merge-plan]] for a future session.

## Out of scope — Expansion mods (design captured, work deferred)

These are documented in `02_Mod_*` through `05_Mod_*` folders. No implementation work happens here until the Core Arcanum mod is shipped. Items are listed so design intent isn't lost.

### Paladin (Citadel of Light)

- [ ] Decide the **military training workplace** name — deferred during the Gemini chat at lines 4869-4905. See [[dh-paladin-workplaces]].
- [ ] Confirm or replace **Reliquary Smith** as the Divine Forge job name (currently marked `[tentative]` — Gemini hedged it as "or similar"; never explicitly locked by Anton). See [[dh-paladin-workplaces]].
- [ ] Work professions for the **Hall of Arms** sub-building (preliminary names: Aether Guard, Vow Keeper — never locked).

### Druid (Sacred Grove)

- [ ] **Tier-3 work buildings and professions** inside the Sacred Grove monument. Monument name is locked; interior is unspecified. See [[druid-design]].
- [ ] The **Evertree** / **Heartwood** signature tree-building inside the Sacred Grove (reserved names; design not started). See [[_sacred-grove]].

### Sorcerer (Bloodforged Spire)

- [ ] **Tier-3 work buildings and professions** inside the Bloodforged Spire. Monument name is locked; interior is unspecified. See [[sorcerer-design]].
- [ ] **Ritual Grounds** sub-building (reserved name; design not started). See [[_bloodforged-spire]].

### Mage (Atheneum Tower)

- [ ] **Tier-3 work buildings and professions** inside the Atheneum Tower. Monument name is locked; interior is unspecified. See [[mage-design]].

## Notes

- Status tracking lives here; per-area design history lives in `design-history/`.
- When something here resolves, link to the commit / PR / file path in the bullet so the audit trail is intact.
- Project-level priorities and tech-stack notes live in [[project-brief]].

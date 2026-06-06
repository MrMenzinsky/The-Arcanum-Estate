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
- [ ] **Decoration naming convention** — pick one of three candidate patterns: (a) the core-mod building-part progression (`Scholastic` T1/T2, `Arcane` T3+), (b) vanilla Common-tech-tree decoration unlock naming, or (c) any vanilla estate's tech-tree decoration unlock naming. Affects every decoration name across all 5 monuments. See [[aethercourt-decorations]] and the per-expansion decoration notes.

### 3D modeling / asset pipeline

- [ ] Finish the **first building part** (Blender) with working **LODs** and **textures** in-game. Currently blocked on Blender .fbx export quirks — partial LOD breakage suspected to be export-pipeline issues, not Blender source. (From [[project-brief]].)
- [ ] Model all remaining **Aethercourt sub-building parts**, texture, and verify in-game. (From [[project-brief]].)
- [ ] Architectural execution of the [[arcane-lyceum]]: Pantheon-style dome + amphitheater + icosahedron roof parts. Design is locked; modeling is open.

### Lua / code

- [ ] Implement the **core monument and its sub-buildings** in Lua (Aethercourt + Academy, Annex, Aetherium, Lapidary, Archive, Aether Hold, Arcane Lyceum, plus the post-NotebookLM additions: [[aether-bloom-garden|Aether Bloom Garden]] T1, [[arcane-weaver|Arcane Weaver]] T2, [[apothecary|Apothecary]] T2, [[rune-crafter|Rune Crafter]] T3, [[artificer|Artificer]] T3, [[aether-bindery|Aether Bindery]] T4 — see [[core-buildings]]). Sanctum has been relocated to the Paladin monument [[citadel-of-light]] and is out of Core scope.
- [ ] Implement **unit progression** (Aspirant → Arcanist → Loremaster — see [[aetherian-progression]]).
- [ ] Implement **work professions**: [[scholar]] (Aspirant), [[caster]] / [[lapidarist]] (Arcanist), [[aether-envoy]], [[tomebinder]] (Loremaster secondary, at the Aether Bindery), [[arcane-weaver]] + [[artificer]] (Labor-Estate Serf/Commoner workforce), [[rune-crafter]] (workforce `[TBD]`), plus the Apothecary worker (job name `[TBD]`). See [[aetherian-progression]].
- [ ] Implement **resource economy** — base loop (Aether Crystal, Glyph, Faceted Aether Crystal, Arcane Lore, [[lecture-service|Lecture Service]]) plus the NotebookLM additions: [[aether-crystal-dust|Aether Crystal Dust]] byproduct, [[aether-bloom|Aether Bloom]], inter-estate goods ([[scholar-vestments|Scholar's Vestments]], [[aetherial-elixir|Aetherial Elixir]], [[runic-talisman|Runic Talisman]]), [[enchanted-tome|Enchanted Tome]] trade good, and the [[arcane-anchorstone|charged-container family]] (empty + 8 charged variants). See [[core-economy]].
- [ ] Implement the **Discourse** Need for T2+ Aetherians (replaces Entertainment; fulfilled at Arcane Lyceum by Loremasters — see [[need-discourse]]).
- [ ] Implement the **Aether Envoy** external-affairs role and its tie to the **Grand Council** quest authority (see [[aether-envoy]]).
- [ ] **Verify Apiary / Beekeeper dual-output behavior** — read the vanilla Lua to confirm both the `COMP_WORKPLACE` dual-resource mechanic and the "storage full does not block the other output" behavior. Pattern the Lapidary off it (Faceted Aether Crystals primary + Aether Crystal Dust byproduct). See [[dh-notebooklm-mod-api-reference]] and [[dh-notebooklm-inter-estate-goods]].
- [ ] **Define a consistent emissive vertex-color / HDR-RGBA treatment** for all decorations the design describes as "glowing", "luminous", or "shining" (Floating Arcane Rune, Vigilant's Brazier, Luminous Fungi Cluster, Bound-Spirit Lantern, Radiant Anchorstone, Ancient Evertree Sapling, Primal Monolith, Supreme Binding Obelisk, etc.). One sweep-pass to lock the emissive design language so the look reads as one estate, not per-asset improv. Required because the modding API forbids custom light sources. See [[dh-notebooklm-aesthetic-corrections]] and [[dh-notebooklm-mod-api-reference]].
- [ ] **Diagnose the LOD blocker** on the first Aethercourt building part — determine whether the issue is on the Blender .fbx export side or on the engine's `registerAssetProcessor` LOD-transition side. See [[3d-modeling-pipeline]] and [[dh-notebooklm-mod-api-reference]].

### Documentation / vault hygiene

- [x] Run **Pass 4** (Obsidianify raw Gemini chat) and move the resulting file into `00_Global_Meta/_raw/`. ✓ 2026-06-04 — no content transformation needed; raw chat had zero active Obsidian syntax. File copied byte-identical to `00_Global_Meta/_raw/gemini-conversation.md`. Source file at `metadata/Docs/` has since been deleted; `_raw/` copy is now the sole canonical location. See [[_pass-4-progress]].
- [x] Validate the **master Mermaid diagram** at `design-history/dh-mermaid-master-diagram-source.md` against the written design notes; fix or replace. ✓ 2026-06-04 — **closed without repair.** The Gemini-generated diagram has Mermaid syntax errors and tries to show everything in one 74-line block. All its information is now in the structured notes, and Obsidian's graph view provides a live equivalent. The block is kept in design-history as a historical snapshot only. See the callout in [[dh-mermaid-master-diagram-source]] for full rationale.
- [x] Programmatic vault check: all wikilinks resolve, frontmatter parses, no orphan notes outside the MOC. ✓ 2026-06-06 — done as NotebookLM-merge Phase 7. 1,523 wikilinks scanned, 7 genuine breaks fixed, 0 frontmatter parse errors, 0 MOC orphans across 136 vault files. See [[_notebooklm-merge-plan#Phase 7 — Verification|Phase 7 results]].
- [x] Incorporate **NotebookLM** material — 4 files in `metadata/Docs/`. ✓ **All 7 phases complete 2026-06-05 → 2026-06-06.** See [[_notebooklm-merge-plan]] for the full log. Merge produced ~38 new files (10 dh-notebooklm + 1 chat-index + 14 building/job/resource stubs + 5 decoration notes + 3 audit-fix building stubs + 1 mod-API reference + 4 archived raw sources) plus ~30 updates to existing notes; new `06_Decorations/` subfolder; zero unresolved contradictions; 1,523 wikilinks all resolving; zero MOC orphans. Anton-owned cleanup of the now-redundant originals in `metadata/Docs/` deferred separately.

### Forgotten / parked items from the NotebookLM merge (Anton to adjudicate)

Captured during Phase 4 reconciliation. Each item was raised in the NotebookLM chat but not explicitly locked before the conversation moved on. Decision deferred to Anton; no vault content acts on these until resolved.

**Resources mentioned but never returned to:**
- **Aether Crystal Dust** — Lapidary byproduct surfaced in the NotebookLM report (L103) and used as an input for Scholar's Vestments / Arcane Weaver (L1147). Status: implicitly accepted by Anton (referenced in Cluster 1 Artificer Weaver mirror) but the resource itself has no dedicated note.
- **Aether Lamps** — original Artificer product, orphaned by the Artificer pivot. Three options surfaced (drop / move workplace / extension sub-building); pick one. See [[dh-notebooklm-artificer]].
- **Arcane Ink, Blank Vellum** — proposed at NotebookLM L388-451 as inter-estate-goods inputs feeding Enchanted Tomes. Status before the Tome lock at L609 dropped them in favor of Glyphs + Planks + Faceted Crystals. Likely abandoned but not explicitly rejected.

**Buildings / sub-buildings mentioned but unresolved:**
- **Aether Crystal Mine (T2) — separate building or upgrade?** At L1217 Anton's framing was "surface nodes for T1 Mining Camp, prospecting nodes for **mines** that unlock at T2" — mirroring vanilla's two-building Stonecutter-Camp → Quarry split. The T2 building was never explicitly named. Decide: (a) create a separate **Aether Crystal Mine** (or **Quarry** / **Deep Mine**) T2 building file, or (b) treat the T2 prospecting as an upgrade to the existing T1 [[aether-crystal-mining-camp|Aether Crystal Mining Camp]]. See [[dh-notebooklm-artificer]].
- **Aether Bloom Garden** — sub-building category for cultivating Aether Blooms. Anton at L445: "similar to the Monastery herb and berry garden sub-buildings." Tier not explicitly stated; Monastery analogy implies **T1 planters + Garden Hut → T2 Apothecary consumption**. Confirm tier and unique-naming pass needed (the L1660-1668 names use the "Aether Bloom Planter, Square / Round / Trellis" + "Aether Bloom Garden Hut" syntax but the Tier 1 unique-naming exercise hadn't reached this category before the chat moved on).
- **Arcane Conservatory / Moon-well** — early names for the Aether Bloom gathering building at NotebookLM L402-408. Superseded by the modular planter-bed framing at L468-474; presumably rejected, but not explicitly.
- **Apothecary** — Tier 2 sub-building locked across multiple references (L470-474, L1153, L1198, L2149). Needs a vault note in `01_Mod_Core_Arcanum/01_Buildings/`. Job for the Apothecary itself was never named (Anton just called it "the Apothecary worker") — likely needs an explicit job name in `03_Villager_Jobs/`.
- **Tier 2 building-part category — Gallery.** At L2053 Anton said: save Gallery for the T2 unlock. So a `Scholastic Gallery` part will likely exist at T2. No T2 part list yet.
- **Custom T1 categories beyond Aether Bloom Garden.** Anton's instruction at L1671 reset the unique-naming work to the Room category only. Doors / Monument Decorations / Estate Decorations all still need a unique-naming pass.

**Jobs / professions surfaced but unfinalized:**
- **Apothecary worker** (job name).
- **Loremaster's Lyceum job name** — Loremaster is a status (T3). At the Aether Bindery the job is **Tomebinder**. At the Arcane Lyceum the chat never assigned a separate job name; "Loremaster" is used for both status and job. Decide: keep Loremaster as both status and Lyceum job (precedented by vanilla Monks/Nuns where status = job at the Cloister) or invent a distinct job name (`Lecturer`? `Lector`?). Note: "Lector" was already rejected as an Aspirant-job alternative — see [[dh-aspirant-arcanist-jobs]].
- **Container infusion professions** at each Tier 3 specialization monument (one per: Atheneum Tower, Citadel of Light, Sacred Grove, Bloodforged Spire). Implied by the [[dh-notebooklm-artificer|Artificer pivot]] but never named. Touches every expansion mod.

**Names / decisions mentioned in passing:**
- **Final empty/charged container names** — pick between Anchorstone and Crystalfocus lines. See [[dh-notebooklm-charged-containers]]. **Anton's stance (2026-06-05):** Charged Container resources should most likely be consistently named across the core mod *and* all four expansion mods (one `X Y` line used everywhere, with per-path modifier varying). **Discrepancy to resolve:** the expansion-monument decorations brainstorm currently uses *both* lines — Paladin's "Radiant Anchorstone" (Anchorstone line) + Sorcerer's "Floating Blood-Crystal" (Crystal line). Future decision: lock the single line that propagates everywhere, then sweep all dh-notebooklm files that name charged containers and reconcile.
- **Artificer recipe ratios** — Iron-heavy, crystal-light principle locked; exact numbers `[TBD]`.
- **Arcane Lore rename** — NotebookLM suggested Arcane Praxis, Prime Arcana, Aetheric Theorem, etc. (L1377-1405). Anton didn't lock a rename; the current vault name `Arcane Lore` stands unless reopened.
- **T5 mastery rank names** — `Archmage` (Mage), `Hallow Lord` (Paladin), `Earthparent` (Druid), `Supreme Sorcerer` (Sorcerer). Triple-cited (NotebookLM report + chat decorations) but not yet locked into expansion-mod final notes. Decision: confirm names + lock into per-expansion-mod design.
- **Decoration naming convention** — building parts use `Scholastic` prefix (T1+T2) and `Arcane` prefix (T3+ core); decoration naming convention is unestablished. Most likely choice: follow **one of three** existing patterns — (a) the core-mod building-part progression (Scholastic / Arcane), (b) the vanilla **Common-tech-tree** decoration unlock naming convention, or (c) any individual vanilla estate's tech-tree decoration unlock naming convention. Pick one for consistency. See [[dh-notebooklm-aethercourt-decorations]].

**Resources / categories not yet captured:**
- **Aetherwood** — magically altered tree species with light-purple/teal foliage. Referenced in decorations (Aetherwood Sapling T2 / Ancient Aetherwood Tree T3+). **Currently decoration-only**, but worth a future decision on whether to also promote Aetherwood to a harvestable resource (Aetherwood logs / planks) that the Arcanum economy can produce or consume. See [[dh-notebooklm-aethercourt-decorations]].
- **Vertex-color / HDR-RGBA emissive workaround** — needed for every "glowing / luminous / shining" decoration across all five monuments. Single design-pass to define a consistent emissive treatment when those decorations enter implementation. See [[dh-notebooklm-aesthetic-corrections]].
- [x] **Vault hygiene refresh** — MOC ([[_index]]) updated to reflect post-reorg subfolder layout under `01_Mod_Core_Arcanum/`, all new per-entity notes linked, stale "Pass 4 will Obsidianify" and Mermaid-`[TBD]` text removed. Project brief updated: Sanctum moved off Aethercourt to Citadel of Light, gemini-chat path corrected, `metadata/Docs/` repurposed for NotebookLM staging. ✓ 2026-06-05

## Out of scope — Expansion mods (design captured, work deferred)

These are documented in `02_Mod_*` through `05_Mod_*` folders. No implementation work happens here until the Core Arcanum mod is shipped. Items are listed so design intent isn't lost.

### Paladin (Citadel of Light)

- [ ] Decide the **military training workplace** name — deferred during the Gemini chat at lines 4869-4905. See [[dh-paladin-workplaces]].
- [ ] Confirm or replace **Reliquary Smith** as the Divine Forge job name (currently marked `[tentative]` — Gemini hedged it as "or similar"; never explicitly locked by Anton). See [[dh-paladin-workplaces]].
- [ ] Work professions for the **Hall of Arms** sub-building (preliminary names: Aether Guard, Vow Keeper — never locked).

### Druid (Sacred Grove)

- [ ] **Tier-3 work buildings and professions** inside the Sacred Grove monument. Monument name is locked; interior is unspecified. See [[druid-design]].
- [ ] The **Evertree** / **Heartwood** signature tree-building inside the Sacred Grove (reserved names; design not started). See [[sacred-grove]].

### Sorcerer (Bloodforged Spire)

- [ ] **Tier-3 work buildings and professions** inside the Bloodforged Spire. Monument name is locked; interior is unspecified. See [[sorcerer-design]].
- [ ] **Ritual Grounds** sub-building (reserved name; design not started). See [[bloodforged-spire]].

### Mage (Atheneum Tower)

- [ ] **Tier-3 work buildings and professions** inside the Atheneum Tower. Monument name is locked; interior is unspecified. See [[mage-design]].

## Notes

- Status tracking lives here; per-area design history lives in `design-history/`.
- When something here resolves, link to the commit / PR / file path in the bullet so the audit trail is intact.
- Project-level priorities and tech-stack notes live in [[project-brief]].

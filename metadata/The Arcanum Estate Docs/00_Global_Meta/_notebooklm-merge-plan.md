---
title: NotebookLM Merge — Plan
tags:
  - meta
  - plan
  - paper-trail
created: 2026-06-04
status: complete
---

# NotebookLM Merge — Plan

Anton has exported four files from NotebookLM and placed them in `metadata/Docs/`. The goal is to merge the relevant content into the existing Obsidian vault (which is the canonical source from the earlier Gemini parse).

This plan is meant to be executed in a future session after the current session's token budget resets.

## Sources to ingest

| File | Lines | Bytes | Role |
| --- | --- | --- | --- |
| `notebooklm-conversation-notebooklm-chat-2026-06-04.md` | 2412 | 171,455 | Main NotebookLM chat — the heaviest source |
| `notebooklm-report-technical-design-specification-the-arcanum-estate-2026-06-04.md` | 191 | 10,464 | NotebookLM-generated "report" — its own synthesis of the design |
| `notebooklm-note-aethercourt-architecture-and-thematic-progression--2026-06-04.md` | 37 | 3,118 | Saved-response note 1 |
| `notebooklm-note-scholastic-foundations-and-medieval-academic-progr-2026-06-04.md` | 79 | 4,471 | Saved-response note 2 |

**Total: 2,719 lines, ~190 KB.**

Anton context (for the future-session agent):
- NotebookLM was seeded with the full original Gemini chat + supplemental sources (YouTube videos, the Foundation modding API wiki, the game's Steam page, in-game screenshots, a `Buildings.md` file from the repo, etc.).
- NotebookLM also had several long discussions about both existing topics and new ones.
- The two small "note" files are saved responses from inside the main chat — they may be duplicates of content already in the 2,412-line conversation. Dedup at the index step.

## Strategy overview

The merge mirrors the original Gemini parse (Pass 1 → 2 → 3 → verify), with one important difference: **the existing vault is itself a source to reconcile against.** Every topic in NotebookLM falls into one of three buckets vs. the vault:

| Bucket | Meaning | Default action |
| --- | --- | --- |
| **Redundant** | NotebookLM covers the same ground the vault already covers, no new info | Add a citation to NotebookLM in the relevant `dh-*.md` `sources:` frontmatter (paper trail); no body change |
| **Complementary** | NotebookLM adds details, examples, refinements, or new line citations to an existing topic | Append to the relevant `dh-*.md` decision log; update the final note only if the addition shifts the design |
| **New** | NotebookLM introduces something not in the vault (new building, new resource, new mechanic, new specialization, etc.) | Create a new `dh-*.md` + a new final note in the relevant folder; add to MOC |

**Conflict-resolution default:** NotebookLM is the LATER source (post-Gemini). When NotebookLM contradicts Gemini, treat NotebookLM as more recent and likely more refined — BUT surface every contradiction explicitly for Anton's adjudication before changing a locked decision. Do not silently overwrite locked vault content based on NotebookLM alone.

## Phased plan

### Phase 0 — Re-orient the agent (session restart)

The new session won't have this conversation's context. Step 1 for the next agent:

1. Read `_pass-3-plan.md` and `_pass-4-progress.md` to understand what was done.
2. Read `project-brief.md`, `master-to-do.md`, `_chat-index.md`, and the MOC `_index.md` to load the current vault state.
3. Skim the design-history folder name list (don't read all 25; just know they exist).
4. Read this file (`_notebooklm-merge-plan.md`) to load the merge plan.

### Phase 1 — Read the NotebookLM report first

The 191-line report is the highest-leverage starting point. NotebookLM was asked to synthesize the design; comparing its synthesis to the vault will surface major contradictions and additions fast.

**Caveat (added 2026-06-05):** the report was generated **early** in NotebookLM's lifecycle, shortly after the raw Gemini chat was added as a source — most refinements happened later in the main chat. Phase 1 will under-represent additions/changes; Phase 3 (chat topic-index) is the real workhorse.

Output: a short reconciliation table in this file's "Phase 1 results" section, listing:
- Items NotebookLM affirms (matches vault) — likely most of them
- Items NotebookLM contradicts — flag for Anton
- Items NotebookLM adds — flag for Anton

### Phase 2 — Inspect the two "note" files

The two saved-response notes are small (37 + 79 lines). Read them and decide:

- If their content is identical to a section in the main conversation → mark as duplicate, ignore in Phase 3
- If they contain unique framing or refinements not in the main convo → treat them as their own sources

This is a 5-minute task and prevents double-counting in Phase 3.

### Phase 3 — Topic-index the main NotebookLM conversation (Pass 1 equivalent)

The 2,412-line conversation needs the same "topic-index in line ranges" treatment that the Gemini chat got. Dispatch parallel subagents in line-ranged chunks (e.g., 4 chunks of ~600 lines each). Each subagent produces a topic-map entry per segment with:

- Line range
- Topic slug (matching existing dh-* slugs where possible)
- One-line summary
- **Bucket flag**: `[REDUNDANT]`, `[COMPLEMENTARY]`, `[NEW]`, or `[CONTRADICTS dh-xxx]`

Output: `_notebooklm-chat-index.md` in `00_Global_Meta/`.

### Phase 4 — Per-topic reconciliation

For each topic in the new index:

- **Redundant** → just add the NotebookLM citation to the existing `dh-*.md` `sources:` frontmatter
- **Complementary** → append a "## NotebookLM additions" subsection to the existing `dh-*.md` with line citations into the NotebookLM conversation
- **New** → create a new `dh-notebooklm-<topic>.md` decision log
- **Contradicts** → surface to Anton with the specific contradiction; wait for adjudication

The convention `dh-notebooklm-<topic>.md` (with `notebooklm-` infix) keeps new entries visually distinct from the original Gemini-derived ones.

### Phase 5 — Update final notes

Only where Phase 4 reconciliation produces a material change:

- For complementary additions: the final note may need a small inline addition or a new section
- For new topics: create a new final note in the appropriate folder (`01_Mod_Core_Arcanum/`, an expansion folder, or `00_Global_Meta/`)
- Update the MOC `_index.md` to include any new top-level notes
- Update `master-to-do.md` if NotebookLM resolves or introduces TODO items

### Phase 6 — Move the raw files into the vault paper trail

After the merge is complete, the four NotebookLM source files should join the existing raw chat at `00_Global_Meta/_raw/`. Same approach as Pass 4:

- Scan each file for active Obsidian syntax (the NotebookLM main chat is much more likely to contain wikilinks/tags than the Gemini chat did, because NotebookLM is more sophisticated)
- If active syntax is found, neutralize via inline-backtick wrapping (or rename to `.txt` if more pragmatic)
- Move to `00_Global_Meta/_raw/` alongside `gemini-conversation.md`
- Once moved, the original `metadata/Docs/` folder can be deleted (Anton already cleared the old contents per his message)

### Phase 7 — Re-verify

Re-run the wikilink + frontmatter + MOC check. Confirm zero broken links, all new frontmatter parses, all new notes reachable from the MOC.

## Decisions (locked 2026-06-04 by Anton)

1. **Conflict-resolution policy — NotebookLM wins by default.** NotebookLM is the later source. When NotebookLM contradicts a locked Gemini decision in the vault, treat NotebookLM as the more recent and refined version and update the vault accordingly. **Still surface every contradiction in the Phase 4 reconciliation log** so Anton can audit the changes — but don't block on adjudication. The default flow is: NotebookLM says X, vault says Y, vault gets updated to X with a note in the relevant `dh-*.md` recording the supersedence and citing NotebookLM lines.
2. **New final notes are created automatically.** When NotebookLM introduces a major new concept (new building, resource, mechanic, etc.), the merge creates the new final note plus its `dh-notebooklm-<topic>.md` decision log plus an MOC entry without prompting. (The Phase 4/5 logs in this file will still summarize what was added so Anton can review.)
3. **The report file is a read-only source.** Used to seed Phase 1 reconciliation; never imported as a vault note. The vault's structured notes remain the canonical synthesis.
4. **Same terse design-doc voice as Pass 3.** All NotebookLM additions are synthesized into Anton's voice; line citations live in `sources:` frontmatter, not inline prose.
5. **Shorten raw filenames during archival.** When the four NotebookLM source files move to `00_Global_Meta/_raw/`, rename to clean slugs:
   - `notebooklm-conversation-notebooklm-chat-2026-06-04.md` → `notebooklm-conversation.md`
   - `notebooklm-report-technical-design-specification-the-arcanum-estate-2026-06-04.md` → `notebooklm-report.md`
   - `notebooklm-note-aethercourt-architecture-and-thematic-progression--2026-06-04.md` → `notebooklm-note-aethercourt-architecture.md`
   - `notebooklm-note-scholastic-foundations-and-medieval-academic-progr-2026-06-04.md` → `notebooklm-note-scholastic-foundations.md`

   Any `dh-*.md` citations to these files (created during Phases 1-5) must use the shortened names, since archival happens at Phase 6 — author citations against the FINAL filenames from the start so no rewrite pass is needed.

6. **New-content routing (added 2026-06-05 after vault reorg).** Place new final notes by mod + entity type:
   - **Core Arcanum** → into the appropriate `01_Mod_Core_Arcanum/0N_*/` subfolder by type:
     - new monument → `00_Monuments/`
     - new building → `01_Buildings/`
     - new villager status → `02_Villager_Statuses/`
     - new villager job → `03_Villager_Jobs/`
     - new resource (including any new Fulfillment Need, which is a resource in-engine) → `04_Resources/`
     - new Grand Council content → `05_Grand_Council/`
     - Core overview notes that don't fit a subfolder → directly under `01_Mod_Core_Arcanum/` root
   - **Expansion mods (02-05)** → flat under their respective mod folder; no subfolders at this time.
   - **Design-history files** → always flat in `00_Global_Meta/design-history/`, regardless of source. NotebookLM-derived files use the `dh-notebooklm-<topic>.md` prefix.

7. **Superseded content (added 2026-06-05).** When NotebookLM supersedes locked vault content, the existing final note **stays in place**. Add an Obsidian callout at the top of the affected note:

   ```
   > [!NOTE] Superseded by `[[X]]`
   > Brief description of what changed. Citation: notebooklm-conversation lines NNN-NNN.
   ```

   Do NOT move old notes to `Archive/` as part of the merge. Anton adjudicates folder reorganization after the merge is complete.

8. **Arcane Lyceum pivot — preserve both readings (added 2026-06-05).** The free-standing-monument vs. Aethercourt-sub-building question remains open. Any NotebookLM-derived prose mentioning the Lyceum must be neutral on this — do not assume the pivot has happened, do not assume it hasn't.

## Resumption rules (mirroring Pass 4)

- Original files in `metadata/Docs/` are NEVER modified during the merge — only read.
- All vault changes are additive (new files, new sections, updated frontmatter sources arrays). Existing locked content is not silently overwritten.
- Each phase writes a checkpoint to this file. A mid-phase session reset loses at most one phase's work.

## Phase outputs (filled in during execution)

### Phase 1 — Report reconciliation

Source: `notebooklm-report.md` (191 lines). Cited against its post-archival filename per Decision 5. Generated early in NotebookLM's lifecycle — expect most refinement to live in the main chat (Phase 3), not here.

#### Affirms (matches vault — no action needed beyond Phase 6 archival)

- Estate name **Arcanum Estate**, collective term **Aetherians**, purple identity. `[[estate-identity]]`
- **Aether Envoy** as administrator of the estate + Grand Council quest interface. `[[aether-envoy]]`, `[[_grand-council]]`
- "Vanilla integration" philosophy — modular medieval, no glow shaders, growth like the Monastery. `[[foundation-aesthetic-reference]]`, `[[the-aethercourt]]`, `[[monument-architecture]]`
- Aethercourt as modular piece-by-piece monument. `[[the-aethercourt]]`
- Sub-buildings affirmed (subset): **Academy**, **Annex**, **Archive**, **Aetherium**. `[[core-buildings]]`. Report does not name Lapidary, Aether Hold, or Arcane Lyceum in §3 — silence rather than contradiction.
- Progression **Aspirant → Arcanist → Loremaster** with Loremaster as administrative/service rank at the Arcane Lyceum. `[[aetherian-progression]]`, `[[loremaster]]`
- Job map: Aspirant → **Scholar** (Academy → Glyphs); Arcanist → **Caster** (Aetherium → Arcane Lore) or **Lapidarist**. `[[scholar]]`, `[[caster]]`, `[[lapidarist]]`
- **Discourse** need replaces Entertainment at T2+; fulfilled at **Arcane Lyceum** by a **Loremaster**. `[[need-discourse]]`, `[[arcane-lyceum]]`
- Crystal chain: T1 **Mining Camp** → T2 **Lapidary**. `[[aether-crystal-mining-camp]]`, `[[lapidary]]`, `[[aether-crystal]]`, `[[faceted-aether-crystal]]`
- Knowledge chain: T1 **Academy → Glyphs**, T2 **Aetherium → Arcane Lore**. `[[glyph]]`, `[[arcane-lore]]`
- `generated_ids.lua` mandatory for GUID stability (already locked; never touched). Matches vault rule.
- No custom light code / glow shaders. Matches `[[foundation-aesthetic-reference]]`.

#### Contradicts → adjudicated 2026-06-05

1. **Estate color hex.** Report says Metallic Purple `#8E44AD` (notebooklm-report L24). Vault has no locked hex; only "soft purple/lavender" descriptive. **Adjudicated:** not a contradiction. Treat as a **complementary suggestion/example**. Moved to the Adds list below; Phase 4 may capture it as a `[TBD]` candidate value in `[[estate-identity]]` without locking it.
2. **Mage path: 1 Elementalist vs. 4 elemental jobs.** Report (L144-148) names one profession "Elementalist" at the abandoned "Aether Tower". **Adjudicated:** **vault wins.** Four elemental jobs (`[[flame-forger]]`, `[[mist-maker]]`, `[[stone-shaper]]`, `[[wind-weaver]]`) at `[[atheneum-tower]]` stand. Report's framing rejected as stale.
3. **Paladin monument name.** Report (L150-154) calls the monument "The Sanctum". **Adjudicated:** **vault wins.** `[[citadel-of-light]]` is the monument; `[[sanctum]]` is a sub-building inside it. Report's framing rejected as stale.

Phase 4 will not act on the C2/C3 framings. They are recorded here as paper trail for why no supersedence was applied.

#### Adds (new content not in vault — Phase 4/5 will absorb if accepted)

**Aesthetic / asset spec (would touch `[[foundation-aesthetic-reference]]`, `[[estate-identity]]`, and `[[3d-modeling-pipeline]]`):**
- **Suggested estate-color hex `#8E44AD`** (L24) — Metallic Purple. Complementary example only; no hex is locked in the vault. Phase 4 may surface as a `[TBD]` candidate in `[[estate-identity]]`.
- **Material Constraint Table** (L42-47) — forbidden vs. approved for Wall Textures, Support Elements, Lighting Logic, Architectural Accents. A more formal version of what the aesthetic-reference says in prose.
- **Custom Roof Specification** (L49-57) — interlocking diamond tiles; default Light Purple; variants Brown/Black/Green/Blue.
- **Color-customizable Faceted Aether Crystal inlays** (L59-61) — mirrors the roof-variant system; player-facing aesthetic agency.
- **Tiered part-naming convention** (L73-76) — `Rustic [Part]` for T1, `Modest [Part]` for T2.

**Engine / connection logic (would touch `[[the-aethercourt]]` or a new note):**
- **"Linked Plans" / Interior Access** (L88-90) — every sub-building must have functional doors + snap-points or the workplace will fail to register. Engine-level constraint.

**Resources (would create new files in `04_Resources/`):**
- **Aether Crystal Dust** (L103) — byproduct of the Lapidary (Faceted Aether Crystal production).
- **Aether Blooms** (L120) — grown in the Aethercourt; input for Aetherial Elixirs.

**Inter-estate synergy goods + new professions (would create new building/job/resource notes):**
- **Scholar's Vestments** ← **Arcane Weaver** (Cloth + Aether Crystal Dust).
- **Runic Talismans** ← **Rune Crafter** (Glyphs + Polished Stone).
- **Aetherial Elixirs** ← **Apothecary** (Aether Blooms + Herbs/Berries).
- **Enchanted Tomes** ← **Aether Bindery** (Glyphs + Leather + Planks; **deliberately uses Glyphs not Arcane Lore** — design decision to keep promotion paths viable in gold-focused playstyles, L124).

**T3 profession + hidden-rank names (would touch each expansion mod):**
- Paladin profession: **Sentinel** (combat buffs/Blessings).
- Druid profession: **Rootshaper**, workplace **Evertree/Heartwood**.
- Sorcerer profession: **Incantator**, workplace **Ritual Grounds**.
- Hidden-quest mastery rank names: **Archmage** (matches `[[arch-mage]]`), **Hallow Lord** (Paladin), **Earthparent** (Druid), **Supreme Sorcerer** (Sorcerer).

**API / implementation specifics (would touch `[[3d-modeling-pipeline]]`, building notes, or a new tech-note):**
- `registerClass` for ECS components; `registerAssetId` for 3D materials (L182).
- **COMP_WORKPLACE dual-resource output logic** for the Lapidary (apiary pattern — prevents stalls when Aether Crystal Dust storage is full; L186). Concrete technical specification for `[[lapidary]]`.
- `registerAssetProcessor` for LOD transitions (L190).

#### Phase 1 summary

| Bucket | Count |
| --- | --- |
| Affirms | 10 items |
| Contradicts | 0 after adjudication (C1 reclassified as complementary; C2/C3 rejected as stale report framings, vault stands) |
| Adds | ~18 items (including the color-hex suggestion): aesthetic spec, engine constraints, 2 new resources, 4 new craft chains, 4 T3 profession names, 4 hidden-rank names, 3 API specifics |

**Phase 4 carry-forward:** these findings stay in this file as a holding list. No `dh-notebooklm-*` files or new final notes are created from the report alone — Phase 3 will re-validate every Add against the main chat first, and Phase 4 acts on the unified set.

### Phase 2 — Saved-note dedup

Both saved-response notes are **duplicates** of content already in the main NotebookLM conversation. Mapped to main-chat line ranges:

| Saved-note file | Lines (note) | Maps to (main chat) |
| --- | --- | --- |
| `notebooklm-note-scholastic-foundations` | 14-79 | ~L1898-1956 |
| `notebooklm-note-aethercourt-architecture` | 14-36 | ~L1971-1993 |

**Decision:** ignore both saved-note files in Phase 3 indexing. Their content will be captured automatically when Phase 3 indexes the main conversation. They will still be archived in Phase 6 as part of the four-file paper trail (per locked Decision 5).

#### Topic surfaced by both notes (carry-forward for Phase 3/4)

The two notes are an in-context brainstorm about **architectural tier-naming convention** for the Aethercourt monument's T2/T3 tech-unlock names (NOT individual building-part names). Vault currently has no design-history file for this topic. Candidate paired progressions raised in the chat:

- Scholastic → Magister / Erudite / Arcane / Collegium
- Trivium → Quadrivium
- Philosophic → Empirical / Epistemic
- Hermetic → Alchemical / Magnum Opus
- Lyceum → Collegium
- Campus → Collegiate

Anton's in-line lean per main-chat L1961: "Campus → Collegiate, but leaning most towards Scholastic → Magister." Anton's later in-context follow-ups in the same thread (~L1970+) ask for alternatives to Magister, and NotebookLM's final recommendation is **Scholastic → Arcane** or **Scholastic → Erudite**.

**Status:** open design question, no lock. Phase 3 will tag this thread with `[NEW]` bucket flag and Phase 4 will create `dh-notebooklm-tier-architecture-naming.md` if it remains unresolved after the chat is fully indexed.

Note: this is distinct from the Phase 1 finding about **part-naming convention** ("Rustic [Part]" T1 / "Modest [Part]" T2 per notebooklm-report L73-76) — that's per-asset, this is per-tech-tier.

### Phase 3 — NotebookLM chat topic index

Complete 2026-06-05. Output: [[_notebooklm-chat-index]].

Approach: dispatched 4 parallel subagents over line-ranged chunks (L1-600, L601-1200, L1201-1800, L1801-2412) of the main NotebookLM chat. Each returned a bucketed topic-map for its range; the stitched index is `_notebooklm-chat-index.md`.

Bucket totals: REDUNDANT 5, COMPLEMENTARY ~20, NEW ~17, CONTRADICTS 0 (every previously-flagged stale framing — Aether Tower, Sanctum-as-monument, single Elementalist — was already adjudicated in Phase 1; the chat repeats them in places but they remain REDUNDANT because the vault wins).

**Anticipated Phase 4 work** (8 new dh-notebooklm files + corresponding new final notes):
1. Artificer pivot — biggest single new system; touches every expansion mod via T3 container-infusion flow.
2. Tier 1 room-parts lock — directly informs current 3D modeling work.
3. Scholastic → Arcane Architecture tech-unlock naming lock.
4. Inter-estate goods + Enchanted Tomes — 4 new professions, 4 new workplaces, multiple new resources.
5. Aesthetic-correction verify-pass against [[dh-foundation-aesthetic-reference]].
6. Aethercourt + monument decorations.
7. Mod-API reference (paper trail).
8. Charged-container naming convention.

The index's "Phase 4 priorities" section is the suggested execution order for Phase 4.

### Phase 4 — Per-topic reconciliation log

In progress 2026-06-05. Execution order matches the index's "Phase 4 priorities" — biggest single new system first. Each cluster gets a check-in before moving on.

#### Cluster 1 — Artificer pivot + charged-containers (Priority 1 in the index)

Written 2026-06-05. Two new design-history files:

- [[dh-notebooklm-artificer]] — Tier 3 base-resource workplace producing empty magical containers. Workforce Serfs/Commoners. Inputs raw Aether Crystal + Iron. Output charged at T3 specialization monuments into premium decoration material. Mining camp surface-node / prospecting-node split mirrors vanilla Stone. Open: container final name, recipe ratios, fate of Aether Lamps.
- [[dh-notebooklm-charged-containers]] — Naming format `X <magic type> Y` locked. Two candidate `X Y` lines (Anchorstone / Crystalfocus). UI-sorting-over-theme principle locked at mod level. Modifier vocabulary parked per-specialization.

Final-note creation for this cluster deferred to Phase 5 (will need new files in `01_Buildings/` for the Artificer workplace and `04_Resources/` for the new container resource family, plus updates to `[[aether-crystal-mining-camp]]`, `[[core-buildings]]`, `[[core-economy]]`).

**No CONTRADICTS flagged in this cluster.** The Artificer pivot supersedes a Gemini-era luxury-goods framing (Aether Lamps recipe at notebooklm-conversation L1063-1071) without conflicting with any locked vault decision — the Gemini-era Artificer was never locked into a final note.

#### Cluster 2 + 3 — Tier 1 room-parts lock + Scholastic→Arcane tech-unlock naming

Written 2026-06-05. Bundled because they share line range and topic (Aethercourt naming/structure decisions made in one extended chat exchange).

- [[dh-notebooklm-tech-unlock-naming]] — **Locks Aethercourt Scholastic Architecture (T2) and Aethercourt Arcane Architecture (T3) as tech-unlock names.** Records the 11 rejected alternatives as paper trail. Also captures the standalone-T2-unlock framing for the Arcane Lyceum (consistent with both pivot readings — does not settle the monument-vs-sub-building question).
- [[dh-notebooklm-tier1-room-parts]] — **Locks the 8 Tier 1 Room-part roster** for the Aethercourt: Scholastic Study Hall Minor, Scholastic Tower Minor, Scholastic Quarters (Minor + Major), Scholastic Passageway, Scholastic Vestibule, Scholastic Study Nook (Minor + Major). Also records that the Aether Hold and Archive are non-modular single-building placements (like Castle Armoury), and Anton's vertical-scale stone/timber asset strategy.

**No CONTRADICTS flagged.** Both decisions are net-new specifications (the vault had no prior tech-unlock-naming or T1-room-parts content). Touches but does not overwrite the open [[arcane-lyceum]] pivot.

#### Cluster 4 — Inter-estate goods + Enchanted Tomes

Written 2026-06-05. Two new design-history files:

- [[dh-notebooklm-inter-estate-goods]] — Locks the three-chain inter-estate goods family at L507: **Scholar's Vestments** (Arcane Weaver, Cloth + Aether Crystal Dust, T2, Serf/Commoner workforce), **Aetherial Elixirs** (Apothecary, Aether Blooms + Berries/Herbs, T2), **Runic Talismans** (Rune Crafter, Glyphs + Polished Stone, T3). Adds the **Aether Crystal Dust** byproduct from the Lapidary + the Apiary `COMP_WORKPLACE` reference pattern. Captures the recurring **"Arcanum input + vanilla input"** economic principle that the cluster establishes.
- [[dh-notebooklm-aether-bindery]] — Locks **Aether Bindery** + **Tomebinder** + **Enchanted Tome (T4)** + recipe Glyphs + Planks + Faceted Aether Crystals. Records the **Lore Bindery rejection** and the elevated mod-wide principle (never name something for what it doesn't consume). Loremaster gets a documented **secondary job** at the Aether Bindery beyond Lyceum work. Captures the Glyph→Arcane-Lore playtest-driven recipe-swap as a developer-tuning task.

**Anton corrections applied to Clusters 2+3 in the same session:**
- Vestibule name updated to "most likely Scholastic Vestibule" with the two alternatives kept as paper trail.
- T1+T2 building-part prefix locked as `Scholastic`, T3+ (core mod) as `Arcane`. [[dh-notebooklm-tech-unlock-naming]] updated.
- Aether Bloom Garden added to the forgotten-items list in [[master-to-do]] for tier confirmation (chat read: T1 planters + Garden Hut → T2 Apothecary consumer, mirroring Monastery's Herb/Berry Garden).

**No CONTRADICTS flagged.** Cluster 4 is net-new (the vault had no Inter-estate goods or Aether Bindery content). Aether Lamps (original Artificer product, item 3 of the cluster's brainstorm) was orphaned by the [[dh-notebooklm-artificer|Cluster 1 Artificer pivot]] and tracked in the forgotten-items list.

#### Cluster 5 — Aesthetic-correction verify-pass

Written 2026-06-05. One new design-history file:

- [[dh-notebooklm-aesthetic-corrections]] — Verifies the vault's existing aesthetic notes are correct on the broad strokes, then locks 6 load-bearing specifics not previously in the vault: diamond-tile roof geometry; washed-out color palette as a vanilla style principle; color-variant scheme (light purple default + brown/black/green/blue); Faceted Aether Crystals as decorative accent (not core building material) with color customization; explicit "no polished limestone" prohibition; **modding-API constraint that no custom light sources are allowed** (no glow effects — affects every "luminous" decoration design). Also formally records Anton's L260 retirement of the Gemini hallucinations (limestone tower / glowing crystal windows / massive spire) and notes that the L278 Rustic/Modest naming-convention reference has since been superseded by Scholastic/Arcane.

**Anton correction applied to Cluster 4:** [[dh-notebooklm-aether-bindery]] gained a workplace-rename-if-recipe-changes note and a recipe-input iteration history section tracking the Glyph ↔ Arcane Lore back-and-forth (Anton's L449 promotion-bottleneck flag was the load-bearing reason for the lock).

**No CONTRADICTS flagged in Cluster 5.** The chat segment is itself a *correction* of earlier Gemini hallucinations, but those hallucinations were never adopted into the vault, so there's no live vault content to overturn — only refinements to add. The "Aether Tower" and "polished limestone" framings are retired as paper trail.

#### Cluster 6 — Decorations (Aethercourt + expansion monuments)

Written 2026-06-05. Two new design-history files (split to keep in-scope/deferred content separate):

- [[dh-notebooklm-aethercourt-decorations]] — Aethercourt decorations T1-T5. 12 candidate items across three tier-bands. Captures first-pass discards as paper trail. Flags decoration-naming convention as an open question (building parts use Scholastic/Arcane; decorations use mixed status/job prefixes — unresolved). Status `design-iterating` because naming convention isn't settled.
- [[dh-notebooklm-expansion-monument-decorations]] — Per-path decoration palettes for Atheneum Tower (Mage), Citadel of Light (Paladin), Sacred Grove (Druid), Bloodforged Spire (Sorcerer), T3-T5. Status `design-captured-deferred` since expansion-mod work is out of scope for the current milestone. Triple-confirms the **T5 mastery rank names** (Archmage / Hallow Lord / Earthparent / Supreme Sorcerer). Surfaces **two cross-cutting issues**: (a) Paladin uses Anchorstone naming line while Sorcerer uses Crystal line — internal inconsistency to resolve; (b) many "glowing / luminous" decorations triggered → need single vertex-color/HDR-RGBA emissive design-pass at implementation time.

**No CONTRADICTS flagged.** Decorations are net-new content — the vault had no prior decoration design.

**New forgotten-items added to [[master-to-do]]:** decoration-naming convention question, T5 mastery rank lock, per-path container-naming consistency, Aetherwood as potential new resource species, emissive-vertex-color workaround design-pass.

#### Cluster 8 — Charged-container naming (cross-check)

Cross-check complete 2026-06-05. The `dh-notebooklm-charged-containers.md` written at Cluster 1 (L1223-1593) already covers the charged-container naming work end-to-end — format, rejected alternatives, UI-sorting principle, per-specialization modifier vocabulary, two candidate `X Y` lines. Two complementary additions made on the cross-check:

- Open-questions section gained the **cross-mod consistency** flag — the expansion-monument decorations brainstorm in [[dh-notebooklm-expansion-monument-decorations]] uses both Anchorstone (Paladin "Radiant Anchorstone") and Crystal (Sorcerer "Floating Blood-Crystal") lines in the same chat session, demonstrating concretely why picking *one* line is load-bearing across the four expansion mods.
- Adjacent-discussion section added — captures the Arcane Lore rename tangent at L1371-1405 (NotebookLM misunderstanding, corrected by Anton at L1410). Not a charged-container decision; brainstormed names parked in [[master-to-do]].

**Anton corrections applied to Cluster 6:**
- Decoration naming convention forgotten-item refined: most likely follows one of three patterns — core-mod building-part progression OR vanilla Common-tech-tree decoration unlock naming OR any vanilla estate's tech-tree decoration unlock naming. Pick one for consistency.
- Per-path container-naming consistency forgotten-item refined as a future decision to make.
- Aetherwood forgotten-item refined: currently decoration-only; future decision on whether to promote to a harvestable resource.

#### Cluster 7 — Mod-API reference (paper trail)

Written 2026-06-05. One new design-history file:

- [[dh-notebooklm-mod-api-reference]] — Consolidates every Lua-API mechanic, file convention, debugging hook, and engine constraint surfaced across the NotebookLM chat. Pulls together the primary L152-207 overview plus scattered references (COMP_WORKPLACE Apiary pattern at L466, GUID-from-naming at L617, 4-resource UI penalty at L681 and L1556, vertex-color emissive workaround from the report). Status `reference`. Flags the partial-coverage caveat — NotebookLM only had the modding-wiki "start" page; deeper API details must be verified against the live wiki before implementation.

Three concrete developer tasks surfaced and noted as candidates for [[master-to-do]]'s Lua/code section: verify Apiary dual-output behavior to pattern the Lapidary off; define a consistent emissive vertex-color treatment for all glow-described decorations; check whether the current LOD blocker on the first Aethercourt part is on the Blender side or the `registerAssetProcessor` side.

**No CONTRADICTS flagged.** The mod-API content is purely net-new; no prior vault content covers Lua API specifics.

---

### Phase 4 — closed 2026-06-05

All 8 clusters reconciled:

| # | Cluster | dh files written |
| --- | --- | --- |
| 1 | Artificer + charged-containers | dh-notebooklm-artificer, dh-notebooklm-charged-containers |
| 2 + 3 | Tier 1 room parts + tech-unlock naming | dh-notebooklm-tier1-room-parts, dh-notebooklm-tech-unlock-naming |
| 4 | Inter-estate goods + Aether Bindery | dh-notebooklm-inter-estate-goods, dh-notebooklm-aether-bindery |
| 5 | Aesthetic corrections | dh-notebooklm-aesthetic-corrections |
| 6 | Aethercourt + expansion decorations | dh-notebooklm-aethercourt-decorations, dh-notebooklm-expansion-monument-decorations |
| 7 | Mod-API reference | dh-notebooklm-mod-api-reference |
| 8 | Charged-containers cross-check | (covered by Cluster 1 file; complementary additions made on cross-check) |

**Totals:** 10 dh-notebooklm files, 0 unresolved CONTRADICTS, 1 new chat index (`_notebooklm-chat-index`), all five Phase-1 adjudications recorded (color hex as suggestion, 4 elemental jobs stand, Citadel of Light stands as monument, no creation of new dh from report alone before Phase 3 ran). Forgotten-items list in [[master-to-do]] catalogs every parked-design and future-decision item surfaced during reconciliation.

### Phase 5 — Final-note updates

In progress 2026-06-05. Working cluster-by-cluster, mirroring Phase 4 structure.

#### Cluster 5.1 — Aether Bindery + Tomebinder + Enchanted Tome

Complete 2026-06-05. 3 new files + 6 updates + 1 MOC update:

| Operation | File | Notes |
| --- | --- | --- |
| New | `01_Buildings/aether-bindery.md` | Stub |
| New | `03_Villager_Jobs/tomebinder.md` | Stub |
| New | `04_Resources/enchanted-tome.md` | Stub |
| Update | `02_Villager_Statuses/loremaster.md` | Added Tomebinder as secondary workplace |
| Update | `04_Resources/glyph.md` | Added Aether Bindery as T4 consumer |
| Update | `04_Resources/faceted-aether-crystal.md` | Added Aether Bindery as T4 consumer (magic-seal) |
| Update | `04_Resources/arcane-lore.md` | Added deliberate-non-use rationale + playtest-swap note |
| Update | `01_Mod_Core_Arcanum/core-buildings.md` | New table row + new T4 section + sources frontmatter |
| Update | `01_Mod_Core_Arcanum/core-economy.md` | New table row + new T4 trade loop + sources frontmatter |
| Update | `00_Global_Meta/_index.md` | Added 3 new entries to MOC subfolder lists |

#### Side task (after 5.1, before 5.2) — Audit `core-buildings.md` + `core-economy.md` coverage

Complete 2026-06-05. Three orphan-stub gaps in `01_Buildings/` filled — every building/resource referenced from the two umbrella notes now has a stub:

| Operation | File | Notes |
| --- | --- | --- |
| New | `01_Buildings/annex.md` | T1 lodging stub; "Aetherians" collective term introduction |
| New | `01_Buildings/archive.md` | T1/T2 intellectual-resource storage stub; rejected alternatives Repository / Registrum |
| New | `01_Buildings/aether-hold.md` | T1/T2 physical-resource storage stub; backup name Materia Reserve |
| Update | `00_Global_Meta/_index.md` | Added 3 new entries to MOC |
| Update | `00_Global_Meta/master-to-do.md` | Added Loremaster's Lyceum job-name question to forgotten-items |

#### Cluster 5.2 — Inter-estate goods

Complete 2026-06-05. 11 new files + 4 updates + MOC update:

| Operation | File | Notes |
| --- | --- | --- |
| New | `01_Buildings/arcane-weaver.md` | T2 — Serf/Commoner workforce |
| New | `01_Buildings/apothecary.md` | T2 — job name `[TBD]` |
| New | `01_Buildings/rune-crafter.md` | T3 — workplace + job share name |
| New | `01_Buildings/aether-bloom-garden.md` | T1 custom category — planters + Garden Hut |
| New | `03_Villager_Jobs/arcane-weaver.md` | Serf/Commoner Labor job |
| New | `03_Villager_Jobs/rune-crafter.md` | Workforce assumption `[TBD]` (Aetherian likely) |
| New | `04_Resources/aether-crystal-dust.md` | T2 byproduct |
| New | `04_Resources/aether-bloom.md` | T1 magical flora |
| New | `04_Resources/scholar-vestments.md` | T2 consumable |
| New | `04_Resources/aetherial-elixir.md` | T2 buff item |
| New | `04_Resources/runic-talisman.md` | T3 buff item |
| Update | `01_Buildings/lapidary.md` | Dual-output Apiary pattern + COMP_WORKPLACE dev-task ref |
| Update | `04_Resources/aether-crystal.md` | New early-game-sink use as Bloom Garden bed construction |
| Update | `01_Mod_Core_Arcanum/core-buildings.md` | 4 new table rows + 4 new sections + sources frontmatter |
| Update | `01_Mod_Core_Arcanum/core-economy.md` | 5 new table rows + new "Inter-estate goods family" subsection + cross-estate principle articulation + sources frontmatter |
| Update | `00_Global_Meta/_index.md` | 11 new entries in MOC subfolder lists |

#### Cluster 5.3 — Artificer + charged-containers (full variant set)

Complete 2026-06-05. Per Anton's "option (b)" decision — create stubs for all proposed charged-container variants up front, even though specialization-monument infusion workplaces aren't yet designed. 11 new files + 3 updates + MOC:

| Operation | File | Notes |
| --- | --- | --- |
| New | `01_Buildings/artificer.md` | T3 — Serf/Commoner workforce, iron-heavy recipe |
| New | `03_Villager_Jobs/artificer.md` | Labor-Estate Serf/Commoner job |
| New | `04_Resources/arcane-anchorstone.md` | Empty container; X-Y pair `Arcane Anchorstone` used as working convention; Crystalfocus alternative noted |
| New | `04_Resources/arcane-pure-anchorstone.md` | Core unaligned charged variant; `Pure` modifier is one candidate |
| New | `04_Resources/arcane-fire-anchorstone.md` | Mage Fire (Flame Forger) |
| New | `04_Resources/arcane-wind-anchorstone.md` | Mage Wind (Wind Weaver) |
| New | `04_Resources/arcane-earth-anchorstone.md` | Mage Earth (Stone Shaper) — Earth vs Stone `[TBD]` |
| New | `04_Resources/arcane-water-anchorstone.md` | Mage Water (Mist Maker) — Water vs Mist `[TBD]` |
| New | `04_Resources/arcane-radiant-anchorstone.md` | Paladin path; `Radiant` from T5 Citadel decoration; Holy / Light alternatives |
| New | `04_Resources/arcane-life-anchorstone.md` | Druid path; `Life` is placeholder; Nature / Wild / Verdant / Bloom alternatives |
| New | `04_Resources/arcane-blood-anchorstone.md` | Sorcerer path; `Blood` from T4 Bloodforged Spire decoration; full modifier candidate list noted |
| Update | `01_Buildings/aether-crystal-mining-camp.md` | T1 surface-node + T2 prospecting-upgrade framing; open question on separate T2 building |
| Update | `01_Mod_Core_Arcanum/core-buildings.md` | New Artificer table row + new T3 section + sources frontmatter |
| Update | `01_Mod_Core_Arcanum/core-economy.md` | New charged-container resource rows + new "Charged-container family" subsection explaining the 3-step Mine-Craft-Infuse chain |
| Update | `00_Global_Meta/_index.md` | 11 new entries in MOC; charged-container family grouped under a single bullet |
| Update | `00_Global_Meta/master-to-do.md` | Added forgotten-items entry for T2 Aether Crystal Mine separate-vs-upgrade decision |

#### Cluster 5.4 — Aethercourt tech-unlock + Tier 1 parts

Complete 2026-06-05. 0 new + 3 updates:

| Operation | File | Notes |
| --- | --- | --- |
| Update | `00_Monuments/the-aethercourt.md` | New sections: Tech-unlock progression (Scholastic T2 → Arcane T3); Tier 1 Room parts (8 locked); Asset modeling strategy (vertical scale stone/timber, not material-variant pairs); Non-modular sub-buildings note. Sources frontmatter updated. |
| Update | `00_Monuments/arcane-lyceum.md` | New "Tech-unlock placement" section locking the Lyceum's standalone T2 unlock (mirroring Cloister / Tavern). Notes the framing is compatible with both readings of the monument-vs-sub-building pivot. Sources frontmatter updated. |
| Update | `01_Mod_Core_Arcanum/core-buildings.md` | Added non-modular single-building-placement note to both Archive and Aether Hold sections. Sources frontmatter updated with `dh-notebooklm-tier1-room-parts` and `dh-notebooklm-tech-unlock-naming`. |

**No new MOC entries needed.** All three updated notes were already linked. The new dh-* sources are linked from the umbrella notes that the MOC points at.

#### Cluster 5.5 — Aesthetic corrections

Complete 2026-06-05. 0 new + 3 updates:

| Operation | File | Notes |
| --- | --- | --- |
| Update | `00_Global_Meta/foundation-aesthetic-reference.md` | New "Vanilla style rules (engine-aware)" section locking the washed-out color rule and the no-custom-light-sources API constraint with the vertex-color/HDR-RGBA workaround. Sources frontmatter updated. |
| Update | `00_Monuments/the-aethercourt.md` | Architectural-language section expanded with: signature diamond-tile roof + 5-color variant scheme; Faceted Aether Crystals as accent-only (Gemini "polished limestone" framing retired); doors/windows distinct geometry + vanilla artstyle constraint. Sources frontmatter updated. |
| Update | `00_Global_Meta/3d-modeling-pipeline.md` | Rewritten from stub to full asset-pipeline reference: vertical-scale asset strategy, diamond-tile roof geometry, 5-color variant scheme, vertex-color/HDR-RGBA emissive workaround (with affected-decorations list), engine-API entry points (`registerAssetId` + `registerAssetProcessor`), active LOD blocker. Status changed from `stub` to `living-document`. Sources frontmatter updated. |

**No new MOC entries needed.** All three notes already linked from MOC.

#### Cluster 5.6 — Decorations

Complete 2026-06-05. 5 new files + 5 monument-note updates + 2 MOC updates. **New `06_Decorations/` subfolder** created under the Core mod (parallel to 00-05). Per Decision 6 routing, expansion-mod decoration files live flat in each expansion folder.

| Operation | File | Notes |
| --- | --- | --- |
| New | `01_Mod_Core_Arcanum/06_Decorations/aethercourt-decorations.md` | Status `design-iterating`; 12 candidate names across T1-T5 + first-pass discards as paper trail; naming-convention caveat at top |
| New | `02_Mod_Citadel_of_Light/citadel-of-light-decorations.md` | Status `design-captured-deferred`; 8 candidate names T3-T5; flags Radiant Anchorstone + Hallow Lord |
| New | `03_Mod_Sacred_Grove/sacred-grove-decorations.md` | Status `design-captured-deferred`; 8 candidate names T3-T5; flags Aetherwood / Evertree / Earthparent |
| New | `04_Mod_Bloodforged_Spire/bloodforged-spire-decorations.md` | Status `design-captured-deferred`; 8 candidate names T3-T5; flags the Blood-Crystal vs Blood-Anchorstone naming inconsistency |
| New | `05_Mod_Atheneum_Tower/atheneum-tower-decorations.md` | Status `design-captured-deferred`; 8 candidate names T3-T5; flags all four elemental anchor decorations |
| Update | `00_Monuments/the-aethercourt.md` | Cross-link to `aethercourt-decorations` |
| Update | `02_Mod_Citadel_of_Light/citadel-of-light.md` | Cross-link added |
| Update | `03_Mod_Sacred_Grove/sacred-grove.md` | Cross-link added |
| Update | `04_Mod_Bloodforged_Spire/bloodforged-spire.md` | Cross-link added |
| Update | `05_Mod_Atheneum_Tower/atheneum-tower.md` | Cross-link added |
| Update | `00_Global_Meta/_index.md` | New `06_Decorations/` subfolder section + 4 expansion decoration entries + Conventions block updated to mention 06_Decorations |

#### Cluster 5.7 — Mod-API reference

Complete 2026-06-05. 1 new + 2 updates:

| Operation | File | Notes |
| --- | --- | --- |
| New | `00_Global_Meta/foundation-mod-api-reference.md` | Navigable summary mirroring the `foundation-aesthetic-reference` reference-note pattern. Covers mod-folder structure, Lua scripting model, COMP_WORKPLACE and GUID-generation mechanics, no-light-sources / vertex-color emissive workaround, UI/UX rules, debugging hooks, distribution, plus a "what this does NOT cover" pointer back to the live wiki |
| Update | `00_Global_Meta/3d-modeling-pipeline.md` | API entry-points section + Cross-links updated to point to the new final note as well as the dh paper trail |
| Update | `00_Global_Meta/_index.md` | New entry added to the "Start here" cluster alongside `foundation-aesthetic-reference` and `3d-modeling-pipeline` |

#### Cluster 5.8 — Phase 5 close-out + final sweep

Complete 2026-06-05. Hygiene cluster; no new content.

| Operation | File | Notes |
| --- | --- | --- |
| Verify | MOC orphan-link scan | Programmatic check: 128 vault files; 124 directly linked; the 4 unmatched are `_index` itself, `Archive/aether-tower`, `Archive/formulas`, and `_raw/gemini-conversation` — all correctly handled by group-level MOC sections. **Zero orphans.** |
| Update | `00_Global_Meta/project-brief.md` | Core Systems Design Status table refreshed with the post-NotebookLM sub-building list (13 sub-buildings cited), the locked tech-unlock names + Tier 1 Room parts as new "Done" rows, the expanded resource list, and a new "Decoration Naming Convention | Open" row. |
| Update | `00_Global_Meta/master-to-do.md` | Design section: added decoration-naming-convention as an actionable Design item (elevated from forgotten-items). Lua/code section: added an explicit work-professions implementation bullet covering all 9 known jobs + 2 TBD-name jobs. |

---

### Phase 5 — closed 2026-06-05

8 clusters complete. **Totals:** 38 new files (Phase 4: 10 dh-notebooklm + 1 chat index; Phase 5: 14 new resource/job/building stubs + 5 decoration notes + 3 audit-fix stubs + 5 expansion-decoration files + 1 mod-api reference + 1 Aether Bindery family triplet that I'm including in the 14 count = 30 Phase 5 new files); ~30 updates to existing notes; new `06_Decorations/` subfolder created under the Core mod.

The vault now reflects the complete NotebookLM-derived design surface. **All locks captured; all open questions tracked in [[master-to-do]] forgotten-items list.** Cross-mod naming inconsistencies (charged-container Anchorstone vs Crystal lines), TBD modifier choices, the T2 Aether-Crystal-Mine separate-vs-upgrade decision, the Aether Lamps fate, the Apothecary worker job name, and the decoration naming convention all wait on Anton's adjudication — but each has an actionable bullet with full design context recorded.

Phases 6 (raw-file archival) and 7 (final wikilink/MOC verification) remain.

#### Cluster 5.8 — Phase 5 close-out

Complete 2026-06-05. Final hygiene sweep:

| Operation | File | Notes |
| --- | --- | --- |
| Verify | All Core subfolders | File-tree audit confirms every per-entity file is linked from MOC. 00_Monuments (2), 01_Buildings (13), 02_Villager_Statuses (3), 03_Villager_Jobs (8), 04_Resources (20), 05_Grand_Council (2), 06_Decorations (1) — all reachable. Expansion mods 02-05 likewise. |
| Update | `00_Global_Meta/_index.md` | Added NotebookLM-merge design-history subsection listing all 10 dh-notebooklm files; updated total dh-count from 25 to 35 |
| Update | `00_Global_Meta/master-to-do.md` | Updated Lua/code core-monument item to reflect new sub-buildings (Aether Bloom Garden, Arcane Weaver, Apothecary, Rune Crafter, Artificer, Aether Bindery); Sanctum removed (relocated to Citadel of Light). Updated resource-economy item to list all new resources including the charged-container family. Updated NotebookLM-incorporate item to note Phases 1-5 complete, Phases 6-7 remaining. |

---

### Phase 5 — closed 2026-06-05

Final tally across all 8 clusters:

| Cluster | New files | Updated files |
| --- | --- | --- |
| 5.1 Aether Bindery + Tomebinder + Enchanted Tome | 3 | 6 |
| Side task (audit) | 3 | 0 |
| 5.2 Inter-estate goods | 11 | 4 |
| 5.3 Artificer + charged-containers (option b — full variant set) | 11 | 3 |
| 5.4 Aethercourt tech-unlock + Tier 1 parts | 0 | 3 |
| 5.5 Aesthetic corrections | 0 | 3 |
| 5.6 Decorations (incl. new `06_Decorations/` subfolder) | 5 | 5 |
| 5.7 Mod-API reference | 1 | 2 |
| 5.8 Close-out (MOC + master-to-do sweep) | 0 | 2 |
| **Totals** | **34 new** | **28 updates** |

All 10 dh-notebooklm files from Phase 4 have been propagated into final notes per Decision 6 routing (Core mod → entity-type subfolders; expansion mods → flat). Forgotten-items list in [[master-to-do]] captures every parked-design decision surfaced during reconciliation. The MOC is up to date.

### Phase 6 — Raw archive

Complete 2026-06-06. Same approach as Pass 4 for the Gemini chat — copy + rename + SHA-256 verify, no content transformation needed.

**Scan results (active Obsidian syntax across all 4 source files):**

| Pattern | notebooklm-conversation | notebooklm-report | notebooklm-note-aethercourt-architecture | notebooklm-note-scholastic-foundations |
| --- | --- | --- | --- | --- |
| `[[wikilink]]` | 0 | 0 | 0 | 0 |
| `![[embed]]` | 0 | 0 | 0 | 0 |
| Inline `#hashtag` (non-heading, non-code) | 0 | 0 | 0 | 0 |
| `^block-id` at end of line | 0 | 0 | 0 | 0 |

The 6 `#hex-color` strings detected in the main chat (`fill:#e0e0e0`, `stroke:#333`, etc., L764-768) all sit inside a fenced Mermaid code block and are therefore not parsed as Obsidian tags. No neutralization needed.

**Copy + rename + verify executed:**

| Source | Destination | Size | SHA-256 (first 16 chars) |
| --- | --- | --- | --- |
| `notebooklm-conversation-notebooklm-chat-2026-06-04.md` | `_raw/notebooklm-conversation.md` | 171,455 B | `fc1c8862912a6c6d…` |
| `notebooklm-report-technical-design-specification-the-arcanum-estate-2026-06-04.md` | `_raw/notebooklm-report.md` | 10,464 B | `39db5b9b377ae7a5…` |
| `notebooklm-note-aethercourt-architecture-and-thematic-progression--2026-06-04.md` | `_raw/notebooklm-note-aethercourt-architecture.md` | 3,118 B | `5c4d739e26c90d53…` |
| `notebooklm-note-scholastic-foundations-and-medieval-academic-progr-2026-06-04.md` | `_raw/notebooklm-note-scholastic-foundations.md` | 4,471 B | `629e974da76050db…` |

All 4 byte-equality verifications passed. The 5 historical sources now sit side-by-side in `00_Global_Meta/_raw/` (the existing `gemini-conversation.md` + 4 NotebookLM exports).

**Source-file deletion in `metadata/Docs/`:** owned by Anton, deferred. The originals are duplicates of the `_raw/` copies (SHA-256 verified) so deletion is safe whenever Anton chooses to do it.

All Phase 4 dh-notebooklm-* citation references use the post-archival short slugs (per Decision 5), so no citation-rewrite pass needed. The Obsidian wikilinks in the dh-files resolve to the new `_raw/` filenames automatically by basename.

### Phase 7 — Verification

Complete 2026-06-06.

#### Wikilink resolution

Scanned all 136 vault files, 1,523 wikilinks total. Initial scan flagged 66 broken; after correcting the verifier to handle (a) the `\|` markdown-table pipe-escape that appears inside wikilinks (e.g. `[[aether-bindery\|Aether Bindery]]` inside a table cell) and (b) inline-code spans (which Obsidian skips), the genuine break count was **7**. All 7 fixed:

| # | Broken target | File | Fix |
| --- | --- | --- | --- |
| 1 | `[[03_Villager_Jobs]]` | `master-to-do.md` | Rewritten as a plain-text folder reference |
| 2 | `[[X]]` | `_notebooklm-merge-plan.md` | Wrapped in inline code (it was example syntax in the Decision 7 callout) |
| 3 | `[[_core-buildings]]` | `dh-notebooklm-artificer.md` | Removed forward-reference to a not-yet-existing front-door file |
| 4-5 | `[[note]]`, `[[dh-note]]` | `_index.md` Conventions section | Rephrased to use `-style` suffix (the wikilink form was being used as example syntax) |
| 6 | `[[expansion-mage]]` | `dh-mage-path-jobs.md` | Removed stray entry — that string is a frontmatter tag, not a wikilink target. Pre-existing Pass-3 artifact. |
| 7 | `[[dh-notebooklm-<topic>]]` | `_index.md` | Rephrased to use slug-pattern wording without the brackets |

Documentation-example files (`obsidian-ai-editing-guidelines.md`, `_pass-3-plan.md`, `_pass-4-progress.md`) contain intentional unresolved wikilinks as part of their content (e.g. `[[note-title]]`, `[[wikilink]]`) — these are excluded from the failure count.

**Final wikilink result: PASS — all wikilinks resolve outside of documentation-example files and code spans.**

#### Frontmatter parse

Walked all 136 files. Two files have no frontmatter, both intentional:

- `_raw/gemini-conversation.md` — raw chat archive, kept byte-identical to source per the Pass-4 decision to preserve line citations.
- `obsidian-ai-editing-guidelines.md` — root-level documentation reference, not a vault note.

All 134 files with frontmatter parse as valid YAML. **PASS.**

#### MOC reachability

136 vault files. 126 directly linked from `_index.md`. 9 group-handled (the MOC itself, the 5 `_raw/` archive files mentioned in the cross-vault-notes section, 2 `Archive/` files mentioned in the Archive section, and `obsidian-ai-editing-guidelines.md` mentioned in the Conventions block). One file was double-counted in those two categories.

**Zero orphans.** Every vault file is reachable from the MOC, directly or via a group mention. **PASS.**

---

### Merge complete 2026-06-06

All 7 phases done. The NotebookLM material is fully integrated into the vault:

- **38+ new files** across design history, monuments, buildings, jobs, resources, decorations, and reference notes
- **~30 updates** to existing notes (umbrella notes, monument notes, project-brief, master-to-do)
- **New `06_Decorations/` subfolder** under the Core mod
- **4 raw NotebookLM sources** archived to `00_Global_Meta/_raw/` under short slugs
- **0 unresolved contradictions**, every open question tracked in [[master-to-do]]
- **1,523 wikilinks scanned, all resolving**
- **0 frontmatter parse errors**
- **0 MOC orphans**

The vault is ready for the next milestone (Anton-owned: cleanup of `metadata/Docs/`, plus design adjudications on the open items now sitting in `master-to-do`).

## Cross-links

- [[_pass-3-plan]] — original Pass 3 plan (analogous structure)
- [[_pass-4-progress]] — Pass 4 progress doc (analogous structure for the raw file move)
- [[project-brief]] — overall vault context
- [[master-to-do]] — open items list (will get updated during Phase 5)
- [[_index]] — MOC; will get updated for any new top-level notes

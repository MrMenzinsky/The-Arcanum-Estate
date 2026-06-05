---
title: NotebookLM Merge — Plan
tags:
  - meta
  - plan
  - paper-trail
created: 2026-06-04
status: planned-not-started
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
   > [!NOTE] Superseded by [[X]]
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

_pending_

### Phase 2 — Saved-note dedup

_pending_

### Phase 3 — NotebookLM chat topic index

_pending_

### Phase 4 — Per-topic reconciliation log

_pending_

### Phase 5 — Final-note updates

_pending_

### Phase 6 — Raw archive

_pending_

### Phase 7 — Verification

_pending_

## Cross-links

- [[_pass-3-plan]] — original Pass 3 plan (analogous structure)
- [[_pass-4-progress]] — Pass 4 progress doc (analogous structure for the raw file move)
- [[project-brief]] — overall vault context
- [[master-to-do]] — open items list (will get updated during Phase 5)
- [[_index]] — MOC; will get updated for any new top-level notes

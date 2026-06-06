# Obsidian Vault Editing Guidelines for AI

This document defines rules and conventions for AI editing `.md` files in an Obsidian vault directly on disk. Following these guidelines ensures vault integrity, correct link resolution, and compatibility with Obsidian's rendering and graph features.

---

## 1. File and Folder Naming

- Use **lowercase kebab-case** for all filenames: `my-note-title.md`
- Spaces in filenames are technically supported by Obsidian but cause fragile wikilinks — avoid them unless the vault already uses them consistently
- Never use special characters in filenames: `/ \ : * ? " < > |`
- Folder names follow the same rules as filenames
- The `.obsidian/` folder at the vault root is **off-limits** — never read, write, or delete files inside it unless explicitly instructed

---

## 2. Wikilinks (Internal Links)

Obsidian uses its own `[[wikilink]]` syntax for internal links. These are **not standard Markdown links** and must be used correctly.

### Basic wikilink
```
[[note-title]]
```
Links to a note by filename (without `.md` extension). Obsidian resolves these vault-wide, so the folder path is not required if the filename is unique.

### Link with display text
```
[[note-title|Display Text]]
```
The pipe `|` separates the target from the label shown to the reader.

### Link to a heading within a note
```
[[note-title#Heading Name]]
```
The heading must match exactly, including capitalisation.

### Link to a block
```
[[note-title#^block-id]]
```
Block IDs are defined in the target note by appending `^block-id` at the end of a paragraph (on the same line). Only reference block IDs that already exist in the target file.

### Rules
- **Never use standard Markdown links** (`[text](path/to/note.md)`) for internal vault navigation — they will not appear in the graph and break on vault moves
- Always omit the `.md` extension in wikilinks
- If you rename a file, update **all wikilinks** pointing to it across the vault — Obsidian does this automatically in the UI, but AI edits bypass that
- Wikilinks are **case-insensitive** in resolution but case-sensitive in display — keep casing consistent with the actual filename

---

## 3. Frontmatter (YAML)

Frontmatter is a YAML block at the very top of the file, before any content. It must be the **first thing in the file**.

```yaml
---
title: My Note Title
tags:
  - tag-one
  - tag-two
aliases:
  - alternate name
  - another alias
created: 2026-06-04
status: draft
---
```

### Rules
- The opening `---` must be on line 1 with no leading whitespace or blank lines before it
- The closing `---` must be on its own line
- Use the `tags` field as a list (not inline comma string) for compatibility
- Use the `aliases` field to define alternative names Obsidian will resolve wikilinks against
- Date fields should use ISO 8601 format: `YYYY-MM-DD`
- Do not add frontmatter fields that conflict with Obsidian's reserved keys unless intentional: `position`, `cssclass`, `cssclasses`, `publish`
- YAML strings containing `:`, `#`, or `[` must be quoted: `title: "Note: A Subtitle"`

---

## 4. Tags

Tags can be defined in two ways:

**In frontmatter (preferred):**
```yaml
tags:
  - concept
  - status/draft
```

**Inline in body:**
```
This note is about #concept and is currently #status/draft
```

### Rules
- Tags must not contain spaces — use `/` for hierarchy: `#area/subarea`
- Tags are case-insensitive in Obsidian but keep casing consistent across the vault
- Do not mix frontmatter and inline tags for the same tag — pick one convention per vault and stick to it
- Never put a `#` tag inside a code block unless it's genuinely code

---

## 5. Embeds

Obsidian can embed the content of other notes, images, or blocks inline.

### Embed a whole note
```
![[note-title]]
```

### Embed a heading section
```
![[note-title#Heading]]
```

### Embed a block
```
![[note-title#^block-id]]
```

### Embed an image (in vault)
```
![[image-filename.png]]
```

### Rules
- Only embed files that exist in the vault — broken embeds render as red error text in Obsidian
- Image files should live in a dedicated attachments folder (e.g. `assets/` or `attachments/`) — check the vault's existing convention before placing images
- Do not use standard Markdown image syntax (`![](path)`) for vault-local images — use `![[]]` instead

---

## 6. Headings

- Use ATX-style headings (`#`, `##`, `###`) — never Setext-style (`===` underlines)
- The note title is typically `# H1` at the top (after frontmatter) or derived from the filename — do not have two `# H1` headings in one file
- Heading text used in `[[note#Heading]]` links must match exactly — changing a heading breaks any links pointing to it
- Leave one blank line before and after each heading

---

## 7. Block IDs

Block IDs allow linking to a specific paragraph, list item, or other block.

```
This is a paragraph that can be linked to. ^my-block-id
```

### Rules
- Block IDs must be on the **same line** as the block content, at the very end, after a space
- Only use alphanumeric characters and hyphens in block IDs: `^my-block-123`
- Block IDs are invisible in Reading view — they do not affect rendered output
- Do not add duplicate block IDs within the same file

---

## 8. Callouts

Obsidian supports callout blocks (similar to admonitions):

```markdown
> [!NOTE]
> This is a note callout.

> [!WARNING] Custom Title
> This is a warning with a custom title.

> [!TIP]- Collapsible callout (collapsed by default)
> Content here.
```

Common callout types: `NOTE`, `TIP`, `IMPORTANT`, `WARNING`, `CAUTION`, `INFO`, `TODO`, `QUOTE`, `ABSTRACT`, `SUCCESS`, `FAILURE`, `DANGER`, `BUG`, `EXAMPLE`

### Rules
- The `[!TYPE]` must be on the first line of the blockquote
- A `-` after the type makes it collapsible and collapsed by default; a `+` makes it collapsible but expanded by default
- All lines of the callout body must be prefixed with `> `

---

## 9. Standard Markdown That Works Safely

These standard Markdown features render correctly in Obsidian and are safe to use:

| Feature | Syntax |
|---|---|
| Bold | `**bold**` |
| Italic | `*italic*` or `_italic_` |
| Strikethrough | `~~strikethrough~~` |
| Inline code | `` `code` `` |
| Code block | ` ```language ` ... ` ``` ` |
| Horizontal rule | `---` (on its own line, not in frontmatter) |
| Unordered list | `- item` or `* item` |
| Ordered list | `1. item` |
| Checkbox | `- [ ] task` / `- [x] done` |
| Blockquote | `> text` |
| Table | Standard GFM table syntax |
| External link | `[text](https://example.com)` |
| Footnote | `[^1]` with `[^1]: definition` at bottom |

---

## 10. What to Never Do

| Action | Why |
|---|---|
| Use `[text](other-note.md)` for internal links | Bypasses graph, breaks on vault moves |
| Edit anything inside `.obsidian/` | Corrupts workspace, plugin, and appearance config |
| Add blank lines before frontmatter `---` | Frontmatter will not be parsed |
| Use duplicate `# H1` headings | Confuses Obsidian's outline and link resolution |
| Add block IDs with spaces or special chars | Will not resolve correctly |
| Rename a file without updating backlinks | Creates broken wikilinks across the vault |
| Use HTML for layout | Partially supported; avoid unless necessary |
| Hard-wrap lines mid-paragraph | Obsidian treats each line break as a continuation — this is fine, but be consistent |

---

## 11. Vault Structure Conventions (check before writing)

Before creating or editing files, verify the vault's existing conventions:

- **Where are attachments stored?** (images, PDFs) — match that folder
- **Is there a templates folder?** — don't create files there unless making a template
- **What frontmatter fields are used consistently?** — add the same fields to new notes
- **Are filenames spaces or kebab-case?** — match the existing convention
- **Is there a root index or MOC (Map of Content)?** — new notes may need to be linked from it

---

## 12. Checklist Before Saving a File

- [ ] Frontmatter starts on line 1 with no blank lines above it
- [ ] All `[[wikilinks]]` point to files that exist (or will exist) in the vault
- [ ] No `.md` extensions inside wikilinks
- [ ] No heading text was changed that other notes link to via `[[note#Heading]]`
- [ ] Block IDs (if added) are unique within the file and use only `a-z`, `0-9`, `-`
- [ ] Tags follow the vault's existing convention
- [ ] The file is valid UTF-8 with no stray binary characters
- [ ] Filename matches the vault's naming convention

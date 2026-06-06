---
title: Aethercourt Aesthetic Corrections + Vanilla-Integration Specifics — Decision Log (NotebookLM)
tags:
  - design-history
  - notebooklm
  - core
  - aesthetic
  - monuments
created: 2026-06-05
status: locked
sources:
  - notebooklm-conversation.md lines 213-340
  - "[[_notebooklm-chat-index]]"
---

# Aethercourt Aesthetic Corrections + Vanilla-Integration Specifics — Decision Log (NotebookLM)

## Why this dh exists

A verify-pass against [[dh-foundation-aesthetic-reference]] confirmed that the *broad* aesthetic direction (vanilla integration, modular non-spire monument, no glow effects, medieval-provincial baseline) is already captured in the vault. But the NotebookLM chat at L213-340 adds **load-bearing specifics** that are not currently in the vault — diamond-tile roof geometry, washed-out color rules, color-variant scheme, an explicit modding-API constraint, and a clean prohibition on polished limestone. These warrant their own decision log.

This chat segment is also where Anton explicitly **flagged earlier Gemini descriptions as hallucinations** (L260 onward), so it doubles as the formal paper-trail record of that supersession.

## What's affirmed (already in vault — no action needed)

- The Aethercourt sits inside Foundation's vanilla artstyle, not a separate visual island.
- The monument is **modular, piece-by-piece**, scaling at higher tiers via the tech tree — NOT a massive tower or spire (L270, L286, L312-314).
- General medieval-provincial materials (exposed stone, half-timber framing, white plaster, dark oak beams).

These are already in [[dh-foundation-aesthetic-reference]], [[foundation-aesthetic-reference]], [[the-aethercourt]] and [[dh-the-aethercourt]]. Sources update only.

## What's locked here (new / refined specifics)

### 1. Custom diamond-roof tiles — the signature visual marker

The monument's most distinguishing visual element is **custom roof textures featuring interlocking diamond-shaped roof tiles** (L264, L300). This separates the Aethercourt from the Manor, Monastery, and Castle on a glance.

This is the single most concrete aesthetic add from the chat — every other estate's roof reads at a glance because of its tile shape, and the Aethercourt now does too.

### 2. Roof color palette — washed-out, with player-choice variants

- **Default:** non-intrusive **light purple** (L264, L302, L336).
- **Variants available:** brown, black, green, blue — each hued specifically so they don't clash with the other estates' roof colors (L264, L304, L338).
- **Color rule:** the vanilla roof textures use **slightly washed-out colors** to avoid intensity that would distract the player; the Aethercourt's custom roofs strictly follow this (L322, L334).

The washed-out rule is broader than just roofs — it's a vanilla style principle the mod must respect everywhere it adds custom textures.

### 3. Faceted Aether Crystals: decorative accent, NOT core building material

- The crystals are not a core building material (L266, L308).
- They may be used as accent/decoration (e.g., window inlays, engraved-rune inserts).
- If used in any building part or decoration, they are **available in different colors** so players can customize them the same way as the monument roofs (L276, L310).

This contradicts Gemini's earlier hallucinated framing (windows entirely filled with glowing Faceted Aether Crystals) but is consistent with the vault's current silence on crystal-as-building-material — the vault never adopted Gemini's framing, so this is a refinement rather than an overwrite.

### 4. Doors and windows — distinct designs, vanilla artstyle

The Aethercourt has its own door and window designs (not reused from other estates), but these must still strictly follow the vanilla artstyle, look, and feel (L268, L296). No specific geometry was locked in this chat segment; left for future part-design.

### 5. No polished limestone — explicit prohibition

The earlier Gemini framing called for "polished white/light grey limestone" as the primary building material for the Aethercourt's core tower (L246, L252). Anton explicitly removed this at L274: "There will be NO (polished) limestone!"

This is now locked. The Aethercourt uses the same field stone / plaster / timber as the rest of vanilla Foundation.

### 6. Modding-API constraint — no custom light sources

> "The modding API doesn't allow for custom light sources, so there will not be any glow effects currently." (L272)

This is a load-bearing developer / pipeline constraint that touches every aesthetic decision involving "glow", "luminescence", "emissive", etc. NotebookLM's later report (Phase 1 finding) gave a workaround direction — emissive effects must be handled via standard vertex colors and HDR-capable RGBA channels rather than custom light code. That workaround is recorded in [[master-to-do]] forgotten-items as a developer-tuning task; this dh captures the constraint itself.

This affects (at minimum):
- [[arcane-lyceum]] — any glowing-rune or astral-light treatment must use vertex-color / HDR-RGBA techniques.
- [[dh-notebooklm-charged-containers]] — the charged container decorations described as "floating runes" and "luminous" must comply.
- All future "glowing" decoration design — see Cluster 6 work.

## Superseded — paper trail

### Gemini hallucinations explicitly retired

Anton at L260 marked the following Gemini-era descriptions of the Aethercourt as **incorrect guesses / hallucinations**, retroactively:

| Hallucinated Gemini detail (Gemini chat) | Replaced by |
| --- | --- |
| Faceted Aether Crystal windows that glow Light Cyan/Teal | Crystals as colored decorative accents only; no glow |
| Soft Light Cyan/Teal glow from engraved runes set into stone | No custom light sources at all (API constraint) |
| Polished white/light grey limestone as primary building material | Vanilla field stone / plaster / timber; no polished limestone |
| Tiered, massive Academic Tower/Spire | Modular piece-by-piece monument; not a tower |

Cite this dh whenever you encounter remnants of the Gemini glow / limestone / spire framing in older notes.

### Rustic / Modest naming was the early naming convention

L278 captures the chat's then-current decision: T1 parts are `Rustic X/Y`, higher-tier parts are `Modest X/Y`. **This naming convention has since been superseded** — see [[dh-notebooklm-tech-unlock-naming]] for the Scholastic / Arcane progression Anton locked at L1996 (with T1+T2 part-prefix `Scholastic` and T3+ core-mod prefix `Arcane`). Recorded here for completeness of the L213-340 segment.

## Implications for existing vault notes

- [[foundation-aesthetic-reference]] — add the washed-out-color rule as a vanilla style principle; add the no-custom-light-sources API constraint to the architectural-characteristics section.
- [[the-aethercourt]] — add the diamond-tile roof signature + color-variant scheme to the "Architectural language" section.
- [[dh-foundation-aesthetic-reference]] — sources array can add `notebooklm-conversation.md lines 213-340` as a supporting citation.
- [[3d-modeling-pipeline]] — the diamond-tile geometry, color-variant approach, and washed-out palette belong in the asset-pipeline note.
- [[arcane-lyceum]] — flag the no-glow constraint; any "luminous" treatment must use vertex-color / HDR-RGBA workaround.
- [[estate-identity]] — the heraldry/splendor color choice is unaffected; the lavender/purple is independent of the building-material question.

## Cross-links

- [[dh-foundation-aesthetic-reference]] — vault baseline this dh complements
- [[dh-the-aethercourt]] — Aethercourt naming history
- [[dh-notebooklm-tech-unlock-naming]] — the Rustic/Modest convention that L278 referenced is superseded here
- [[dh-notebooklm-charged-containers]] — "luminous"/"floating" decoration framing must respect the no-light-sources constraint
- [[foundation-aesthetic-reference]], [[the-aethercourt]], [[3d-modeling-pipeline]], [[arcane-lyceum]]
- [[_notebooklm-chat-index]]
- [[_notebooklm-merge-plan]]
- [[master-to-do]] — vertex-color / HDR-RGBA workaround is a developer task

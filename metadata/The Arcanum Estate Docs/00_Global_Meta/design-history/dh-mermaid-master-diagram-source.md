---
title: Master Mermaid Diagram — Aethercourt (Source)
tags:
  - design-history
  - core
  - paper-trail
  - historical-snapshot
created: 2026-06-04
status: historical-snapshot
sources:
  - "Foundation-The-Arcanum-Estate-gemini-conversation.md lines 5333-5415"
---

# Master Mermaid Diagram — Aethercourt (Source)

> [!NOTE] Historical snapshot — not maintained
> This is a verbatim copy of the Mermaid diagram Gemini generated at the end of the original chat (lines 5333-5415). It captures Gemini's view of the final design at that moment.
>
> **Decision (2026-06-04):** the diagram will not be validated or repaired. The reasoning, briefly:
> - The block contains Mermaid syntax errors (multi-target `-->` arrows, duplicate node ID redefinitions inside subgraphs) and will not render in Obsidian as-is.
> - All the information it tries to convey is now captured in the structured notes — see [[_the-aethercourt]], [[core-buildings]], [[aetherian-progression]], [[core-economy]], [[need-discourse]], and [[aether-envoy]].
> - Obsidian's built-in **graph view** provides a live, auto-generated visualization of the same relationships from the wikilinks across the vault — no manual maintenance required.
> - If a focused visual aid is ever needed (e.g., for a Discord post or a tutorial), drafting a small, scope-limited Mermaid diagram inside the relevant note will be cheaper than repairing this one.
>
> The block is kept here unchanged as a paper-trail artifact only.

## Verbatim source

```mermaid
graph TD
    subgraph "Arcanum Estate: The Aethercourt (Core Monument)"

        direction LR

        %% Statuses
        A[Aspirant] --> B(Arcanist)
        B --> C(Loremaster)

        %% Collective Term
        subgraph "Collective Term"
            A(Aspirant) --- AETH(Aetherian)
            B(Arcanist) --- AETH
            C(Loremaster) --- AETH
        end

        %% Jobs
        subgraph "Jobs"
            ASP_JOB(Scholar) -- "Researches science..." --> A
            ARC_JOB(Caster) -- "Applies mastered principles..." --> B
            LOR_JOB(Loremaster) -- "Gives lectures" --> C
        end

        %% Resources
        subgraph "Resources"
            R1(Aether Crystal)
            R2(Glyph)
            R3(Faceted Aether Crystal)
            R4(Arcane Lore)
        end

        %% Sub-Buildings & Interactions
        subgraph "Sub-Buildings"
            ACMC[Aether Crystal Mining Camp] -- "Mine" --> R1
            ACMC -- "Serf" --> ASP_JOB

            ACADEMY[Academy] -- "Produce" --> R2
            ACADEMY -- "Scholar" --> ASP_JOB

            AETHERIUM[Aetherium] -- "Refine" --> R4
            AETHERIUM -- "Caster" --> ARC_JOB

            LAPIDARY[Lapidary] -- "Refine" --> R3
            LAPIDARY -- "Lapidarist" --> B

            ANNEX[Annex] -- "Sleep/Study" --> A, B, C

            ARCHIVE[Archive] -- "Storage" --> R2, R4
            AETHER_HOLD[Aether Hold] -- "Storage" --> R1, R3

            ARC_LYCEUM[The Arcane Lyceum] -- "Fulfills Need" --> AETH
            ARC_LYCEUM -- "Loremaster" --> C
            ARC_LYCEUM -- "Provides Discourse" --> LOR_JOB
        end

        %% Needs
        subgraph "Needs"
            NEED_DISCOURSE(Discourse) -- "Must attend advanced lectures..." --> B, C
            NEED_DISCOURSE --> ARC_LYCEUM
            ASP_JOB -- "Has Basic Needs" --> A
            ARC_JOB -- "Has Basic Needs" --> B
            LOR_JOB -- "Has Basic Needs" --> C
        end

        %% External Role
        subgraph "External Role"
            AE_ROLE(Aether Envoy) -- "Communicates with" --> GC(Grand Council)
            AE_ROLE --> C
        end

    end

```

## Cross-links

- [[_the-aethercourt]]
- [[dh-discourse-need]]
- [[dh-aether-envoy]]
- [[dh-arcane-lyceum]]
- [[aetherian]]

---
title: Dependency Logic — Core mod and expansion gating
tags:
  - meta
  - architecture
  - lua
created: 2026-06-04
status: design-locked-implementation-tbd
sources:
  - "metadata/Docs/Gemini-raw-chat-parsing-instructions.md (architectural intent)"
  - "[[project-brief]]"
---

# Dependency Logic — Core mod and expansion gating

## Final state

The Arcanum Estate is delivered as **one required core mod plus four optional expansion mods**:

| Mod folder | Required? | Depends on |
| --- | --- | --- |
| `01_Mod_Core_Arcanum` | required | — |
| `02_Mod_Citadel_of_Light` (Paladin) | optional expansion | `01_Mod_Core_Arcanum` |
| `03_Mod_Sacred_Grove` (Druid) | optional expansion | `01_Mod_Core_Arcanum` |
| `04_Mod_Bloodforged_Spire` (Sorcerer) | optional expansion | `01_Mod_Core_Arcanum` |
| `05_Mod_Atheneum_Tower` (Mage) | optional expansion | `01_Mod_Core_Arcanum` |

Each expansion adds **one Tier-3 specialization monument** (see [[dh-monument-architecture]]) plus its associated work professions, status ranks, and any specialized sub-buildings. None can function without the Core Arcanum mod, because every expansion shares the core economy ([[core-economy]]), the core progression ladder ([[aetherian-progression]]), and the [[_the-aethercourt]] as the entry point.

Expansions do **not** depend on each other. A player can install Citadel of Light without installing Sacred Grove, or any combination.

## Enforcement strategy

Dependency enforcement is the responsibility of the **Lua modding API**. The exact mechanism is `[TBD]` pending confirmation from the modding API documentation — see https://www.polymorph.games/foundation/modding/start.

Two enforcement layers to plan for:

### Layer 1 — Mod manifest declaration

Each expansion mod's `mod.json` should declare a dependency on the Core Arcanum mod's mod ID. If the Foundation modding system supports manifest-level dependency declarations (similar to Steam Workshop dependencies or game-engine plugin manifests), this is the cleanest layer.

`[TBD]` — verify exact manifest key (e.g. `requires`, `dependencies`, `prerequisites`) against the modding API.

### Layer 2 — Lua runtime guard

If manifest-level enforcement is unavailable or insufficient, each expansion's `mod.lua` entry point should perform a runtime check at load: confirm the Core Arcanum mod's tag / namespace is present, and fail loudly with a localized error message if not.

Pseudo-code:

```lua
-- Inside expansion mod's mod.lua
if not Mods.IsLoaded("arcanum_core") then
    error("The " .. ModName .. " expansion requires The Arcanum Estate core mod to be installed and enabled.")
end
```

`[TBD]` — confirm actual Foundation modding API for mod-presence checking. The function name and namespace shown above are illustrative.

## Shared assets and namespaces

Because expansions read core mod assets (the [[_the-aethercourt]] sub-buildings, [[core-economy|core resources]], shared icons), there must be a stable namespace convention. Suggested convention:

- Core mod namespace: `arcanum_core` or `arcanum`
- Expansion namespaces: `arcanum_paladin`, `arcanum_druid`, `arcanum_sorcerer`, `arcanum_mage`

Resource and building IDs are prefixed with the namespace to avoid collisions with vanilla or other mods.

`[TBD]` — confirm namespacing requirements against the modding API conventions.

## Failure modes to design for

- **Expansion installed, core absent:** loud error at load, mod disables itself. (See Layer 2.)
- **Core updated, expansion not updated:** expansion may rely on a core API/resource that changed. Mitigate by versioning the core mod's public API and having expansions declare a minimum core version.
- **Two expansions installed:** must coexist without name collisions. The namespace convention above handles this if applied consistently.

## Open questions

- Does Foundation's modding API expose a built-in "this mod requires this other mod" mechanism? — see [[master-to-do]] action item.
- Is there a load-order guarantee, or do we need to defer expansion init via a hook that fires after all mods load? — `[TBD]`.

## Cross-links

- [[project-brief]] — the brief outlines the one-core-plus-four-expansions structure.
- [[dh-monument-architecture]] — each expansion adds one Tier-3 monument.
- [[_the-aethercourt]] — the core monument all expansions extend from.
- [[master-to-do]] — open action items related to dependency enforcement.

---
title: Mage Path Specialization Jobs — Decision Log
tags:
  - design-history
  - expansion-mage
  - jobs
created: 2026-06-04
status: locked
sources:
  - Foundation-The-Arcanum-Estate-gemini-conversation.md lines 1464-1851
final_note: "[[dh-mage-path-jobs]]"
---

# Mage Path Specialization Jobs — Decision Log

> **Scope note:** The Mage path is expansion content and is **out of current implementation scope**. Anton's first pass focuses on the common Aspirant + Arcanist tier only. These four jobs are captured here for the future expansion but are not yet implemented in the mod.

## Final state

Four element-specialized Work Professions for **Mage / Arch Mage** units (Lvl 1–10), each a two-word title using a unique starting consonant (W / S / F / M alliteration across the word pair):

| Element | Work Profession | Alliteration | Thematic Focus |
| --- | --- | --- | --- |
| Wind | **Wind Weaver** | W/W | Atmospheric / current control |
| Earth | **Stone Shaper** | S/S | Solid creation / construction |
| Fire | **Flame Forger** | F/F | Volatile heat / creation |
| Water | **Mist Maker** | M/M | Subtle / gaseous creation and control |

Design constraints that locked in this set:
- Two-word job titles (like military Spearman/Bowman but more poetic).
- Each pair alliterates internally (W W, S S, F F, M M).
- Each pair starts with a **unique consonant** — no two specializations share a starting letter.
- The water choice picks a specific *form* of water (mist) rather than generic "water," mirroring how Earth specifically uses Stone.

## Iteration history

The path from generic Elementalist to the final W/S/F/M set ran roughly 360 lines of back-and-forth. Compressed:

1. **Starting point — Elementalist** (single shared job). Anton wanted four distinct jobs instead, one per element, modeled on military specialization (Spearman / Bowman analogue).
2. **Single-word sets explored.** Action set (Skycaller, Hydros, Pyron, Terran) and creation set (Aeronaut, Aquaflow, Cinder, Geomancer) both rejected. A more technical set (Aervite, Aquist, Pyrist, Lithos) also rejected.
3. **Pivot to two-word titles** (inspired by "fire bender / earth singer"). First batch produced Cloud Weaver, Tide Binder, Blaze Shaper, Stone Crafter.
4. **Stone Shaper** (Earth) confirmed early. Flame Wielder briefly held the Fire slot.
5. **Alliteration constraint imposed.** Anton noticed Wind Weaver and Stone Shaper both alliterate, and made internal alliteration a hard rule. Flame Wielder upgraded to **Flame Forger** for stylistic consistency.
6. **Long water search.** The water slot took the bulk of the iteration:
   - Wave Worker, Water Warden, Wave Wielder, Whirl Weaver, Well Watcher — all rejected.
   - Form-of-water suggestions: Frost Former, Mist Master, Frost Fuser, Freeze Former — closer, but not right.
   - Ice variants explored (Ice Carver, Ice Inscriber, Ice Invoker, Ice Implanter) — all broke the unique-consonant rule because they reused I/I awkwardly and didn't sit alongside W/S/F.
7. **Unique-consonant rule added.** Anton refined the constraint: each element's title must start with a *different* consonant. Candidates: Current Carver (C), Tide Tracer (T), Mist Maker (M), Glacier Guide (G), Rain Rigger (R), Vapor Vendor (V).
8. **Locked: Mist Maker** (L1828–1851). The final W/S/F/M set is confirmed.

## Abandoned options

Notable rejected titles, grouped by element:

- **Wind:** Skycaller, Aeronaut, Aervite, Storm Caller, Sky Runner, Air Shaper, Gale Master, Gale Keeper, Vortex Shaper, Cloud Weaver.
- **Earth:** Terran, Lithos, Geomancer, Root Shaper, Geo Binder, Clay Mixer, Stone Crafter.
- **Fire:** Pyron, Cinder, Pyrist, Pyro Tender, Heat Tracer, Ember Watch, Blaze Shaper, Flame Wielder (the precursor to Flame Forger).
- **Water:** Hydros, Aquaflow, Aquist, Wave Worker, Wave Wielder, Water Warden, Water Wielder, Whirl Weaver, Well Watcher, Well Wielder, Tide Binder, Tide Tracer, Tide Controller, Wave Keeper, Liquid Weaver, Aqua Flow, Flow Master, Mist Weaver, Mist Master, Frost Former, Frost Fuser, Freeze Former, Ice Carver, Ice Inscriber, Ice Invoker, Ice Implanter, Ice Channeler, River Runner, Weir Watcher, Wetland Warden, Moor Mender, Water Whisperer, Current Carver, Glacier Guide, Rain Rigger, Vapor Vendor.
- **Generic single-word umbrella:** Elementalist — discarded once the four-way split was committed to.

## Cross-links

- [[dh-aspirant-arcanist-jobs]]
- [[mage]]
- [[arch-mage]]
- [[wind-weaver]]
- [[stone-shaper]]
- [[flame-forger]]
- [[mist-maker]]

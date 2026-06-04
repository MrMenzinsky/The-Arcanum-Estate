## Instructions for the Parsing AI

**Objective:** Parse the raw chat markdown export and convert it into a structured, interconnected Obsidian Vault for "The Arcanum Estate" project.

**Architectural Note:** This project consists of a required core mod and four separate, dependent expansion mods. The folder structure must use numerical prefixes to maintain a strict visual hierarchy and prevent alphabetical scrambling.

### Desired Folder Hierarchy

A suggestion on how the folder structure should look:

```text
The Arcanum Estate Docs/
├── 00_Global_Meta/
├── 01_Mod_Core_Arcanum/
├── 02_Mod_Citadel_of_Light/
├── 03_Mod_Sacred_Grove/
├── 04_Mod_Bloodforged_Spire/
└── 05_Mod_Mages_Sanctum/

```

*(Note: Adjust the final folder name for the Mage expansion based on the specific monument name chosen).*

---

### Content Distribution & Note Creation

Extract the specific details from the chat and create individual `.md` files within their respective project folders. Do not create sub-folders; keep the architecture flat within each numbered root folder.

### 00_Global_Meta (Project Management)

* **`Project_Brief.md`:** Insert the completed project brief template, outlining the grand vision for the base mod and its modular expansions.
* **`Master_To-Do.md`:** Extract pending tasks, including final UI icon selection and detailing the remaining specializations.
* **`Dependency_Logic.md`:** Document that mods 02 through 05 require 01 to be installed, utilizing the Lua modding API for enforcement.

### 01_Mod_Core_Arcanum (The Base Mod)

* **`Estate_Identity.md`:** Define the overarching intellectual/scientific magic theme. Include the finalized heraldry visual identity (Soft Purple/Lavender metal, Flared Top with Sharp Points shield shape).
* **`The_Aethercourt.md`:** Detail the central hub monument. Preserve any Mermaid diagram code blocks exactly as generated.
* **`Core_Buildings.md`:** Document the Academy, Aetherium, Lapidary, and The Arcane Lyceum.
* **`Aetherian_Progression.md`:** Outline the core social ladder (Aspirant, Arcanist, Loremaster).
* **`Core_Economy.md`:** Detail the production chains for Aether Crystal, Glyph, Faceted Aether Crystal, and Arcane Lore.
* **`Need_Discourse.md`:** Document the custom need replacing "Entertainment" for T2+ units.

### 02_Mod_Citadel_of_Light (Paladin Expansion)

* **`Paladin_Design.md`:** Extract all notes regarding the militaristic, light-wielding specialization.
* **`Citadel_of_Light.md`:** Document the core monument for this expansion.
* **`Military_Workplaces.md`:** Detail the Training Workplace and associated military jobs.

### 03_Mod_Sacred_Grove (Druid Expansion)

* **`Druid_Design.md`:** Extract notes related to the nature-based magic specialization.
* **`Sacred_Grove.md`:** Document the core monument for this expansion.

### 04_Mod_Bloodforged_Spire (Sorcerer Expansion)

* **`Sorcerer_Design.md`:** Extract notes related to the blood-magic specialization.
* **`Bloodforged_Spire.md`:** Document the core monument for this expansion.

### 05_Mod_Mages_Sanctum (Mage Expansion)

* **`Mage_Design.md`:** Extract notes related to the pure/academic mage specialization.
* **`Mage_Monument.md`:** Document the core monument for this expansion.

---

### Obsidian Formatting Directives (Critical)

* **Wikilinks as Connective Tissue:** Aggressively use Obsidian wikilinks (`[[Note Name]]`) to connect concepts across different mods. An expansion unit note in `02_Mod_Citadel_of_Light` must link back to core resources like `[[Aether_Crystal]]` located in `01_Mod_Core_Arcanum`.
* **Frontmatter:** Add YAML frontmatter to every note for database querying. Include tags like `#core`, `#expansion`, `#building`, or `#resource`.
* **Code Blocks:** Ensure all markdown formatting, tables, and specifically `mermaid` charts remain intact.
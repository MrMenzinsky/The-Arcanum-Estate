--[[
    building_parts.lua
    Helpers for registering two-scaler building models with Foundation's asset system.

    HOW TO USE THIS MODULE
    ----------------------
    In any building_parts.lua file, load this module first and capture its return value:

        local mod = ...
        local buildingParts = mod:dofile("scripts/utils/building_parts.lua")

    Then define a config table for each building model and register it:

        local myBuildingConfig = { ... }
        buildingParts.registerModel(mod, myBuildingConfig)

    Foundation's mod:dofile() propagates the return value of the loaded chunk,
    so `return utils` at the bottom of this file is what `buildingParts` receives.

    LUA QUICK REFERENCE FOR NON-LUA DEVELOPERS
    -------------------------------------------
    String concat:  "a" .. "b"  gives  "ab"    (not "a" + "b")
    Nil = absent:   A table field set to nil simply does not exist in the table.
                    { a = 1, b = nil }  is identical to  { a = 1 }
                    Foundation treats absent fields as "not set" — no null errors.
    Array length:   #myTable  returns the number of entries in an array table.
    For-loops:      for _, v in ipairs(t) do ... end
                    ipairs() iterates a 1-based sequential array table.
                    `_` is the conventional Lua discard variable (we ignore the index).
    Colon syntax:   mod:registerAsset(...)  is shorthand for
                    mod.registerAsset(mod, ...)  — passes mod as the implicit first arg.
]]


local utils = {}


-- ─────────────────────────────────────────────────────────────────────────────
-- PRIVATE HELPERS
-- ─────────────────────────────────────────────────────────────────────────────

-- Derives the all-caps BUILDING_PART asset ID from an FBX prefab node name.
-- Convention in this mod: part IDs are always string.upper(prefab_node_name).
-- e.g. "2_Small_House_Stone_Filler_1_Part" → "2_SMALL_HOUSE_STONE_FILLER_1_PART"
local function partId(prefabName)
    return string.upper(prefabName)
end


-- Returns a new array table with entries in reverse order.
-- Used to convert a natural ascending filler list [filler_1, filler_2, filler_3]
-- into the [filler_3, filler_2, filler_1] order that Foundation's scaler expects.
-- Foundation cycles the FillerList from the last entry toward the first as the
-- building is scaled up, so reversing here produces a natural ascending visual result.
local function reversed(list)
    local result = {}
    for i = #list, 1, -1 do          -- #list is the array length; counting down with -1 step
        result[#result + 1] = list[i] -- #result + 1 appends to the end of the new array
    end
    return result
end


-- Registers one BUILDING_CONSTRUCTOR_DEFAULT part (a filler segment or end/roof part).
-- The part ID is derived from the prefab name using the all-caps convention.
-- The CoreObjectPrefab is always "PREFAB_" .. id, matching the asset ID registered
-- in step 2 of registerModel.
-- capacity and cost are passed through as-is; nil means "not set" in Foundation.
local function registerDefaultPart(mod, prefabName, capacity, cost)
    local id = partId(prefabName)
    mod:registerAsset({
        DataType        = "BUILDING_PART",
        Id              = id,
        ConstructorData = {
            DataType        = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = "PREFAB_" .. id,
        },
        Capacity = capacity,
        Cost     = cost,
    })
end


-- ─────────────────────────────────────────────────────────────────────────────
-- PUBLIC API
-- ─────────────────────────────────────────────────────────────────────────────

-- Registers material asset IDs from a list of { id, model, name } entries.
-- Each entry maps one FBX material node to the all-caps asset ID used in
-- MaterialSetList definitions. Call this once before any registerModel calls.
-- When two FBX files share the same material node name, give each entry a
-- unique id — mod:registerAssetId is first-registration-wins and silently
-- ignores any later registration for the same id.
function utils.registerMaterials(mod, list)
    for _, mat in ipairs(list) do
        mod:registerAssetId(
            "models/" .. mat.model .. "/Materials/" .. mat.name,
            mat.id
        )
    end
end


-- Registers MATERIAL_SET_LIST assets from a list of { id, sets } entries.
-- Each entry becomes one recoloring swatch selector in the build UI.
-- sets format: { { name = "LABEL", icon = "ICON_ID", materials = { "MAT_ID" } }, ... }
-- Call this once after registerMaterials, before any registerModel calls.
function utils.registerMaterialSetLists(mod, list)
    for _, setListConfig in ipairs(list) do
        local materialSetList = {}
        for _, s in ipairs(setListConfig.sets) do
            materialSetList[#materialSetList + 1] = {
                SetName                   = s.name,
                AssetSelectionButtonImage = s.icon,
                MaterialList              = s.materials,
            }
        end
        mod:registerAsset({
            DataType        = "MATERIAL_SET_LIST",
            Id              = setListConfig.id,
            MaterialSetList = materialSetList,
        })
    end
end


--[[
    utils.registerModel(mod, config)

    Registers all Foundation assets for a two-scaler building model in one call:
      1. Asset processor (FBX attach-point parsing)
      2. Prefab asset IDs (all meshes in the scaler chain)
      3. Filler and roof parts (BUILDING_CONSTRUCTOR_DEFAULT)
      4. Top scaler root (BUILDING_CONSTRUCTOR_SCALER — capped by the roof)
      5. Bottom scaler root (BUILDING_CONSTRUCTOR_SCALER — capped by the top scaler)
    Materials and material-set lists must be registered separately beforehand
    via registerMaterials() and registerMaterialSetLists().

    CONFIG TABLE SCHEMA
    ───────────────────
    Required fields:
      config.filename       string  FBX file relative to models/
                                    e.g. "small_house_010.fbx"
      config.rootId         string  BUILDING_PART asset ID for the bottom scaler root.
                                    This is the ID you put in the BUILDING's AssetBuildingPartList.
                                    Does not have to match the FBX node name (can be a friendly name).
      config.bottom         table   See BOTTOM SECTION below.
      config.top            table   See TOP SECTION below.

    Optional fields:
      config.category       string  BUILDING_PART_TYPE for the root, e.g. "ROOM".
      config.name           string  Localization key for the root part's display name.
      config.description    string  Localization key for the root part's description.
      config.materialSetList string Asset ID of a MATERIAL_SET_LIST for recoloring the root.
      config.zone           polygon The polygon shape of the navigable zone. Use any Foundation
                                    polygon value directly — it is passed straight to the Polygon
                                    field inside ZoneEntryList with no conversion.
                                    Examples:
                                      polygon.createRectangle({ 4.0, 6.0 })
                                      polygon.createCircle(3.0)
                                      polygon.createCircle(3.0, {0,0}, 8)  -- 8-sided approximation
                                      { {5.5,5.5}, {5.5,-3.5}, {-3.5,-3.5}, {-3.5,5.5} }  -- custom shape

    BOTTOM SECTION (config.bottom)
      Required:
        .prefab             string  FBX node name for the base mesh (mixed case as exported).
        .fillers            table   Array of filler entries (see FILLER ENTRY).
                                    List them in ASCENDING order [filler_1, filler_2, ...];
                                    the helper reverses them for Foundation's FillerList.
      Optional:
        .capacity           number  Capacity contribution of the bottom scaler root.
        .cost               table   Foundation BUILDING_PART_COST table:
                                      { UpkeepCost = { {Resource="X", Quantity=N}, ... },
                                        ResourceNeededList = { { {Resource="X", Quantity=N}, ... }, ... } }
        .isRepeatLastFiller bool    Passed through to BUILDING_CONSTRUCTOR_SCALER.

    TOP SECTION (config.top)
      Required:
        .prefab             string  FBX node name for the mid-level transition mesh.
        .fillers            table   Array of filler entries (ascending order).
        .roof               table   Single filler entry for the topmost end/cap part.
      Optional:
        .capacity           number
        .cost               table
        .category           string  BUILDING_PART_TYPE for the top scaler root.
        .gizmoHeightOffset  number  Vertical offset for the height-drag gizmo in the editor.
        .isRepeatLastFiller bool

    FILLER ENTRY (used in .fillers array and .roof)
      .prefab               string  FBX node name (mixed case).
      .capacity             number  (optional)
      .cost                 table   Foundation BUILDING_PART_COST table (optional)
]]
function utils.registerModel(mod, config)

    -- ── Step 1: Asset processor ────────────────────────────────────────────
    -- Tells Foundation to parse the FBX and extract attach-point nodes
    -- (Attach_Bottom, Attach_Top etc.) that the scaler system uses to
    -- snap building segments together correctly.
    mod:registerAssetProcessor("models/" .. config.filename, {
        DataType = "BUILDING_ASSET_PROCESSOR"
    })


    -- ── Step 2: Register prefab asset IDs ─────────────────────────────────
    -- Maps every FBX prefab node path to an all-caps asset ID string.
    -- Path inside FBX uses the original mixed-case node name; the asset ID
    -- uses string.upper() of the same name, prefixed with "PREFAB_".
    -- Example: "1_Small_House_Bottom_Part" → PREFAB_1_SMALL_HOUSE_BOTTOM_PART
    local allPrefabs = {}

    allPrefabs[#allPrefabs + 1] = config.bottom.prefab
    for _, filler in ipairs(config.bottom.fillers) do
        allPrefabs[#allPrefabs + 1] = filler.prefab
    end

    allPrefabs[#allPrefabs + 1] = config.top.prefab
    for _, filler in ipairs(config.top.fillers) do
        allPrefabs[#allPrefabs + 1] = filler.prefab
    end

    allPrefabs[#allPrefabs + 1] = config.top.roof.prefab

    for _, prefabName in ipairs(allPrefabs) do
        mod:registerAssetId(
            "models/" .. config.filename .. "/Prefab/" .. prefabName,
            "PREFAB_" .. partId(prefabName)
        )
    end


    -- ── Steps 3–5: Register all BUILDING_CONSTRUCTOR_DEFAULT parts ─────────
    -- These must be registered BEFORE the scalers that reference them,
    -- because Foundation resolves EndPart and FillerList IDs at load time.

    -- Step 3: Roof end part — terminates the top scaler chain.
    registerDefaultPart(mod,
        config.top.roof.prefab,
        config.top.roof.capacity,
        config.top.roof.cost
    )

    -- Step 4: Top section filler parts.
    for _, filler in ipairs(config.top.fillers) do
        registerDefaultPart(mod, filler.prefab, filler.capacity, filler.cost)
    end

    -- Step 5: Bottom section filler parts.
    for _, filler in ipairs(config.bottom.fillers) do
        registerDefaultPart(mod, filler.prefab, filler.capacity, filler.cost)
    end


    -- ── Step 6: Register the top scaler root ──────────────────────────────
    -- This is the mid-level anchor mesh. It scales through the plaster fillers
    -- and terminates at the roof part.
    -- FillerList is reversed from config order: config lists fillers ascending
    -- [1,2,3] for readability; Foundation cycles last-to-first, so reversed order
    -- [3,2,1] produces the natural ascending visual result as height increases.
    local topFillerIds = {}
    for _, filler in ipairs(config.top.fillers) do
        topFillerIds[#topFillerIds + 1] = partId(filler.prefab)
    end
    topFillerIds = reversed(topFillerIds)

    -- This ID is derived from the prefab name, not from a custom rootId.
    -- The bottom scaler references it as EndPart.
    local topScalerId = partId(config.top.prefab)

    mod:registerAsset({
        DataType        = "BUILDING_PART",
        Id              = topScalerId,
        Category        = config.top.category,
        ConstructorData = {
            DataType          = "BUILDING_CONSTRUCTOR_SCALER",
            CoreObjectPrefab  = "PREFAB_" .. topScalerId,
            EndPart           = partId(config.top.roof.prefab),
            FillerList        = topFillerIds,
            IsRepeatLastFiller = config.top.isRepeatLastFiller,
            GizmoHeightOffset = config.top.gizmoHeightOffset,
        },
        Capacity = config.top.capacity,
        Cost     = config.top.cost,
    })


    -- ── Step 7: Register the bottom scaler root ────────────────────────────
    -- This is the part the player places from the build menu. It uses config.rootId
    -- as its asset ID (a friendly name, not derived from the prefab node name).
    -- It scales through the stone fillers and terminates at the top scaler root.
    local bottomFillerIds = {}
    for _, filler in ipairs(config.bottom.fillers) do
        bottomFillerIds[#bottomFillerIds + 1] = partId(filler.prefab)
    end
    bottomFillerIds = reversed(bottomFillerIds)

    -- Wrap config.zone (a polygon value) in Foundation's ZoneEntryList structure.
    -- config.zone is passed through as-is to the Polygon field — no conversion needed.
    local buildingZone = nil
    if config.zone then
        buildingZone = {
            ZoneEntryList = {
                {
                    Polygon = config.zone,
                    Type    = { DEFAULT = true, NAVIGABLE_PART = true }
                }
            }
        }
    end

    mod:registerAsset({
        DataType     = "BUILDING_PART",
        Id           = config.rootId,           -- friendly name, e.g. "REAL_SMALL_HOUSE_PART"
        Category     = config.category,
        Name         = config.name,
        Description  = config.description,
        ConstructorData = {
            DataType          = "BUILDING_CONSTRUCTOR_SCALER",
            CoreObjectPrefab  = "PREFAB_" .. partId(config.bottom.prefab),
            EndPart           = topScalerId,    -- the top scaler root is the cap of this chain
            FillerList        = bottomFillerIds,
            IsRepeatLastFiller = config.bottom.isRepeatLastFiller,
        },
        BuildingZone       = buildingZone,
        AssetMaterialSetList = config.materialSetList,
        Capacity           = config.bottom.capacity,
        Cost               = config.bottom.cost,
    })

end


-- Return the utils table to the caller.
-- Because Foundation's mod:dofile() propagates return values, the caller receives
-- this table when it does:  local buildingParts = mod:dofile("scripts/utils/building_parts.lua")
return utils

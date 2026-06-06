local mod = ...
local buildingParts = mod:dofile("scripts/utils/building_parts.lua")


-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SHARED MATERIALS                                                        │
-- │  Each entry: { id, model, name }                                        │
-- │    id    — all-caps asset ID referenced in material set lists below      │
-- │    model — the FBX that owns this material node                         │
-- │    name  — exact node name in the FBX (case-sensitive)                  │
-- │  When two FBX files share a node name, each gets a unique id to avoid   │
-- │  mod:registerAssetId's first-registration-wins silent collision.         │
-- └─────────────────────────────────────────────────────────────────────────┘
buildingParts.registerMaterials(mod, {
    -- small_house_010.fbx
    { id = "WINDOW_BLACK",                         model = "small_house_010.fbx", name = "Window_Black" },
    { id = "MAT_WALL_STONE_RUSTIC_01A",            model = "small_house_010.fbx", name = "Mat_Wall_Stone_Rustic_01A_Diff.png" },
    { id = "MAT_WALL_STONE_RUSTIC_MOSS",           model = "small_house_010.fbx", name = "Mat_Wall_Stone_Rustic_Moss_Diff.png" },
    { id = "MAT_GEN_WALL_PLASTER_01A",             model = "small_house_010.fbx", name = "Mat_Gen_Wall_Plaster_01A_Diff.png" },
    { id = "SMALL_HOUSE_DIAMOND_ROOF_TILES_2",     model = "small_house_010.fbx", name = "diamond_roof_tiles_2" },
    { id = "SMALL_HOUSE_ROOF_TILES_3",             model = "small_house_010.fbx", name = "Roof_tiles_3" },

    -- scholastic_houses_tier_1_006.fbx
    -- Note: diamond_roof_tiles_2 and Roof_tiles_3 also exist in small_house_010 above,
    -- so each scholastic entry gets its own unique id (SQ_MINOR_ prefix).
    { id = "SQ_MINOR_DIAMOND_ROOF_TILES_2",        model = "scholastic_houses_tier_1_006.fbx", name = "diamond_roof_tiles_2" },
    { id = "SQ_MINOR_ROOF_TILES_3",                model = "scholastic_houses_tier_1_006.fbx", name = "Roof_tiles_3" },
    { id = "ROUGH_DIAMOND_TILE_ROOF_TEXTURE_PURPLE",       model = "scholastic_houses_tier_1_006.fbx", name = "Rough_diamond_tile_roof_texture_purple" },
    { id = "ROUGH_DIAMOND_TILE_ROOF_TEXTURE_BROWN",        model = "scholastic_houses_tier_1_006.fbx", name = "Rough_diamond_tile_roof_texture_brown" },
    { id = "ROUGH_DIAMOND_TILE_ROOF_TEXTURE_BROWN_BRIGHT", model = "scholastic_houses_tier_1_006.fbx", name = "Rough_diamond_tile_roof_texture_brown_bright" },
    { id = "ROUGH_DIAMOND_TILE_ROOF_TEXTURE_BROWN_DEEP",   model = "scholastic_houses_tier_1_006.fbx", name = "Rough_diamond_tile_roof_texture_brown_deep" },
    { id = "ROUGH_DIAMOND_TILE_ROOF_TEXTURE_BROWN_FIERY",  model = "scholastic_houses_tier_1_006.fbx", name = "Rough_diamond_tile_roof_texture_brown_fiery" },
})


-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SHARED MATERIAL SET LISTS                                               │
-- │  Recoloring swatch selectors shown in the build UI.                     │
-- │  Each set entry is one selectable option in the panel.                  │
-- └─────────────────────────────────────────────────────────────────────────┘
buildingParts.registerMaterialSetLists(mod, {
    {
        id = "ROOF_TEST_MATERIAL_SET_LIST",
        sets = {
            { name = "TEST_0", icon = "ICON_1", materials = { "SMALL_HOUSE_ROOF_TILES_3" } },
            { name = "TEST_1", icon = "ICON_2", materials = { "SMALL_HOUSE_DIAMOND_ROOF_TILES_2" } },
        }
    },
    {
        id = "ROOF_MATERIAL_SET_LIST_AETHERCOURT",
        sets = {
            { name = "TEST_01", icon = "ICON_1", materials = { "SQ_MINOR_ROOF_TILES_3" } },
            { name = "TEST_02", icon = "ICON_2", materials = { "SQ_MINOR_DIAMOND_ROOF_TILES_2" } },
            { name = "TEST_1",  icon = "ICON_1", materials = { "ROUGH_DIAMOND_TILE_ROOF_TEXTURE_PURPLE" } },
            { name = "TEST_2",  icon = "ICON_2", materials = { "ROUGH_DIAMOND_TILE_ROOF_TEXTURE_BROWN" } },
            { name = "TEST_3",  icon = "ICON_3", materials = { "ROUGH_DIAMOND_TILE_ROOF_TEXTURE_BROWN_BRIGHT" } },
            { name = "TEST_4",  icon = "ICON_4", materials = { "ROUGH_DIAMOND_TILE_ROOF_TEXTURE_BROWN_DEEP" } },
            { name = "TEST_5",  icon = "ICON_5", materials = { "ROUGH_DIAMOND_TILE_ROOF_TEXTURE_BROWN_FIERY" } },
        }
    },
})


-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SMALL HOUSE 010                                                        │
-- │  Temporary stand-in model while the final Aethercourt part is modeled.  │
-- │  rootId "REAL_SMALL_HOUSE_PART" is referenced in monument.lua's         │
-- │  AssetBuildingPartList.                                                 │
-- └─────────────────────────────────────────────────────────────────────────┘
local smallHouse010 = {
    filename = "small_house_010.fbx",

    rootId         = "REAL_SMALL_HOUSE_PART",
    category       = "ROOM",
    name           = "REAL_SMALL_HOUSE_PART_NAME",
    description    = "REAL_SMALL_HOUSE_PART_DESC",
    materialSetList = "ROOF_TEST_MATERIAL_SET_LIST",
    zone           = polygon.createRectangle({ 4.0, 6.0 }),

    bottom = {
        prefab    = "1_Small_House_Bottom_Part",
        capacity  = 2,
        cost      = {
            UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 3 } },
            ResourceNeededList = {
                { { Resource = "STONE", Quantity = 2 }, { Resource = "WOOD", Quantity = 2 } },
                { { Resource = "STONE", Quantity = 3 }, { Resource = "WOOD", Quantity = 3 } },
            }
        },
        isRepeatLastFiller = false,
        -- Fillers listed in ascending order (1 → 3); registerModel reverses them
        -- internally to match Foundation's last-to-first cycling direction.
        fillers = {
            {
                prefab   = "2_Small_House_Stone_Filler_1_Part",
                capacity = 1,
                cost     = {
                    UpkeepCost = { { Resource = "GOLD_COINS", Quantity = 1 } },
                    ResourceNeededList = {
                        { { Resource = "POLISHED_STONE", Quantity = 2 }, { Resource = "PLANK", Quantity = 2 } }
                    }
                }
            },
            {
                prefab   = "2_Small_House_Stone_Filler_2_Part",
                capacity = nil, -- TODO: set capacity
                cost     = nil, -- TODO: set cost
            },
            {
                prefab   = "2_Small_House_Stone_Filler_3_Part",
                capacity = nil, -- TODO: set capacity
                cost     = nil, -- TODO: set cost
            },
        }
    },

    top = {
        prefab             = "3_Small_House_Middle_Part",
        category           = "ROOM",
        capacity           = nil, -- TODO: set capacity
        cost               = nil, -- TODO: set cost
        gizmoHeightOffset  = 2.0,
        isRepeatLastFiller = false,
        fillers = {
            {
                prefab   = "4_Small_House_Plaster_Filler_1_Part",
                capacity = nil, -- TODO: set capacity
                cost     = nil, -- TODO: set cost
            },
            {
                prefab   = "4_Small_House_Plaster_Filler_2_Part",
                capacity = nil,
                cost     = nil,
            },
            {
                prefab   = "4_Small_House_Plaster_Filler_3_Part",
                capacity = nil,
                cost     = nil,
            },
        },
        roof = {
            prefab   = "5_Small_House_Roof_Part",
            capacity = nil, -- TODO: set capacity
            cost     = nil, -- TODO: set cost
        }
    }
}

buildingParts.registerModel(mod, smallHouse010)


-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  SCHOLASTIC QUARTERS, MINOR                                             │
-- │  Source model: scholastic_houses_tier_1_001.blend                       │
-- │  Export the FBX from Blender before testing in-game.                    │
-- │  Prefab node names below must match the actual node names in the FBX.   │
-- └─────────────────────────────────────────────────────────────────────────┘
local scholasticQuartersMinor = {
    filename = "scholastic_houses_tier_1_006.fbx",

    rootId      = "SCHOLASTIC_QUARTERS_MINOR_PART",
    category    = "ROOM",
    name        = "SCHOLASTIC_QUARTERS_MINOR_NAME",
    description = "SCHOLASTIC_QUARTERS_MINOR_DESC",
    materialSetList = "ROOF_MATERIAL_SET_LIST_AETHERCOURT",
    zone        = polygon.createRectangle({ 4.0, 6.0 }),

    bottom = {
        prefab             = "1_Scholastic_Quarters_Minor_Bottom_Part",
        capacity           = nil, -- TODO: set capacity
        cost               = nil, -- TODO: set cost
        isRepeatLastFiller = false,
        -- 9 stone filler variants, ascending order
        fillers = {
            { prefab = "2_Scholastic_Quarters_Minor_Stone_Filler_1_Part", capacity = nil, cost = nil },
            { prefab = "2_Scholastic_Quarters_Minor_Stone_Filler_2_Part", capacity = nil, cost = nil },
            { prefab = "2_Scholastic_Quarters_Minor_Stone_Filler_3_Part", capacity = nil, cost = nil },
            { prefab = "2_Scholastic_Quarters_Minor_Stone_Filler_4_Part", capacity = nil, cost = nil },
            { prefab = "2_Scholastic_Quarters_Minor_Stone_Filler_5_Part", capacity = nil, cost = nil },
            { prefab = "2_Scholastic_Quarters_Minor_Stone_Filler_6_Part", capacity = nil, cost = nil },
            { prefab = "2_Scholastic_Quarters_Minor_Stone_Filler_7_Part", capacity = nil, cost = nil },
            { prefab = "2_Scholastic_Quarters_Minor_Stone_Filler_8_Part", capacity = nil, cost = nil },
            { prefab = "2_Scholastic_Quarters_Minor_Stone_Filler_9_Part", capacity = nil, cost = nil },
        }
    },

    top = {
        prefab             = "3_Scholastic_Quarters_Minor_Middle_Part",
        category           = "ROOM",
        capacity           = nil, -- TODO: set capacity
        cost               = nil, -- TODO: set cost
        gizmoHeightOffset  = 2.0, -- TODO: adjust to actual model mid-point height
        isRepeatLastFiller = false,
        -- 9 plaster filler variants, ascending order
        fillers = {
            { prefab = "4_Scholastic_Quarters_Minor_Plaster_Filler_1_Part", capacity = nil, cost = nil },
            { prefab = "4_Scholastic_Quarters_Minor_Plaster_Filler_2_Part", capacity = nil, cost = nil },
            { prefab = "4_Scholastic_Quarters_Minor_Plaster_Filler_3_Part", capacity = nil, cost = nil },
            { prefab = "4_Scholastic_Quarters_Minor_Plaster_Filler_4_Part", capacity = nil, cost = nil },
            { prefab = "4_Scholastic_Quarters_Minor_Plaster_Filler_5_Part", capacity = nil, cost = nil },
            { prefab = "4_Scholastic_Quarters_Minor_Plaster_Filler_6_Part", capacity = nil, cost = nil },
            { prefab = "4_Scholastic_Quarters_Minor_Plaster_Filler_7_Part", capacity = nil, cost = nil },
            { prefab = "4_Scholastic_Quarters_Minor_Plaster_Filler_8_Part", capacity = nil, cost = nil },
            { prefab = "4_Scholastic_Quarters_Minor_Plaster_Filler_9_Part", capacity = nil, cost = nil },
        },
        roof = {
            prefab   = "5_Scholastic_Quarters_Minor_Roof_Part",
            capacity = nil, -- TODO: set capacity
            cost     = nil, -- TODO: set cost
        }
    }
}

buildingParts.registerModel(mod, scholasticQuartersMinor)

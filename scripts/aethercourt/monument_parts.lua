local mod = ...

local filename = "small_house_003.fbx"
-- To easily read in and correctly parse the different attach points (Attach_Bottom, Attach_Top etc.)
mod:registerAssetProcessor("models/" .. filename, {
    DataType = "BUILDING_ASSET_PROCESSOR"
})


-- Build parts
mod:registerAssetId("models/" .. filename .. "/Prefab/Big_House_Part", "PREFAB_BIG_HOUSE_PART")
mod:registerAssetId("models/" .. filename .. "/Prefab/Small_House_Part", "PREFAB_SMALL_HOUSE_PART")



-- Root (main) part
-- mod:registerAsset({
--     DataType = "BUILDING_PART",
--     Id = "BLOCK_SINGLE_ROOT_PART",
--     Category = "DECORATION",
--     ConstructorData = {
--         DataType = "BUILDING_CONSTRUCTOR_SCALER",
--         CoreObjectPrefab = "PREFAB_SINGLE_ROOT_PART",
--         EndPart = "BLOCK_SINGLE_TOP_PART",
--         FillerList = {
--             "BLOCK_SINGLE_TILING_PART"
--         },
--         MiniatureConfig = {
--             CameraPosition = { 0.0, 0.25, -2.0 }
--         }
--     },
--     BuildingZone = {
--         ZoneEntryList = {
--             {  -- Make the smallest possible collision box so it gets included when double-clicking on adjacent parts
--                 Polygon = polygon.createRectangle({ 0.01, 0.01 }),
--                 Type = {
--                     DEFAULT = true,
--                     NAVIGABLE_PART = true
--                 }
--             }
--         }
--     },
--     AssetMaterialSetList = "BLOCK_MATERIAL_SET_LIST",
--     Cost = {
--         BuildRightTaxes = {
--             { Resource = "GOLD_COINS", Quantity = 5 }
--         }
--     }
-- })

mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "BIG_HOUSE_PART",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_BIG_HOUSE_PART"
    }
})

mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "SMALL_HOUSE_PART",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_SMALL_HOUSE_PART"
    }
})

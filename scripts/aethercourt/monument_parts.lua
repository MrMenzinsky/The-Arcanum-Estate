local mod = ...

local filename = "small_house_010.fbx"


-- To easily read in and correctly parse the different attach points (Attach_Bottom, Attach_Top etc.)
mod:registerAssetProcessor("models/" .. filename, {
    DataType = "BUILDING_ASSET_PROCESSOR"
})

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

local small_house_parts = {
    "1_Small_House_Bottom_Part",
    "2_Small_House_Stone_Filler_1_Part",
    "2_Small_House_Stone_Filler_2_Part",
    "2_Small_House_Stone_Filler_3_Part",
    "3_Small_House_Middle_Part",
    "4_Small_House_Plaster_Filler_1_Part",
    "4_Small_House_Plaster_Filler_2_Part",
    "4_Small_House_Plaster_Filler_3_Part",
    "5_Small_House_Roof_Part"
}

for _, small_house_part in ipairs(small_house_parts) do
    local prefab = "PREFAB_" .. string.upper(small_house_part)
    mod:registerAssetId("models/" .. filename .. "/Prefab/" .. small_house_part, prefab)
end


local materials = {
    "Window_Black",
    "Mat_Wall_Stone_Rustic_01A_Diff.png",
    "Mat_Wall_Stone_Rustic_Moss_Diff.png",
    "Mat_Gen_Wall_Plaster_01A_Diff.png",
    -- "Roof_tiles",
    -- "Roof_tiles_2",
    "diamond_roof_tiles_2",
    "Roof_tiles_3",
    "Roof_base"
}

for _, material in ipairs(materials) do
    mod:registerAssetId("models/" .. filename .. "/Materials/" .. material, string.upper(material))
end


-- Register custom swatches for recoloring/changing the texture on the block
mod:registerAsset({
    DataType = "MATERIAL_SET_LIST",
    Id = "ROOF_TEST_MATERIAL_SET_LIST",
    MaterialSetList = {
        {
            SetName = "TEST_0",
            AssetSelectionButtonImage = "ICON_1",
            MaterialList = {
                "ROOF_TILES_3"
            }
        },
        {
            SetName = "TEST_1",
            AssetSelectionButtonImage = "ICON_2",
            MaterialList = {
                "DIAMOND_ROOF_TILES_2"
            }
        },
    }
})


-- Double scaling cube parts

-- Root one (main) part
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "REAL_SMALL_HOUSE_PART",
    Category = "ROOM",
    Name = "REAL_SMALL_HOUSE_PART_NAME",
    Description = "REAL_SMALL_HOUSE_PART_DESC",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_SCALER",
        CoreObjectPrefab = "PREFAB_1_SMALL_HOUSE_BOTTOM_PART",
        EndPart = "3_SMALL_HOUSE_MIDDLE_PART",
        FillerList = {
            "2_SMALL_HOUSE_STONE_FILLER_3_PART",
            "2_SMALL_HOUSE_STONE_FILLER_2_PART",
            "2_SMALL_HOUSE_STONE_FILLER_1_PART",
        },
        IsRepeatLastFiller = false,
        -- MiniatureConfig = {
        --     CameraPosition = { 0.0, 0.0, 0.0 },
        --     ClipUnderGround = false
        -- }
    },
    BuildingZone = {
        ZoneEntryList = {
            {
                Polygon = polygon.createRectangle({ 4.0, 6.0 }),
                Type = {
                    DEFAULT = true,
                    NAVIGABLE_PART = true
                }
            }
        }
    },
    AssetMaterialSetList = "ROOF_TEST_MATERIAL_SET_LIST",
    Capacity = 2,
    Cost = {
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 3 }
        },
        ResourceNeededList = {
            {
                { Resource = "STONE", Quantity = 2 },
                { Resource = "WOOD",  Quantity = 2 }
            },
            {
                { Resource = "STONE", Quantity = 3 },
                { Resource = "WOOD",  Quantity = 3 }
            }
        }
    }
})

-- Tiling one part (1, 2, 3)
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "2_SMALL_HOUSE_STONE_FILLER_1_PART",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_2_SMALL_HOUSE_STONE_FILLER_1_PART"
    },
    Capacity = 1,
    Cost = {
        UpkeepCost = {
            { Resource = "GOLD_COINS", Quantity = 1 }
        },
        ResourceNeededList = {
            {
                { Resource = "POLISHED_STONE", Quantity = 2 },
                { Resource = "PLANK",  Quantity = 2 }
            }
        }
    }
})

mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "2_SMALL_HOUSE_STONE_FILLER_2_PART",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_2_SMALL_HOUSE_STONE_FILLER_2_PART"
    }
})

mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "2_SMALL_HOUSE_STONE_FILLER_3_PART",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_2_SMALL_HOUSE_STONE_FILLER_3_PART"
    }
})

-- Root two part
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "3_SMALL_HOUSE_MIDDLE_PART",
    Category = "ROOM",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_SCALER",
        CoreObjectPrefab = "PREFAB_3_SMALL_HOUSE_MIDDLE_PART",
        EndPart = "5_SMALL_HOUSE_ROOF_PART",
        FillerList = {
            "4_SMALL_HOUSE_PLASTER_FILLER_3_PART",
            "4_SMALL_HOUSE_PLASTER_FILLER_2_PART",
            "4_SMALL_HOUSE_PLASTER_FILLER_1_PART",
        },
        IsRepeatLastFiller = false,
        GizmoHeightOffset = 2.0,
    }
})

-- Tiling two part (1, 2, 3)
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "4_SMALL_HOUSE_PLASTER_FILLER_1_PART",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_4_SMALL_HOUSE_PLASTER_FILLER_1_PART"
    }
})

mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "4_SMALL_HOUSE_PLASTER_FILLER_2_PART",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_4_SMALL_HOUSE_PLASTER_FILLER_2_PART"
    }
})

mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "4_SMALL_HOUSE_PLASTER_FILLER_3_PART",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_4_SMALL_HOUSE_PLASTER_FILLER_3_PART"
    }
})

-- End part
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "5_SMALL_HOUSE_ROOF_PART",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_5_SMALL_HOUSE_ROOF_PART"
    }
})

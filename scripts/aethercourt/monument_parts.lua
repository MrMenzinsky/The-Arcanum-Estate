local mod = ...

local filename = "small_house_010.fbx"


-- To easily read in and correctly parse the different attach points (Attach_Bottom, Attach_Top etc.)
mod:registerAssetProcessor("models/" .. filename, {
    DataType = "BUILDING_ASSET_PROCESSOR"
})


-- -- Build parts
-- mod:registerAssetId("models/" .. filename .. "/Prefab/Big_House_Part", "PREFAB_BIG_HOUSE_PART")
-- mod:registerAssetId("models/" .. filename .. "/Prefab/Small_House_Part", "PREFAB_SMALL_HOUSE_PART")



local templateBlocks = {
    "1x1.5m_Flat_Part",
    "1x1m_Flat_Part",
    "1x1m_Part",
    "2x2m_Part",
    "4x4m_Part",
    "8x8m_Part",
    "Big_House_Part",
    "Small_House_Part"
}

for _, templateBlock in ipairs(templateBlocks) do
    local prefab = "PREFAB_" .. string.upper(templateBlock)
    mod:registerAssetId("models/" .. filename .. "/Prefab/" .. templateBlock, prefab)

    mod:registerAsset({
        DataType = "BUILDING_PART",
        Id = string.upper(templateBlock),
        Name = templateBlock,
        Description = templateBlock,
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = prefab
        }
    })
end

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

-- mod:registerAsset({
--     DataType = "BUILDING_PART",
--     Id = "BIG_HOUSE_PART",
--     ConstructorData = {
--         DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
--         CoreObjectPrefab = "PREFAB_BIG_HOUSE_PART"
--     }
-- })

-- mod:registerAsset({
--     DataType = "BUILDING_PART",
--     Id = "SMALL_HOUSE_PART",
--     ConstructorData = {
--         DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
--         CoreObjectPrefab = "PREFAB_SMALL_HOUSE_PART"
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
    "Template_Bottom",
    "Template_Middle_Bottom",
    "Template_Middle_Top",
    "Template_Top",
    "Template_Roof",
    "Window_Black",
    "Mat_Wall_Stone_Rustic_01A_Diff.png",
    "Mat_Wall_Stone_Rustic_Moss_Diff.png",
    "Mat_Gen_Wall_Plaster_01A_Diff.png",
    "Roof_tiles",
    "Roof_tiles_2",
    "Roof_base",
    "Window_Black",
    "Green",
    "Light_Green",
    "Aqua",
    "Teal",
}

for _, material in ipairs(materials) do
    mod:registerAssetId("models/" .. filename .. "/Materials/" .. material, string.upper(material))
end

local roof_materials = {
  "Roof tiles - Vibrance -25 Saturation +25.png",
  "Roof tiles - Vibrance -25 Saturation +50.png",
  "Roof tiles - Vibrance -25 Saturation 0.png",
  "Roof tiles - Vibrance -50 Saturation +25.png",
  "Roof tiles - Vibrance -50 Saturation +50.png",
  "Roof tiles - Vibrance -50 Saturation 0.png",
  "Roof tiles - Vibrance -100 Saturation 0.png",
}

for _, roof_material in ipairs(roof_materials) do
  mod:registerAssetId("models/textures/Variants/" .. roof_material, string.upper(roof_material))
end


-- Register custom swatches for recoloring/changing the texture on the block
mod:registerAsset({
	DataType = "MATERIAL_SET_LIST",
	Id = "ROOF_TEST_MATERIAL_SET_LIST",
	MaterialSetList = {
        {
            SetName = "TEST_0",
            AssetSelectionButtonImage = "ICON_3",
            MaterialList = {
                "ROOF_TILES_2"
            }
        },
        {
          SetName = "TEST_1",
          AssetSelectionButtonImage = "ICON_1",
          MaterialList = {
              "ROOF TILES - VIBRANCE -25 SATURATION +25.PNG"
          }
        },
        {
            SetName = "TEST_2",
            AssetSelectionButtonImage = "ICON_2",
            MaterialList = {
                "ROOF TILES - VIBRANCE -25 SATURATION +50.PNG"
            }
        },
        {
            SetName = "TEST_3",
            AssetSelectionButtonImage = "ICON_3",
            MaterialList = {
                "ROOF TILES - VIBRANCE -25 SATURATION 0.PNG"
            }
        },
        {
            SetName = "TEST_4",
            AssetSelectionButtonImage = "ICON_4",
            MaterialList = {
                "ROOF TILES - VIBRANCE -50 SATURATION +25.PNG"
            }
        },
        {
            SetName = "TEST_5",
            AssetSelectionButtonImage = "ICON_5",
            MaterialList = {
                "ROOF TILES - VIBRANCE -50 SATURATION +50.PNG"
            }
        },
        {
            SetName = "TEST_6",
            AssetSelectionButtonImage = "ICON_1",
            MaterialList = {
                "ROOF TILES - VIBRANCE -50 SATURATION 0.PNG"
            }
        },
        {
            SetName = "TEST_7",
            AssetSelectionButtonImage = "ICON_2",
            MaterialList = {
                "ROOF TILES - VIBRANCE -100 SATURATION 0.PNG"
            }
        }
    }
})

-- mod:registerAsset({
--     DataType = "BUILDING",
--     Id = "SMALL_HOUSE",
--     Name = "SMALL_HOUSE_NAME",
--     Description = "SMALL_HOUSE_DESC",
--     BuildingType = BUILDING_TYPE.GENERAL,
--     AssetCoreBuildingPart = "SMALL_HOUSE_BOTTOM_PART"
-- })



-- Double scaling cube parts

-- Root one (main) part
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "REAL_SMALL_HOUSE_PART",
    Category = "ROOM",
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
    -- BuildingZone = {
    --     ZoneEntryList = {
    --         {  -- Make the smallest possible collision box so it gets included when double-clicking on adjacent parts
    --             Polygon = polygon.createRectangle({ 0.01, 0.01 }),
    --             Type = {
    --                 DEFAULT = true,
    --                 NAVIGABLE_PART = true
    --             }
    --         }
    --     }
    -- },
    AssetMaterialSetList = "ROOF_TEST_MATERIAL_SET_LIST",
    -- Cost = {
    --     BuildRightTaxes = {
    --         { Resource = "GOLD_COINS", Quantity = 5 }
    --     }
    -- }
})

-- Tiling one part (1, 2, 3)
mod:registerAsset({
    DataType = "BUILDING_PART",
    Id = "2_SMALL_HOUSE_STONE_FILLER_1_PART",
    ConstructorData = {
        DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
        CoreObjectPrefab = "PREFAB_2_SMALL_HOUSE_STONE_FILLER_1_PART"
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

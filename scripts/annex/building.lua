local mod = ...

-- Annex-specific building parts
-- mod:dofile("scripts/annex/building_parts.lua")

-- Annex-specific behavior tree
-- mod:dofile("scripts/annex/behavior_tree.lua")

mod:registerAsset({
  DataType = "BUILDING",
  Id = "BUILDING_ARCANUM_AETHERCOURT_ANNEX",
  Name = "BUILDING_ARCANUM_AETHERCOURT_ANNEX_NAME",
  Description = "BUILDING_ARCANUM_AETHERCOURT_ANNEX_DESC",
  BuildingType = "HOUSING",
  NavMeshLockCategory = "ARCANE",
  OptionalSubBuildingIcon = "ICON_SUB_BUILDING_DORM",
  AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
  AssetBuildingPartList = {
    -- Add specific building parts for the Annex here
  },
  AssetBuildingFunction = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ANNEX_HOUSING",
  RequiredPartList = {
    {
      Category = "ROOM",
      Min = 1
    }
  },
  AssetBuildingConditionConfigList = {
    "BUILDING_GAME_CONDITION_CONFIG_INTERIOR_ACCESS"
  }
})

mod:registerAsset({
  DataType = "BUILDING_FUNCTION_HOUSE",
  Id = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ANNEX_HOUSING",
  Name = "",
  NamePluralKey = "",
  Description = "",
  UpkeepPerCapacity = {
    -- Add building cost here?
  },
  RelatedDesirability = "DESIRABILITY_RESIDENTIAL",
  AssetHouseSetup = "HOUSE_SETUP_ARCANUM_AETHERCOURT_ANNEX_HOUSING",
  RelatedZone = "ZONE_RESIDENTIAL", -- Test with empty object and see if its accepted
  IsCapacityOverriden = false, -- Default value, what does it do?
  OptionalGenderCompatibility = {
    "MALE",
    "FEMALE"
  },
  ShowCapacity = false, -- Default value, what does it do?
  OccupationCapacityMultiplier = 1.0, -- Default value

  -- TargetProfile = "PROFILE_AETHERCOURT_AETHERIANS",
  -- WorkerRatioFromCapacity = 1.5,
  -- StorageRatioFromCapacity = 10,
  -- UpkeepPerWorker = {
  --   {
  --     Resource = "GOLD_COINS",
  --     Quantity = 5
  --   }
  -- }
})

mod:registerAsset({
  DataType = "HOUSE_SETUP",
  Id = "HOUSE_SETUP_ARCANUM_AETHERCOURT_ANNEX_HOUSING",
  HouseStatusList = {
    {
      AssetHouseRequirementList = {},
      ResourceGenerated = "HOUSING_AETHERCOURT_ANNEX",
      DataHouseDensityList = {},
      Name = "",
      Description = ""
    }
  },
  HouseStatusUpgradeDelay = {DataType = "TIME_SYSTEM"},
  HouseStatusDowngradeDelay = {DataType = "TIME_SYSTEM"},
  HouseDensityUpgradeDelay = {DataType = "TIME_SYSTEM"},
  HouseDensityDowngradeDelay = {DataType = "TIME_SYSTEM"}
})

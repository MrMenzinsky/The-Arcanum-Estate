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
  BuildingType = BUILDING_TYPE.GENERAL,
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
  Name = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ANNEX_HOUSING_NAME",
  NamePluralKey = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ANNEX_HOUSING_NAMES",
  Description = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ANNEX_HOUSING_DESC",
  UpkeepPerCapacity = {
    -- Add building cost here?
    {
      Resource = "GOLD_COINS",
      Quantity = 5
    }
  },
  RelatedDesirability = "DESIRABILITY_RESIDENTIAL",
  AssetHouseSetup = "HOUSE_SETUP_ARCANUM_AETHERCOURT_ANNEX_HOUSING",
  RelatedZone = "ZONE_RESIDENTIAL", -- What should I put here?
  IsCapacityOverriden = false, -- Default value, what does it do?
  OptionalGenderCompatibility = {
    "MALE",
    "FEMALE"
  },
  ShowCapacity = true,
  OccupationCapacityMultiplier = 1.0 -- Default value
})

mod:registerAsset({
  DataType = "HOUSE_SETUP",
  Id = "HOUSE_SETUP_ARCANUM_AETHERCOURT_ANNEX_HOUSING",
  HouseStatusList = {
    {
      DataType = "HOUSE_STATUS",
      AssetHouseRequirementList = {},
      ResourceGenerated = "HOUSING_AETHERCOURT_ANNEX",
      DataHouseDensityList = {},
      Name = "HOUSE_SETUP_ANNEX_NAME",
      Description = "HOUSE_SETUP_ANNEX_DESC"
    }
  },
  HouseStatusUpgradeDelay = {DataType = "TIME_SYSTEM"},
  HouseStatusDowngradeDelay = {DataType = "TIME_SYSTEM"},
  HouseDensityUpgradeDelay = {DataType = "TIME_SYSTEM"},
  HouseDensityDowngradeDelay = {DataType = "TIME_SYSTEM"}
})

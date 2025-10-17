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
  Name = "Some name",
  NamePluralKey = "Some names",
  Description = "Just some test text",
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
      AssetHouseRequirementList = {
        {
          DataType = "HOUSE_REQUIREMENT",
          Name = "HOUSE_REQUIREMENT_ARCANUM_AETHERCOURT_ANNEX",
          Description = "HOUSE_REQUIREMENT_ARCANUM_AETHERCOURT_ANNEX_DESC",
          Icon = "ICON_HOUSE_QUALITY_2"
        }
      },
      ResourceGenerated = "HOUSING_AETHERCOURT_ANNEX",
      DataHouseDensityList = {
        {
          DataType = "DATA_HOUSE_DENSITY",
          Name = "HOUSE_DENSITY_1_NAME",
          Description = "HOUSE_DENSITY_1_DESC",
          AssetHouseBuildingPart = "BUILDING_PART_MANOR_HOUSE_STONE_CHAMBER",
          AssetHouseRequirementList = {}
        }
      },
      Name = "HOUSE_SETUP_ANNEX_NAME",
      Description = "HOUSE_SETUP_ANNEX_DESC"
    }
  },
  HouseStatusUpgradeDelay = {DataType = "TIME_SYSTEM"},
  HouseStatusDowngradeDelay = {DataType = "TIME_SYSTEM"},
  HouseDensityUpgradeDelay = {DataType = "TIME_SYSTEM"},
  HouseDensityDowngradeDelay = {DataType = "TIME_SYSTEM"}
})

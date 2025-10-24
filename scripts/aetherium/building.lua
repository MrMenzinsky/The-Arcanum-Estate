local mod = ...

-- Aetherium-specific building parts
-- mod:dofile("scripts/aetherium/building_parts.lua")

-- Aetherium-specific behavior tree
-- mod:dofile("scripts/aetherium/behavior_tree.lua")

mod:registerAsset({
  DataType = "BUILDING",
  Id = "BUILDING_ARCANUM_AETHERCOURT_AETHERIUM",
  Name = "BUILDING_ARCANUM_AETHERCOURT_AETHERIUM_NAME",
  Description = "BUILDING_ARCANUM_AETHERCOURT_AETHERIUM_DESC",
  BuildingType = "RESOURCE_PRODUCTION",
  NavMeshLockCategory = "ARCANE",
  OptionalSubBuildingIcon = "ICON_SUB_BUILDING_ABBATIAL", -- Fix custom icon later
  AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
  AssetBuildingPartList = {
    -- Add specific building parts for the Aetherium here
  },
  AssetBuildingFunction = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_AETHERIUM",
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
  DataType = "BUILDING_FUNCTION_WORKPLACE",
  Id = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_AETHERIUM",
  
  -- BUILDING_FUNCTION properties
  Name = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ARCHIVE_NAME",
  NamePluralKey = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ARCHIVE_NAMES",
  Description = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ARCHIVE_DESC",
  -- UpkeepPerCapacity = {},

  -- BUILDING_FUNCTION_WORKPLACE properties
  WorkerRatioFromCapacity = 1,
  StorageRatioFromCapacity = 10,
  UpkeepPerWorker = {
    {
      Resource = "GOLD_COINS",
      Quantity = 10
    }
  },
  RelatedJob = {
    DataType = "ASSOCIATION_JOB_BEHAVIOR",
    Job = "JOB_AETHERCOURT_CASTER",
    Behavior = "BEHAVIOR_WORK"
  },
  CanAssignWorkerAutomatically = false,
  ProductionCycleDurationInSec = 30.0, -- 20.0f is the default. Don't make them level up their job too fast.
  WorkCycleNeededToProduceOnce = 3, -- 1 is the default, make the resource a bit scarcer.
  InputInventoryCapacity = {
    {
      Resource = RESOURCE.RESOURCE_GLYPH,
      Quantity = 50
    }
  },
  ResourceListNeeded = {
    {
      Resource = RESOURCE.RESOURCE_GLYPH,
      Quantity = 3
    }
  }
  ResourceProduced = {
    {
      Resource = RESOURCE.RESOURCE_ARCANE_LORE,
      Quantity = 1
    }
  }
})

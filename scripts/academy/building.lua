local mod = ...

-- Academy-specific building parts
mod:dofile("scripts/academy/building_parts.lua")

-- Academy-specific behavior tree
mod:dofile("scripts/academy/behavior_tree.lua")

mod:registerAsset({
  DataType = "BUILDING",
  Id = "BUILDING_ARCANUM_AETHERCOURT_ACADEMY",
  Name = "BUILDING_ARCANUM_AETHERCOURT_ACADEMY_NAME",
  Description = "BUILDING_ARCANUM_AETHERCOURT_ACADEMY_DESC",
  BuildingType = "RESOURCE_PRODUCTION",
  NavMeshLockCategory = "ARCANE",
  OptionalSubBuildingIcon = "ICON_SUB_BUILDING_SCRIPTORIUM",
  AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
  AssetBuildingPartList = {
    -- Add specific building parts for the academy here
  },
  AssetBuildingFunction = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ACADEMY",
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
  DataType = "BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE",  -- Parent class is BUILDING_FUNCTION_WORKPLACE
  Id = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ACADEMY",
  
  -- BUILDING_FUNCTION properties
  Name = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ACADEMY_NAME",
  NamePluralKey = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ACADEMY_NAMES",
  Description = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ACADEMY_DESC",

  -- Custom properties
  TargetProfile = "PROFILE_AETHERCOURT_AETHERIANS",
  RevertOnDismissal = false,
  RevertOnBuildingDestruction = false,

  -- BUILDING_FUNCTION_WORKPLACE properties
  WorkerRatioFromCapacity = 1,
  StorageRatioFromCapacity = 10,
  UpkeepPerWorker = {
    {
      Resource = "GOLD_COINS",
      Quantity = 5
    }
  },
  RelatedJob = {
    DataType = "ASSOCIATION_JOB_BEHAVIOR",
    Job = "JOB_AETHERCOURT_SCHOLAR",
    Behavior = "BEHAVIOR_WORK"
  },
  CanAssignWorkerAutomatically = false,
  ProductionCycleDurationInSec = 20.0, -- 20.0f is the default. Don't make them level up their job too fast.
  WorkCycleNeededToProduceOnce = 3, -- 1 is the default, make the resource a bit scarcer.
  ResourceProduced = {
    {
      Resource = "RESOURCE_GLYPH",
      Quantity = 1
    }
  }
})

local mod = ...

-- Academy-specific building parts
mod:dofile("scripts/academy/building_parts.lua")

-- Academy-specific behavior tree
mod:dofile("scripts/academy/behavior_tree.lua")

mod:registerAsset({
  DataType = "BUILDING",
  Id = "BUILDING_ARCANUM_AETHER_COURT_ACADEMY",
  Name = "BUILDING_ARCANUM_AETHER_COURT_ACADEMY_NAME",
  Description = "BUILDING_ARCANUM_AETHER_COURT_ACADEMY_DESC",
  BuildingType = "RESOURCE_PRODUCTION",
  NavMeshLockCategory = "ARCANE",
  OptionalSubBuildingIcon = "ICON_SUB_BUILDING_SCRIPTORIUM",
  AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
  AssetBuildingPartList = {
    -- Add specific building parts for the academy here
  },
  AssetBuildingFunction = "BUILDING_FUNCTION_ARCANUM_AETHER_COURT_ACADEMY",
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
  Id = "BUILDING_FUNCTION_ARCANUM_AETHER_COURT_ACADEMY",
  WorkerRatioFromCapacity = 1.5,
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
  ResourceProduced = {
    {
      Resource = "RESOURCE_GLYPH",
      Quantity = 1
    }
  }
})

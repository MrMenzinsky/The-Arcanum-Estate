local mod = ...

mod:registerAsset({
  DataType = "BUILDING",
  Id = "BUILDING_ARCANUM_AETHERCOURT_ARCHIVE",
  Name = "BUILDING_ARCANUM_AETHERCOURT_ARCHIVE_NAME",
  Description = "BUILDING_ARCANUM_AETHERCOURT_ARCHIVE_DESC",
  BuildingType = BUILDING_TYPE.LOGISTICS,
  NavMeshLockCategory = "ARCANE",
  OptionalSubBuildingIcon = "ICON_SUB_BUILDING_CITY_BELFRY", -- Fix custom icon later
  AssetCoreBuildingPart = "BUILDING_PART_WAREHOUSE", -- Fix custom part later
  AssetBuildingPartList = {
    -- Add specific building parts for the Archive here
  },
  AssetBuildingFunction = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ARCHIVE",
  IsAllowParentParts = false,
  RequiredPartList = {},
  AssetBuildingConditionConfigList = {}
})

mod:registerAsset({
  DataType = "BUILDING_FUNCTION_WAREHOUSE",
  Id = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ARCHIVE",
  
  -- BUILDING_FUNCTION properties
  Name = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ARCHIVE_NAME",
  NamePluralKey = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ARCHIVE_NAMES",
  Description = "BUILDING_FUNCTION_ARCANUM_AETHERCOURT_ARCHIVE_DESC",
  -- UpkeepPerCapacity = {},

  -- BUILDING_FUNCTION_WORKPLACE properties
  WorkerCapacity = 4,
  -- UpkeepPerWorker = {},
  RelatedJob = {
    DataType = "ASSOCIATION_JOB_BEHAVIOR",
    Job = "JOB_AETHERCOURT_ARCHIVIST",
    Behavior = "BEHAVIOR_TRANSPORTER"
  },
  CanAssignWorkerAutomatically = false,
  ShowProgressBar = false,

  -- BUILDING_FUNCTION_WAREHOUSE properties
  SocketCount = 4, -- default value
  SocketCapacity = 100,
  AllowedResourceTypeList = {
    {
      DataType = "BUILDING_FUNCTION_WAREHOUSE_ALLOWED_RESOURCE_TYPE_INFO",
      ResourceType = RESOURCE_TYPE.ARCANE_LITERATURE,
      ShowInDescription = true
    }
  },
  DefaultResourceVisual = "PREFAB_RESOURCE_VISUAL_GENERIC_CRATE"
})
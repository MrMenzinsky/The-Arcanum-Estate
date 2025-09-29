local mod = foundation.createMod();

mod:registerAssetId("icons/Icon_Arcanum_Influence.png", "ICON_ARCANUM_INFLUENCE", "ATLAS_CELL")
mod:registerAssetId("icons/Icon_Arcanum_Splendor.png", "ICON_ARCANUM_SPLENDOR", "ATLAS_CELL")
mod:registerAssetId("icons/Icon_Aether_Court.png", "ICON_AETHER_COURT", "ATLAS_CELL")

-- TODO: Temp icons until I figure out what they are for...
mod:registerAssetId("icons/Icon_1.png", "ICON_1", "ATLAS_CELL") -- DualIcon
mod:registerAssetId("icons/Icon_2.png", "ICON_2", "ATLAS_CELL") -- RatingIcon
mod:registerAssetId("icons/Icon_3.png", "ICON_3", "ATLAS_CELL") -- HeaderImage
mod:registerAssetId("icons/Icon_4.png", "ICON_4", "ATLAS_CELL") -- ProgressTierImage
mod:registerAssetId("icons/Icon_5.png", "ICON_5", "ATLAS_CELL") -- Privilege Image



-- Add a new enum value to restrict which villagers can go through the monument buildings.
mod:registerEnumValue("NAVMESH_LOCK_CATEGORY", "ARCANE")

mod:registerAsset({
  DataType = "ESTATE",
  Id = "ARCANUM",
  EstateName = "ESTATE_ARCANUM_NAME",
  Description = "ESTATE_ARCANUM_DESC",
  InfluenceIcon = "ICON_ARCANUM_INFLUENCE",
  SplendorIcon = "ICON_ARCANUM_SPLENDOR",
  DualIcon = "ICON_1",
  RatingIcon = "ICON_ARCANUM_SPLENDOR",
  HeaderImage = "ICON_3",
  PanelVisual = "ILLUSTRATION_ESTATE_CHURCH", -- TODO: Placeholder until I figure out what this is for...
  AssetProgressPath = "PROGRESS_PATH_ARCANUM",
  DefaultPrivilegeList = {
    "PRIV_ARCANUM_MANDATORY_STUDY"
  },
  InfluenceEffectList = {},
  EstateInfluenceRange = "DEFAULT_INFLUENCE_RANGE",
  AssetBuildingList = {
    "MONUMENT_ARCANUM_AETHER_COURT"
  }
})

-- Register the monument building
mod:registerAsset({
  DataType = "BUILDING",
  Id = "MONUMENT_ARCANUM_AETHER_COURT",
  Name = "MONUMENT_ARCANUM_AETHER_COURT_NAME",
  Description = "MONUMENT_ARCANUM_AETHER_COURT_DESC",
  BuildingType = "MONUMENT",
  NavMeshLockCategory = "ARCANE",
  AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
  AssetBuildingPartList = {
    -- Core
    "BUILDING_PART_MANOR_HOUSE_MANOR_GALLERY_MAJOR",
    "BUILDING_PART_MANOR_HOUSE_STONE_TOWER_MAJOR",
    "BUILDING_PART_MANOR_HOUSE_STONE_TOWER_MINOR",
    -- Doors
    "BUILDING_PART_MANOR_HOUSE_SIMPLE_STONE_ENTRANCE",
    "BUILDING_PART_MONASTERY_RUSTIC_GATE_ELEVATED",
    "BUILDING_PART_RUSTIC_CHURCH_HUMBLE_GATE",
    -- Chimneys
    "BUILDING_PART_MANOR_HOUSE_ENCASED_CHIMNEY",
    "BUILDING_PART_CHIMNEY_E",
    "BUILDING_PART_MANOR_HOUSE_ENCASED_CHIMNEY",
    "BUILDING_PART_MANOR_HOUSE_COVERED_CHIMNEY",
    "BUILDING_PART_MANOR_HOUSE_SHORT_CHIMNEY",
    "BUILDING_PART_MONASTERY_HEAVY_CHIMNEY",
    "BUILDING_PART_TAVERN_REINFORCED_CHIMNEY",
    "BUILDING_PART_CASTLE_WIDE_CHIMNEY"
  },
  SubAssetBuildingList = {
    "BUILDING_GREAT_HALL",
    "BUILDING_ARCANUM_AETHER_COURT_ACADEMY"
  }
})

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
  RequiredPartList = {
    {
      Category = "ROOM",
      Min = 1
    }
  },
  AssetBuildingConditionConfigList = {
    "BUILDING_GAME_CONDITION_CONFIG_INTERIOR_ACCESS"
  },
  AssetBuildingFunction = "BUILDING_FUNCTION_ARCANUM_AETHER_COURT_ACADEMY"
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
    Job = "JOB_RESEARCHER",
    Behavior = "BEHAVIOR_WORK"
  },
  CanAssignWorkerAutomatically = false,
  ResourceProduced = {
    {
      Resource = "RESEARCH_PAPER",
      Quantity = 1
    }
  }
})

mod:registerAsset({
  DataType = "JOB",
  Id = "JOB_RESEARCHER",
  JobName = "JOB_RESEARCHER_NAME",
  JobDescription = "JOB_RESEARCHER_DESC",
  UseWorkplaceBehavior = true,
  NeededMasteredJobList = {},
  ExperienceToMaster = 20, -- TODO: What does this mean?
  AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
  -- AssetJobProgression = "SCHOLAR_JOB_PROGRESSION" -- TODO: Check if this is needed
  -- CharacterSetup = {}, -- Advanced customization of the character
  IsDefinitive = true,
  IsLockedByDefault = true
})

-- TODO: Check how this works and if its applicable on my magic users?!
-- mod:registerAsset({
--   DataType = "JOB_PROGRESSION",
--   Id = "SCHOLAR_JOB_PROGRESSION",
--   ProgressionElementList = {
--     {
--       DataType = "JOB_PROGESSION_ELEMENT",
--       XpNeeded = 1000 -- TODO: Check what this means in relation to what?!?
--     }
--   }
-- })

mod:registerAsset({
  DataType = "RESOURCE",
  Id = "RESEARCH_PAPER",
  ResourceName = "RESEARCH_PAPER_NAME",
  Icon = "ICON_RESOURCE_MANUSCRIPT", -- TODO: (#14) Fix custom icon for research paper resource
  ResourceTypeList = {
    "RESOURCE",
    "LITERATURE"
  },
  ResourceLayoutType = "TRUNKS",
  ResourceVisualPrefabList = {
    "PREFAB_RESOURCE_VISUAL_GENERIC_CRATE"
  },
  IndividualResourceVisualPrefabList = {
    "PREFAB_RESOURCE_VISUAL_GENERIC_CRATE"
  }
})

mod:registerAsset({
  DataType = "PROGRESS_PATH",
  Id = "PROGRESS_PATH_ARCANUM",
  ProgressTierAssetList = {
    "PROGRESS_TIER_ARCANUM_T1",
    "PROGRESS_TIER_ARCANUM_T2",
    "PROGRESS_TIER_ARCANUM_T3",
    "PROGRESS_TIER_ARCANUM_T4",
    "PROGRESS_TIER_ARCANUM_T5"
  }
})

mod:registerAsset({
  DataType = "PROGRESS_TIER_DATA",
  Id = "PROGRESS_TIER_ARCANUM_T1",
  Name = "PROGRESS_TIER_ARCANUM_T1_NAME",
  Description = "PROGRESS_TIER_ARCANUM_T1_DESC",
  ConditionList = {
    {
      DataType = "GAME_CONDITION_SCORE",
      ScoreNeeded = 0
    }
  },
  OnReachedFirstTimeActionList = {},
  OnReachedActionList = {},
  OnUnreachedActionList = {},
  UnlockableList = {
    "UNLOCKABLE_ARCANUM_AETHER_COURT"
  },
  ProgressTierImage = "ICON_ARCANUM_INFLUENCE",
  AllowTierCelebrationNotification = false
})

mod:registerAsset({
  DataType = "UNLOCKABLE",
  Id = "UNLOCKABLE_ARCANUM_AETHER_COURT",
  Name = "UNLOCKABLE_ARCANUM_AETHER_COURT_NAME",
  Description = "UNLOCKABLE_ARCANUM_AETHER_COURT_DESC",
  OptionalNameParameter = "UNLOCKABLE_ARCANUM_AETHER_COURT_NAME_OPTIONAL",
  BoughtText = "UNLOCKABLE_ARCANUM_AETHER_COURT_BOUGHT",
  DataCost = {
    DataInfluenceCostList = {},
    ResourceCollection = {
      {
        Resource = "GOLD_COINS",
        Quantity = 25
      }
    }
  },
  PrerequisiteUnlockableList = {},
  IsMajor = true,
  ActionList = {
    {
      DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
      BuildingProgressData = {
        DataType = "BUILDING_PROGRESS",
        UnlockName = "UNLOCKNAME_MONUMENT_ARCANUM_AETHER_COURT",
        AssetBuildingList = {
          "MONUMENT_ARCANUM_AETHER_COURT"
        },
        AdditionalBuildingUnlockList = {},
        AssetBuildingFunctionList = {},
        DataEstateDecorationList = {}
      }
    }
  },
  UnlockableImage = "ICON_AETHER_COURT"
})

mod:registerAsset({
  DataType = "PROGRESS_TIER_DATA",
  Id = "PROGRESS_TIER_ARCANUM_T2",
  Name = "PROGRESS_TIER_ARCANUM_T2_NAME",
  Description = "PROGRESS_TIER_ARCANUM_T2_DESC",
  ConditionList = {
    {
      DataType = "GAME_CONDITION_SCORE",
      ScoreNeeded = 10
    },
    {
      DataType = "GAME_CONDITION_SPLENDOR_REACHED",
      EstateList = {
        "ARCANUM"
      },
      SplendorAmount = 25
    }
  },
  OnReachedFirstTimeActionList = {},
  OnReachedActionList = {},
  OnUnreachedActionList = {},
  UnlockableList = {
    "UNLOCKABLE_ARCANUM_AETHER_COURT_TREASURY"
  },
  ProgressTierImage = "ICON_ARCANUM_INFLUENCE"
})


mod:registerAsset({
  DataType = "UNLOCKABLE",
  Id = "UNLOCKABLE_ARCANUM_AETHER_COURT_TREASURY",
  Name = "UNLOCKABLE_ARCANUM_AETHER_COURT_TREASURY_NAME",
  Description = "UNLOCKABLE_ARCANUM_AETHER_COURT_TREASURY_DESC",
  OptionalNameParameter = "UNLOCKABLE_ARCANUM_AETHER_COURT_TREASURY_NAME_OPTIONAL",
  BoughtText = "UNLOCKABLE_ARCANUM_AETHER_COURT_TREASURY_BOUGHT",
  DataCost = {
    DataInfluenceCostList = {
      {
        Estate = "ARCANUM",
        Quantity = 5
      }
    },
    ResourceCollection = {}
  },
  PrerequisiteUnlockableList = {
    "UNLOCKABLE_ARCANUM_AETHER_COURT"
  },
  IsMajor = false,
  ActionList = {
    {
      DataType = "GAME_ACTION_UNLOCK_BUILDING_LIST",
      BuildingProgressData = {
        DataType = "BUILDING_PROGRESS",
        UnlockName = "UNLOCKNAME_BUILDING_TREASURY",
        AssetBuildingList = {},
        AdditionalBuildingUnlockList = {
          {
            DataType = "PROGRESS_UNLOCK_BUILDING_PART",
            OwnerBuilding = "MONUMENT_ARCANUM_AETHER_COURT",
            AssetBuildingPartList = {},
            SubBuildingList = {
              "BUILDING_TREASURY"
            }
          }
        },
        AssetBuildingFunctionList = {},
        DataEstateDecorationList = {}
      }
    }
  },
  UnlockableImage = "ICON_UNLOCKABLE_TREASURY"
})

mod:registerAsset({
  DataType = "PROGRESS_TIER_DATA",
  Id = "PROGRESS_TIER_ARCANUM_T3",
  Name = "PROGRESS_TIER_ARCANUM_T3_NAME",
  Description = "PROGRESS_TIER_ARCANUM_T3_DESC",
  ConditionList = {
    {
      DataType = "GAME_CONDITION_SCORE",
      ScoreNeeded = 50
    },
    {
      DataType = "GAME_CONDITION_SPLENDOR_REACHED",
      EstateList = {
        "ARCANUM"
      },
      SplendorAmount = 75
    }
  },
  OnReachedFirstTimeActionList = {},
  OnReachedActionList = {},
  OnUnreachedActionList = {},
  UnlockableList = {},
  ProgressTierImage = "ICON_ARCANUM_INFLUENCE"
})

mod:registerAsset({
  DataType = "PROGRESS_TIER_DATA",
  Id = "PROGRESS_TIER_ARCANUM_T4",
  Name = "PROGRESS_TIER_ARCANUM_T4_NAME",
  Description = "PROGRESS_TIER_ARCANUM_T4_DESC",
  ConditionList = {
    {
      DataType = "GAME_CONDITION_SCORE",
      ScoreNeeded = 100
    },
    {
      DataType = "GAME_CONDITION_SPLENDOR_REACHED",
      EstateList = {
        "ARCANUM"
      },
      SplendorAmount = 150
    }
  },
  OnReachedFirstTimeActionList = {},
  OnReachedActionList = {},
  OnUnreachedActionList = {},
  UnlockableList = {},
  ProgressTierImage = "ICON_ARCANUM_INFLUENCE"
})

mod:registerAsset({
  DataType = "PROGRESS_TIER_DATA",
  Id = "PROGRESS_TIER_ARCANUM_T5",
  Name = "PROGRESS_TIER_ARCANUM_T5_NAME",
  Description = "PROGRESS_TIER_ARCANUM_T5_DESC",
  ConditionList = {
    {
      DataType = "GAME_CONDITION_SCORE",
      ScoreNeeded = 200
    },
    {
      DataType = "GAME_CONDITION_SPLENDOR_REACHED",
      EstateList = {
        "ARCANUM"
      },
      SplendorAmount = 300
    }
  },
  OnReachedFirstTimeActionList = {},
  OnReachedActionList = {},
  OnUnreachedActionList = {},
  UnlockableList = {},
  ProgressTierImage = "ICON_ARCANUM_INFLUENCE"
})

mod:registerAsset({
  DataType = "PRIVILEGE",
  Id = "PRIV_ARCANUM_MANDATORY_STUDY",
  TypeKey = "TypeKey",
  NameKey = "NameKey",
  DescriptionKey = "DescriptionKey",
  Image = "ICON_5",
  GameRuleModifierList = {
    -- {
    --   Name = "MyCustomName",
    --   DataGameRuleModifier = {
    --     Multiplier = 0.5
    --   },
    --   EstateAllegianceList = {
    --     "ARCANUM"
    --   }
    -- }
  },
  AssetEstate = "ARCANUM"
})

-- TODO: Remember to create an AGENT_PROFILE for Arcanum workers

-- Register the Arcanum Estate
mod:overrideAsset({
  Id = "DEFAULT_ESTATE_SETTING",
  AssetEstateList = {
      Action = "APPEND",
      "ARCANUM"
  }
})

mod:overrideAsset({
  Id = "STATUS_VILLAGER_SERF",
  CompatibleJobList = {
    Action = "APPEND",
    "JOB_RESEARCHER"
  }
})
local mod = ...

mod:registerAsset({
  DataType = "VILLAGER_STATUS",
  Id = "STATUS_AETHERCOURT_ASPIRANT",
  StatusNameGendered = {
    -- MALE
    "",
    -- FEMALE
    "",
    -- ALL
    "STATUS_AETHERCOURT_ASPIRANT_GENERIC_NAME"
  },
  StatusDescriptionGendered = {
    -- MALE
    "",
    -- FEMALE
    "",
    -- ALL
    "STATUS_AETHERCOURT_ASPIRANT_GENERIC_DESC"
  },
  TitleGendered = {
    -- MALE
    "",
    -- FEMALE
    "",
    -- ALL
    "STATUS_AETHERCOURT_ASPIRANT_GENERIC_TITLE"
  },
  StatusIcon = "ICON_2", -- TODO: Figure out where this is used in-game
  StatusImportance = 0, -- Set to default value, what does it mean?
  IsReachedByDefault = false, -- Set to default value, what does it mean?
  IsManuallyReached = false, -- Set to default value, what does it mean?
  IsSetNextStatusAutomaticallyWhenNeedsFilled = false, -- Set to default value, what does it mean? How does this work? How to specify what the next status IS?
  CanLowerStatusAssignJob = false, -- Set to default value, what does it mean?
  AssetAgentNeedList = { -- AGENT_NEED_TYPE
    "NEED_HOUSE_AETHERCOURT_ANNEX"
  },
  AssetAgentNeedToRemoveList = {
    "NEED_HOUSE_LEVEL_1" -- Is this needed?
  },
  CompatibleJobList = {
    "JOB_AETHERCOURT_SCHOLAR"
  },
  CharacterSetup = {
    DataType = "CHARACTER_SETUP",
    CharacterSetupDataGendered = {
      -- MALE
      {
        ClothingModel = {
            "PREFAB_BODY_MALE_DEFAULT"
        }
      },
      -- FEMALE
      {
        ClothingModel = {
            "PREFAB_BODY_FEMALE_DEFAULT"
        }
      },
      -- ALL
      {
        DataType = "CHARACTER_SETUP_DATA",
        WalkAnimationList = { "WALKING" },
        IdleAnimationList = { "IDLE" }
      }
    }
  },
  JobProgressionAffectedByStatusImportance = false -- Set to default value, what does it mean?
})


-- Register a new resource type (housing for the Aethercourt)
mod:registerEnumValue("RESOURCE_TYPE", "AETHERCOURT_ANNEX")


mod:registerAsset({
  DataType = "AGENT_NEED_TYPE_HOUSING", -- Parent class: AGENT_NEED_TYPE
  Id = "NEED_HOUSE_AETHERCOURT_ANNEX",
  Icon = "ICON_NEED_HOUSING",
  NeedTypeName = "NEED_HOUSE_AETHERCOURT_ANNEX_NAME",
  NeedTypeDescription = "NEED_HOUSE_AETHERCOURT_ANNEX_DESC",
  NeedTypeList = {
    "AETHERCOURT_ANNEX"
  },
  ProcessHousingBehavior = "BEHAVIOR_PROCESS_HOUSE"
})


-- Create new Villager_Profile for the Aethercourt
mod:registerAsset({
  DataType = "AGENT_PROFILE",
  Id = "PROFILE_AETHERCOURT_AETHERIANS",
  Behavior = "BEHAVIOR_VILLAGER",
  CharacterSetup = {
    CharacterSetupDataGendered = {
      -- MALE
      {
          DataType = "CHARACTER_SETUP_DATA",
          ClothingModel = {
              "PREFAB_BODY_MALE_DEFAULT"
          }
      },
      -- FEMALE
      {
          DataType = "CHARACTER_SETUP_DATA",
          ClothingModel = {
              "PREFAB_BODY_FEMALE_DEFAULT"
          }
      },
      -- ALL
      {
          DataType = "CHARACTER_SETUP_DATA",
      }
    }
  },
  ProfileFunction = {
    DataType = "AGENT_PROFILE_FUNCTION",
    AssetStatusQuotaGendered = {},
    IsNeedMasteredJobToPromote = true
  },
  Vehicle = nil,
  AssignWorkplaceFunction = VILLAGER_ASSIGN_WORKPLACE_FUNCTION_DEFAULT,
  ProfileNameGendered = {
    -- MALE
    "",
    -- FEMALE
    "",
    -- ALL
    "PROFILE_AETHERCOURT_AETHERIAN_ALL"
  },
  ProfileNamePluralGendered = {
    -- MALE
    "",
    -- FEMALE
    "",
    -- ALL
    "PROFILE_AETHERCOURT_AETHERIAN_ALL_PLURAL"
  },
  StatusList = {
    "STATUS_AETHERCOURT_ASPIRANT"
  },
  NavMeshUnlockCategoryList = {
    "ARCANE"
  },
  IsDefinitive = false,
  AllowUnemployedVillager = true,
  CanHaveAPartner = true,
  IsMergeVisitorNotification = false
})


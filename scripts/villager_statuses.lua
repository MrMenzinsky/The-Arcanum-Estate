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
    ""
  },
  StatusIcon = "ICON_RESOURCE_BARREL", -- This isn't used for VILLAGER_STATUS, but can't be nil.
  StatusImportance = 1, -- Set to 1 instead of 0 to leave room for a future lower status if needed.
  -- IsManuallyReached = true -- This isn't used for VILLAGER_STATUS, but can't be nil.
  IsReachedByDefault = true, -- This must be true for the lowest VILLAGER_STATUS in an AGENT_PROFILE. Otherwise its needs aren't registered correctly. Can be false for higher VILLAGER_STATUS that are promoted up to normally.
  IsSetNextStatusAutomaticallyWhenNeedsFilled = false,
  CanLowerStatusAssignJob = false,
  OptionalAdditionalBehavior = nil,
  AssetAgentNeedList = {
    "NEED_ESSENTIAL_WATER",
    "NEED_ESSENTIAL_FOOD_RUSTIC",
    "NEED_HOUSE_AETHERCOURT_ANNEX",
    "NEED_ADDITIONAL_FOOD_REFINED",
    "NEED_ADDITIONAL_SERVICE"
  },
  AssetAgentNeedToRemoveList = {},
  CompatibleJobList = {
    "JOB_AETHERCOURT_SCHOLAR"
  },
  CharacterSetup = {},
  JobProgressionAffectedByStatusImportance = false
})


mod:registerAsset({
  DataType = "AGENT_NEED_TYPE_HOUSING",
  Id = "NEED_HOUSE_AETHERCOURT_ANNEX",
  Icon = "ICON_NEED_HOUSING",
  NeedTypeName = "NEED_HOUSE_AETHERCOURT_ANNEX_NAME",
  NeedTypeDescription = "NEED_HOUSE_AETHERCOURT_ANNEX_DESC",
  IsNeedFirstConsumptionBeforeLacking = false,
  NeedTypeList = {
    "HOUSE_AETHERCOURT_ANNEX"
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
          WalkAnimationList = { "WALKING" },
          IdleAnimationList = { "IDLE" }
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
    -- , "STATUS_AETHERCOURT_ARCANIST"
  },
  NavMeshUnlockCategoryList = {
    "ARCANE"
  },
  IsDefinitive = false,
  AllowUnemployedVillager = true,
  CanHaveAPartner = true,
  IsMergeVisitorNotification = false
})


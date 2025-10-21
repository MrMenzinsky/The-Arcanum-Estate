local mod = ...

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
    AssetStatusQuotaGendered = {
      MALE = nil,
      FEMALE = nil,
      ALL = "AETHERCOURT_AETHERIANS_STATUS_QUOTA"
    },
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
    "STATUS_AETHERCOURT_ASPIRANT",
    "STATUS_AETHERCOURT_ARCANIST"
  },
  NavMeshUnlockCategoryList = {
    "ARCANE"
  },
  IsDefinitive = false, -- default value
  AllowUnemployedVillager = true, -- default value
  CanHaveAPartner = true, -- default value
  IsMergeVisitorNotification = false -- default value
})

mod:registerAsset({
  DataType = "VILLAGER_STATUS_QUOTA",
  Id = "AETHERCOURT_AETHERIANS_STATUS_QUOTA",
  VillagerStatusRatioList = {
    {
      DataType = "VILLAGER_STATUS_RATIO",
      Status = "STATUS_AETHERCOURT_ASPIRANT",
      Ratio = 0
    },
    {
      DataType = "VILLAGER_STATUS_RATIO",
      Status = "STATUS_AETHERCOURT_ARCANIST",
      Ratio = 0
    }
  }
})

mod:overrideAsset({
  DataType = "PROMOTION_COST_LIST",
  Id = "DEFAULT_PROMOTION_COST_LIST",
  StatusCostList = {
    Action = "APPEND",
    {
      -- Maybe unneccesary but lets keep it anyway
      DataType = "VILLAGER_STATUS_RESOURCE_LIST_PAIR",
      Status = "STATUS_AETHERCOURT_ASPIRANT",
      ResourceCollection = {
        {
          Resource = "GOLD_COINS",
          Quantity = 10
        }
      }
    },
    {
      DataType = "VILLAGER_STATUS_RESOURCE_LIST_PAIR",
      Status = "STATUS_AETHERCOURT_ARCANIST",
      ResourceCollection = {
        {
          Resource = "RESOURCE_GLYPH",
          Quantity = 10
        }
      }
    }
  }
})


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
    "JOB_AETHERCOURT_SCHOLAR",
    "JOB_AETHERCOURT_ARCHIVIST"
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
  HappinessFactor = "HAPPINESS_FACTOR_LACK_HOUSING",
  NeedTypeList = {
    "HOUSE_AETHERCOURT_ANNEX"
  },
  ProcessHousingBehavior = "BEHAVIOR_PROCESS_HOUSE"
})


mod:registerAsset({
  DataType = "VILLAGER_STATUS",
  Id = "STATUS_AETHERCOURT_ARCANIST",
  StatusNameGendered = {
    -- MALE
    "",
    -- FEMALE
    "",
    -- ALL
    "STATUS_AETHERCOURT_ARCANIST_GENERIC_NAME"
  },
  StatusDescriptionGendered = {
    -- MALE
    "",
    -- FEMALE
    "",
    -- ALL
    "STATUS_AETHERCOURT_ARCANIST_GENERIC_DESC"
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
  StatusImportance = 2, -- Set to 1 instead of 0 to leave room for a future lower status if needed.
  -- IsManuallyReached = true -- This isn't used for VILLAGER_STATUS, but can't be nil.
  IsReachedByDefault = false, -- This must be true for the lowest VILLAGER_STATUS in an AGENT_PROFILE. Otherwise its needs aren't registered correctly. Can be false for higher VILLAGER_STATUS that are promoted up to normally.
  IsSetNextStatusAutomaticallyWhenNeedsFilled = false,
  CanLowerStatusAssignJob = false,
  OptionalAdditionalBehavior = nil,
  AssetAgentNeedList = {
    "NEED_ESSENTIAL_FOOD_REFINED",
    "NEED_ESSENTIAL_FOOD_REFINED",
    "NEED_ESSENTIAL_SERVICE",
    "NEED_ADDITIONAL_ARCANUM_DISCOURSE",
    "NEED_ADDITIONAL_GOODS"
  },
  AssetAgentNeedToRemoveList = {
    "NEED_ESSENTIAL_FOOD_RUSTIC",
    "NEED_ADDITIONAL_FOOD_REFINED",
    "NEED_ADDITIONAL_SERVICE"
  },
  CompatibleJobList = {
    "JOB_AETHERCOURT_CASTER"
  },
  CharacterSetup = {},
  JobProgressionAffectedByStatusImportance = false
})

-- Like NEED_ESSENTIAL_ENTERTAINMENT (Tavern), but for Aetherians (Lyceum)
mod:registerAsset({
  DataType = "AGENT_NEED_TYPE_RESOURCE",
  Id = "NEED_ESSENTIAL_ARCANUM_DISCOURSE",

  -- AGENT_NEED_TYPE properties
  Icon = "ICON_NEED_ENTERTAINMENT", -- Fix custom icon later (book icon?)
  NeedTypeName = "NEED_ESSENTIAL_ARCANUM_DISCOURSE_NAME",
  NeedTypeDescription = "NEED_ESSENTIAL_ARCANUM_DISCOURSE_DESC",
  IsNeedFirstConsumptionBeforeLacking = false,
  HappinessFactor = "HAPPINESS_FACTOR_LACK_ENTERTAINMENT", -- Fix later, custom asset with matching icon?

  -- AGENT_NEED_TYPE_RESOURCE properties
  NeedTypeList = {
    "ARCANUM_DISCOURSE"
  },
  RestrictToLocalProviders = true, -- default value, what does it mean?
  -- ResourceNeedActivityMessage = <asset> -- Fix later, custom message for this need
})

-- Like NEED_ADDITIONAL_ENTERTAINMENT (Tavern), but for Aetherians (Lyceum)
mod:registerAsset({
  DataType = "AGENT_NEED_TYPE_RESOURCE",
  Id = "NEED_ADDITIONAL_ARCANUM_DISCOURSE",

  -- AGENT_NEED_TYPE properties
  Icon = "ICON_NEED_ENTERTAINMENT", -- Fix custom icon later (book icon?)
  NeedTypeName = "NEED_ADDITIONAL_ARCANUM_DISCOURSE_NAME",
  NeedTypeDescription = "NEED_ADDITIONAL_ARCANUM_DISCOURSE_DESC",
  IsNeedFirstConsumptionBeforeLacking = true,
  HappinessFactor = "HAPPINESS_FACTOR_LACK_ENTERTAINMENT", -- Fix later, custom asset with matching icon?

  -- AGENT_NEED_TYPE_RESOURCE properties
  NeedTypeList = {
    "ARCANUM_DISCOURSE"
  },
  RestrictToLocalProviders = true, -- default value, what does it mean?
  -- ResourceNeedActivityMessage = <asset> -- Fix later, custom message for this need
})

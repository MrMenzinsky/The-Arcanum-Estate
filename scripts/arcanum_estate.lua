local mod = ...

-- Unlockables for Arcanum Estate progress path tiers
mod:dofile("scripts/unlockables.lua")

-- Aethercourt monument
mod:dofile("scripts/aethercourt/monument.lua")


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

-- Register the Arcanum Estate
mod:overrideAsset({
  Id = "DEFAULT_ESTATE_SETTING",
  AssetEstateList = {
      Action = "APPEND",
      "ARCANUM"
  }
})


--------------------------
-- Progress path assets --
--------------------------

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


----------------------
-- Privilege assets --
----------------------

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

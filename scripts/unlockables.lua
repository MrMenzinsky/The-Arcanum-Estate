local mod = ...

mod:registerAsset({
  DataType = "UNLOCKABLE",
  Id = "UNLOCKABLE_ARCANUM_AETHERCOURT",
  Name = "UNLOCKABLE_ARCANUM_AETHERCOURT_NAME",
  Description = "UNLOCKABLE_ARCANUM_AETHERCOURT_DESC",
  OptionalNameParameter = "UNLOCKABLE_ARCANUM_AETHERCOURT_NAME_OPTIONAL",
  BoughtText = "UNLOCKABLE_ARCANUM_AETHERCOURT_BOUGHT",
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
        UnlockName = "UNLOCKNAME_MONUMENT_ARCANUM_AETHERCOURT",
        AssetBuildingList = {
          "MONUMENT_ARCANUM_AETHERCOURT"
        },
        AdditionalBuildingUnlockList = {},
        AssetBuildingFunctionList = {},
        DataEstateDecorationList = {}
      }
    }
  },
  UnlockableImage = "ICON_AETHERCOURT"
})

mod:registerAsset({
  DataType = "UNLOCKABLE",
  Id = "UNLOCKABLE_ARCANUM_AETHERCOURT_TREASURY",
  Name = "UNLOCKABLE_ARCANUM_AETHERCOURT_TREASURY_NAME",
  Description = "UNLOCKABLE_ARCANUM_AETHERCOURT_TREASURY_DESC",
  OptionalNameParameter = "UNLOCKABLE_ARCANUM_AETHERCOURT_TREASURY_NAME_OPTIONAL",
  BoughtText = "UNLOCKABLE_ARCANUM_AETHERCOURT_TREASURY_BOUGHT",
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
    "UNLOCKABLE_ARCANUM_AETHERCOURT"
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
            OwnerBuilding = "MONUMENT_ARCANUM_AETHERCOURT",
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

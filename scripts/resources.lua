local mod = ...

-- Register a new resource type
mod:registerEnumValue ("RESOURCE_TYPE", "ARCANE_LITERATURE")

-- Register a new resource type (housing for the Aethercourt)
mod:registerEnumValue("RESOURCE_TYPE", "HOUSE_AETHERCOURT_ANNEX")

-- Register a new resource type (entertainment for the Arcanum Estate)
mod:registerEnumValue("RESOURCE_TYPE", "ARCANUM_DISCOURSE")

mod:registerAssetId("icons/Icon_Resource_Glyph.png", "ICON_RESOURCE_GLYPH", "ATLAS_CELL")
mod:registerAssetId("icons/Icon_Resource_Arcane_Lore.png", "ICON_RESOURCE_ARCANE_LORE", "ATLAS_CELL")


mod:registerAsset({
  DataType = "RESOURCE",
  Id = "RESOURCE_GLYPH",
  ResourceName = "RESOURCE_GLYPH_NAME",
  Icon = "ICON_RESOURCE_GLYPH",
  ResourceTypeList = {
    "ARCANE_LITERATURE"
  },
  ResourceLayoutType = "TRUNKS",
  DisplayInToolbar = true,
  ResourceVisualPrefabList = {
    "PREFAB_RESOURCE_VISUAL_GENERIC_CRATE"
  },
  IndividualResourceVisualPrefabList = {
    "PREFAB_RESOURCE_VISUAL_GENERIC_CRATE"
  }
})

mod:registerAsset({
  DataType = "RESOURCE",
  Id = "RESOURCE_ARCANE_LORE",
  ResourceName = "RESOURCE_ARCANE_LORE_NAME",
  Icon = "ICON_RESOURCE_ARCANE_LORE",
  ResourceTypeList = {
    "ARCANE_LITERATURE"
  },
  ResourceLayoutType = "TRUNKS",
  DisplayInToolbar = true,
  ResourceVisualPrefabList = {
    "PREFAB_RESOURCE_VISUAL_GENERIC_CRATE"
  },
  IndividualResourceVisualPrefabList = {
    "PREFAB_RESOURCE_VISUAL_COAL_CRATE"
  }
})

mod:registerAsset({
  DataType = "RESOURCE",
  Id = "HOUSING_AETHERCOURT_ANNEX",
  ResourceName = "HOUSING_AETHERCOURT_ANNEX_NAME",
  Icon = "ICON_HOUSE_QUALITY_2",
  ResourceTypeList = {
    "HOUSE_AETHERCOURT_ANNEX"
  },
  IsTradable = false,
  DisplayInInventory = false,
  DisplayInToolbar = false,
  DisplayGizmo = false,
  IsDisplayContainerTracker = false,
  ResourceVisualPrefabList = {
    "PREFAB_EMPTY_PART"
  },
  IndividualResourceVisualPrefabList = {
    "PREFAB_EMPTY_PART"
  }
})

mod:registerAsset({
  DataType = "RESOURCE",
  Id = "AETHERCOURT_ARCANE_LECTURE",
  ResourceName = "AETHERCOURT_ARCANE_LECTURE_NAME",
  Icon = "ICON_HOUSE_QUALITY_2", -- Fix later, need a custom icon for mouse-over tooltip that shows the icon
  ResourceTypeList = {
    "ARCANUM_DISCOURSE"
  },
  IsTradable = false,
  DisplayInInventory = false,
  DisplayInToolbar = false,
  DisplayGizmo = false,
  IsDisplayContainerTracker = false,
  ResourceVisualPrefabList = {
    "PREFAB_EMPTY_PART"
  },
  IndividualResourceVisualPrefabList = {
    "PREFAB_EMPTY_PART"
  }
})

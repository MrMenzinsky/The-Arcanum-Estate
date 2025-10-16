local mod = ...

-- Register a new resource type
mod:registerEnumValue ("RESOURCE_TYPE", "ARCANE_LITERATURE")

-- Register a new resource type (housing for the Aethercourt)
mod:registerEnumValue("RESOURCE_TYPE", "HOUSE_AETHERCOURT_ANNEX")


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
  }--,
  -- TransportInteractiveLocationSetup = "INTERACTIVE_LOCATION_SETUP_TRANSPORT"
  -- Maybe needed when transporting the resource?
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

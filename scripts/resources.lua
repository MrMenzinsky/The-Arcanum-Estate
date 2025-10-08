local mod = ...

-- Register a new resource type
mod:registerEnumValue ("RESOURCE_TYPE", "ARCANE")


mod:registerAsset({
  DataType = "RESOURCE",
  Id = "RESOURCE_GLYPH",
  ResourceName = "RESOURCE_GLYPH_NAME",
  Icon = "ICON_RESOURCE_GLYPH",
  ResourceTypeList = {
    "RESOURCE",
    "LITERATURE",
    "ARCANE"
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

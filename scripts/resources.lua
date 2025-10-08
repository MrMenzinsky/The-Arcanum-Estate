local mod = ...

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

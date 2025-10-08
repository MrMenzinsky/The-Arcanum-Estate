local mod = ...

-- Aethercourt monument-wide building parts
mod:dofile("scripts/aethercourt/monument_parts.lua")

-- Academy sub-building
mod:dofile("scripts/academy/building.lua")

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
    -- Temporary reuse of existing building parts for quick testing
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

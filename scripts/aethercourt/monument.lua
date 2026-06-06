local mod = ...

-- Aethercourt monument-wide building parts
mod:dofile("scripts/aethercourt/monument_parts.lua")

-- Academy sub-building
mod:dofile("scripts/academy/building.lua")

-- Annex sub-building
mod:dofile("scripts/annex/building.lua")

-- Archive sub-building
mod:dofile("scripts/archive/building.lua")

-- Aetherium sub-building
mod:dofile("scripts/aetherium/building.lua")

-- Register the monument building
mod:registerAsset({
  DataType = "BUILDING",
  Id = "MONUMENT_ARCANUM_AETHERCOURT",
  Name = "MONUMENT_ARCANUM_AETHERCOURT_NAME",
  Description = "MONUMENT_ARCANUM_AETHERCOURT_DESC",
  BuildingType = BUILDING_TYPE.ADMINISTRATION,
  NavMeshLockCategory = "ARCANE",
  AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
  AssetBuildingPartList = {
    "SCHOLASTIC_QUARTERS_MINOR_PART",

    -- Test house
    "REAL_SMALL_HOUSE_PART",

    -- Chimneys
    "BUILDING_PART_CHIMNEY_E", -- Narrow Chimney?
    "BUILDING_PART_MANOR_HOUSE_ENCASED_CHIMNEY",
    "BUILDING_PART_MANOR_HOUSE_COVERED_CHIMNEY",

    -- Uncomment when QoL update is released
    -- "BUILDING_PART_VISITOR_LOCATION",

    -- Temporary reuse of existing building parts for quick testing
    -- Core
    "BUILDING_PART_MANOR_HOUSE_MANOR_GALLERY_MAJOR",
    "BUILDING_PART_MANOR_HOUSE_STONE_TOWER_MAJOR",
    "BUILDING_PART_MANOR_HOUSE_STONE_TOWER_MINOR",
    -- Doors
    "BUILDING_PART_MANOR_HOUSE_SIMPLE_STONE_ENTRANCE",
    "BUILDING_PART_MONASTERY_RUSTIC_GATE_ELEVATED",
    "BUILDING_PART_RUSTIC_CHURCH_HUMBLE_GATE",
  },
  SubAssetBuildingList = {
    "BUILDING_GREAT_HALL",
    "BUILDING_ARCANUM_AETHERCOURT_ACADEMY",
    "BUILDING_ARCANUM_AETHERCOURT_ANNEX",
    "BUILDING_ARCANUM_AETHERCOURT_ARCHIVE"
  }
})

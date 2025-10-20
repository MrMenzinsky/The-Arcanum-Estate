local mod = foundation.createMod();

-- Add a new enum value to restrict which villagers can go through the monument buildings.
mod:registerEnumValue("NAVMESH_LOCK_CATEGORY", "ARCANE")

-- Resources and their assets (icons)
mod:dofile("scripts/resources.lua")

-- Custom Building Function: BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE
mod:dofile("scripts/building_function_change_profile_workplace.lua")

-- Estate, progress path, and privilege assets
mod:dofile("scripts/arcanum_estate.lua")

-- Jobs and statuses
mod:dofile("scripts/villager_jobs.lua")
mod:dofile("scripts/villager_statuses.lua")

-- Estate icons
mod:registerAssetId("icons/Icon_Arcanum_Influence.png", "ICON_ARCANUM_INFLUENCE", "ATLAS_CELL")
mod:registerAssetId("icons/Icon_Arcanum_Splendor.png", "ICON_ARCANUM_SPLENDOR", "ATLAS_CELL")
mod:registerAssetId("icons/Icon_Aethercourt.png", "ICON_AETHERCOURT", "ATLAS_CELL")

-- TODO: Temp icons until I figure out what they are for...
mod:registerAssetId("icons/Icon_1.png", "ICON_1", "ATLAS_CELL") -- DualIcon
mod:registerAssetId("icons/Icon_2.png", "ICON_2", "ATLAS_CELL") -- 
mod:registerAssetId("icons/Icon_3.png", "ICON_3", "ATLAS_CELL") -- HeaderImage
mod:registerAssetId("icons/Icon_4.png", "ICON_4", "ATLAS_CELL") -- 
mod:registerAssetId("icons/Icon_5.png", "ICON_5", "ATLAS_CELL") -- Privilege Image



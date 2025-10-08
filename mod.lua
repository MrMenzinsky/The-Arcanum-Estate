local mod = foundation.createMod();

-- Estate, progress path, and privilege assets
mod:dofile("scripts/arcanum_estate.lua")

-- Resources and their assets (icons)
mod:dofile("scripts/resources.lua")

-- Jobs and statuses
mod:dofile("scripts/villager_jobs.lua")
mod:dofile("scripts/villager_statuses.lua")

-- Estate icons
mod:registerAssetId("icons/Icon_Arcanum_Influence.png", "ICON_ARCANUM_INFLUENCE", "ATLAS_CELL")
mod:registerAssetId("icons/Icon_Arcanum_Splendor.png", "ICON_ARCANUM_SPLENDOR", "ATLAS_CELL")
mod:registerAssetId("icons/Icon_Aether_Court.png", "ICON_AETHER_COURT", "ATLAS_CELL")

-- TODO: Temp icons until I figure out what they are for...
mod:registerAssetId("icons/Icon_1.png", "ICON_1", "ATLAS_CELL") -- DualIcon
mod:registerAssetId("icons/Icon_2.png", "ICON_2", "ATLAS_CELL") -- 
mod:registerAssetId("icons/Icon_3.png", "ICON_3", "ATLAS_CELL") -- HeaderImage
mod:registerAssetId("icons/Icon_4.png", "ICON_4", "ATLAS_CELL") -- 
mod:registerAssetId("icons/Icon_5.png", "ICON_5", "ATLAS_CELL") -- Privilege Image


-- Add a new enum value to restrict which villagers can go through the monument buildings.
mod:registerEnumValue("NAVMESH_LOCK_CATEGORY", "ARCANE")

-- TODO: Remember to create an AGENT_PROFILE for Arcanum workers

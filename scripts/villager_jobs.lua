local mod = ...

mod:registerAsset({
  DataType = "JOB",
  Id = "JOB_RESEARCHER",
  JobName = "JOB_RESEARCHER_NAME",
  JobDescription = "JOB_RESEARCHER_DESC",
  UseWorkplaceBehavior = true,
  NeededMasteredJobList = {},
  ExperienceToMaster = 20, -- TODO: What does this mean?
  AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
  -- AssetJobProgression = "SCHOLAR_JOB_PROGRESSION" -- TODO: Check if this is needed
  -- CharacterSetup = {}, -- Advanced customization of the character
  IsDefinitive = true,
  IsLockedByDefault = true
})

-- TODO: Check how this works and if its applicable on my magic users?!
-- mod:registerAsset({
--   DataType = "JOB_PROGRESSION",
--   Id = "SCHOLAR_JOB_PROGRESSION",
--   ProgressionElementList = {
--     {
--       DataType = "JOB_PROGESSION_ELEMENT",
--       XpNeeded = 1000 -- TODO: Check what this means in relation to what?!?
--     }
--   }
-- })

mod:overrideAsset({
  Id = "STATUS_VILLAGER_SERF",
  CompatibleJobList = {
    Action = "APPEND",
    "JOB_RESEARCHER"
  }
})
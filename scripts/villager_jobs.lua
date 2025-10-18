local mod = ...

mod:registerAsset({
  DataType = "JOB",
  Id = "JOB_AETHERCOURT_SCHOLAR",
  JobName = "JOB_AETHERCOURT_SCHOLAR_NAME",
  JobDescription = "JOB_AETHERCOURT_SCHOLAR_DESC",
  UseWorkplaceBehavior = true,
  NeededMasteredJobList = {},
  -- ExperienceToMaster = 20, -- TODO: What does this mean?
  -- AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
  AssetJobProgression = "SCHOLAR_JOB_PROGRESSION",
  CharacterSetup = {}, -- Advanced customization of the character
  IsDefinitive = true,
  IsLockedByDefault = true
})

-- From Mathieu:
-- Default: 20, 40, 80, 130, 180
-- Combatant: 500, 1000, 1500, 2000, 2500
mod:registerAsset({
  DataType = "JOB_PROGRESSION",
  Id = "SCHOLAR_JOB_PROGRESSION",
  ProgressionElementList = {
    {
      DataType = "JOB_PROGESSION_ELEMENT",
      XpNeeded = 30 -- For level 2
    },
    {
      DataType = "JOB_PROGESSION_ELEMENT",
      XpNeeded = 60 -- For level 3
    },
    {
      DataType = "JOB_PROGESSION_ELEMENT",
      XpNeeded = 120 -- For level 4
    },
    {
      DataType = "JOB_PROGESSION_ELEMENT",
      XpNeeded = 200 -- For level 5
    }
  }
})

mod:overrideAsset({
  Id = "STATUS_VILLAGER_SERF",
  CompatibleJobList = {
    Action = "APPEND",
    "JOB_AETHERCOURT_SCHOLAR"
  }
})

mod:registerAsset({
  DataType = "JOB",
  Id = "JOB_AETHERCOURT_ARCHIVIST",
  JobName = "JOB_AETHERCOURT_ARCHIVIST_NAME",
  JobDescription = "JOB_AETHERCOURT_ARCHIVIST_DESC",
  UseWorkplaceBehavior = true,
  NeededMasteredJobList = {},
  AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
  CharacterSetup = {}, -- Advanced customization of the character
  IsDefinitive = false,
  IsLockedByDefault = true,
  AreLowerStatusCompatible = false
})

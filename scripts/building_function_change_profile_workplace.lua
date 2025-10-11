local mod = ...

-- Defines a custom building function asset for changing a villagers agent_profile on assignment

local BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE = {
  TypeName = "BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE",
  ParentType = "BUILDING_FUNCTION_WORKPLACE",
  Properties = {
    { Name = "TargetProfile", Type = "AGENT_PROFILE" },
    { Name = "RevertOnDismissal", Type = "boolean", Default = false },
    { Name = "RevertOnBuildingDestruction", Type = "boolean", Default = false }
  }
}

function BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:onInit(gameObject)
  self.super:onInit(gameObject)
  mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:onInit() called")
  mod:log("TargetProfile: " .. tostring(self.TargetProfile))
  mod:log("RevertOnDismissal: " .. tostring(self.RevertOnDismissal))
  mod:log("RevertOnBuildingDestruction: " .. tostring(self.RevertOnBuildingDestruction))

  -- Setup the component
  local compChangeProfile = gameObject:getOrCreateComponent("COMP_CHANGE_PROFILE")
  mod:log("Is compChangeProfile nil? " .. tostring(compChangeProfile == nil))
  
  -- Set properties on the component
  compChangeProfile.TargetProfile = self.TargetProfile
  compChangeProfile.RevertOnDismissal = self.RevertOnDismissal
  compChangeProfile.RevertOnBuildingDestruction = self.RevertOnBuildingDestruction

  return true
end

function BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:reloadBuildingFunction(gameObject)
  self.super:reloadBuildingFunction(gameObject)
  mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:reloadBuildingFunction() called")
end

function BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:removeBuildingFunction(gameObject)
  self.super:removeBuildingFunction(gameObject)
  mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:removeBuildingFunction() called")
end

mod:registerClass(BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE)


-- Defines a custom component for changing a villagers agent_profile on assignment to workplace

local COMP_CHANGE_PROFILE = {
  TypeName = "COMP_CHANGE_PROFILE",
  ParentType = "COMPONENT",
  Properties = {
    { Name = "TargetProfile", Type = "AGENT_PROFILE", Default = nil, Flags = { "SAVE_GAME" } },
    { Name = "RevertOnDismissal", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
    { Name = "RevertOnBuildingDestruction", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } }
  }
}

function COMP_CHANGE_PROFILE:init()
  mod:log("COMP_CHANGE_PROFILE:init() called")

  mod:log("TargetProfile: " .. tostring(self.TargetProfile))
  mod:log("RevertOnDismissal: " .. tostring(self.RevertOnDismissal))
  mod:log("RevertOnBuildingDestruction: " .. tostring(self.RevertOnBuildingDestruction))
end

function COMP_CHANGE_PROFILE:onEnabled()
  mod:log("COMP_CHANGE_PROFILE:onEnabled() called")

  local compWorkplace = self:getOwner():getEnabledComponent("COMP_WORKPLACE")
  mod:log("COMP_CHANGE_PROFILE:onEnabled() compWorkplace: " .. tostring(compWorkplace))
  
  -- Check all current workers and change their profiles if needed
  self:changeAllVillagerProfiles(compWorkplace)

  event.register(self, compWorkplace.ON_ASSIGNED_WORKER_CHANGED,
    function(compVillager)
      mod:log("event ON_ASSIGNED_WORKER_CHANGED called")
      if compVillager:hasJob() then
        self:changeVillagerProfile(compVillager)
      else
        if self.RevertOnDismissal then
          self:revertVillager(compVillager)
        end
      end
    end
  )
end

function COMP_CHANGE_PROFILE:onDisabled()
  mod:log("COMP_CHANGE_PROFILE:onDisabled() called")
  local compWorkplace = self:getOwner():getEnabledComponent("COMP_WORKPLACE")
  event.unregister(self, compWorkplace.ON_ASSIGNED_WORKER_CHANGED)
end

function COMP_CHANGE_PROFILE:logPrintVillager(compVillager)
  mod:log("COMP_CHANGE_PROFILE:logPrintVillager() called")
  mod:log("compVillager.getJobInstance(): " .. tostring(compVillager:getJobInstance()))
  mod:log("compVillager.findDisplayJobInstance(): " .. tostring(compVillager:findDisplayJobInstance()))
  mod:log("compVillager.getAssetJob(): " .. tostring(compVillager:getAssetJob()))
  mod:log("compVillager.hasJob(): " .. tostring(compVillager:hasJob()))
end

function COMP_CHANGE_PROFILE:changeVillagerProfile(compVillager)
  mod:log("COMP_CHANGE_PROFILE:changeVillagerProfile() called")
  local compAgent = compVillager:getOwner():getEnabledComponent("COMP_AGENT")

  self:logPrintVillager(compVillager)

  local currentVillagerProfile = compAgent:getProfile()
  mod:log("currentVillagerProfile: " .. tostring(currentVillagerProfile))

  -- Check that the villager doesn't already have the correct profile
  if currentVillagerProfile ~= self.TargetProfile then
    mod:log("Begin changing profile")
    compAgent:setProfile(self.TargetProfile)
    mod:log("Finished changing profile")
  end
end

function COMP_CHANGE_PROFILE:changeAllVillagerProfiles(compWorkplace)
  mod:log("COMP_CHANGE_PROFILE:changeAllVillagerProfiles() called")
  local allCurrentWorkers = compWorkplace.AssignedWorkerList
  local nrOfWorkers = #allCurrentWorkers

  mod:log("allCurrentWorkers: " .. tostring(allCurrentWorkers))
  mod:log("nrOfWorkers: " .. tostring(nrOfWorkers))

  if nrOfWorkers > 0 then
    for i = 1, nrOfWorkers do
      self:changeVillagerProfile(allCurrentWorkers[i])
    end
  end
end

function COMP_CHANGE_PROFILE:revertVillager(compVillager)
  mod:log("COMP_CHANGE_PROFILE:revertVillager() called")
  self:logPrintVillager(compVillager)

  -- Remove villager_job when reverting, but avoid infinite event-loop if already dismissed
  if compVillager:hasJob() then
    compVillager:changeJob(nil)
  end
  
  local compAgent = compVillager:getOwner():getEnabledComponent("COMP_AGENT")
  compAgent:setProfile("PROFILE_VILLAGER")
end

function COMP_CHANGE_PROFILE:revertAllToVillagerProfile()
  mod:log("COMP_CHANGE_PROFILE:revertAllToVillagerProfile() called")
  local compWorkplace = self:getOwner():getEnabledComponent("COMP_WORKPLACE")
  local allCurrentWorkers = compWorkplace.AssignedWorkerList
  local nrOfWorkers = #allCurrentWorkers

  if nrOfWorkers > 0 then
    for i = 1, nrOfWorkers do
      mod:log("COMP_CHANGE_PROFILE:revertAllToVillagerProfile() loop called")
      self:revertVillager(allCurrentWorkers[i])
    end
  end
end

function COMP_CHANGE_PROFILE:onFinalize(isClearingLevel)
  mod:log("COMP_CHANGE_PROFILE:onFinalize() called")
  if not isClearingLevel then
    mod:log("COMP_CHANGE_PROFILE:onFinalize() not isClearingLevel == true")
    if self.RevertOnBuildingDestruction then
      mod:log("COMP_CHANGE_PROFILE:onFinalize() RevertOnBuildingDestruction == true")
      self:revertAllToVillagerProfile()
    end
  end
end

mod:registerClass(COMP_CHANGE_PROFILE)

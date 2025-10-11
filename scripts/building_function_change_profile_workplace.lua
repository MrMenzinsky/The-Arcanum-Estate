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

  -- -- Make sure to call removeBuildingFunction when the building is destroyed
  -- mod:log("self.IsCallRemoveBuildingFunctionOnBuildableDestruction (before): " .. tostring(self.IsCallRemoveBuildingFunctionOnBuildableDestruction))
  -- self.IsCallRemoveBuildingFunctionOnBuildableDestruction = true
  -- mod:log("self.IsCallRemoveBuildingFunctionOnBuildableDestruction (after): " .. tostring(self.IsCallRemoveBuildingFunctionOnBuildableDestruction))

  -- Setup the component
  local compChangeProfileWorkplace = gameObject:getOrCreateComponent("COMP_CHANGE_PROFILE_WORKPLACE")
  mod:log("Is compChangeProfileWorkplace nil? " .. tostring(compChangeProfileWorkplace == nil))
  
  compChangeProfileWorkplace.TargetProfile = self.TargetProfile
  compChangeProfileWorkplace.RevertOnDismissal = self.RevertOnDismissal
  compChangeProfileWorkplace.RevertOnBuildingDestruction = self.RevertOnBuildingDestruction

  return true
end

function BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:reloadBuildingFunction(gameObject)
  self.super:reloadBuildingFunction(gameObject)
  mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:reloadBuildingFunction() called")
end

function BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:removeBuildingFunction(gameObject)
  self.super:removeBuildingFunction(gameObject)
  mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:removeBuildingFunction() called")
  
  -- local compChangeProfileWorkplace = gameObject:getEnabledComponent("COMP_CHANGE_PROFILE_WORKPLACE")

  -- if self.RevertOnBuildingDestruction then
  --   mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:removeBuildingFunction() RevertOnBuildingDestruction == true")
  --   compChangeProfileWorkplace:revertAllToVillagerProfile()
  -- end

  -- gameObject:removeComponent(compChangeProfileWorkplace)
end

mod:registerClass(BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE)




-- Defines a custom building function component for changing a villagers agent_profile on assignment

local COMP_CHANGE_PROFILE_WORKPLACE = {
  TypeName = "COMP_CHANGE_PROFILE_WORKPLACE",
  ParentType = "COMPONENT",
  Properties = {
    { Name = "TargetProfile", Type = "AGENT_PROFILE", Default = nil, Flags = { "SAVE_GAME" } },
    { Name = "RevertOnDismissal", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } },
    { Name = "RevertOnBuildingDestruction", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } }
  }
}

function COMP_CHANGE_PROFILE_WORKPLACE:init()
  -- self.super:init()
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:init() called")
  -- Do I need to do anything here?

  mod:log("TargetProfile: " .. tostring(self.TargetProfile))
  mod:log("RevertOnDismissal: " .. tostring(self.RevertOnDismissal))
  mod:log("RevertOnBuildingDestruction: " .. tostring(self.RevertOnBuildingDestruction))

  local compWorkplace = self:getOwner():getEnabledComponent("COMP_WORKPLACE")
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:init() compWorkplace: " .. tostring(compWorkplace.AssignedWorkerList))
end

function COMP_CHANGE_PROFILE_WORKPLACE:onEnabled()
  -- self.super:onEnabled()
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onEnabled() called")

  -- Get COMP_WORKPLACE
  local compWorkplace = self:getOwner():getEnabledComponent("COMP_WORKPLACE")
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onEnabled() compWorkplace: " .. tostring(compWorkplace))
  
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

function COMP_CHANGE_PROFILE_WORKPLACE:onDisabled()
  -- self.super:onDisabled()
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onDisabled() called")
  local compWorkplace = self:getOwner():getEnabledComponent("COMP_WORKPLACE")
  event.unregister(self, compWorkplace.ON_ASSIGNED_WORKER_CHANGED)
end

-- function COMP_CHANGE_PROFILE_WORKPLACE:registerVillager(compVillager)
--   self.super:registerVillager(compVillager)
--   mod:log("COMP_CHANGE_PROFILE_WORKPLACE:registerVillager() called")
--   local compAgent = compVillager:getOwner():getEnabledComponent("COMP_AGENT")

--   -- Check that the villager doesn't already have the correct profile
--   if compAgent:getProfile() ~= self.TargetProfile then
--     compAgent:setProfile(self.TargetProfile)
--   end
-- end

-- function COMP_CHANGE_PROFILE_WORKPLACE:unregisterVillager(compVillager)
--   self.super:unregisterVillager(compVillager)
--   mod:log("COMP_CHANGE_PROFILE_WORKPLACE:unregisterVillager() called")

--   if self.RevertOnDismissal then
--     mod:log("COMP_CHANGE_PROFILE_WORKPLACE:unregisterVillager() RevertOnDismissal == true")
--     self:revertVillager(compVillager)
--   end
-- end

function COMP_CHANGE_PROFILE_WORKPLACE:logPrintVillager(compVillager)
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:logPrintVillager() called")
  mod:log("compVillager.getJobInstance(): " .. tostring(compVillager:getJobInstance()))
  mod:log("compVillager.findDisplayJobInstance(): " .. tostring(compVillager:findDisplayJobInstance()))
  mod:log("compVillager.getAssetJob(): " .. tostring(compVillager:getAssetJob()))
  mod:log("compVillager.hasJob(): " .. tostring(compVillager:hasJob()))
end

function COMP_CHANGE_PROFILE_WORKPLACE:changeVillagerProfile(compVillager)
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:changeVillagerProfile() called")
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

function COMP_CHANGE_PROFILE_WORKPLACE:changeAllVillagerProfiles(compWorkplace)
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:changeAllVillagerProfiles() called")
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

function COMP_CHANGE_PROFILE_WORKPLACE:revertVillager(compVillager)
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:revertVillager() called")
  self:logPrintVillager(compVillager)
  if compVillager:hasJob() then
    compVillager:changeJob(nil)
  end
  local compAgent = compVillager:getOwner():getEnabledComponent("COMP_AGENT")
  compAgent:setProfile("PROFILE_VILLAGER")
end

function COMP_CHANGE_PROFILE_WORKPLACE:revertAllToVillagerProfile()
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:revertAllToVillagerProfile() called")
  local compWorkplace = self:getOwner():getEnabledComponent("COMP_WORKPLACE")
  local allCurrentWorkers = compWorkplace.AssignedWorkerList
  local nrOfWorkers = #allCurrentWorkers

  if nrOfWorkers > 0 then
    for i = 1, nrOfWorkers do
      mod:log("COMP_CHANGE_PROFILE_WORKPLACE:revertAllToVillagerProfile() loop called")
      self:revertVillager(allCurrentWorkers[i])
    end
  end
end

function COMP_CHANGE_PROFILE_WORKPLACE:onFinalize(isClearingLevel)
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onFinalize() called")
  if not isClearingLevel then
    mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onFinalize() not isClearingLevel == true")
    if self.RevertOnBuildingDestruction then
      mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onFinalize() RevertOnBuildingDestruction == true")
      self:revertAllToVillagerProfile()
    end
  end
end

mod:registerClass(COMP_CHANGE_PROFILE_WORKPLACE)

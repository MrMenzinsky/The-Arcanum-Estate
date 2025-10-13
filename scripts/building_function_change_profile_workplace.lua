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

  -- Create the component
  local compChangeProfile = gameObject:getOrCreateComponent("COMP_CHANGE_PROFILE")
  
  -- Set properties on the component
  compChangeProfile.TargetProfile = self.TargetProfile
  compChangeProfile.RevertOnDismissal = self.RevertOnDismissal
  compChangeProfile.RevertOnBuildingDestruction = self.RevertOnBuildingDestruction

  return true
end

function BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:reloadBuildingFunction(gameObject)
  self.super:reloadBuildingFunction(gameObject)
end

function BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:removeBuildingFunction(gameObject)
  local comp = gameObject:getEnabledComponent("COMP_CHANGE_PROFILE")
  self.super:removeBuildingFunction(gameObject)
  gameObject:removeComponent(comp)
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

function COMP_CHANGE_PROFILE:onEnabled()
  local compWorkplace = self:getOwner():getEnabledComponent("COMP_WORKPLACE")
  
  -- Check all current workers and change their profiles if needed
  self:changeAllVillagerProfiles(compWorkplace)

  event.register(self, compWorkplace.ON_ASSIGNED_WORKER_CHANGED,
    function(compVillager)
      if compVillager:hasJob() then -- If villager was assigned to workplace
        self:changeVillagerProfile(compVillager)
      else -- If villager was dismissed from workplace
        if self.RevertOnDismissal then
          self:revertVillager(compVillager)
        end
      end
    end
  )
end

function COMP_CHANGE_PROFILE:onDisabled()
  local compWorkplace = self:getOwner():getEnabledComponent("COMP_WORKPLACE")
  event.unregister(self, compWorkplace.ON_ASSIGNED_WORKER_CHANGED)
end

function COMP_CHANGE_PROFILE:changeVillagerProfile(compVillager)
  local compAgent = compVillager:getOwner():getEnabledComponent("COMP_AGENT")
  local currentVillagerProfile = compAgent:getProfile()

  -- Check that the villager doesn't already have the correct profile
  if currentVillagerProfile ~= self.TargetProfile then
    compAgent:setProfile(self.TargetProfile)
  end
end

function COMP_CHANGE_PROFILE:changeAllVillagerProfiles(compWorkplace)
  local allCurrentWorkers = compWorkplace.AssignedWorkerList
  local nrOfWorkers = #allCurrentWorkers

  if nrOfWorkers > 0 then
    for i = 1, nrOfWorkers do
      self:changeVillagerProfile(allCurrentWorkers[i])
    end
  end
end

function COMP_CHANGE_PROFILE:revertVillager(compVillager)
  -- Remove villager_job when reverting,
  -- but avoid infinite event-loop if already dismissed
  if compVillager:hasJob() then
    compVillager:changeJob(nil)
  end

  local compAgent = compVillager:getOwner():getEnabledComponent("COMP_AGENT")
  compAgent:setProfile("PROFILE_VILLAGER")
end

function COMP_CHANGE_PROFILE:revertAllToVillagerProfile()
  local compWorkplace = self:getOwner():getEnabledComponent("COMP_WORKPLACE")
  local allCurrentWorkers = compWorkplace.AssignedWorkerList
  local nrOfWorkers = #allCurrentWorkers

  if nrOfWorkers > 0 then
    for i = 1, nrOfWorkers do
      self:revertVillager(allCurrentWorkers[i])
    end
  end
end

function COMP_CHANGE_PROFILE:onFinalize(isClearingLevel)
  if not isClearingLevel then
    if self.RevertOnBuildingDestruction then
      self:revertAllToVillagerProfile()
    end
  end
end

mod:registerClass(COMP_CHANGE_PROFILE)

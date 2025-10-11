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

  -- Make sure to call removeBuildingFunction when the building is destroyed
  self.super.IsCallRemoveBuildingFunctionOnBuildableDestruction = true

  -- Test to see if it already exists, expecting nil.
  local compChangeProfileWorkplace = gameObject:getComponent("COMP_CHANGE_PROFILE_WORKPLACE")
  mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:onInit() compChangeProfileWorkplace: " .. tostring(compChangeProfileWorkplace))
  -- Result: compChangeProfileWorkplace == nil

  -- Setup the component
  compChangeProfileWorkplace = gameObject:getOrCreateComponent("COMP_CHANGE_PROFILE_WORKPLACE")
  -- Result: compChangeProfileWorkplace == nil still (why?)

  if compChangeProfileWorkplace == nil then
    mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:onInit() compChangeProfileWorkplace == nil, so creating new component?")

    -- Now when we've supposedly created the component above, should get the component, right?
    compChangeProfileWorkplace = gameObject:getComponent("COMP_CHANGE_PROFILE_WORKPLACE")
    mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:onInit() compChangeProfileWorkplace: " .. tostring(compChangeProfileWorkplace))
    -- Result: compChangeProfileWorkplace == nil still?!?! Why isn't it getting created?
  end

  -- Below assignments fail due to component being nil...
  compChangeProfileWorkplace.TargetProfile = self.TargetProfile
  compChangeProfileWorkplace.RevertOnDismissal = self.RevertOnDismissal
  return true
end

function BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:reloadBuildingFunction(gameObject)
  self.super:reloadBuildingFunction(gameObject)
  mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:reloadBuildingFunction() called")
  self:onInit(gameObject)
end

function BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:removeBuildingFunction(gameObject)
  self.super:removeBuildingFunction(gameObject)
  mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:removeBuildingFunction() called")

  if self.RevertOnBuildingDestruction then
    mod:log("BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE:removeBuildingFunction() RevertOnBuildingDestruction == true")
    local compChangeProfileWorkplace = gameObject:getEnabledComponent("COMP_CHANGE_PROFILE_WORKPLACE")
    compChangeProfileWorkplace:revertAllToVillagerProfile()
  end
end

mod:registerClass(BUILDING_FUNCTION_CHANGE_PROFILE_WORKPLACE)


-- Defines a custom building function componentfor changing a villagers agent_profile on assignment

local COMP_CHANGE_PROFILE_WORKPLACE = {
  TypeName = "COMP_CHANGE_PROFILE_WORKPLACE",
  ParentType = "COMP_WORKPLACE",
  Properties = {
    { Name = "TargetProfile", Type = "AGENT_PROFILE", Default = nil, Flags = { "SAVE_GAME" } },
    { Name = "RevertOnDismissal", Type = "boolean", Default = false, Flags = { "SAVE_GAME" } }
  }
}

function COMP_CHANGE_PROFILE_WORKPLACE:init()
  self.super:init()
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:init() called")
  -- Do I need to do anything here?
end

function COMP_CHANGE_PROFILE_WORKPLACE:onEnabled()
  self.super:onEnabled()
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onEnabled() called")
end

function COMP_CHANGE_PROFILE_WORKPLACE:onDisabled()
  self.super:onDisabled()
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onDisabled() called")
end

function COMP_CHANGE_PROFILE_WORKPLACE:registerVillager(compVillager)
  self.super:registerVillager(compVillager)
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:registerVillager() called")
  local compAgent = compVillager:getOwner():getEnabledComponent("COMP_AGENT")

  -- Check that the villager doesn't already have the correct profile
  if compAgent:getProfile() ~= self.TargetProfile then
    compAgent:setProfile(self.TargetProfile)
  end
end

function COMP_CHANGE_PROFILE_WORKPLACE:unregisterVillager(compVillager)
  self.super:unregisterVillager(compVillager)
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:unregisterVillager() called")

  if self.RevertOnDismissal then
    mod:log("COMP_CHANGE_PROFILE_WORKPLACE:unregisterVillager() RevertOnDismissal == true")
    self:revertVillager(compVillager)
  end
end

function COMP_CHANGE_PROFILE_WORKPLACE:revertVillager(compVillager)
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:revertVillager() called")
  local compAgent = compVillager:getOwner():getEnabledComponent("COMP_AGENT")
  compAgent:setProfile("PROFILE_VILLAGER")
end

function COMP_CHANGE_PROFILE_WORKPLACE:revertAllToVillagerProfile()
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:revertAllToVillagerProfile() called")
  for compVillager in ipairs(self.super.AssignedWorkerList) do
    mod:log("COMP_CHANGE_PROFILE_WORKPLACE:revertAllToVillagerProfile() loop called")
    self:revertVillager(compVillager)
  end
end

function COMP_CHANGE_PROFILE_WORKPLACE:onFinalize(isClearingLevel)
  mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onFinalize() called")
  if not isClearingLevel then
    mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onFinalize() not isClearingLevel == true")
    if self.RevertOnDismissal then
      mod:log("COMP_CHANGE_PROFILE_WORKPLACE:onFinalize() RevertOnDismissal == true")
      self:revertAllToVillagerProfile()
    end
  end
end

mod:registerClass(COMP_CHANGE_PROFILE_WORKPLACE)




-- create(): when the component is created
-- init(): when the component is initialized in the game
-- update(): at each frame
-- onEnabled(): when the component is enabled
-- onDisabled(): when the component is disabled
-- onFinalize(_isClearingLevel): when the component is destroyed, only if it has been initialized
-- onDestroy(_isClearingLevel): when the component is destroyed, after onFinalize
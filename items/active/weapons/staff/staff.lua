require "/scripts/util.lua"
require "/scripts/vec2.lua"
require "/items/active/weapons/weapon.lua"

function init()
self.critChance = config.getParameter("critChance", 0)
self.critBonus = config.getParameter("critBonus", 0)
  activeItem.setCursor("/cursors/reticle0.cursor")
  animator.setGlobalTag("paletteSwaps", config.getParameter("paletteSwaps", ""))

  self.weapon = Weapon:new()

  self.weapon:addTransformationGroup("weapon", {0,0}, 0)
  
  local primaryAbility = getPrimaryAbility()
  self.weapon:addAbility(primaryAbility)

  local secondaryAttack = getAltAbility(self.weapon.elementalType)
  if secondaryAttack then
    self.weapon:addAbility(secondaryAttack)
  end
  --*************************************    
  -- FU/FR ADDONS
   if self.staffCount == nil then 
     self.staffCount = 0 
   end
   if self.staffCount2 == nil then 
     self.staffCount2 = 0 
   end  
   local species = world.entitySpecies(activeItem.ownerEntityId())
            if species == "greckan" then      
              self.staffCount = self.staffCount + 0.30
              self.staffCount2 = self.staffCount2 + 0.10
              status.setPersistentEffects("avianbonusdmg", {
              {stat = "powerMultiplier", baseMultiplier = 1 + self.staffCount},
              {stat = "physicalResistance", baseMultiplier = 1 + self.staffCount2}
              }) 
              local bounds = mcontroller.boundBox()
            end     
            if species == "avian" then      
              self.staffCount = self.staffCount + 0.20
              status.setPersistentEffects("avianbonusdmg", {
              {stat = "powerMultiplier", baseMultiplier = 1 + self.staffCount},
              {stat = "maxEnergy", baseMultiplier = 1 + self.staffCount},
              {stat = "critBonus", baseMultiplier = 1 + self.staffCount}
              }) 
              local bounds = mcontroller.boundBox()
            end            
            if species == "kineptic" then     
              self.staffCount = self.staffCount + 0.25
              status.setPersistentEffects("ningenbonusdmg", {
              {stat = "powerMultiplier", baseMultiplier = 1 + self.staffCount},
              {stat = "energyRegenPercentageRate", amount = 0.2},
              {stat = "energyRegenBlockTime", amount = -0.5}
              })  
            end             
            if species == "ningen" then     
              self.staffCount = self.staffCount + 0.15
              status.setPersistentEffects("ningenbonusdmg", {{stat = "maxEnergy", baseMultiplier = 1 + self.staffCount}})  
            end  
            if species == "viera" then     
              self.staffCount = self.staffCount + 0.15
              status.setPersistentEffects("ningenbonusdmg", {
                {stat = "maxEnergy", baseMultiplier = 1 + self.staffCount},
                {stat = "powerMultiplier", baseMultiplier = 1 + self.staffCount},
              })  
            end 
            if species == "familiar" then     
              self.staffCount = self.staffCount + 0.15
              self.staffCount2 = self.staffCount2 + 0.30
              status.setPersistentEffects("ningenbonusdmg", {
                {stat = "maxEnergy", baseMultiplier = 1+ self.staffCount},
                {stat = "powerMultiplier", baseMultiplier = 1 + self.staffCount2}
              })  
              local bounds = mcontroller.boundBox() 
            end            
            
  
--************************************** 
  self.weapon:init()
end

function update(dt, fireMode, shiftHeld)
  self.weapon:update(dt, fireMode, shiftHeld)        
end

function uninit()
  status.clearPersistentEffects("avianbonusdmg")
  status.clearPersistentEffects("ningenbonusdmg")
  self.staffCount = 0
  self.bonusCount = 0
  self.weapon:uninit()
end

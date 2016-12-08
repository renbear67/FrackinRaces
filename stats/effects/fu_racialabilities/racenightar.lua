function init()
  baseValue = config.getParameter("healthBonus",0)*(status.resourceMax("health"))
  baseValue2 = config.getParameter("energyBonus",0)*(status.resourceMax("energy"))
  baseValue3 = config.getParameter("foodBonus",0)*(status.resourceMax("food"))
  self.gritBoost = config.getParameter("gritBonus",0)
  
  effect.addStatModifierGroup({
    {stat = "maxFood", amount = baseValue3 },
    {stat = "maxHealth", amount = baseValue },
    {stat = "maxEnergy", amount = baseValue2 },
    {stat = "grit", baseMultiplier = self.gritBoost },
    {stat = "biooozeImmunity", amount = 1},
    {stat = "physicalResistance", amount = 1},
    {stat = "fireResistance", amount = 1},
    {stat = "iceResistance", amount = 1},
    {stat = "electricResistance", amount = 1},
    {stat = "poisonResistance", amount = 1}
  })
  
  self.movementParams = mcontroller.baseParameters() 
  local bounds = mcontroller.boundBox()
  self.liquidMovementParameter = { liquidJumpProfile = { jumpHoldTime = 0.275 } }  
  script.setUpdateDelta(5)
end

function update(dt)


end

function uninit()

end
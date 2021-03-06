function init()
  effect.addStatModifierGroup({
    {stat = "foodDelta", baseMultiplier = 1.06146},
    {stat = "slimestickImmunity", amount = 1},
    {stat = "slimefrictionImmunity", amount = 1},
    {stat = "physicalResistance", amount = 0},
    {stat = "fireResistance", amount = 0.20},
    {stat = "iceResistance", amount = 0.20},
    {stat = "electricResistance", amount = 0.20},
    {stat = "poisonResistance", amount = 0.20},
    {stat = "shadowResistance", amount = -1}        
  })

  baseValue = config.getParameter("healthBonus",0)*(status.resourceMax("health"))
  effect.addStatModifierGroup({{stat = "maxHealth", amount = baseValue }})
  baseValue2 = config.getParameter("energyBonus",0)*(status.resourceMax("energy"))
  effect.addStatModifierGroup({{stat = "maxEnergy", amount = baseValue2 }}) 
  
  local bounds = mcontroller.boundBox()
  script.setUpdateDelta(10)
	if (world.type() == "forest") or (world.type() == "thickjungle") or (world.type() == "arboreal") or (world.type() == "arborealdark") then
		    status.setPersistentEffects("vieraEpic", {
		      {stat = "protection", baseMultiplier = 1.10},
		      {stat = "maxEnergy", baseMultiplier = 1.15}
		    })
		    mcontroller.controlModifiers( { speedModifier = 1.18 } )		    
	end  
  script.setUpdateDelta(10)
end

function update(dt)
  mcontroller.controlModifiers({ speedModifier = 1.12 })
end

function uninit()
  status.clearPersistentEffects("vieraEpic")
end
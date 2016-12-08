require("/scripts/vec2.lua")
function init()
  inWater=0
  baseValue = config.getParameter("healthBonus",0)*(status.resourceMax("health"))
  baseValue2 = config.getParameter("energyBonus",0)*(status.resourceMax("energy"))
  
  effect.addStatModifierGroup({
    {stat = "maxHealth", amount = baseValue },
    {stat = "maxEnergy", amount = baseValue2 },
    {stat = "maxBreath", amount = 1500},
    {stat = "breathRegenerationRate", amount = 60},
    {stat = "wetImmunity", amount = 1},
    {stat = "physicalResistance", amount = 1},
    {stat = "fireResistance", amount = 1},
    {stat = "iceResistance", amount = 1.2},
    {stat = "electricResistance", amount = -1.75},
    {stat = "poisonResistance", amount = 1}
  })

  script.setUpdateDelta(5)

    if (world.type() == "ocean") or (world.type() == "oceanfloor") then
	    status.setPersistentEffects("jungleEpic", {
	      {stat = "protection", baseMultiplier = 1.20}
	    })
    end    
end

function isDry()
local mouthPosition = vec2.add(mcontroller.position(), status.statusProperty("mouthPosition"))
	if not world.liquidAt(mouthPosition) then
            status.clearPersistentEffects("hylotlprotection")
	    inWater = 0
	end
end

function update(dt)

local mouthPosition = vec2.add(mcontroller.position(), status.statusProperty("mouthPosition"))
local mouthful = world.liquidAt(mouthposition)
	if (world.liquidAt(mouthPosition)) and (inWater == 0) and (mcontroller.liquidId()== 1) or (mcontroller.liquidId()== 6) or (mcontroller.liquidId()== 58) or (mcontroller.liquidId()== 12) then
            status.setPersistentEffects("hylotlprotection", {
              {stat = "protection", baseMultiplier = 1.10},
              {stat = "perfectBlockLimit", amount = 2},
              {stat = "maxHealth", baseMultiplier = 1.25}
            })
	    inWater = 1
	else
	  isDry()
        end 
end

function uninit()
  status.clearPersistentEffects("hylotlprotection")
  status.clearPersistentEffects("jungleEpic")
end
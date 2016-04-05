require "code.gui.ability"
require "code.entities.bullet"
require "code.gui.skill"

timeToPass = 0.2
timePassed = 0
done = 0
canAbility = false


function useAbilities(key)
	for i,v in ipairs(ability) do
			if v.name == "bullet_barrage" and key == "k" and v.active == true then
				canAbility = true
			end
	end
end

function abilityUser()
	for i,v in ipairs(ability) do
		for a,j in ipairs(player) do
			if canDo == true and done <= 19 and canAbility == true then
				bulletSpawn(j.x, j.y, "up", 600)
				bulletSpawn(j.x, j.y, "right", 600)
				bulletSpawn(j.x, j.y, "left", 600)
				bulletSpawn(j.x, j.y, "down", 600)
				done = done + 1
				canDo = false
			elseif done >= 20 then
				v.used = true
				done = 0
				canAbility = false
			end	
		end
	end
	
	
end

function abilityTimer(dt)
	if timeToPass >= timePassed then
		timePassed = timePassed + dt
	end
	if timePassed >= timeToPass then
		canDo = true
		timePassed = 0
	else
		canDo = false
	end
end

function unlockAbility()
	for i,v in ipairs(ability) do
		if v.name == "bullet_barrage" and blvl == 10 then
		    v.active = true
		elseif v.name == "bullet_barrage" then
			v.active = false
		end
	end
end
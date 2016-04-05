ability = {}

function newAbility(name, cooldown, x, y, barwidth)
	table.insert(ability, {x = x, y = y, name = name, cooldown = cooldown, passed = 0, usable = false, active = false, used = false, width = barwidth, owidth = barwidth})
end

function abilityCooldown(dt)
	for i,v in ipairs(ability) do
		if v.active == true and v.cooldown >= v.passed then
			v.passed = v.passed + dt
			if v.passed >= v.cooldown then
				v.usable = true
			else
				v.usable = false
			end
		end
		if v.used == true and v.passed >= v.cooldown then
			v.passed = 0
			v.used = false
		end
	end
end

function abilityBar()
	for i,v in ipairs(ability) do
		if v.passed == 0 then
			v. width = 30
		end
		v.width = v.owidth - (v.cooldown - v.passed)/v.cooldown * v.owidth
	end
end

function abilityDraw()
	for i,v in ipairs(ability) do
		if v.width == nil or v.width == 0 then
		    v.width = 10
		end
		love.graphics.print(v.name, v.x, v.y,0,1,1)
		love.graphics.rectangle("fill", v.x, v.y + 15, v.width,5 )
	end
end
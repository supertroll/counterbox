require "code.entities.bullet"
require "code.entities.player"

function skill()
	if blvlup == true and score >= blvl then
		score = score - blvl
		blvl = blvl + 1
		bulletDamage = bulletDamage + 1
		blvlup = false
	end
	if plvlup == true and score >= plvl then
		score = score - plvl
		plvl = plvl + 1
		plvlup = false
		for i,v in ipairs(player) do
			v.original = v.original + 1
		end
	end
end
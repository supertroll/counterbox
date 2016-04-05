require "code.entities.enemie"
require "code.entities.health"


spawned = 0
toSpawn = 0

function nextwave()
	wave = wave + 1
	spawned = 0
	enemieHealth = enemieHealth + 0.5
end

function waves()
	if wave >= 1 then
		if spawned <= wave then
		spawned = spawned + 1
		enemieSpawn(enemieHealth,enemieSpeed,randomColor)
		toSpawn = toSpawn + 1
		end
		if toSpawn >= 2 then
		    spawnHealth()
		    toSpawn = 0
		end
	end
end

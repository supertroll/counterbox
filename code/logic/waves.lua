require "code.entities.enemie"
require "code.vodka.vodka.vodka"


spawned = 0

function nextwave()
	wave = wave + 1
	spawned = 0
end

function waves()
	if wave >= 1 then
		if spawned <= wave then
		spawned = spawned + 1
		enemieSpawn(enemieHealth,enemieSpeed,randomColor)
		spawnVodka()
		end
	end
end

function spawnWaves()
	
end
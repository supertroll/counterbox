require "code.entities.enemie"
require "code.entities.player"

bullets = {}


function bulletSpawn(x,y,dir)
	table.insert(bullets, {x = x, y = y, dir = dir,})
end

function bulletLoad()
	
end

function bulletMove(dt)
	for i,v in ipairs(bullets) do
		if v.dir == "left" then
			v.x = v.x - bulletSpeed * dt
		end
		if v.dir == "right" then
			v.x = v.x + bulletSpeed * dt
		end
		if v.dir == "up" then
			v.y = v.y - bulletSpeed * dt
		end
		if v.dir == "down" then
			v.y = v.y + bulletSpeed * dt
		end
	end
end

function bulletDraw()
	for i,v in ipairs(bullets) do
		love.graphics.rectangle("fill", v.x, v.y, 10, 10)
	end
end

function shoot(skey)
	for i,v in ipairs(player) do
		sx = v.x + v.width/2 - 5
		sy = v.y + v.height/2 - 5
		if skey == "left" then
			bulletSpawn(sx,sy,"left")
		end
		if skey == "right" then
		    bulletSpawn(sx,sy,"right")
		end
		if skey == "up" then
		    bulletSpawn(sx,sy,"up")
		end
		if skey == "down" then
		    bulletSpawn(sx,sy,"down")
		end
	end
end

function bulletEnd()
	for i,v in ipairs(bullets) do
		if v.x >= swidth - 10 or v.x <= 0 or
		 v.y >= sheight - 10 or v.y <= 0 then
		    table.remove(bullets, i)
		end
	end
end

function bulletKill()
	for j,a in ipairs(bullets) do
		for i,v in ipairs(enemies) do
			if v.x <= a.x and
			v.x + ewidth >= a.x and
			v.y <= a.y and
			v.y + eheight >= a.y then
			    v.shot = true
			    table.remove(bullets, j)
			end
		end
	end
end
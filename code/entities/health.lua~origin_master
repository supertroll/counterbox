require "code.entities.player"

health = {}


function spawnHealth()
	X = math.random(0, width-imgw)
	Y = math.random(0, height-imgh)
	table.insert(health, {x = X, y = Y})
end

function loadHealth()
	img = love.graphics.newImage("healthPack.png")
	imgh = img:getHeight() * 2
	imgw = img:getWidth() * 2
end

function healthStuff()
	for i,v in ipairs(health) do
		for j,a in ipairs(player) do
			if v.x + imgw >= a.x and
			v.x <= a.x + a.width and
			v.y + imgh >= a.y and
			v.y <= a.y + a.height then
				a.health = a.health + 1
				table.remove(health, i)
			end
		end
	end
end

function drawHealth()
	for i,v in ipairs(health) do
		love.graphics.setColor(255, 255, 255)
		img:setFilter("nearest")
		love.graphics.draw(img, v.x, v.y,0,2,2)
	end
	
end
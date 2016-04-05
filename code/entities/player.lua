
player = {}

xc = false
nxc = false
yc = false
nyc = false

function playerSpawn(x,y,speed, health)
	table.insert(player,{x = x, y = y, speed = speed, width = pimg:getWidth(), height = p2img:getHeight(), health = health, original = health, healths = swidth, hit = false, damaged = false})
end

function playerLoad()
	pimg = love.graphics.newImage("player.png")
	p2img = love.graphics.newImage("player2.png")
end

function playerMove(dt)
	for i,v in ipairs(player) do
		if love.keyboard.isDown("a") and nxc == false then
			v.x = v.x - v.speed * dt
		end
		if love.keyboard.isDown("d") and xc == false then
		    v.x = v.x + v.speed * dt
		end
		if love.keyboard.isDown("w") and nyc == false then
		    v.y = v.y - v.speed * dt
		end
		if love.keyboard.isDown("s") and yc == false then
		    v.y = v.y + v.speed * dt
		end
	end
end

function collision()
	for i,v in ipairs(player) do
		if v.x <= 0 then
		    v.x = 0
		    nxc = true
		else
			nxc = false
		end
		if v.x >= swidth - v.width then
		    v.x = swidth - v.width
		    xc = true
		else
			xc = false
		end
		if v.y <= 0 then
		    v.y = 0
		    nyc = true
		else
			nyc = false
		end
		if v.y >= sheight - v.height then
			v.y = sheight - v.height
			yc = true
		else
			yc = false
		end
	end
end

function playerDraw()
	for i,v in ipairs(player) do
		if plvl >= 1 then
			love.graphics.draw(pimg, v.x, v.y)
		end
		if plvl >= 10 then
			love.graphics.draw(p2img, v.x, v.y)
		end
	end
end

function PHealthBar()
	for i,v in ipairs(player) do
			v.healths = width/v.original*v.health
		if v.health == 0 then
		    table.remove(player, i)
		    score = score - 10
		end
		if v.health > v.original then
		    v.health = v.original
		end

	end
end

function PHBDraw()
	for i,v in ipairs(player) do
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("fill", 0, height - 20, v.healths, 20)
	end
end
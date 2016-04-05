<<<<<<< HEAD
require "code.entities.enemie"
require "code.entities.player"

bullets = {}


function bulletSpawn(x,y,dir,speed)
	table.insert(bullets, {x = x, y = y, dir = dir,width = bimg:getWidth(),height = bimg:getHeight(), R = R, speed = speed })
end

function bulletLoad()
	bimg = love.graphics.newImage("projectile.png")
	b2img = love.graphics.newImage("projectile2.png")
end

function bulletMove(dt)
	for i,v in ipairs(bullets) do
		if v.dir == "left" then
			v.x = v.x - v.speed * dt
		end
		if v.dir == "right" then
			v.x = v.x + v.speed * dt
		end
		if v.dir == "up" then
			v.y = v.y - v.speed * dt
		end
		if v.dir == "down" then
			v.y = v.y + v.speed * dt
		end
	end
end

function bulletDraw()
	for i,v in ipairs(bullets) do
		if v.dir == "up" then
		    v.R = -1.6
		elseif v.dir == "down" then
			v.R = 1.6
		elseif v.dir == "left" then
		    v.R = 3.2
		else
			v.R = 0
		end
		love.graphics.setColor(255, 255, 255)
		bimg:setFilter("nearest")
		b2img:setFilter("nearest")
		if blvl >= 1 and blvl <= 9 then
			love.graphics.draw(bimg, v.x, v.y,v.R,2,2)
		end
		if blvl >= 10 then
		    love.graphics.draw(b2img, v.x, v.y,v.R,2,2)
		end
	end
end

function shoot(skey)
	for i,v in ipairs(player) do
			sx = v.x + v.width/2
			sy = v.y + v.height/2
			if skey == "left" then
				bulletSpawn(sx, sy, "left", bulletSpeed)
			end
			if skey == "right" then
			    bulletSpawn(sx, sy, "right", bulletSpeed)
			end
			if skey == "up" then
			    bulletSpawn(sx, sy, "up", bulletSpeed)
			end
			if skey == "down" then
		    	bulletSpawn(sx, sy, "down",bulletSpeed)
			end
	end
end

function bulletEnd()
	for i,v in ipairs(bullets) do
		if v.x >= swidth - v.width or v.x <= 0 or
		 v.y >= sheight - v.height or v.y <= 0 then
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
			v.y + eheight >= a.y and selected ~= v.color then
			    v.shot = true
			    table.remove(bullets, j)
			end
		end
	end
=======
require "code.entities.enemie"
require "code.entities.player"

bullets = {}


function bulletSpawn(x,y,dir,speed)
	table.insert(bullets, {x = x, y = y, dir = dir,width = bimg:getWidth(),height = bimg:getHeight(), R = R, speed = speed })
end

function bulletLoad()
	bimg = love.graphics.newImage("projectile.png")
	b2img = love.graphics.newImage("projectile2.png")
end

function bulletMove(dt)
	for i,v in ipairs(bullets) do
		if v.dir == "left" then
			v.x = v.x - v.speed * dt
		end
		if v.dir == "right" then
			v.x = v.x + v.speed * dt
		end
		if v.dir == "up" then
			v.y = v.y - v.speed * dt
		end
		if v.dir == "down" then
			v.y = v.y + v.speed * dt
		end
	end
end

function bulletDraw()
	for i,v in ipairs(bullets) do
		if v.dir == "up" then
		    v.R = -1.6
		elseif v.dir == "down" then
			v.R = 1.6
		elseif v.dir == "left" then
		    v.R = 3.2
		else
			v.R = 0
		end
		love.graphics.setColor(255, 255, 255)
		bimg:setFilter("nearest")
		b2img:setFilter("nearest")
		if blvl >= 1 and blvl <= 9 then
			love.graphics.draw(bimg, v.x, v.y,v.R,2,2)
		end
		if blvl >= 10 then
		    love.graphics.draw(b2img, v.x, v.y,v.R,2,2)
		end
	end
end

function shoot(skey)
	for i,v in ipairs(player) do
			sx = v.x + v.width/2
			sy = v.y + v.height/2
			if skey == "left" then
				bulletSpawn(sx, sy, "left", bulletSpeed)
			end
			if skey == "right" then
			    bulletSpawn(sx, sy, "right", bulletSpeed)
			end
			if skey == "up" then
			    bulletSpawn(sx, sy, "up", bulletSpeed)
			end
			if skey == "down" then
		    	bulletSpawn(sx, sy, "down",bulletSpeed)
			end
	end
end

function bulletEnd()
	for i,v in ipairs(bullets) do
		if v.x >= swidth - v.width or v.x <= 0 or
		 v.y >= sheight - v.height or v.y <= 0 then
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
			v.y + eheight >= a.y and selected ~= v.color then
			    v.shot = true
			    table.remove(bullets, j)
			end
		end
	end
>>>>>>> origin/master
end
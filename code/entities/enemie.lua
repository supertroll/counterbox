<<<<<<< HEAD
require "code.entities.player"
require "code.gui.hotbar"

enemies = {}
swidth = love.graphics.getWidth()
sheight = love.graphics.getHeight()
ewidth = 50
eheight = 50

function enemieSpawn(health, speed, color)
	X = love.math.random(swidth)
	Y = love.math.random(sheight)
	table.insert(enemies, {x = X, y = Y, health = health, original = health, speed = speed, shot = false, HBar = HBar, color = color})
end

function enemieMove(dt)
	for i,v in ipairs(enemies) do
		for a,j in ipairs(player) do
			if v.color ~= selected then
				if j.x > v.x then
				    v.x = v.x + v.speed * dt
				end
				if j.x < v.x then
					v.x = v.x - v.speed * dt
				end
				if j.y > v.y then
				    v.y = v.y + v.speed * dt
				end
				if j.y < v.y then
				    v.y = v.y - v.speed * dt 
				end
			end
		end
	end
end

function enemieKill()
	for i,v in ipairs(enemies) do
		for a,j in ipairs(player) do
			if v.color ~= selected then
				if v.x <= j.x and
				v.x + ewidth >= j.x and
				v.y <= j.y and
				v.y + eheight >= j.y and
				invincible == false then
				    j.health = j.health - 1
				    v.shot = true
				    j.damaged = true
				end
			end
		end
	end
end

function enemieDraw()
	for i,v in ipairs(enemies) do
		if v.color == 1 then
			love.graphics.setColor(255, 0, 0)
		end
		if v.color == 2 then
		    love.graphics.setColor(0, 255, 0)
		end
		if v.color == 3 then
			love.graphics.setColor(0, 0, 255)
		end
		love.graphics.rectangle("fill", v.x, v.y, ewidth, eheight)
	end
end

function healthBar()
	for i,v in ipairs(enemies) do
		if v.health == nil then
			v.health = 2
			v.original = 2
		end
		if v.health == v.original then
		    v.HBar = ewidth
		end
		if v.shot == true then
			v.HBar = v.HBar - ewidth/v.original*bulletDamage
			v.health = v.health - bulletDamage
			v.shot = false
		end
		if v.health <= 0 then
		    table.remove(enemies, i)
		    score = score + 1
		end
	end
end

function HBDraw()
	for i,v in ipairs(enemies) do
		love.graphics.setColor(255, 255, 255)
		if v.HBar == nil then
			v.HBar = 2
		end
		love.graphics.rectangle("fill", v.x, v.y + eheight/2-5, v.HBar, 5)
	end
=======
require "code.entities.player"
require "code.gui.hotbar"

enemies = {}
swidth = love.graphics.getWidth()
sheight = love.graphics.getHeight()
ewidth = 50
eheight = 50

function enemieSpawn(health, speed, color)
	X = love.math.random(swidth)
	Y = love.math.random(sheight)
	table.insert(enemies, {x = X, y = Y, health = health, original = health, speed = speed, shot = false, HBar = HBar, color = color})
end

function enemieMove(dt)
	for i,v in ipairs(enemies) do
		for a,j in ipairs(player) do
			if v.color ~= selected then
				if j.x > v.x then
				    v.x = v.x + v.speed * dt
				end
				if j.x < v.x then
					v.x = v.x - v.speed * dt
				end
				if j.y > v.y then
				    v.y = v.y + v.speed * dt
				end
				if j.y < v.y then
				    v.y = v.y - v.speed * dt 
				end
			end
		end
	end
end

function enemieKill()
	for i,v in ipairs(enemies) do
		for a,j in ipairs(player) do
			if v.color ~= selected then
				if v.x <= j.x and
				v.x + ewidth >= j.x and
				v.y <= j.y and
				v.y + eheight >= j.y and
				invincible == false then
				    j.health = j.health - 1
				    v.shot = true
				    j.damaged = true
				end
			end
		end
	end
end

function enemieDraw()
	for i,v in ipairs(enemies) do
		if v.color == 1 then
			love.graphics.setColor(255, 0, 0)
		end
		if v.color == 2 then
		    love.graphics.setColor(0, 255, 0)
		end
		if v.color == 3 then
			love.graphics.setColor(0, 0, 255)
		end
		love.graphics.rectangle("fill", v.x, v.y, ewidth, eheight)
	end
end

function healthBar()
	for i,v in ipairs(enemies) do
		if v.health == nil then
			v.health = 2
			v.original = 2
		end
		if v.health == v.original then
		    v.HBar = ewidth
		end
		if v.shot == true then
			v.HBar = v.HBar - ewidth/v.original*bulletDamage
			v.health = v.health - bulletDamage
			v.shot = false
		end
		if v.health <= 0 then
		    table.remove(enemies, i)
		    score = score + 1
		end
	end
end

function HBDraw()
	for i,v in ipairs(enemies) do
		love.graphics.setColor(255, 255, 255)
		if v.HBar == nil then
			v.HBar = 2
		end
		love.graphics.rectangle("fill", v.x, v.y + eheight/2-5, v.HBar, 5)
	end
>>>>>>> origin/master
end
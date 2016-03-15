io.stdout:setvbuf("no")
require "code.entities.player"
require "code.gui.hotbar"
require "code.gui.menu"
require "code.entities.bullet"
require "code.entities.enemie"
require "code.vodka.vodka.vodka"

gameState = "menu"
bulletSpeed = 600
enemieSpeed = 200
enemieHealth = 2
selected = 1
invincible = false

function love.load()
	loadVodka()
	height = love.graphics.getHeight()
	width = love.graphics.getWidth()
end

function love.update(dt)
	mx = love.mouse.getX()
	my = love.mouse.getY()
	down = love.mouse.isDown("1")
	if gameState == "playing" then
		playerMove(dt)
		collision()
		shoot()
		bulletMove(dt)
		bulletEnd()
		enemieMove(dt)
		enemieKill()
		healthBar()
		bulletKill()
		PHealthBar()
		vodkaStuff()
	end
	if gameState == "menu" then
		newButton("start",0,0,100,50)
		newButton("quit",0,70,100,50)
		selector()
		press()
	end
end

function love.draw()
	if gameState == "playing" then
		drawHotbar()
		hotbarSelect()
		playerDraw()
		bulletDraw()
		enemieDraw()
		HBDraw()
		drawVodka()
		PHBDraw()
	end
	if gameState == "menu" then
		drawButtons()
	end
end

function love.keypressed(key)
	if gameState == "playing" then
		if key == "p" then
			playerSpawn(0,0,30,30,200,10)
		end
		if key == "e" then
			selected = 0
		end
		if key == "1" then
			selected = 1
		end
		if key == "2" then
			selected = 2
		end
		if key == "3" then
			selected = 3
		end
		if key == "b" then
		    enemieSpawn(enemieHealth, enemieSpeed, 1)
		end
		if key == "n" then
		    enemieSpawn(enemieHealth, enemieSpeed, 2)
		end
		if key == "m" then
			enemieSpawn(enemieHealth, enemieSpeed, 3)
		end
		if key == "v" then
			spawnVodka()
		end
		shoot(key)
	end
	if key == "q" then
		love.event.push("quit")
	end
end
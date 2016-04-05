io.stdout:setvbuf("no")
require "code.entities.player"
require "code.gui.hotbar"
require "code.gui.menu"
require "code.entities.bullet"
require "code.entities.enemie"
require "code.entities.health"
require "code.gui.skill"
require "code.logic.waves"
require "code.gui.ability"
require "code.logic.abilityLogic"

gameState = "menu"
bulletSpeed = 600
enemieSpeed = 100
enemieHealth = 5
selected = 1
invincible = false
plvl = 1
blvl = 1
score = 0
screated = false
mcreated = false
bulletDamage = 1
wave = 0

function love.load()
	bulletLoad()
	playerLoad()
	loadHealth()
	height = love.graphics.getHeight()
	width = love.graphics.getWidth()
	newAbility("bullet_barrage",10,0,100,50)
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
		healthStuff()
		waves()
		abilityCooldown(dt)
		abilityBar()
		abilityTimer(dt)
		abilityUser()
		unlockAbility()
		randomColor = love.math.random(1, 3)
		
	end
	if gameState == "skill" and screated == false then
		newButton("projectile:",0,0,150,50)
		newButton("player:",0,70,100,50)
		screated = true
	end
	if gameState == "menu" and mcreated == false then
		newButton("start",0,0,100,50)
		newButton("quit",0,70,100,50)
		mcreated = true
	end
	if gameState == "skill" then
		skill()
	end
	selector()
end

function love.draw()
	if gameState == "playing" then
		drawHotbar()
		hotbarSelect()
		playerDraw()
		bulletDraw()
		enemieDraw()
		HBDraw()
		drawHealth()
		PHBDraw()
		abilityDraw()
		
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("score:"..score, 0, 50)
	    love.graphics.print("projectile lvl:"..blvl, 0, 60)
	    love.graphics.print("player lvl:"..plvl, 0, 70)
	end
	if gameState == "menu" then
		drawButtons()
	end
	if gameState == "skill" then
		drawButtons()
		love.graphics.setColor(0, 0, 255)
		love.graphics.print(blvl, 150, 30, 0, 2, 2)
		love.graphics.print(plvl, 100, 100, 0, 2, 2)
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.print("score:"..score, 0, 200)
	end
	    
end

function love.keypressed(key)
	if gameState == "playing" then
		if key == "p" then
			playerSpawn(0,0,500,10)
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
			spawnHealth()
		end
		
		if key == "f" then
			debug = not debug
		end
		if key == "l" then
			score = score + 100
		end
		if key == "." then
			nextwave()
		end

		shoot(key)
		useAbilities(key)
	end
	if key == "x" then
		gameState = "skill"
	end

	if key == "z" and gameState == "skill" then
		gameState = "playing"
	end

	if key == "q" then
		love.event.push("quit")
	end
end

function love.mousereleased(d,f,button)
	if button == 1 then
		press()
	end
end
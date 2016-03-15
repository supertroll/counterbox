buttons = {}


function newButton(text,x,y,width,height)
	table.insert(buttons, {text = text, x = x, y = y, width = width, height = height, selected = selected})
end

function drawButtons()
	for i,v in ipairs(buttons) do
		if v.selected == true then
			love.graphics.setColor(0, 0, 255)
		else
			love.graphics.setColor(255, 255, 255)
		end
		love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
		love.graphics.setColor(0, 0, 0)
		love.graphics.print(v.text, v.x + v.width/8, v.y + v.height/2,0, 2,2)
	end
end

function selector()
	for i,v in ipairs(buttons) do
		if mx >= v.x and
		mx <= v.x + v.width and
		my >= v.y and
		my <= v.y + v.height then
			v.selected = true
		else
			v.selected = false
		end
	end
end

function press()
	for i,v in ipairs(buttons) do
		if v.selected == true and down and v.text == "start" then
			gameState = "playing"
		end
		if v.selected == true and down and v.text == "quit" then
			love.event.push("quit")
		end
	end
end
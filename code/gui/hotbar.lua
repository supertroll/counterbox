function drawHotbar()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", 0, 0, 30, 30)
	love.graphics.setColor(0, 255, 0)
	love.graphics.rectangle("fill", 30, 0, 30, 30)
	love.graphics.setColor(0, 0, 255)
	love.graphics.rectangle("fill", 60, 0, 30, 30)
end

function hotbarSelect()
	if selected == 0 then
		love.graphics.setColor(255, 255, 255)
	end
	if selected == 1 then
		love.graphics.setColor(255, 0, 0)
	end
	if selected == 2 then
		love.graphics.setColor(0, 255, 0)
	end
	if selected == 3 then 
		love.graphics.setColor(0, 0, 255)
	end
end
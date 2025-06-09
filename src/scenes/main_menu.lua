local function drawMainMenu()
	love.graphics.print("Main Menu", 100, 100)
	love.graphics.print("Press P to play", 100, 120)
	love.graphics.print("Press S to go to settings", 100, 140)
	love.graphics.print("Press esc to exit", 100, 160)
end

return drawMainMenu

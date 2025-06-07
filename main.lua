local Game = require("src.game")

function love.load()
	game = Game:new()
end

function love.update(dt)
	game:update()
end

function love.draw()
	game:draw()
end

function love.keypressed(key)
	game:keyEvent(key, true)
end

function love.keyreleased(key)
	game:keyEvent(key, nil)
end

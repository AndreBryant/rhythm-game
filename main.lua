require("src.constants.index")
local RhythmGame = require("src.rhythm_game")

function love.load()
	game = RhythmGame:new()
end

function love.update(dt)
	game:update(dt)
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

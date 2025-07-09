require("src.constants.index")
local xmlParser = require("lib.xml-parser.index")
local parse = xmlParser.parse
local convert = xmlParser.convert

-- local RhythmGame = require("src.rhythm_game")

function love.load()
	parse("assets.levels_xml.test-level.xml")
	-- game = RhythmGame:new()
end

function love.update(dt)
	-- game:update(dt)
end

function love.draw()
	-- game:draw()
end

function love.keypressed(key)
	-- game:keyEvent(key, true)
end

function love.keyreleased(key)
	-- game:keyEvent(key, nil)
end

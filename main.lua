require("src.constants.index")
local xmlParser = require("src.gameplay_classes.level_parsing")
local parse = xmlParser.parse
local convert = xmlParser.convert

-- local RhythmGame = require("src.rhythm_game")

function love.load()
	local path = "assets/levels_json/test_level.json"

	local parsedData = parse(path)
	local beatMap = parsedData.data

	if parsedData.success and beatMap then
		print(beatMap.metadata.title)
	end

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

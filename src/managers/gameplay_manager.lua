local Player = require("src.gameplay_classes.player")
local Conductor = require("src.gameplay_classes.conductor")

local GameplayManager = {}

function GameplayManager:new(diff)
	local o = {
		keyStates = {},
		player = Player:new(diff or DIFFICULTY_BABIES),
		conductor = Conductor:new(120, 0),
		beatMap = nil,
		hasStarted = false,
		countdownBeforeStart = 3, --seconds
	}
	local path = "assets/levels_json/test_level.json"
	o.conductor:parseBeatmap(path)

	setmetatable(o, self)
	self.__index = self

	return o
end

function GameplayManager:drawGameplay()
	local metadata = {}
	if self.conductor then
		metadata = self.conductor:getBeatmapMeta()
	end

	if not self.hasStarted then
		love.graphics.print("Game Starts in " .. math.floor(self.countdownBeforeStart), 100, 120)
	else
		-- Draw main gameplay
		love.graphics.print("score: " .. self.player:getScore(), 100, 120)
		love.graphics.print("Current Time: " .. self.conductor:getPointerTime(), 100, 140)
		love.graphics.print("Current Tempo: " .. self.conductor:getCurrentTempo(), 100, 160)

		love.graphics.print("MetaData", 100, 200)
		love.graphics.print("Title: " .. metadata.title, 100, 220)
		love.graphics.print("Artist: " .. metadata.artist, 100, 240)
		love.graphics.print("Author: " .. metadata.beatmapAuthor, 100, 260)
		love.graphics.print("Difficulty: " .. metadata.difficulty, 100, 280)
		love.graphics.print("PPQ: " .. metadata.ppq, 100, 300)
	end
end

function GameplayManager:update(dt)
	self.conductor:updatePointerTime(dt)

	if not self.hasStarted then
		self.countdownBeforeStart = self.countdownBeforeStart - dt

		if self.countdownBeforeStart <= 0 then
			self.hasStarted = true
		end
	end
end

function GameplayManager:updateKeyStates(key, isPressed)
	self.keyStates[key] = isPressed

	if isPressed and key == "space" then
		self.player:addScore(1)
	end
end

function GameplayManager:getKeyStates()
	return self.keyStates
end

return GameplayManager

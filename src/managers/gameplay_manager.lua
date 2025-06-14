local Player = require("src.player")
local Conductor = require("src.conductor")

local GameplayManager = {}

function GameplayManager:new(diff)
	local o = {
		keyStates = {},
		player = Player:new(diff or DIFFICULTY_BABIES),
		conductor = Conductor:new(120, 0), -- take tempo from beatmap and offset from settings
		beatMap = nil,
	}
	setmetatable(o, self)
	self.__index = self

	return o
end

function GameplayManager:drawGameplay()
	love.graphics.print("gameplay", 100, 100)
	love.graphics.print("score: " .. self.player:getScore(), 100, 120)

	love.graphics.print("Current Time: " .. self.conductor:getPointerTime(), 100, 140)
end

function GameplayManager:update(dt)
	self.conductor:updatePointerTime(dt)
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

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
	setmetatable(o, self)
	self.__index = self

	return o
end

function GameplayManager:drawGameplay()
	if not self.hasStarted then
		love.graphics.print("score: " .. self.countdownBeforeStart, 100, 120)
	else
		-- Draw main gameplay
		-- love.graphics.print("gameplay", 100, 100)
		love.graphics.print("score: " .. self.player:getScore(), 100, 120)
		love.graphics.print("Current Time: " .. self.conductor:getPointerTime(), 100, 140)
		love.graphics.print("Current Tempo: " .. self.conductor:getCurrentTempo(), 100, 160)
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

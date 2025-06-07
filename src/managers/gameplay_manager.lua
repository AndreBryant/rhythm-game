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

function GameplayManager:updateKeyStates(key, isPressed)
	self.keyStates[key] = isPressed
end

function GameplayManager:getKeyStates()
	return self.keyStates
end

return GameplayManager

local GameplayManager = {}

function GameplayManager:new()
	local o = {
		keyStates = {},
	}
	setmetatable(o, self)
	self.__index = self

	return o
end

function GameplayManager:updateKeyStates(key, isPressed)
	self.keyStates[key] = isPressed -- if within gameplay scene
end

function GameplayManager:getKeyStates()
	return self.keyStates
end

return GameplayManager

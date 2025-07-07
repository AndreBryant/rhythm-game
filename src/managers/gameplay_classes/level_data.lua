local LevelData = {}

function LevelData:new()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

return LevelData

local levelParser = require("src.gameplay_classes.level_parser")
local Conductor = {}

function Conductor:new(tempo, offset)
	local o = {
		tempo = tempo,
		offset = offset,
		pointerTime = -START_TIME_OFFSET,
		tolerance = 5, -- how much a beat can deviate
		beatMap = nil,
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Conductor:updatePointerTime(dt)
	self.pointerTime = self.pointerTime + dt
end

function Conductor:getPointerTime()
	return self.pointerTime
end

function Conductor:updateCurrentTempo(tempo)
	self.tempo = tempo
end

function Conductor:getCurrentTempo()
	return self.tempo
end

function Conductor:parseBeatmap(path)
	-- local path = "assets/levels_json/test_level.json"
	local parsedData = levelParser(path)

	if parsedData.success then
		self.beatMap = parsedData.data
	end

	return parsedData.message
end

return Conductor

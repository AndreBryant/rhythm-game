local Conductor = {}

function Conductor:new(tempo, offset)
	local o = {
		tempo = tempo,
		offset = offset,
		pointerTime = -START_TIME_OFFSET,
		tolerance = 5, -- how much a beat can deviate
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

return Conductor

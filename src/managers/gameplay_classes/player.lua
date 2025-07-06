local Player = {}

function Player:new(difficulty)
	local o = {
		score = 0,
		diff = difficulty,
	}
	setmetatable(o, self)
	self.__index = self

	return o
end

function Player:addScore(increment)
	self.score = self.score + increment
end

function Player:penalize(decrement)
	self.score = self.score - decrement
end

function Player:getScore()
	return self.score
end

return Player

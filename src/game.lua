local SceneManager = require("src.scene_manager")

local Game = {}

function Game:new()
	local o = {
		keyStates = {}, -- transfer to game manager
		sceneManager = SceneManager:new(),
	}
	setmetatable(o, self)
	self.__index = self

	return o
end

function Game:draw()
	love.graphics.print(self.sceneManager:getGameSceneIndex(), 100, 100)

	-- -- debug
	-- local y = 0
	-- for k, v in pairs(self.keyStates) do
	-- 	if v == nil then
	-- 		v = "nil"
	-- 	end
	-- 	love.graphics.print(k .. ": " .. tostring(v), 10, y)
	-- 	y = y + 10
	-- end

	-- self.sceneManager:draw()
end

function Game:update() end

function Game:keyEvent(key, isPressed)
	if self.sceneManager:getGameSceneIndex() == 0 then
		self.sceneManager:updateSceneIndex(key) -- if within menu
	elseif self.sceneManager:getGameSceneIndex() == 1 then
		-- I think gameplay manager should be the one to handle this
		self.keyStates[key] = isPressed -- if within gameplay scene
	elseif self.sceneManager:getGameSceneIndex() == 2 then
		print("within settings scene") -- if within settings scene
	end
end

return Game

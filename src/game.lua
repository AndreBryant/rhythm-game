local SceneManager = require("src.scene_manager")
local GameplayManager = require("src.gameplay_manager")
local SettingManager = require("src.setting_manager")

local Game = {}

function Game:new()
	local o = {
		sceneManager = SceneManager:new(),
		gameplayManager = GameplayManager:new(),
		settingManager = SettingManager:load(),
	}
	setmetatable(o, self)
	self.__index = self

	return o
end

function Game:draw()
	love.graphics.print(self.sceneManager:getGameSceneIndex(), 100, 100)

	-- debug
	if self.sceneManager:getGameSceneIndex() == GAMEPLAY_INDEX then
		local keyStates = self.gameplayManager:getKeyStates()
		local y = 0
		for k, v in pairs(keyStates) do
			love.graphics.print(k .. ": " .. tostring(v), 10, y)
			y = y + 10
		end
	end

	-- self.sceneManager:draw()
end

function Game:update() end

function Game:keyEvent(key, isPressed)
	if self.sceneManager:getGameSceneIndex() == MENU_INDEX then -- menu
		self.sceneManager:updateSceneIndex(key)
	elseif self.sceneManager:getGameSceneIndex() == GAMEPLAY_INDEX then -- gameplay
		self.gameplayManager:updateKeyStates(key, isPressed)
	elseif self.sceneManager:getGameSceneIndex() == SETTINGS_INDEX then -- settings
		self.settingManager:keyEvent(key)
	end
end

return Game

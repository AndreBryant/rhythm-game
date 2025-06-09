local Managers = require("src.managers.index")
local SceneManager = Managers.SceneManager
local GameplayManager = Managers.GameplayManager
local SettingManager = Managers.SettingManager

local RhythmGame = {}

function RhythmGame:new()
	local o = {
		sceneManager = SceneManager:new(),
		gameplayManager = GameplayManager:new(),
		settingManager = SettingManager:load(),
	}
	setmetatable(o, self)
	self.__index = self

	return o
end

function RhythmGame:draw()
	-- debug
	if self.sceneManager:getGameSceneIndex() == GAMEPLAY_INDEX then
		local keyStates = self.gameplayManager:getKeyStates()
		local y = 0
		for k, v in pairs(keyStates) do
			love.graphics.print(k .. ": " .. tostring(v), 10, y)
			y = y + 10
		end
	end

	self.sceneManager:draw()
	-- self.gameplayManager:drawGameplay()

	local index = self.sceneManager:getGameSceneIndex()

	if index == MENU_INDEX then -- menu
		-- self.sceneManager:update()
	elseif index == GAMEPLAY_INDEX then -- gameplay
		self.gameplayManager:drawGameplay()
	elseif index == SETTINGS_INDEX then -- settings
	end
end

function RhythmGame:update(dt)
	local index = self.sceneManager:getGameSceneIndex()

	if index == MENU_INDEX then -- menu
		-- self.sceneManager:update()
	elseif index == GAMEPLAY_INDEX then -- gameplay
		self.gameplayManager:update(dt)
	elseif index == SETTINGS_INDEX then -- settings
	end
end

function RhythmGame:keyEvent(key, isPressed)
	if self.sceneManager:getGameSceneIndex() == MENU_INDEX then -- menu
		self.sceneManager:updateSceneIndex(key)
	elseif self.sceneManager:getGameSceneIndex() == GAMEPLAY_INDEX then -- gameplay
		self.gameplayManager:updateKeyStates(key, isPressed)
	elseif self.sceneManager:getGameSceneIndex() == SETTINGS_INDEX then -- settings
		self.settingManager:keyEvent(key)
	end
end

return RhythmGame

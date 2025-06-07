local SceneManager = {}

function SceneManager:new()
	local o = {
		scenes = {
			[MENU_INDEX] = require("src.scenes.main_menu"),
			[GAMEPLAY_INDEX] = require("src.scenes.gameplay"),
			[SETTINGS_INDEX] = require("src.scenes.settings"),
		},

		game_scene_index = MENU_INDEX,
	}
	setmetatable(o, self)
	self.__index = self

	return o
end

function SceneManager:draw()
	self.scenes[self.game_scene_index]()
end

function SceneManager:updateSceneIndex(key)
	if key == "space" then
		self.game_scene_index = MENU_INDEX
	elseif key == "p" then
		self.game_scene_index = GAMEPLAY_INDEX
	elseif key == "s" then
		self.game_scene_index = SETTINGS_INDEX
	end
end

function SceneManager:getGameSceneIndex()
	return self.game_scene_index
end

return SceneManager

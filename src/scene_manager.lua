local SceneManager = {}

function SceneManager:new()
	local o = {
		-- scenes = {
		--     ["menu"] = require("src.menu_scene"),
		--     ["game"] = require("src.game_scene"),
		-- },

		game_scene_index = 0,
	}
	setmetatable(o, self)
	self.__index = self

	return o
end

function SceneManager:draw()
	print("SceneManager:draw()")
end

function SceneManager:updateSceneIndex(key)
	-- print("SceneManager:updateSceneIndex() " .. key)
	if key == "space" then
		self.game_scene_index = 0
	elseif key == "p" then
		self.game_scene_index = 1
	elseif key == "s" then
		self.game_scene_index = 2
	end
end

function SceneManager:getGameSceneIndex()
	return self.game_scene_index
end

return SceneManager

local SettingManager = {}

function SettingManager:load()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function SettingManager:keyEvent(key)
	print("inside settings pressed " .. key)
end

function SettingManager:update(key, value)
	self[key] = value
end

function SettingManager:save() end

return SettingManager

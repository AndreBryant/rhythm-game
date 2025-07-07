local luaMidi = require("lib.luamidi.LuaMidi")
-- local MIDIParser = {}

-- function MIDIParser:new()
-- 	local o = {}
-- 	setmetatable(o, self)
-- 	self.__index = self
-- 	return o
-- end

-- function MIDIParser:parse() end

-- function MIDIParser:convertToLevelData(parsedData) end

-- return MIDIParser

local function parse(midiPath)
	local parsedData = {}
	local tracks = luaMidi.get_MIDI_tracks(midiPath)
	for key, value in pairs(tracks) do
		print(key)
	end
end
local function convert(parsedData) end

return { parse, convert }

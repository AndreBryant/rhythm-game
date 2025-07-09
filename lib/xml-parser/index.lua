local tprint = require("lib.util.print_table")

local function parse()
	local json = require("lib.not-mine.dkjson")
	local string = love.filesystem.read("assets/levels_json/test_level.json")
	local table = json.decode(string)

	print(table.BeatMap.MetaData.Title)
end

return { parse = parse, convert = function() end }

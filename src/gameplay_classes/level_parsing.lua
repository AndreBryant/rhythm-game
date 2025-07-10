---------------------
--- Parse Functions
--- json data for levels
--- type {beatMap: {metaData: {...meta}, map{...tracks}}}
---
--- Improvements:
--- Use faster sorting algorithm instead of bubble sort
---------------------

local function bubbleSort(left, right)
	if left.startMeasure == right.startMeasure then
		return left.startStep < right.startStep
	else
		return left.startMeasure < right.startMeasure
	end
end

local function parse(path)
	-- Import json parsing library
	local json = require("lib.not-mine.dkjson")

	-- Handle if love camt find file
	local content, err = love.filesystem.read(path)
	if not content then
		return { status = "not-ok", message = "Failed to read file" .. (err or "unknown error"), data = nil }
	end

	-- Handle if not a proper JSON format
	local jsonData = json.decode(content)
	if not jsonData then
		return { status = "not-ok", message = "Failed to parse Beatmap JSON data.", data = nil }
	end

	-- Make sure notes are sorted properly in the list
	local trackList = jsonData.beatMap.map.trackList
	local data = { tracks = {} }

	for i, track in ipairs(trackList) do
		if track.notes then
			table.sort(track.notes, bubbleSort)
		end
	end
	data.tracks = trackList

	-- Debug
	for i, note in ipairs(data.tracks[1].notes) do
		print(
			"Note Type:\t"
				.. note.type
				.. "\t"
				.. "Note Key:\t"
				.. note.key
				.. "\t"
				.. "Note Start:\t"
				.. note.startMeasure
				.. ":"
				.. note.startStep
				.. "\t"
				.. "Note End:\t"
				.. note.endMeasure
				.. ":"
				.. note.endStep
				.. "\t"
		)
	end

	return { status = "ok", message = "Beatmap JSON parsed successfully.", data = data }
end

return { parse = parse, convert = function() end }

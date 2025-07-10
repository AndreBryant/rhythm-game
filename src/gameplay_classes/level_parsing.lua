local function bubbleSort(left, right)
	if left.startMeasure == right.startMeasure then
		return left.startStep < right.startStep
	else
		return left.startMeasure < right.startMeasure
	end
end

local function parse(path)
	local json = require("lib.not-mine.dkjson")

	local content, err = love.filesystem.read(path)
	if not content then
		return { status = "not-ok", message = "Failed to read file" .. (err or "unknown error"), data = nil }
	end

	local jsonData = json.decode(content)
	if not jsonData then
		return { status = "not-ok", message = "Failed to parse Beatmap JSON data.", data = nil }
	end

	local trackList = jsonData.BeatMap.Map.Track
	local data = { tracks = {} }
	for i, track in ipairs(trackList) do
		if track.Notes then
			table.sort(track.Notes, bubbleSort)
		end
	end

	data.tracks = tracklist

	for i, note in ipairs(trackList[1].Notes) do
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

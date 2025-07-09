local libxml = require("lib.not-mine.xml.init")

local function parse()
	local xmlString = love.filesystem.read("assets/levels_xml/test_level.xml")
	print(type(xmlString))
	-- local parser = libxml.dom.DOMParser()
	-- local doc = parser:parseFromString(xmlString, "text/xml") -- ✔ both args
	-- local root = doc:getDocumentElement()

	-- -- quick demo: print the key & endStep of every <Note>
	-- for _, note in ipairs(doc:getElementsByTagName("Note")) do
	-- 	print(note:getAttribute("key"), note:getAttribute("endStep"))
	-- end

	-- return doc
end

return { parse = parse, convert = function() end }

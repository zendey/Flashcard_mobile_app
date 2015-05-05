-----------------------------------------------------------------------------------------
--
-- JsonFile.lua
-- Json class.
-- Saves preferences to Json file.
--
-----------------------------------------------------------------------------------------

local JsonFile = {}

-- Creates a new json file. 
function JsonFile.new()
	local jsonFile = {}
	
	-- Include files.
	--local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.
	local json 				= require "json"						-- json.
	
	function jsonFile:loadSettings()
		local FileHandler = require "scripts.classes.file.FileHandler"		-- File Handler class.
		local json = FileHandler.new( "saveSettings.json", "r", system.DocumentsDirectory )
		local jsonRead = json.decode( saveData )
		local value = jsonRead.value

	end

	function jsonFile:saveSettings()
		local saveGame = {}
		if value then
			saveGame[ "value" ] = value
		end

		local jsonSaveGame = json.encode( saveGame )

		local path = system.pathForFile( "saveSettings.json", system.DocumentsDirectory )
		local file = io.open( path, "w" )
		file:write( jsonSaveGame )
		io.close( file )
		file = nil
	end
		
	jsonFile = jsonFile:loadSettings()
		
	return jsonFile
end

return JsonFile
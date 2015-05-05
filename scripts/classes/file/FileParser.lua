-----------------------------------------------------------------------------------------
--
-- FileParser.lua
-- FileParser class.
-- Parses a file and returns the content as a variable. 
-----------------------------------------------------------------------------------------

local FileParser = {}
	
-- FileParser class.	
function FileParser.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local fileParser = Super.new()
	Super = nil
	
	-- Local variables.
	--local myParsedFile

	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------
	
	function fileParser:start( options )
		local myParsedFile = fileParser:make( "scripts.classes.file.FileHandler", options )

		options.stringToSeparate = myParsedFile		
		myParsedFile = fileParser:make( "scripts.classes.file.DelimiterSeparator", options )
	
		fileParser:set( myParsedFile )
		
		-- Garbage disposal.
		fileParser:unmake()
		options = nil
		myParsedFile = nil

	end
	
	fileParser:start( options )
	
	return fileParser
end

return FileParser
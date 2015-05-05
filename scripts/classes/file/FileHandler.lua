-----------------------------------------------------------------------------------------
--
-- FileHandler.lua
-- FileHandler class.
--
-----------------------------------------------------------------------------------------

local FileHandler = {}
	
-- FileHandler class.	
function FileHandler.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super" -- Super class.	
	local fileHandler = Super.new()
	Super = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	
	
	-- Local variables.
	local myFileHandler
	local myFilePath

	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function fileHandler:buildFilePath( options )
		-- Include files.
		local globalVariable = require "scripts.common.global-variable"	-- Global variables.	
	
		-- Set defaults.
		local thisSystemDirectory = options.systemDirectory or system.ResourceDirectory
		
		-- Get file path.
		myFilePath = system.pathForFile( options.filePath, options.systemDirectory )
		
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myFilePath ~= nil, "File path in file handler is nil." )
		end
		
		-- Garbage disposal.
		thisSystemDirectory = nil
		globalVariable = nil
		options = nil
		
		return myFilePath
	end
	
	function fileHandler:openFile( myFilePath, options )
		-- Set defaults.
		local thisFileMode = options.fileMode or "r"

		local fileHandle
		local errorString
		
		if ( myFilePath ~= nil ) then
			-- io.open opens a file at path. Returns nil if no file found.
			fileHandle, errorString = io.open( myFilePath, thisFileMode )
		else	
			errorString = "File path does not exist." 
		end 
		
		-- If file exists.
		if fileHandle then
		
			-- Read all contents of file into a string
			myFileHandler, errorString = fileHandle:read( "*a" )
			
			-- Close the file.
			io.close( fileHandle )
		else
			local ErrorLog	= require "scripts.add-ons.error-log.error-log.ErrorLog"	-- Error log class.
			local errorLog1 = ErrorLog.new()
			
			-- Write error to log if file fails to open.
			errorLog1:writeErrorLog( "Failed to open file " .. options.filePath .. ". Reason open file failed: " .. errorString )
			--errorLog1:writeErrorLog( "/n" .. event.errorMessage .. "/n" .. event.stackTrace )
			
			-- Garbage disposal
			ErrorLog = nil
			errorLog1 = nil
			
		end
		
		fileHandler:set( myFileHandler )
		
		-- Garbage disposal.
		thisFileMode = nil
		myFilePath = nil
		fileHandle = nil
		errorString = nil
		myFileHandler = nil	
		options = nil
		
	end

	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	function fileHandler:start( options )
		myFilePath = fileHandler:buildFilePath( options )
		fileHandler:openFile( myFilePath, options )
	end
	
	fileHandler:start( options )
	
	return fileHandler
end

return FileHandler
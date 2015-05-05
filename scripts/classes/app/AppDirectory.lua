-----------------------------------------------------------------------------------------
--
-- AppDirectory.lua
-- App directory class.
--
-----------------------------------------------------------------------------------------

local AppDirectory = {}

-- Creates a new appDirectory. 
function AppDirectory.new( thisAppID )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local appDirectory = Super.new()
	Super = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local constant = require "scripts.constant"						-- Constants.	
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.
	
	-- Local variables.
	local myAppDirectoryColumn
	local myParsedFile

	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------
	
	-- Get app directory file.
	function appDirectory:getAppDirectoryFile()
		-- Get the app directory file, parse and return contents in a variable.
		local options = {
			filePath = constant[ "appsFolder" ] .."/" .. constant[ "appDirectoryFile" ],
			fileMode = "r",
			systemDirectory = system.ResourceDirectory,
			delimiter = "\n"
			}
		myParsedFile = appDirectory:make( "scripts.classes.file.FileParser", options )
	
		-- Assertion.
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myParsedFile ~= nil, "Parsed file is nil." )
		end 
		
		-- Garbage disposal.
		appDirectory:unmake()
		options = nil
	
		return myParsedFile
	end
	
	-- Get app directory column.
	function appDirectory:getAppDirectoryColumn( thisAppID, myParsedFile )
		
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( thisAppID ~= nil, "No app ID passed to app directory." )
		end 	
		
		-- Assertion.
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myParsedFile ~= nil, "Parsed file is nil." )
		end
		
		-- Get app directory column.
		local options = { 
			stringToSeparate = myParsedFile[ thisAppID ],
			delimiter = "\t",
		}
		myAppDirectoryColumn = appDirectory:make( "scripts.classes.file.DelimiterSeparator", options )
		
		-- Assertion.
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( type( tonumber( myAppDirectoryColumn[ 1 ] ) ) == "number" , "App directory ID needs to be a number.")
			assert( myAppDirectoryColumn[ 2 ] ~= nil, "App directory needs to be specified." )
		end 
		
		-- Garbage disposal.
		appDirectory:unmake()
		options = nil	
		thisAppID = nil
		myParsedFile = nil
		
		return myAppDirectoryColumn
	end
	
	-- Get the directory where all the appDirectory's assets (images, sounds, cards) are located.
	function appDirectory:setAppDirectory( thisAppID, myAppDirectoryColumn )
		
		-- Assertion.
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myAppDirectoryColumn[ 2 ] ~= nil, "App directory needs to be specified." )
		end 
		
		local strings = require "scripts.common.strings" -- String functions.
		myAppDirectoryColumn[ 2 ] = strings.trim( myAppDirectoryColumn[ 2 ] )
		
		-- Save the app directory to a global variable.  The app directory is in the 2nd column.
		local myAppDirectory = constant[ "appsFolder" ] .. "/" .. myAppDirectoryColumn[ 2 ] .. "/"
		globalVariable.appDirectory = myAppDirectory
		appDirectory:set( myAppDirectory )

		-- TODO: Temporary, need to remove once we create json file for the appDirectory.
		-- Save the appDirectory directory to a global variable using a dot (.) instead of a slash (/).  
		-- Used for including the file in other files.
		local myAppScriptDirectory = constant[ "appsFolder" ] .. "." .. myAppDirectoryColumn[ 2 ] .. "."
		globalVariable.appScriptDirectory = myAppScriptDirectory
	
		-- Garbage disposal.
		thisAppID = nil
		myAppDirectory = nil
		myAppScriptDirectory = nil
		myAppDirectoryColumn = nil
		strings = nil
	end

	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------		

	function appDirectory:start( thisAppID )		
		myParsedFile = appDirectory:getAppDirectoryFile()
		myAppDirectoryColumn = appDirectory:getAppDirectoryColumn( thisAppID, myParsedFile )
		appDirectory:setAppDirectory( thisAppID, myAppDirectoryColumn )			-- TOREPLACE

	end
	
	appDirectory:start( thisAppID )
	
	return appDirectory
end

return AppDirectory
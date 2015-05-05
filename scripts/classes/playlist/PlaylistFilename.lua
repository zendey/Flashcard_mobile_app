-----------------------------------------------------------------------------------------
--
-- PlaylistFilename.lua
-- Card filename class.
-- The card filename.
--
-----------------------------------------------------------------------------------------

local PlaylistFilename = {}

function PlaylistFilename.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super" -- Super class.
	local playlistFilename = Super.new()
	Super = nil

	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	
	
	function playlistFilename:trimCardFileName( options )
		local strings = require "scripts.common.strings" 						-- String functions.
	
		-- Trim spaces from the beginning and end of word.
		myPlaylistFilename = strings.trim( options )	

		-- Garbage disposal.
		strings = nil
		options = nil
		
		return myPlaylistFilename
	end
	
	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function playlistFilename:getPlaylistFilename( options )

		local myPlaylistFilename = playlistFilename:trimCardFileName( options )

		local globalVariable = require "scripts.common.global-variable"				-- Global variables.	
		local appInfo = require( globalVariable.appScriptDirectory .. "app-info" )	-- App-specific information.	
		
		-- Get card file name.
		if ( appInfo.getAppInfo().playlistDirectory ~= nil ) and ( myPlaylistFilename ~= nil ) then
			myPlaylistFilename = appInfo.getAppInfo().playlistDirectory .. myPlaylistFilename .. "-en.txt"
		end
		
		playlistFilename:set( myPlaylistFilename )
		
		-- Garbage disposal.
		globalVariable = nil
		appInfo = nil
		myPlaylistFilename = nil
		options = nil
		
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	function playlistFilename:start( options )
		playlistFilename:getPlaylistFilename( options )
	end
	
	playlistFilename:start( options )
	
	return playlistFilename
	
end	
	
return PlaylistFilename
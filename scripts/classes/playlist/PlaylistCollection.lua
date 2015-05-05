-----------------------------------------------------------------------------------------
--
-- PlaylistCollection.lua
-- Playlist Collection class.
-- 
-----------------------------------------------------------------------------------------

local PlaylistCollection = {}

function PlaylistCollection.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local DisplayGroup = require "scripts.classes.DisplayGroup"	-- DisplayGroup class.
	local playlistCollection = DisplayGroup.new()
	DisplayGroup = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	local globalVariable = require "scripts.common.global-variable"		-- Global variables.
	local appInfo = require( globalVariable.appScriptDirectory .. "app-info" ) -- App-specific information.
	globalVariable = nil	

	local playlist
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function playlistCollection:showButtonGroup()
	
		-- Get the names of playlists from app-info file.
		playlist = appInfo.getAppInfo().playlistCollection
				
		local options = { buttons = {} }
		local playlistCounter
		
		for playlistCounter = 1, #playlist do				
			table.insert( options.buttons, playlist[ playlistCounter ] )
		end
		
		playlistCollection:addToGroup( "scripts.classes.widget.button.PlaylistButtonGroup", options )
		
		-- Garbage disposal.
		globalVariable = nil
		options = nil
		playlistCounter = nil
		playlist = nil
		appInfo = nil
		
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	function playlistCollection:start()	
		playlistCollection:showButtonGroup()
	end	
	
	playlistCollection:start()

	return playlistCollection
	
end	

return PlaylistCollection
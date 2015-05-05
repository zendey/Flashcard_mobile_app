-----------------------------------------------------------------------------------------
--
-- PlaylistScreen.lua
-- Home screen class.
--
-----------------------------------------------------------------------------------------

local PlaylistScreen = {}

-- Create new loading screen.
function PlaylistScreen.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Screen = require "scripts.classes.screen.Screen"				-- Screen class.
	local playlistScreen = Screen.new()
	Screen = nil
	
	-----------------------------------------------------------------
	-- Class methods.
	-----------------------------------------------------------------
	
	function playlistScreen:drawScreen()
		-- Set the background color to black.
		display.setDefault( "background", 0, 0, 0.15 )
		display.setDefault( "fillColor", 0.5, 0.7, 0.9 )
		
		-- Show categories.
		local theScreenTitle = playlistScreen:showScreenTitle( { screenTitle = "Playlist" } )
		playlistScreen:put( theScreenTitle )
		
		-- Show category buttons.
		local thePlaylistButtons = playlistScreen:addToGroup( "scripts.classes.playlist.PlaylistCollection" )
		--playlistScreen:put( thePlaylistButtons )
		
		-- Show menu buttons.
		local options = { buttons = { "Menu" } }
		playlistScreen:addToGroup( "scripts.classes.widget.button.ButtonGroup", options )	
		
		-- Garbage disposal.
		options = nil		
		theScreenTitle = nil
		thePlaylistButtons = nil
	
		return playlistScreen:get()

	end

	-----------------------------------------------------------------------	
	-- Initialize class.
	-----------------------------------------------------------------------	
	
	playlistScreen:start()
	
	return playlistScreen
end

return PlaylistScreen
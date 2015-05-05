-----------------------------------------------------------------------------------------
--
-- PlaylistButtonGroup.lua
-- PlaylistButtonGroup class.
--
-----------------------------------------------------------------------------------------

local PlaylistButtonGroup = {}

-- PlaylistButtonGroup class.	
function PlaylistButtonGroup.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super = require "scripts.classes.Super" -- Super class.
	local playlistButtonGroup = Super.new()
	Super = nil
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------

	function playlistButtonGroup:createButtons( options )

		-- Local variables.
		local myPlaylistButtonGroup = playlistButtonGroup:get()
		local thisButton = {}
		local includeFile = "scripts.classes.widget.button.StartPauseButton"
		local ButtonClass = require( includeFile )
		local i 
		local buttonX = 300
		local buttonY = 250
		local myPlaylistCollection = {}
		
		for i = 1, #options.buttons do
			-- Show each button.	
			myPlaylistCollection[ i ] = playlistButtonGroup:make( "scripts.classes.playlist.PlaylistFilename", options.buttons[ i ] )
			
			-- Replace dash in filename with spaces.
			options.buttons[ i ] = string.gsub( options.buttons[ i ], "-", " ")
			
			thisButton[ i ] = ButtonClass.new( { text = options.buttons[ i ], id = myPlaylistCollection[ i ], x = buttonX + 150, y = buttonY } )
			buttonY = buttonY + 100	
			--playlistButtonGroup:set( thisButton[ i ] )
		end
		
		
		
		-- Garbage disposal.
		thisButton = nil	
		--myPlaylistButtonGroup = nil
		includeFile = nil
		ButtonClass = nil
		i = nil
	
		return myPlaylistButtonGroup

	end
	
	------------------------------------------------------------------
	-- Initialize class.
	------------------------------------------------------------------

	function playlistButtonGroup:start( options )
		playlistButtonGroup:createButtons( options )
	end	
	
	playlistButtonGroup:start( options )
	
	return playlistButtonGroup
end

return PlaylistButtonGroup
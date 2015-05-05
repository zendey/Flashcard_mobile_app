-----------------------------------------------------------------------------------------
--
-- PlayButton.lua
-- PlayButton class.
--
-----------------------------------------------------------------------------------------

local PlayButton = {}

-- PlayButton class.	
function PlayButton.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Button = require "scripts.classes.widget.button.Button"		-- Button class.
	local playButton = Button.new()
	Button = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.	
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function playButton:createPlayButton( options )
		options.x = globalVariable.screenCenterX - 125
		options.y = globalVariable.screenCenterY + 150
		options.id = "scripts.screens.screen-categories"
		options.action = playCards
		options.defaultFile = "images/icons/ic_play_circle_fill_white_48dp.png"
		options.label = "Play"
	
		playButton:createButton( options )	
		
		-- Garbage disposal.
		options = nil	
	end
	
	-- Play cards (non-slideshow).
	function playCards()
	
		local screen = require "scripts.common.screen" -- Screen functions.	
	
		-- Set global variable for slideshow to false.
		globalVariable.slideshow = false
		
		-- Go to categories screen.
		screen.goToScreen( "scripts.screens.screen-categories" )

		-- Garbage disposal.
		globalVariable = nil		
		screen = nil
	end
	
	------------------------------------------------------------------
	-- Instantiate class.
	------------------------------------------------------------------

	function playButton:start( options )	
		playButton:createPlayButton( options )
	end	
	
	playButton:start( options )
	
	return playButton
end

return PlayButton
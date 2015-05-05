-----------------------------------------------------------------------------------------
--
-- SlideshowButton.lua
-- SlideshowButton class.
--
-----------------------------------------------------------------------------------------

local SlideshowButton = {}

-- SlideshowButton class.	
function SlideshowButton.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Button = require "scripts.classes.widget.button.Button"		-- Button class.
	local slideshowButton = Button.new()
	Button = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.	
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function slideshowButton:createSlideshowButton( options )
		options.x = globalVariable.screenCenterX + 125
		options.y = globalVariable.screenCenterY + 150
		options.id = "scripts.screens.screen-categories"
		options.action = playSlideshow
		options.defaultFile = "images/icons/ic_slideshow_white_48dp.png"
		options.label = "Slideshow"

		slideshowButton:createButton( options )

		-- Garbage disposal.
		options = nil
	end
	
	-- Play cards (slideshow mode).
	function playSlideshow()
		local screen = require "scripts.common.screen" -- Screen functions.
		local globalVariable = require "scripts.common.global-variable" -- Global variables.
		
		-- Set global variable for slideshow to true.
		globalVariable.slideshow = true
		
		-- Go to categories screen.
		screen.goToScreen( "scripts.screens.screen-categories" )
		
		-- Garbage disposal.
		globalVariable = nil		
		screen = nil	
	end
	
	------------------------------------------------------------------
	-- Initialize class.
	------------------------------------------------------------------
	function slideshowButton:start( options )	
		slideshowButton:createSlideshowButton( options )
	end	
	
	slideshowButton:start( options )
	
	return slideshowButton
end

return SlideshowButton
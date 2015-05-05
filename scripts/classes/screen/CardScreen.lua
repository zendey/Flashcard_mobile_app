-----------------------------------------------------------------------------------------
--
-- CardScreen.lua
-- Home screen class.
--
-----------------------------------------------------------------------------------------

local CardScreen = {}

-- Create new loading screen.
function CardScreen.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Screen = require "scripts.classes.screen.Screen"	-- Screen class.
	local cardScreen = Screen.new()
	Screen = nil	

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.	

	-- Local variables.
	local slideshowTimer	
	local card1 = cardScreen:construct( "scripts.classes.card.Card" )		-- New instance of card class.	
	local theCard
	
	-----------------------------------------------------------------
	-- Class methods.
	-----------------------------------------------------------------

	-- Slideshow listener.
	function slideshowListener()
		theCard = card1:showCard()
	end
	
	-- Touch listener.
	function touchListener( event )

		if ( event.phase == "began" ) then
			if ( event.numTaps == 2 ) then
				--system.setTapDelay( 5 )
				-- Ignores double taps.
				if ( false == globalVariable.toggleFeatureIgnoreDoubleTap ) then -- Toggle feature while in development.
					theCard = card1:showCard()
				end	
			else
				theCard = card1:showCard()
				return true
			end
			
		end
	end
	
	function cardScreen:addEvents()
		Runtime:addEventListener( "touch", touchListener ) -- Listen for tap event from user.

		if ( true == globalVariable.slideshow ) then
			slideshowTimer = timer.performWithDelay( 5000, slideshowListener, -1 )
			
			-- Prevent device from sleeping when in slideshow mode.
			system.setIdleTimer( false )  -- Disable (turn off) the idle timer.
		end
	end	
	
	-- Draw the screen.
	function cardScreen:drawCardScreen()

		-- Show new card.
		theCard = card1:showCard()
		cardScreen:put( theCard )		-- Insert into sceneGroup so we can remove it later.
	
		local options = { buttons = { "Back" } }
		cardScreen:addToGroup( "scripts.classes.widget.button.ButtonGroup", options )	
		
		cardScreen:addEvents()
			
		-- Garbage disposal.
		options = nil
			
		return cardScreen:get()	

	end
	
	-----------------------------------------------------------------------	
	-- Instantiate class.
	-----------------------------------------------------------------------	
	
	function cardScreen:start()
		--cardScreen:addEvents()
	end
	
	cardScreen:start()

	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------	
	
	-- Get remove method from parent class.
	cardScreen.screenDestroy = cardScreen.destroy
	
	-- Remove the screen.
	function cardScreen:destroy()
		-- Remove event listeners.
		Runtime:removeEventListener( "touch", touchListener )
	
		if ( true == globalVariable.slideshow  ) then
			if ( slideshowTimer ~= nil ) then
				timer.cancel( slideshowTimer )
				slideshowTimer = nil
			end
			
			system.setIdleTimer( true )  -- Enable (turn on) the idle timer.

		end
	
		card1:removePreviousCard()
	
		-- Garbage disposal.
		card1 = nil
		myCardScreen = nil
		theCard = nil
		globalVariable = nil
	
		-- Call remove method from parent class.
		self = self:screenDestroy()	

	end	
	
	return cardScreen
end

return CardScreen
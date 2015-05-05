-----------------------------------------------------------------------------------------
--
-- CategoryScreen.lua
-- Home screen class.
--
-----------------------------------------------------------------------------------------

local CategoryScreen = {}

-- Create new loading screen.
function CategoryScreen.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Screen = require "scripts.classes.screen.Screen"				-- Screen class.
	local categoryScreen = Screen.new()
	Screen = nil
	
	-----------------------------------------------------------------
	-- Class methods.
	-----------------------------------------------------------------
	
	function categoryScreen:drawScreen()
		-- Set the background color to white after changing it to home screen background color.
		display.setDefault( "background", 1, 1, 1 )
		
		-- Show categories.
		--local theScreenTitle = categoryScreen:showScreenTitle( { screenTitle = "Categories" } )
		--categoryScreen:put( theScreenTitle )
		
		-- Show category buttons.
		categoryScreen:addToGroup( "scripts.classes.deck.DeckCollection" )

		-- Show menu buttons.
		local options = { buttons = { "Home" } }
		categoryScreen:addToGroup( "scripts.classes.widget.button.ButtonGroup", options )	
		
		-- Garbage disposal.
		options = nil		
		theScreenTitle = nil
	
		return categoryScreen:get()

	end

	-----------------------------------------------------------------------	
	-- Initialize class.
	-----------------------------------------------------------------------	
	
	categoryScreen:start()
	
	return categoryScreen
end

return CategoryScreen
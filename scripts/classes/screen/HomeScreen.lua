-----------------------------------------------------------------------------------------
--
-- HomeScreen.lua
-- Home screen class.
--
-----------------------------------------------------------------------------------------

local HomeScreen = {}

-- Create new loading screen.
function HomeScreen.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.screen.Screen"	-- Super class.
	local homeScreen = Super.new()
	Super = nil
	
	-----------------------------------------------------------------
	-- Class methods.
	-----------------------------------------------------------------
	
	-- Show the main menu.
	function homeScreen:drawScreen()
				
		homeScreen:addToGroup( "scripts.classes.app.AppBackground" )
		homeScreen:addToGroup( "scripts.classes.app.AppVersionTitle" )
		homeScreen:addToGroup( "scripts.classes.app.AppTitle" )	

		local options = { buttons = { "Menu", "Play", "Slideshow" } }
		homeScreen:addToGroup( "scripts.classes.widget.button.ButtonGroup", options )	
		return homeScreen:get()
	
	end
	
	-----------------------------------------------------------------------	
	-- Initialize class.
	-----------------------------------------------------------------------	
	homeScreen:start()
	
	return homeScreen
end

return HomeScreen
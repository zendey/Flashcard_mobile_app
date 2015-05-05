-----------------------------------------------------------------------------------------
--
-- LoadingScreen.lua
-- Loading screen class.
--
-----------------------------------------------------------------------------------------

local LoadingScreen = {}

-- Create new loading screen.
function LoadingScreen.new()

	-- Include files.
	local LoadingSpinner 	= require "scripts.classes.LoadingSpinner"	-- Loading spinner class.
	local Screen 			= require "scripts.classes.screen.Screen"			-- Screen class.

	-- Local variables.
	local loadingScreen
	local loadingSpinner1

	-- Create a new screen from the screen class.
	local options = {
				screenText = "Loading...",
				screenTextX = 225,
				screenTextY = 75,
				screenTextFontSize = 50,
			}
	local loadingScreen = Screen.new( options )

	-- Show activity indicator.
	--native.setActivityIndicator( true )

	-- Create a new loading spinner.
	loadingSpinner1 = LoadingSpinner.new()
	
	-------------------------------------------------------
	-- Class methods.
	-------------------------------------------------------

	-- Get remove method from parent class.
	loadingScreen.screenDestroy = loadingScreen.destroy
	
	-- Remove loading screen.
	function loadingScreen:destroy()
		
		-- Hide activity indicator after a few seconds
		timer.performWithDelay( 1, function() 
			native.setActivityIndicator( false )
		end )
		
		-- Stop the spinner from spinning and remove it.
		loadingSpinner1.remove()

		-- Remove method from parent class.
		loadingScreen = loadingScreen:screenDestroy()

	end

	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------	
	Screen = nil	
	
	return loadingScreen
end

return LoadingScreen
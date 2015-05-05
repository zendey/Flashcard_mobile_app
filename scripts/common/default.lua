-----------------------------------------------------------------------------------------
--
-- default.lua
-- Defaults.
-- Sets the default values for display objects.
--
-----------------------------------------------------------------------------------------

local default = {}

local function setDefaults()

	local globalVariable = require "scripts.common.global-variable"	-- Global variables.

	-- Default colors for fill and background.
	display.setDefault( "fillColor", 0.1, 0.1, 0.1 )
	display.setDefault( "background", 1, 1, 1 )

	-- Set full screen and immersive mode.
	if ( true == globalVariable.toggleFeatureImmersiveMode ) then -- Toggle feature while in development.
		-- Dims the navigation bar icons. Only on Android Ice Cream Sandwich (Api 14) or above. 
		native.setProperty( "androidSystemUiVisibility", "lowProfile" )

		-- Hides the status and navigation bar on Android (only on Kitkat API 19 and above).
		native.setProperty( "androidSystemUiVisibility", "immersiveSticky" )
		
		display.setStatusBar( display.HiddenStatusBar )
	end

	-- Set screen position.
	local screenPosition = require "scripts.common.screen-position"	
	screenPosition.setScreenPosition()

	-- Set default screen font.
	local Font = require "scripts.classes.Font"	
	font1 = Font.new()

	-- Activate multitouch.
	--system.activate( "multitouch" )	-- TODO:  Causes "attempt to call a table value" error.
	
	-- Garbage disposal.
	globalVariable = nil
	screenPosition = nil
	Font = nil
	font1 = nil
end

setDefaults()	

return default
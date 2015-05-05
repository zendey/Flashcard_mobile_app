-----------------------------------------------------------------------------------------
--
-- screen-position.lua
-- Set screen measurements to global variable to stabilize screen when device orientation changes.
--
-----------------------------------------------------------------------------------------

local screenPosition = {}

-- Save the screen position to global variables.
function screenPosition.setScreenPosition()
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.

	globalVariable.screenWidth 		= display.contentWidth		-- Width of the screen.
	globalVariable.screenHeight 	= display.contentHeight		-- Height of the screen.
	globalVariable.screenCenterX 	= display.contentCenterX	-- Center width of the screen.
	globalVariable.screenCenterY 	= display.contentCenterY	-- Center height of the screen.
	
	globalVariable = nil
end	

return screenPosition
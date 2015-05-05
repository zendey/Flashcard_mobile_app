-----------------------------------------------------------------------------------------
--
-- changeOrientation.lua
-- Adjusts the screen whenever the device has a change of orientation from portrait to landscape or vice versa.
-- To do
-----------------------------------------------------------------------------------------
 
local changeOrientation = {}

-- Include files.
local screenPosition = require "scripts.common.screen-position"	-- Screen position.

-- Redraws the screen whenever the device orientation changes from portrait to landscape or vice versa.
function changeScreenOrientation( thisContainer, thisScreenGroup )
	
	-- Only change the device orientation for these 4 orientations:
	-- "portrait", "landscapeLeft", "portraitUpsideDown", "landscapeRight".
	-- Do not change device orientation when device is face up or face down.
	if ( ( system.orientation == "portrait" ) or ( system.orientation == "portraitUpsideDown" ) or ( system.orientation == "landscapeLeft" ) or ( system.orientation == "landscapeRight" ) ) then
	
		-- Remove previous screen elements.
		if ( thisScreenGroup ~= nil ) and ( thisContainer ~= nil) then
			thisContainer:remove( thisScreenGroup )	
		end	
		
		-- Reset the screen position.
		setScreenPosition()

		-- Redraw the screen again.
		thisScreenGroup = drawScreen()
		
		-- Insert this screen into scene group so we can remove it later.
		-- thisContainer:insert( thisScreenGroup )	

	end	

	return thisScreenGroup
	--return thisContainer
	
end
 
return changeOrientation
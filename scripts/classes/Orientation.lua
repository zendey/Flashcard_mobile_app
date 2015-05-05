-----------------------------------------------------------------------------------------
--
-- Orientation.lua
-- Orientation class.
--
-----------------------------------------------------------------------------------------

local Orientation = {}
	
-- Orientation class.	
function Orientation.new()

	-- Include files.
	local screenPosition 	= require "scripts.common.screen-position"	-- Screen position.
	local Super	= require "scripts.classes.Super"	-- Super class.

	-- Inherit from super class.
	local orientation = Super.new()
	
	-- Create a display group.
	orientation = {}
	
	-- Redraws the screen whenever the device orientation changes from portrait to landscape or vice versa.
	function changeScreenOrientation( thisScreenGroup )
		
		-- Only change the device orientation for these 4 orientations:
		-- "portrait", "landscapeLeft", "portraitUpsideDown", "landscapeRight".
		-- Do not change device orientation when device is face up or face down.
		if ( ( system.orientation == "portrait" ) or ( system.orientation == "portraitUpsideDown" ) or ( system.orientation == "landscapeLeft" ) or ( system.orientation == "landscapeRight" ) ) then
		
			-- Remove previous screen elements.
			if ( thisScreenGroup ~= nil ) then
				thisScreenGroup:removeSelf()
			end	
			
			-- Reset the screen position.
			screenPosition.setScreenPosition()

			-- Redraw the screen again.
			thisScreenGroup = drawScreen()

		end	

		return thisScreenGroup
		
	end
	
	-- Get remove method from parent class.
	orientation.superDestroy = orientation.destroy
	
	-- Remove orientation.
	function orientation:destroy()
	
		-- Remove object from display.
		display.remove( self )
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	return orientation
end

return Orientation
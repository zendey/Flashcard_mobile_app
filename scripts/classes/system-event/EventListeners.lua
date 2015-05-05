-----------------------------------------------------------------------------------------
--
-- EventListeners.lua
-- Event listeners.
--
-----------------------------------------------------------------------------------------

local EventListeners = {}
	
-- EventListeners class.	
function EventListeners.new()

	-- Include files.
	local Super	= require "scripts.classes.Super"	-- Super class.

	-- Inherit from super class.
	local eventListeners = Super.new()
	
	-- Get remove method from parent class.
	eventListeners.superDestroy = eventListeners.destroy
	
	-- Remove event listeners.
	function eventListeners:destroy()
	
		-- Remove object from display.
		eventListeners.destroy( self )
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end

	return eventListeners
end

return EventListeners
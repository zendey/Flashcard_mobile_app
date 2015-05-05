-----------------------------------------------------------------------------------------
--
-- listeners.lua
-- Listeners.
-- Event listener functions.
--
-----------------------------------------------------------------------------------------

local listeners = {}

function removeAllListeners( object )
	object._functionListeners = nil
	object._tableListeners = nil	
end	

return listeners
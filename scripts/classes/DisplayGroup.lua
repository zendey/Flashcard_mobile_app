-----------------------------------------------------------------------------------------
--
-- DisplayGroup.lua
-- DisplayGroup class.
--
-----------------------------------------------------------------------------------------

local DisplayGroup = {}
	
-- DisplayGroup class.	
function DisplayGroup.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local DisplayObject	= require "scripts.classes.DisplayObject"	-- DisplayObject class.
	local displayGroup = DisplayObject.new()
	DisplayObject = nil	

	local myDisplayGroup = display.newGroup()
	
	-- TODO: to merge with addToGroup
	function displayGroup:put( thisDisplayObject )
		local thisDisplayGroup = displayGroup:get()
		if ( thisDisplayObject ~= nil ) then	
			thisDisplayGroup:insert( thisDisplayObject )
			displayGroup:set( thisDisplayGroup )
		end	
		
		-- Garbage disposal.
		thisDisplayGroup = nil
		thisDisplayObject = nil	
	end
	
	function displayGroup:addToGroup( thisClass, options )
		local myItem = displayGroup:make( thisClass, options )
		displayGroup:put( myItem )
		
		-- Garbage disposal.
		myItem = nil
			
		return myDisplayGroup
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------
	
	function displayGroup:start()
		-- Create a display group.
		displayGroup:set( myDisplayGroup )
	end
	
	displayGroup:start()
	
	return displayGroup
end

return DisplayGroup
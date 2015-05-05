-----------------------------------------------------------------------------------------
--
-- DisplayObject.lua
-- DisplayObject class.
--
-----------------------------------------------------------------------------------------

local DisplayObject = {}
	
-- DisplayObject class.	
function DisplayObject.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local displayObject = Super.new()	
	Super = nil		
	
	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------
	
	-- Get remove method from parent class.
	displayObject.superDestroy = displayObject.destroy
	
	-- Remove displayObject.
	function displayObject:destroy()
		
		--[[ Remove object from display.
		print("===============")
		for k, v in pairs(displayObject:get()) do
			print(k)
		end
		
		print(displayObject.get())]]--
		
		--displayObject.get():removeSelf()
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
		
	end
	
	return displayObject
end

return DisplayObject
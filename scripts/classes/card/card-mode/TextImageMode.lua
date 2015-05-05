-----------------------------------------------------------------------------------------
--
-- CardMode.lua
-- Card mode class.
-- Sets the card mode (Text then image, image then text, text only, image only)
--
-----------------------------------------------------------------------------------------

local CardMode = {}

function CardMode.new()

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.	
	local Super				= require "scripts.classes.Super"			-- Super class.
	
	-- Inherit from super class.
	local cardMode = Super.new()

	-- Local variables.
	local myCardMode

	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	

	--------------------------------------------------------------
	-- Inherited methods.
	--------------------------------------------------------------
	
	-- Get remove method from parent class.
	cardMode.superDestroy = cardMode.destroy
	
	-- Remove cardMode.
	function cardMode:destroy()
	
		-- Remove object from display.
		cardMode:removeSelf()
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	--cardMode:getCardNumberBasedOnPattern( thisCardNumber )
	
	return cardMode
	
end	
	
return CardMode
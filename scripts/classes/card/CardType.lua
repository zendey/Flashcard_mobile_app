-----------------------------------------------------------------------------------------
--
-- CardType.lua
-- Card type functions.
--
-----------------------------------------------------------------------------------------

local CardType = {}

-- Card type class.
function CardType.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local cardType = Super.new()
	Super = nil	

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	local preferences		= require "scripts.preferences"		-- Preferences.
	
	local myCardType

	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	
	
	-- Initialize card type.
	function cardType:showCardType()
		-- Set the initial card type.
		if ( preferences.getCardMode() == "Text then image" ) then	
			myCardType = "text"
		elseif ( preferences.getCardMode() == "Image then text" ) then
			myCardType = "image"
		elseif ( preferences.getCardMode() == "Text only" ) then
			myCardType = "text"
		elseif ( preferences.getCardMode() == "Image only" ) then
			myCardType = "image"
		elseif ( preferences.getCardMode() == "Image + Text" ) then
			myCardType = "text"
		end
		return myCardType
	end
	
	-- Toggle the card face (front or back).
	function cardType:toggleCardType()
		if ( preferences.getCardMode() ~= "Text only" ) and ( preferences.getCardMode() ~= "Image only" ) then
			if ( myCardType == "text" ) then
				myCardType = "image"
			elseif ( myCardType == "image" ) then
				myCardType = "text"
			end
		end	
			
		return myCardType
	end	

	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	-- Get the card type (whether it's an image or text).
	function cardType:getCardType()
		return myCardType
	end

	-- Set the card type (whether it's an image or text).
	function cardType:setCardType( thisCardType )

		--myCardType = thisCardType
		myCardType = cardType:toggleCardType()
	
		return myCardType
	end
	
	--------------------------------------------------------------
	-- Inherited methods.
	--------------------------------------------------------------
	
	-- Get remove method from parent class.
	cardType.superDestroy = cardType.destroy
	
	-- Remove cardType.
	function cardType:destroy()
	
		-- Garbage disposal.
		preferences = nil
		myCardType = nil
	
		-- Remove object from display.
		cardType:removeSelf()
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------

	-- Initialize card type.
	function cardType:start()
		cardType:showCardType()
	end
	
	cardType:start()

	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------	
	
	return cardType
end	
	
return CardType
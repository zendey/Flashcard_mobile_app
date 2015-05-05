-----------------------------------------------------------------------------------------
--
-- CardText.lua
-- Card face class.
-- The card face.
--
-----------------------------------------------------------------------------------------

local CardText = {}

function CardText.new( thisCardText )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local cardText = Super.new()
	Super = nil	
	
	--Local variables.	
	local myCardText

	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function cardText:setCardText( thisCardText )

		local globalVariable 	= require "scripts.common.global-variable"				-- Global variables.	
		local preferences		= require "scripts.preferences" 						-- Preferences.	
	
		-- TODO: make sure text wraps 
		local cardFontSize = globalVariable.cardFontSize
		
		local options = 
		{
			text = thisCardText,
			x = globalVariable.screenCenterX,
			y = globalVariable.screenCenterY,
			fontSize = globalVariable.cardFontSize,
			font = globalVariable.cardFontFace,
			width = display.actualContentWidth * 0.9,
			height = 0,
			align = "center"
		}

		local myCardText = display.newText( options )
		
		cardText:set( myCardText )
		
		-- Garbage disposal.
		globalVariable = nil
		preferences = nil
		cardFontSize = nil
		options = nil
		--myCardText = nil
		
		return myCardText
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	cardText:start( thisCardText )

	return cardText
	
end	
	
return CardText
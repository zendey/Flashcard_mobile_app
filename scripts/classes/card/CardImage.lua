-----------------------------------------------------------------------------------------
--
-- CardImage.lua
-- Card image class.
-- The card image.
--
-----------------------------------------------------------------------------------------

local CardImage = {}

function CardImage.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local cardImage = Super.new()
	Super = nil
	
	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function cardImage:setCardImage( thisCardImage )
		
		local myCardFilename = cardImage:make( "scripts.classes.card.CardFilename", thisCardImage )
		local images = require "scripts.common.images" -- Images.	
		
		-- Check first if image name is not blank before displaying image.
		if ( myCardFilename ) then
			thisCardImage = images.showImage( { imageToDisplay = myCardFilename } )
			print(myCardFilename)
			if ( thisCardImage ~= nil ) then
				thisCardImage:toBack()
			end 
		end
		
		cardImage:set( thisCardImage )
		
		-- Garbage disposal.
		--thisCardImage = nil
		myCardFilename = nil
		images = nil
		
		return thisCardImage
		
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	cardImage:start()
	
	return cardImage
	
end	
	
return CardImage
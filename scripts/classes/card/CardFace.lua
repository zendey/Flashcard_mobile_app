-----------------------------------------------------------------------------------------
--
-- CardFace.lua
-- Card face class.
-- The card face.
--
-----------------------------------------------------------------------------------------

local CardFace = {}

function CardFace.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local cardFace = Super.new()
	Super = nil
	
	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.
	
	-- Local variables.
	
	local myCardFace
	local myCardFaceCount = 1
	local myCardColumn
	
	local cardImage1 = cardFace:construct( "scripts.classes.card.CardImage" )
	local cardSound1 = cardFace:construct( "scripts.classes.card.CardSound" )
	local cardText1 = cardFace:construct( "scripts.classes.card.CardText" )
	local cardType1 = cardFace:construct( "scripts.classes.card.CardType" )
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function cardFace:getCardColumn( myCardFace )
		local options = {
				delimiter = "\t",
				stringToSeparate = myCardFace
			}
		myCardFace = cardFace:make( "scripts.classes.file.DelimiterSeparator", options )	
	
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myCardFace[ 2 ] ~= nil, "No card face." )
		end 
	
		-- Garbage disposal.
		options = nil
		
		return myCardFace
	end
	
	-- Toggle the card face between image and text.
	function cardFace:showCardFace( myCardFace )
		local myCardGroup = display.newGroup()
	
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
		--	assert( myCardFace ~= nil, "No card face." )
		end 

		myCardColumn = cardFace:getCardColumn( myCardFace )

		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myCardColumn[ 2 ] ~= nil, "No card image path." )
		end 
		
		-- Show image flashcard.
		if ( cardType1.getCardType() == "image" ) then
			myCardFace = cardImage1:setCardImage( myCardColumn[ 2 ] )
			if ( myCardFace ~= nil ) then
				myCardGroup:insert( myCardFace )
			end
			
			-- Show upgrade button.
			if ( myCardColumn[ 2 ]:find( "upgrade" ) ~= nil ) then
				local upgradeButton = cardFace:make( "scripts.classes.widget.button.UpgradeButton" )
				myCardGroup:insert( upgradeButton )
			end
			
		-- Show text flashcard.
		else			
			myCardFace = cardText1:setCardText( myCardColumn[ 1 ] )
			if ( myCardFace ~= nil ) then
				myCardGroup:insert( myCardFace )
			end
		end
		
		cardType1:setCardType()
		cardFace:setCardFaceCount( myCardFaceCount )
		
		-- Play sound.
		cardSound1:setCardSound( myCardColumn[ 3 ] )
		
		return myCardGroup
		--return myCardFace
	end

	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------
	
	function cardFace:getCardFaceCount()

		return myCardFaceCount
	end
	
	-- Toggles between front of the card and back of the card.
	function cardFace:setCardFaceCount( thisCardFaceCount )
		myCardFaceCount = thisCardFaceCount
		
		local preferences = require "scripts.preferences" 						-- Preferences.
		
		if ( preferences.getCardMode() == "Text only" ) or ( preferences.getCardMode() == "Image only" ) then
			myCardFaceCount = 1
		else
			if ( myCardFaceCount == 1 ) then
				myCardFaceCount = 2				-- Back of the card.
			else 
				myCardFaceCount = 1				-- Front of the card.
			end	
		end
		
		-- Garbage disposal.
		preferences = nil
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	

	function cardFace:start()
		--cardFace:createCardFace()
	end
	
	cardFace:start()

	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------	
	
	-- Get remove method from parent class.
	cardFace.superDestroy = cardFace.destroy
	
	-- Remove cardText.
	function cardFace:destroy()
	
		-- Garbage disposal.
		myCardFace = nil
		myCardFaceCount = nil
		myCardColumn = nil
		--myCardGroup = nil
		
		cardImage1 = nil
		cardSound1 = nil
		cardText1 = nil
		cardType1 = nil
		
		globalVariable = nil	
	
		-- Remove object from display.
		cardFace:removeSelf()
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	return cardFace
	
end	
	
return CardFace
-----------------------------------------------------------------------------------------
--
-- Card.lua
-- Card class.
-- A card.
--
-----------------------------------------------------------------------------------------

local Card = {}

function Card.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local card = Super.new()
	Super = nil

	-- Local variables.
	local myCard
	local previousCardCounter
	local theCardCounter
	local cardFace1	= card:construct( "scripts.classes.card.CardFace" )
	local cardPattern1 = card:construct( "scripts.classes.card.CardPattern" )
	local theDeck = card:make( "scripts.classes.deck.Deck" )
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	-- Remove previous card.
	function card:removePreviousCard()
		if ( myCard ~= nil ) then
			display.remove( myCard )
		end
	end
	
	-- Show card.
	function card:showCard()
	
		-- Remove previous object first.
		card:removePreviousCard()
		
		-- Get new card.
		if ( cardFace1:getCardFaceCount() == 1 ) or ( theCardCounter == nil ) then
			theCardCounter = cardPattern1:getCardNumberBasedOnPattern( theCardCounter )
		end

		-- Show card face (image or text).
		if ( theDeck ~= nil ) then
			myCard = cardFace1:showCardFace( theDeck[ theCardCounter ] )
			myCard:toBack()			
		end 
		
		previousCardCounter = cardCounter

		return myCard
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------

	-- Initialize card.
	function card:start()		
		
	end
	
	card:start()
	
	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------
	
	-- Get remove method from parent class.
	card.superDestroy = card.destroy
	
	-- Remove card.
	function card:destroy()

		-- Garbage disposal.
		theDeck = nil
		cardFace1 = nil
		cardPattern1 = nil
		previousCardCounter = nil
		theCardCounter = nil

		-- Remove object from display.
		display.remove( myCard )
		myCard = nil
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	return card
	
end	
	
return Card
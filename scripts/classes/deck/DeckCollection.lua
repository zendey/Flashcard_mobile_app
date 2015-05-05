-----------------------------------------------------------------------------------------
--
-- DeckCollection.lua
-- Card Collection class.
-- A collection of card decks.
--
-----------------------------------------------------------------------------------------

local DeckCollection = {}

-- Card collection class.
function DeckCollection.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local deckCollection = Super.new()
	Super = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	local globalVariable = require "scripts.common.global-variable"		-- Global variables.
	local appInfo = require( globalVariable.appScriptDirectory .. "app-info" ) -- App-specific information.
	globalVariable = nil	
		
	-- Local variables.
	local myDeckCollection
	local categoryButton
	local cardCategoryCounter
	local cardCategories
	
	local deckThumbnail1 = deckCollection:construct( "scripts.classes.deck.DeckThumbnail" )	
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	-- Get the filenames of the card decks.
	function deckCollection:showButtonGroup()
		-- Local variables.
		myDeckCollection = display.newGroup()
		cardCategories = appInfo.getAppInfo().deckCollection
		
		for cardCategoryCounter = 1, #cardCategories do
			
			categoryButton = deckThumbnail1:getDeckThumbnail( { category = cardCategories[ cardCategoryCounter ] } )
			--categoryButton = deckCollection:showButton( cardCategoryCounter )
			myDeckCollection:insert( categoryButton )
		end
		
		deckCollection:set( myDeckCollection )
		
		-- Garbage disposal.
		categoryButton = nil
		cardCategoryCounter = nil
		cardCategories = nil
		myDeckCollection = nil
		appInfo = nil
		
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	function deckCollection:start()
		deckCollection:showButtonGroup()
	end	
	
	deckCollection:start()

	return deckCollection
	
end	

return DeckCollection
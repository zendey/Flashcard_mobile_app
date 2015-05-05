-----------------------------------------------------------------------------------------
--
-- Deck.lua
-- Deck class.
-- A deck is a group of cards.
--
-----------------------------------------------------------------------------------------

local Deck = {}

function Deck.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local deck = Super.new()
	Super = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local globalVariable 	= require "scripts.common.global-variable"			-- Global variables.
	
	-- Local variables.
	local myDeck

	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------
	
	-- Get the card deck count.
	function deck:setDeckCount()
		local myDeckCount = table.maxn( myDeck )
		-- TODO: Remove this from global variable.
		
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myDeckCount ~= nil, "Deck count is nil." )
		end	
		
		globalVariable.deckCount = myDeckCount

		myDeckCount = nil
	end	
	
	-- Get the card deck.
	function deck:buildDeck()
		local myDeckFilePath = deck:make( "scripts.classes.deck.DeckFilePath" )

		local options = {
			filePath = myDeckFilePath,
			fileMode = "r",
			systemDirectory = system.ResourceDirectory,
			delimiter = "\n"
		}
		myDeck = deck:make( "scripts.classes.file.FileParser", options )
		deck:setDeckCount()
		
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myDeck ~= nil, "No deck selected." )
		end
			
		deck:set( myDeck )
			
		-- Garbage disposal.
		deck:unmake()
		myDeckFilePath = nil
		options = nil
		myDeck = nil
		globalVariable = nil
		
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------
	
	-- Get the card deck.
	function deck:start()
		deck:buildDeck()	
	end	
	
	deck:start()
	
	return deck
	
end	
	
return Deck
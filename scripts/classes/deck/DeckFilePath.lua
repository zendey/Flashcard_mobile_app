-----------------------------------------------------------------------------------------
--
-- DeckFilePath.lua
-- Deck Directory class.
-- The directory (folder path) of the deck.
--
-----------------------------------------------------------------------------------------

local DeckFilePath = {}

function DeckFilePath.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local deckFilePath = Super.new()
	Super = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local globalVariable 	= require "scripts.common.global-variable"			-- Global variables.
	
	-- Local variables.
	local myDeckFilePath

	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	-- Creates a new card deckFilePath.
	function deckFilePath:buildDeckFilePath()
		local appInfo = require( globalVariable.appScriptDirectory .. "app-info" )	-- App-specific information.
		
		-- If deck file path is not set.
		if ( globalVariable.deckFilePath == nil ) then	
			-- Get card file path from apps settings.
			myDeckFilePath = appInfo.getAppInfo().defaultDeckFilePath	
		else
			-- Get card file path from global variable.
			myDeckFilePath = globalVariable.deckFilePath
		end
		
		-- Save the current file path in the global variables.
		globalVariable.deckFilePath = myDeckFilePath

		myDeckFilePath = appInfo.getAppInfo().deckDirectory .. myDeckFilePath
		
		deckFilePath:set( myDeckFilePath )
		
		-- Garbage disposal.
		appInfo = nil
		myDeckFilePath = nil
		
		
		--return myDeckFilePath
	end

	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------

	function deckFilePath:start()
		deckFilePath:buildDeckFilePath()
	end
	
	deckFilePath:start()

	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------	
	
	-- Get remove method from parent class.
	deckFilePath.superDestroy = deckFilePath.destroy
	
	-- Remove deckFilePath.
	function deckFilePath:destroy()
	
		-- Garbage disposal.
		globalVariable = nil
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	return deckFilePath
	
end	
	
return DeckFilePath
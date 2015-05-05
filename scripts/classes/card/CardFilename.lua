-----------------------------------------------------------------------------------------
--
-- CardFilename.lua
-- Card filename class.
-- The card filename.
--
-----------------------------------------------------------------------------------------

local CardFilename = {}

function CardFilename.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super" -- Super class.
	local cardFilename = Super.new()
	Super = nil

	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	
	
	function cardFilename:trimCardFileName( options )
		local strings = require "scripts.common.strings" 						-- String functions.
	
		-- Trim spaces from the beginning and end of word.
		myCardFilename = strings.trim( options )	
		
		-- Garbage disposal.
		strings = nil
		options = nil
		
		return myCardFilename
	end
	
	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function cardFilename:getCardFilename( options )

		local myCardFilename = cardFilename:trimCardFileName( options )

		local globalVariable 	= require "scripts.common.global-variable"				-- Global variables.	
		local appInfo 			= require( globalVariable.appScriptDirectory .. "app-info" )	-- App-specific information.	
		
		-- Get card file name.
		if ( appInfo.getAppInfo().deckDirectory ~= nil ) and ( myCardFilename ~= nil ) then
			myCardFilename = appInfo.getAppInfo().deckDirectory .. myCardFilename
		end
		
		cardFilename:set( myCardFilename )
		
		-- Garbage disposal.
		globalVariable = nil
		appInfo = nil
		myCardFilename = nil
		options = nil
		
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	function cardFilename:start( options )
		cardFilename:getCardFilename( options )
	end
	
	cardFilename:start( options )
	
	return cardFilename
	
end	
	
return CardFilename
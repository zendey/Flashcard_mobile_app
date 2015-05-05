-----------------------------------------------------------------------------------------
--
-- AppID.lua
-- Application ID class.
-- Sets the app ID
--
-----------------------------------------------------------------------------------------

local AppID = {}

function AppID.new( thisAppID )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super" -- Super class.	
	local appID = Super.new()
	Super = nil
	
	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	-- Sets the app ID.
	function appID:setAppID( thisAppID )
		local globalVariable = require "scripts.common.global-variable"	-- Global variables.
		
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( thisAppID ~= nil, "No app ID specified so defaulting to app ID 1. If you want to specify a different app, please change the app ID in apps/start-app.lua file." )
		end
		
		globalVariable.appID = thisAppID or 1
		appID:set( globalVariable.appID )
		
		-- Garbage disposal.
		thisAppID = nil	
		globalVariable = nil
	end

	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------		

	function appID:start( thisAppID )
		appID:setAppID( thisAppID ) 			-- Sets the app ID.
		
		-- Garbage disposal.
		thisAppID = nil	
	end
	
	appID:start( thisAppID )

	-- Garbage disposal.
	thisAppID = nil	
	
	return appID
end

return AppID
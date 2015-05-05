-----------------------------------------------------------------------------------------
--
-- AppVersion.lua
-- App version class.
--
-----------------------------------------------------------------------------------------

local AppVersion = {}

-- Creates a new appVersion. 
function AppVersion.new( thisAppVersion )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super" -- DisplayObject class.
	local appVersion = Super.new()	
	Super = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	local globalVariable = require "scripts.common.global-variable"			-- Global variables.	
	
	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	

	-- Sets whether app is lite version or full version.
	function appVersion:setVersion( thisAppVersion )
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( thisAppVersion ~= nil, "No version specified so defaulting to full version.  If you want to specify a different version, please change the app version in apps/start-app.lua file." )
		end	
		globalVariable.version = thisAppVersion or "full"
		appVersion:set( globalVariable.version )
		
		-- Garbage disposal.
		thisAppVersion = nil
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------		

	function appVersion:start( thisAppVersion )
		appVersion:setVersion( thisAppVersion )
		
		-- Garbage disposal.
		thisAppVersion = nil
	end
	
	appVersion:start( thisAppVersion )
	
	-- Garbage disposal.
	thisAppVersion = nil
	
	return appVersion
end

return AppVersion
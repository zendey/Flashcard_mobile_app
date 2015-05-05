-----------------------------------------------------------------------------------------
--
-- AppWebsite.lua
-- App directory class.
--
-----------------------------------------------------------------------------------------

local AppWebsite = {}

-- Creates a new appWebsite. 
function AppWebsite.new( thisAppID )

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------

	local globalVariable 		= require "scripts.common.global-variable"			-- Global variables.
	local Super					= require "scripts.classes.Super"					-- Super class.
	
	-- Inherit from super class.
	local appWebsite = Super.new()
	
	-- Local variables.
	local myAppWebsiteURL
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	
	
	function appWebsiteURL()
		local appInfo 			= require( globalVariable.appScriptDirectory .. "app-info" )	-- App-specific information.
		print( "Opening website " .. appInfo.getAppInfo().appURL .. "..." )
		system.openURL( appInfo.getAppInfo().appURL )
		
		-- Garbage disposal.
		appInfo = nil
		
	end

	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function appWebsite:getAppWebsiteURL()
		return myAppWebsiteURL
	end 
	--------------------------------------------------------------
	-- Inherited methods.
	--------------------------------------------------------------
	
	-- Get remove method from parent class.
	appWebsite.superDestroy = appWebsite.destroy
	
	-- Remove appWebsite.
	function appWebsite:destroy()
		
		-- Garbage disposal.
		myAppWebsiteURL = nil
	
		-- Remove object from display.
		appWebsite:removeSelf()
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------		
	
	appWebsite:start()

	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------	
	Super = nil
	
	return appWebsite
end

return AppWebsite
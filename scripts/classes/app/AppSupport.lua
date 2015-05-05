-----------------------------------------------------------------------------------------
--
-- AppSupport.lua
-- App support class.
--
-----------------------------------------------------------------------------------------

local AppSupport = {}

-- Creates a new app support. 
function AppSupport.new( thisAppID )

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------

	local globalVariable 		= require "scripts.common.global-variable"			-- Global variables.
	local Super					= require "scripts.classes.Super"					-- Super class.
	
	local appInfo 			= require( globalVariable.appScriptDirectory .. "app-info" )	-- App-specific information.
	
	-- Inherit from super class.
	local appSupport = Super.new()
	
	-- Local variables.
	local myAppSupportURL
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	

	function appSupportURL()
		print( "Opening support page " .. appInfo.getAppInfo().helpURL .. "..." )
		system.openURL( appInfo.getAppInfo().helpURL )
		
	end
	
	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function appSupport:getAppSupportURL()
		return myAppSupportURL
	end 
	--------------------------------------------------------------
	-- Inherited methods.
	--------------------------------------------------------------
	
	-- Get remove method from parent class.
	appSupport.superDestroy = appSupport.destroy
	
	-- Remove appSupport.
	function appSupport:destroy()
	
		-- Remove object from display.
		appSupport:removeSelf()
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------		
	
	appSupport:start()
	
	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------	
	Super = nil
	
	return appSupport
end

return AppSupport
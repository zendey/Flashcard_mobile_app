-----------------------------------------------------------------------------------------
--
-- UpgradeApp.lua
-- Upgrade app class.
--
-----------------------------------------------------------------------------------------

local UpgradeApp = {}

-- Creates a new upgradeApp. 
function UpgradeApp.new( thisAppID )

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------

	local globalVariable 		= require "scripts.common.global-variable"			-- Global variables.
	local Super					= require "scripts.classes.Super"					-- Super class.
	
	-- Inherit from super class.
	local upgradeApp = Super.new()
	
	-- Local variables.
	local myUpgradeAppURL
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	
	
	function upgradeAppURL()
		
		local appInfo = require( globalVariable.appScriptDirectory .. "app-info" )	-- App-specific information.
		
		local options =
		{
		   --iOSAppId = "1234567890",
		   --nookAppEAN = "0987654321",
		   androidAppPackageName = appInfo.getAppInfo().upgradePackageName,
		   supportedAndroidStores = { "google", "amazon", "nook" },
		}
		print( "Opening upgrade app page " .. appInfo.getAppInfo().upgradePackageName .. "..." )
		native.showPopup( "appStore", options )
		
		-- Garbage disposal.
		appInfo = nil
		options = nil
	end

	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function upgradeApp:getUpgradeAppURL()
		return myUpgradeAppURL
	end 
	--------------------------------------------------------------
	-- Inherited methods.
	--------------------------------------------------------------
	
	-- Get remove method from parent class.
	upgradeApp.superDestroy = upgradeApp.destroy
	
	-- Remove upgradeApp.
	function upgradeApp:destroy()
	
		-- Garbage disposal.
		myUpgradeAppURL = nil
	
		-- Remove object from display.
		upgradeApp:removeSelf()
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------		
	
	upgradeApp:start()
	
	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------	
	Super = nil	
	
	return upgradeApp
end

return UpgradeApp
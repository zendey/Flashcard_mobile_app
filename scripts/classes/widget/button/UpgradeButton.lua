-----------------------------------------------------------------------------------------
--
-- UpgradeButton.lua
-- UpgradeButton class.
--
-----------------------------------------------------------------------------------------

local UpgradeButton = {}

-- UpgradeButton class.	
function UpgradeButton.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Button = require "scripts.classes.widget.button.Button"		-- Button class.
	local upgradeButton = Button.new()
	Button = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.	

	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	
	function upgradeButton:createUpgradeButton()
		local options = {}
		options.onPress = upgradeAppURL
		--options.onEvent = upgradeAppURL
		options.x = globalVariable.screenCenterX
		options.y = globalVariable.screenCenterY + 225
		options.id = "upgrade"
		options.label = "Upgrade"
		
		upgradeButton:createButtonText( options )
		
		-- Garbage disposal.
		options = nil	
	end

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
		--globalVariable = nil
	end
	
	------------------------------------------------------------------
	-- Instantiate class.
	------------------------------------------------------------------

	function upgradeButton:start()	
		upgradeButton:createUpgradeButton()
	end	
	
	upgradeButton:start()
	
	return upgradeButton
end

return UpgradeButton
-----------------------------------------------------------------------------------------
--
-- toggle-features.lua
-- Toggle features that are still in development on and off 
--
-----------------------------------------------------------------------------------------

local toggleFeatures = {}

local function toggleTheseFeatures() 
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.

	globalVariable.toggleFeatureDebugMode = false			-- Debug mode
	globalVariable.toggleFeatureAssert = false				-- Turn on assert mode in device.

	globalVariable.toggleFeatureHomeButton = true			-- Home Button
	globalVariable.toggleFeatureExitButton = false			-- Exit Button
	globalVariable.toggleFeatureMenuButton = true			-- Menu Button
	globalVariable.toggleFeatureSettingsButton = true		-- Settings button.
	globalVariable.toggleFeatureBackButton = true			-- Back button.
	globalVariable.toggleFeatureDisableBackButton = false	-- Disable back button.
	
	globalVariable.toggleFeatureJsonFile = false			-- Json file for user preferences.
	globalVariable.toggleFeatureImmersiveMode = true		-- Immersive mode.
	globalVariable.toggleFeatureIgnoreDoubleTap = true		-- Ignore double tap.

	globalVariable.toggleFeatureLanguage = false			-- Internationalization.

	globalVariable.toggleLoadingSpinner = false				-- Loading spinner.
	globalVariable.toggleLoadingScreen = false				-- Loading screen.
	
	-- TODO:  temporary, to remove.
	if ( globalVariable.appID == 5 ) then
		globalVariable.toggleFeatureCreditsButton = true		-- Credits button.
	else
		globalVariable.toggleFeatureCreditsButton = false		-- Credits button.
	end
	
	globalVariable = nil
end	

toggleTheseFeatures()

return toggleFeatures
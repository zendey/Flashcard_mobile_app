-----------------------------------------------------------------------------------------
--
-- MainApplication.lua
-- MainApplication class.
-- Sets application-specific settings.
--		- application ID.
--		- whether the application is lite version or full version.
--		- gets the application directory where all the application's assets (images, sounds, cards) and saves it to global variable.
-----------------------------------------------------------------------------------------

local MainApplication = {}

-- Creates a new application and sets the settings. 
function MainApplication.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"					-- Super class.
	local mainApplication = Super.new()
	Super = nil
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	
	
	function mainApplication:start()
	
		-- Include files.
		local globalVariable = require "scripts.common.global-variable"	-- Global variables.		
		
		if ( true == globalVariable.toggleLoadingSpinner ) then
			-- Show loading activity indicator.
			native.setActivityIndicator( true )
		end		
		
		--[[ Test suite.
		if ( system.getInfo( "environment" ) == "simulator" ) then
			local lunaTestLibrary = require "scripts.external.lunatest.lunatest"
			lunatest.suite( "scripts.tests.test" )
			lunatest.run()

			lunaTestLibrary = nil
		end ]]--
			
		-- Toggle features.
		local toggleFeatures = require "scripts.common.toggle-features"
		toggleFeatures = nil
		
		-- For debugging.
		if ( true == globalVariable.toggleFeatureDebugMode ) then
			local DebugButton = require "scripts.classes.widget.button.DebugButton"
			local debugButton1 = DebugButton.new( { } )
			DebugButton = nil
			debugButton1 = nil
		end

		-- Create new instance of error log class.
		local ErrorLog = require "scripts.add-ons.error-log.error-log.ErrorLog"	-- Error log class.
		errorLog1 = ErrorLog.new()
		ErrorLog = nil

		-- Internationalization
		if ( true == globalVariable.toggleFeatureLanguage ) then			-- Toggle feature while in development.
			local language = require "scripts.i18n.language" 				-- Language.
			language = nil
		end

		-- Google license key.
		local licensing = require "licensing" 								-- Google licensing.
		licensing.init( "google" )
		licensing = nil
	
		-- Set defaults.
		local default = require "scripts.common.default"
		default = nil
		
		if ( true == globalVariable.toggleLoadingSpinner ) then
			-- Hide loading activity indicator.
			native.setActivityIndicator( false )
		end	
	
		-- Go to home screen.
		local composer = require( "composer" )

		--if ( false == globalVariable.toggleFeatureHomeScreen ) then 
		if ( globalVariable.appID == 6 ) then -- TODO: Change appID to toggleFeature
			composer.gotoScene( "scripts.screens.screen-playlist" )
		else
			composer.gotoScene( "scripts.screens.screen-home" )
		end
		
		-- Garbage disposal.
		globalVariable = nil
		composer = nil
	end
	
	--------------------------------------------------------------
	-- Inherited methods.
	--------------------------------------------------------------
	
	-- Get remove method from parent class.
	mainApplication.superDestroy = mainApplication.destroy
	
	-- Remove app.
	function mainApplication:destroy()
	
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------
	
	mainApplication:start()
	
	return mainApplication
end

return MainApplication
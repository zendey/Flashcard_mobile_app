-----------------------------------------------------------------------------------------
--
-- AppTitle.lua
-- App title class.
--
-----------------------------------------------------------------------------------------

local AppTitle = {}

-- Creates a new appTitle. 
function AppTitle.new( thisAppID )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local DisplayObject	= require "scripts.classes.DisplayObject"			-- DisplayObject class.
	local appTitle = DisplayObject.new()
	DisplayObject = nil
	
	-- Include files.	
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.
	local appDesign = require( globalVariable.appScriptDirectory .. "app-design" )	-- App-specific information.	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	

	-- Show title image.
	function appTitle:showAppTitleImage()

		local images = require "scripts.common.images" -- Image functions.
			
		-- Calculate image scale depending on device.
		local imageScale
		if ( globalVariable.screenWidth > 800 ) then
			imageScale = 0.75
		end
		
		-- Display title image.
		local options = {
			imageToDisplay = appDesign.getAppDesign().titleImage, 
			imageOffsetX = 0,
			imageOffsetY = 125 - globalVariable.screenCenterY,
			scaleAllowance = imageScale
		}
		local myAppTitle = images.showImage( options )

		if ( myAppTitle == nil ) then
			local appInfo = require( globalVariable.appScriptDirectory .. "app-info" )	-- App-specific information.	
			myAppTitle = display.newText( appInfo.getAppInfo().appTitle, globalVariable.screenCenterX, globalVariable.screenCenterY - 150, "Arial", 60 )
			myAppTitle:setFillColor( 1, 1, 1 )
			appInfo = nil
		else
			if ( globalVariable.screenHeight > 720 ) then
				myAppTitle.y = myAppTitle.height 
			end	
		end	

		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myAppTitle ~= nil, "No app title found." )
		end 
		
		appTitle:set( myAppTitle )
		
		-- Garbage disposal.
		options = nil
		images = nil
		imageScale = nil
		myAppTitle = nil
	end
	
	-- Show app title text.
	function appTitle:showAppTitleText()
		local myAppTitle = display.newText( "Flashcards", 0, 125 - globalVariable.screenCenterY, globalVariable.titleFontFace, 70 )
		
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myAppTitle ~= nil, "No app title text found." )
		end 		
		
		appTitle:set( myAppTitle )	
		
		-- Garbage disposal.
		myAppTitle = nil
	end
	
	-- Show app title.
	function appTitle:showAppTitle()
		if ( appDesign.getAppDesign().titleImage ~= nil ) then
			appTitle:showAppTitleImage()			
		else
			appTitle:showAppTitleText()
		end
		
		-- Garbage disposal.
		globalVariable = nil
		appDesign = nil	
	end

	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------		
	
	function appTitle:start()
		appTitle:showAppTitle()
	end
			
	appTitle:start()
	
	return appTitle
end

return AppTitle
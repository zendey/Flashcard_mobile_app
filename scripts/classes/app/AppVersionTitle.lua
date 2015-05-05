-----------------------------------------------------------------------------------------
--
-- AppVersionTitle.lua
-- App version title class.
-- Shows the app version in the title screen.
--
-----------------------------------------------------------------------------------------

local AppVersionTitle = {}

function AppVersionTitle.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local DisplayObject	= require "scripts.classes.DisplayObject" -- DisplayObject class.
	local appVersionTitle = DisplayObject.new()	
	DisplayObject = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	local globalVariable = require "scripts.common.global-variable"			-- Global variables.	
	
	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function appVersionTitle:setAppVersionTitle()
		local myAppVersionTitle
		
		-- Display the app version (whether it is lite or full version).
		if ( globalVariable.version == "lite" ) then
			myAppVersionTitle = display.newText( "lite", globalVariable.screenCenterX, globalVariable.screenCenterY, globalVariable.appFontFace, 40 )
			myAppVersionTitle:setFillColor( 1, 1, 1 )
		else
			myAppVersionTitle = display.newText( "", globalVariable.screenCenterX, globalVariable.screenCenterY, globalVariable.appFontFace, 40 )
		end
		
		appVersionTitle:set( myAppVersionTitle )
		
		-- Garbage disposal.
		myAppVersionTitle = nil

	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------		

	function appVersionTitle:start()
		appVersionTitle:setAppVersionTitle()
		
	end
	
	appVersionTitle:start()
	
	return appVersionTitle
end

return AppVersionTitle
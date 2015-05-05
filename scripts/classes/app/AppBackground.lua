-----------------------------------------------------------------------------------------
--
-- AppBackground.lua
-- App background class.
--
-----------------------------------------------------------------------------------------

local AppBackground = {}

-- Creates a new appBackground. 
function AppBackground.new( thisAppID )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local DisplayGroup	= require "scripts.classes.DisplayGroup" -- DisplayGroup class.
	local appBackground = DisplayGroup.new()	
	DisplayGroup = nil	

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	local globalVariable = require "scripts.common.global-variable"			-- Global variables.	
	local appDesign 	= require( globalVariable.appScriptDirectory .. "app-design" )	-- App-specific information.
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	
	
	-- Set the background color.
	function appBackground:setAppBackgroundColor()

		-- Get the background color as specified by each app.
		local titleBackgroundColorR = appDesign.getAppDesign().titleBackgroundColorR or 1
		local titleBackgroundColorG = appDesign.getAppDesign().titleBackgroundColorG or 1	
		local titleBackgroundColorB = appDesign.getAppDesign().titleBackgroundColorB or 1

		display.setDefault( "background", titleBackgroundColorR, titleBackgroundColorG, titleBackgroundColorB )
		
		-- Garbage disposal.
		titleBackgroundColorR = nil
		titleBackgroundColorG = nil
		titleBackgroundColorB = nil
	end
	
	-- Show background pattern.
	function appBackground:setAppBackgroundPattern()
		local myAppBackgroundPattern = appBackground:get()
	
		local images = require "scripts.common.images" 					-- Image functions.
	
		if ( globalVariable.appID == 3 ) then	-- First Words
			local options = {
					imageToDisplay = globalVariable.appDirectory .. "design/cloud-1.png",
					imageOffsetX = globalVariable.screenWidth - 175 - globalVariable.screenCenterX,
					imageOffsetY = 75 - globalVariable.screenCenterY,
					scaleAllowance = 0.18
				}
			local backgroundPattern1 = images.showImage( options )
			
			options = {
					imageToDisplay = globalVariable.appDirectory .. "design/cloud-2.png",
					imageOffsetX = globalVariable.screenWidth - 225 - globalVariable.screenCenterX,
					imageOffsetY = globalVariable.screenHeight - 200 - globalVariable.screenCenterY,
					scaleAllowance = 0.2
			}
			local backgroundPattern2 = images.showImage( options )
			
			options = {
					imageToDisplay = globalVariable.appDirectory .. "design/cloud-3.png",
					imageOffsetX = 200 - globalVariable.screenCenterX,
					imageOffsetY = globalVariable.screenHeight - 225 - globalVariable.screenCenterY,
					scaleAllowance = 0.2
			}
			local backgroundPattern3 = images.showImage( options )
		
			if ( globalVariable.screenHeight > 720 ) then
				backgroundPattern1.y = backgroundPattern1.height * 2
			end

			appBackground:put( backgroundPattern1 )
			appBackground:put( backgroundPattern2 )
			appBackground:put( backgroundPattern3 )
			
			-- Garbage disposal.
			options = nil
			backgroundPattern1 = nil
			backgroundPattern2 = nil
			backgroundPattern3 = nil
		end
		
		appBackground:set( myAppBackgroundPattern )
		
		-- Garbage disposal.
		myAppBackgroundPattern = nil
		images = nil

	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------		
	function appBackground:start()
		appBackground:setAppBackgroundColor()
		appBackground:setAppBackgroundPattern()
	end
	
	appBackground:start()
	
	return appBackground
end

return AppBackground
-----------------------------------------------------------------------------------------
--
-- events-confirm-exit.lua
-- Events for confirm exit.
--
-----------------------------------------------------------------------------------------

local eventsConfirmExit = {}

-- Include files.
local globalVariable 	= require "scripts.common.global-variable"			-- Global variables.
local OverlayScreen 	= require "scripts.classes.screen.OverlayScreen"	-- Screen class.

-- To remove after to do:
local form 				= require "scripts.widgets.form" 			-- Form widgets.
local screen 			= require "scripts.common.screen" 			-- Screen functions.
local widget 			= require "widget" 							-- Widgets.

-- Draw the screen.
function drawScreen()
	
	local options = {
				screenTitle = "Exit app",
				screenText = "Are you sure you want to close this app?",
				-- To do:
				--[[buttons = {
					choiceButton = {
						label = "Exit",
						action = native.requestExit,
						y = globalVariable.screenCenterY + 25,
					},
					backButton = {
						label = "Back",
						action = OverlayScreen.closeOverlayScreen,
						screen = "scripts.screens.screen-home",
						y = globalVariable.screenCenterY + 100,
					}						
				}]]--
			}
	local overlayScreen1 = OverlayScreen.new( options )
	theOverlayScreen = overlayScreen1:getOverlayScreen()
	
	-- Show exit button on top right corner.
	local exitButton = form.displayButtonImage( "scripts.screens.screen-confirm-exit", "Exit", native.requestExit, "images/icons/ic_cancel_white_18dp.png" )
	exitButton.x = globalVariable.screenWidth - 50
	exitButton.y = 50
	theOverlayScreen:insert( exitButton )
	
	-- Show back button.
	local backButton = form.displayButton( "scripts.screens.screen-confirm-exit", "Back", screen.closeOverlayScreen )
	backButton.y = globalVariable.screenCenterY + 100
	theOverlayScreen:insert( backButton )
	
	return overlayScreen1
end

function eventsConfirmExit.new()
	local confirmExitScreen

	confirmExitScreen = drawScreen()

	return confirmExitScreen
end

return eventsConfirmExit
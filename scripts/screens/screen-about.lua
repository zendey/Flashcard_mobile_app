-----------------------------------------------------------------------------------------
--
-- screen-settings.lua
-- Shows the app title screen and main menu.
--
-----------------------------------------------------------------------------------------

-- Include files.
local composer 			= require "composer"
local form				= require "scripts.widgets.form"
local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.
local screen			= require "scripts.common.screen"
local widget			= require "widget"
local scene 			= composer.newScene()

local appInfo 			= require( globalVariable.appScriptDirectory .. "app-info" )	-- App-specific information.

-- Local variables.
local screenElements

function scene:create( event )

	-- Completely removes all scenes except for the currently active scene
	-- composer.removeHidden()

	local sceneGroup = self.view
	settingsMenu( sceneGroup )
end

function settingsMenu( sceneGroup )
	screenElements = display.newGroup()
	local dimScreen = screen.dimScreen()
	local screenOverlay = screen.displayOverlay()
	local screenTitle = screen.displayScreenTitle( "About Flashcards" )
	local options = 
	{
		text = "Flashcards are powered by the Zendey Flashcards Mobile Framework.  \n\nVersion " .. system.getInfo( "appVersionString" ) .. ".",
		x = globalVariable.screenCenterX,
		y = globalVariable.screenCenterY - 70,
		width = 625,     --required for multi-line and alignment
		font = globalVariable.appFontFace,
		fontSize = 30
	}
	local screenText = display.newText( options )

	local AppWebsite = require "scripts.classes.app.AppWebsite"
	local appWebsite1 = AppWebsite.new()
	
	local choiceButton = form.displayButton( appInfo.getAppInfo().appURL, "Learn More", appWebsiteURL )
	choiceButton.y = globalVariable.screenCenterY + 225
	
	local backButton = form.displayButton( "scripts.screens.screen-menu", "Back", screen.openOverlayScreen )
	backButton.y = globalVariable.screenCenterY + 300
	
	-- Add elements to scene so we can remove them from the screen once the program starts.
	screenElements:insert( dimScreen )
	screenElements:insert( screenOverlay )
	screenElements:insert( screenTitle )
	screenElements:insert( screenText )
	screenElements:insert( backButton )
	screenElements:insert( choiceButton )
	sceneGroup:insert( screenElements )
end

function scene:show( event )	
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Called when the scene is still off screen (but is about to come on screen).
	elseif ( phase == "did" ) then
		-- Called when the scene is now on screen.
		-- Insert code here to make the scene come alive.
		-- Example: start timers, begin animation, play audio, etc.
	end
end

function scene:hide( event )
	local sceneGroup = self.view

	local phase = event.phase

	if ( phase == "will" ) then
		-- Called when the scene is on screen (but is about to go off screen).
		-- Insert code here to "pause" the scene.
		-- Example: stop timers, stop animation, stop audio, etc.
	elseif ( phase == "did" ) then
		-- Called immediately after scene goes off screen.
		composer.removeScene( self, true )
		--composer.removeScene( "scripts.screens.screen-upgrade-to-full", true )
		Runtime:removeEventListener( "orientation", changeOrientation )
	end 	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's view ("sceneGroup").
	-- Insert code here to clean up the scene.
	-- Example: remove display objects, save state, etc.
end

-- Redraws whenever the device orientation changes.
local function changeOrientation( event )
	local sceneGroup = scene.view	
	if ( screenElements ~= nil ) then
		sceneGroup:remove( screenElements )
	end
	settingsMenu( sceneGroup )
end

-- Event listeners.
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
Runtime:addEventListener( "orientation", changeOrientation )

return scene
-----------------------------------------------------------------------------------------
--
-- screen-settings.lua
-- Shows the user settings.
--
-----------------------------------------------------------------------------------------

-- Include files.
local composer 			= require "composer"
local form 				= require "scripts.widgets.form"
local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.
local screen			= require "scripts.common.screen"

local scene 			= composer.newScene()

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
	local screenTitle = screen.displayScreenTitle( "Settings" )
	local cardModeArray = { "Text then image", "Image then text", "Text only", "Image only", "Image + Text" }
	local radioGroup = form.displayRadioButtons( cardModeArray )
	local backButton = form.displayButton( "scripts.screens.screen-settings", "OK", screen.closeOverlayScreen )
	backButton.y = globalVariable.screenCenterY + 300
	
	-- Add elements to scene so we can remove them from the screen once the program starts.
	screenElements:insert( dimScreen )
	screenElements:insert( screenOverlay )
	screenElements:insert( screenTitle )
	screenElements:insert( radioGroup )
	screenElements:insert( backButton )
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
		--composer.removeScene( "scripts.screens.screen-settings", true )
		composer.removeScene( self, true )
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
-----------------------------------------------------------------------------------------
--
-- screen-menu.lua
-- Shows the user settings.
--
-----------------------------------------------------------------------------------------

-- Include files.
local composer 			= require "composer"
local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.
local form 				= require "scripts.widgets.form"
local screen			= require "scripts.common.screen"
local scene 			= composer.newScene()

-- Local variables.
local screenElements

function scene:create( event )

	-- Completely removes all scenes except for the currently active scene
	-- composer.removeHidden()

	local sceneGroup = self.view
	screenElements = display.newGroup()
end

function settingsMenu( sceneGroup )
	local sceneGroup = scene.view

	local dimScreen = screen.dimScreen()
	screenElements:insert( dimScreen )

	local screenOverlay = screen.displayOverlay()
	screenElements:insert( screenOverlay )	
	
	local screenTitle = screen.displayScreenTitle( "Menu" )

	if ( true == globalVariable.toggleFeatureSettingsButton ) then
	--if ( globalVariable.appID ~= 3 ) and ( globalVariable.appID ~= 4 ) then
		local settingsButton = form.displayButton( "scripts.screens.screen-card-mode", "Settings", screen.openOverlayScreen )
		settingsButton.y = globalVariable.screenCenterY - 150
		screenElements:insert( settingsButton )
	end

	if ( true == globalVariable.toggleFeatureCreditsButton ) then
	--else
		local creditsButton = form.displayButton( "scripts.screens.screen-credits", "Credits", screen.openOverlayScreen )
		creditsButton.y = globalVariable.screenCenterY - 150
		screenElements:insert( creditsButton )
	end
	
	local helpButton = form.displayButton( "scripts.screens.screen-help", "Help", screen.openOverlayScreen )
	helpButton.y = globalVariable.screenCenterY - 75
	
	local aboutButton = form.displayButton( "scripts.screens.screen-about", "About", screen.openOverlayScreen )
	aboutButton.y = globalVariable.screenCenterY 

	local reviewButton = form.displayButton( "scripts.screens.screen-review", "Review", screen.openOverlayScreen )
	reviewButton.y = globalVariable.screenCenterY + 75
	
	--local creditsButton = form.displayButton( "scripts.screens.screen-credits", "Credits", screen.openOverlayScreen )
	--creditsButton.y = globalVariable.screenCenterY - 150
	
	local backButton = form.displayButton( "scripts.screens.screen-settings", "Back", screen.closeOverlayScreen )
	backButton.y = globalVariable.screenCenterY + 300
	
	-- Add elements to scene so we can remove them from the screen once the program starts.
	screenElements:insert( screenTitle )
	screenElements:insert( reviewButton )
	--screenElements:insert( creditsButton )	

	
	if ( globalVariable.version == "lite" ) then
		local upgradeButton = form.displayButton( "scripts.screens.screen-upgrade-to-full", "Upgrade", screen.openOverlayScreen )
		upgradeButton.y = globalVariable.screenCenterY + 150
		screenElements:insert( upgradeButton )
	end	

	
	screenElements:insert( aboutButton )
	screenElements:insert( helpButton )
	screenElements:insert( backButton )
	--sceneGroup:insert( screenElements )
	return screenElements
end

function scene:show( event )	
	local sceneGroup = self.view
	local phase = event.phase
	
	screenElements = settingsMenu( sceneGroup )
	sceneGroup:insert( screenElements )

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

		if ( screenElements ~= nil ) then
			sceneGroup:remove( screenElements )
		end
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
	
	-- Remove previous screen elements.
	if ( screenElements ~= nil ) then
		sceneGroup:remove( screenElements )
	end
	
	-- Redraw the menu again.
	screenElements = settingsMenu( sceneGroup )
	
	-- Insert screenElements into scene group so we can remove it later.
	sceneGroup:insert( screenElements )
end

-- Event listeners.
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
--Runtime:addEventListener( "orientation", changeOrientation )

return scene
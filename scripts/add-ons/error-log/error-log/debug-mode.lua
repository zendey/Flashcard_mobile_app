-----------------------------------------------------------------------------------------
--
-- debug-mode.lua
-- Debug mode for developer only. Shows the error message.
--
-----------------------------------------------------------------------------------------

-- Include files.
local composer 			= require "composer"
local form 				= require "scripts.widgets.form"
local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.
local screen 			= require "scripts.common.screen"			-- Screen functions.
local scene 			= composer.newScene()

-- Local variables.
local screenElements

function scene:create( event )
	local sceneGroup = self.view
	settingsMenu( sceneGroup )
end

function settingsMenu( sceneGroup )
	screenElements = display.newGroup()
	local screenTitle = screen.displayScreenTitle( "Debug Mode" )
	
	local path = system.pathForFile( "error-log.txt", system.DocumentsDirectory )
	local contents = ""
	local file = io.open( path, "r" )
	if ( file ) then
		-- read all contents of file into a string
		local contents = file:read( "*a" )
		io.close( file )
		errorText = display.newText( contents, globalVariable.screenCenterX, globalVariable.screenCenterY, globalVariable.screenWidth, globalVariable.screenHeight, native.systemFont, 30  )
		errorText:setFillColor( 0.1, 0.1, 0.1 )
	else
		print( "Error: could not read scores from error-log.txt." )
	end
	
	-- Show debug mode buttons
	local emailErrorButton 		= form.displayButton( "scripts.add-ons.error-log.error-log.debug-email-error-log", "Email Error Log", screen.goToScreen )
	emailErrorButton.y 			= globalVariable.screenCenterY + 100
	screenElements:insert( emailErrorButton )
	
	local resetErrorLogButton 		= form.displayButton( "scripts.add-ons.error-log.error-log.debug-reset-error-log", "Reset Error Log", screen.goToScreen )
	resetErrorLogButton.y 			= globalVariable.screenCenterY + 200
	screenElements:insert( resetErrorLogButton )
	
	screenElements:insert( screenTitle )

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
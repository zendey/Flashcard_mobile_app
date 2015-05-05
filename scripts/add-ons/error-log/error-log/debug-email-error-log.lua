-----------------------------------------------------------------------------------------
--
-- debug-email-error-log.lua
-- Debug mode for developer only. Email the error log to developer.
--
-----------------------------------------------------------------------------------------

-- Include files.
local composer 			= require "composer"
local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.
local scene 			= composer.newScene()

function settingsMenu( sceneGroup )
	--screenElements = display.newGroup()

--[[	local path = system.pathForFile( "error-log.txt", system.DocumentsDirectory )
	--local contents = ""
	local file = io.open( path, "r" )

	if ( file ) then
      -- read all contents of file into a string
      local contents = file:read( "*a" )
      io.close( file )
	else
      print( "Error: could not read from error-log.txt." )
   end
]]--

	--return screenElements
end

function scene:create( event )
	local sceneGroup = self.view
	--settingsMenu( sceneGroup )
	--screenElements = settingsMenu( sceneGroup )
	--sceneGroup:insert( screenElements )
	
	
	
end

function scene:show( event )	
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Called when the scene is still off screen (but is about to come on screen).
		--screenElements = settingsMenu( sceneGroup )
		--sceneGroup:insert( screenElements )
	
		local openingMailText = display.newText( "Opening mail application...", 450, 250, "Arial", 50 )
		openingMailText:setFillColor(.5, .5, .5)
		
		local constant = require "scripts.constant"
		
		local options =
			{
				to = constant[ "email" ],
				subject = "Report Bug",
				body = "There was an error in the app.",
				attachment = { baseDir=system.DocumentsDirectory, filename="error-log.txt", type="txt" },
			}
		
		constant = nil
		
		native.showPopup( "mail", options )
	
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
	end 	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's view ("sceneGroup").
	-- Insert code here to clean up the scene.
	-- Example: remove display objects, save state, etc.
end

-- Event listeners.
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
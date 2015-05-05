-----------------------------------------------------------------------------------------
--
-- screen-exit.lua
-- Confirms exit before exiting application.
--
-----------------------------------------------------------------------------------------

-- Include files.
local composer 			= require "composer"
local eventsConfirmExit = require "scripts.screens.events-confirm-exit" 	-- Event listeners for home screen.
local globalVariable 	= require "scripts.common.global-variable"			-- Global variables.	
--local orientation 		= require "scripts.common.change-orientation"	

local scene 			= composer.newScene()

-- Local variables.
local mainContainer
local mainGroup

-- Redraws the screen whenever the device orientation changes.
local function changeOrientation( event )

	local sceneGroup = scene.view
	mainGroup = changeScreenOrientation( mainContainer, mainGroup )
	mainContainer:insert( mainGroup )

end

function scene:create( event )

	local sceneGroup = self.view
	
	mainContainer = display.newGroup()
	sceneGroup:insert( mainContainer )

end

function scene:show( event )	
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Called when the scene is still off screen (but is about to come on screen).
		
		mainGroup = eventsConfirmExit.new()
		
		-- Insert app design elements into scene group so we can remove it later.
		--mainContainer:insert( mainGroup )
		
		-- Add an event listener for changing device orientation.
		Runtime:addEventListener( "orientation", changeOrientation ) 
		
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

	end 	
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's view ("sceneGroup").
	-- Insert code here to clean up the scene.
	-- Example: remove display objects, save state, etc.
	
	-- Remove the elements on the screen from the scene group.
	mainContainer:remove( mainGroup )
	sceneGroup:remove( mainContainer )
		
	-- Remove the scene.
	composer.removeScene( self, true )
		
	-- Remove the event listener.
	Runtime:removeEventListener( "orientation", changeOrientation )	
		
	-- To do: set the display objects to nil.
	mainGroup = nil
	mainContainer = nil
end

-- Event listeners.
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
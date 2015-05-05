-----------------------------------------------------------------------------------------
--
-- screen-categories.lua
-- Shows the different card categories.
--
-----------------------------------------------------------------------------------------

-- Include files.
local composer 				= require "composer"
local globalVariable 		= require "scripts.common.global-variable"		-- Global variables.
--local Orientation 			= require "scripts.classes.Orientation"		-- Orientation class.
local scene 				= composer.newScene()

-- Local variables.
local mainGroup
local sceneGroup

local function hideScene()
	sceneGroup:remove( mainGroup )
--	mainGroup:removeSelf()
	mainGroup = nil
end

local function destroyScene()
	
	-- Remove the scene.
	composer.removeScene( self )

	sceneGroup:removeSelf()
	sceneGroup = nil
	
	-- Remove the event listener.
	Runtime:removeEventListener( "orientation", changeOrientation )

end

-- Redraws the screen whenever the device orientation changes.
local function changeOrientation( event )
--	mainGroup = changePlaylistScreenOrientation( mainGroup )
end

-----------------------------------------------------
-- Scene listeners.
-----------------------------------------------------

function scene:create( event )

	sceneGroup = self.view
	--local orientation1 = Orientation:new()
end

function scene:show( event )	
	sceneGroup = self.view
	local phase = event.phase	

	if ( phase == "will" ) then
		-- Called when the scene is still off screen (but is about to come on screen).
		
		--display.setDefault( "background", 1, 1, 1 )
		
		
		local PlaylistScreen = require "scripts.classes.screen.PlaylistScreen"
		local playlistScreen1 = PlaylistScreen.new()
		mainGroup = playlistScreen1:drawScreen()
		
		-- Garbage disposal.
		PlaylistScreen = nil
		playlistScreen1 = nil		
		
		--mainGroup = drawPlaylistScreen()
		sceneGroup:insert( mainGroup )
		
		--Runtime:addEventListener( "orientation", changeOrientation )
		
	elseif ( phase == "did" ) then
		-- Called when the scene is now on screen.
		-- Insert code here to make the scene come alive.
		-- Example: start timers, begin animation, play audio, etc.
		
	end
end

function scene:hide( event )
	sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Called when the scene is on screen (but is about to go off screen).
		-- Insert code here to "pause" the scene.
		-- Example: stop timers, stop animation, stop audio, etc.
		
	elseif ( phase == "did" ) then
		-- Called immediately after scene goes off screen.
		--Runtime:removeEventListener( "orientation", changeOrientation )
		hideScene()
	end 	
end

function scene:destroy( event )
	sceneGroup = self.view
	
	-- Called prior to the removal of scene's view ("sceneGroup").
	-- Insert code here to clean up the scene.
	-- Example: remove display objects, save state, etc.
	
	destroyScene()
end

-- Event listeners.
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
--Runtime:addEventListener( "orientation", changeOrientation )

return scene
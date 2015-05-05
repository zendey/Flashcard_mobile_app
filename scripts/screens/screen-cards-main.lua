-----------------------------------------------------------------------------------------
--
-- screen-cards-main.lua
-- The main card app.
--
-----------------------------------------------------------------------------------------

-- Include files.
local composer = require "composer" 
local scene = composer.newScene()

-- Local variables.
local sceneGroup
local mainGroup
local cardScreen1
local cardMusic1

local function hideScene()
	-- Remove card.  TODO:
	sceneGroup:remove( mainGroup )
	
	cardScreen1:destroy()					-- TODO: causes crashing. pcall attempt to call a table value
	
	mainGroup:removeSelf() 
	mainGroup = nil
end

-- Remove scene.
local function destroyScene()

	cardScreen1:removeSelf()
	cardMusic1:removeSelf()

	-- Garbage disposal.
	mainGroup = nil
	cardScreen1 = nil
	cardMusic1 = nil
	
	-- Remove the scene.
	composer.removeScene( self ) 

	sceneGroup:removeSelf()

	-- Garbage disposal.
	composer = nil
	scene = nil
	sceneGroup = nil 	
end

-----------------------------------------------------
-- Scene listeners.
-----------------------------------------------------

function scene:create( event )
	sceneGroup = self.view
end

function scene:show( event )	
	sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
	
		local CardScreen = require "scripts.classes.screen.CardScreen"
		cardScreen1 = CardScreen.new()
		CardScreen = nil
	
		-- Called when the scene is still off screen (but is about to come on screen).	
		mainGroup = cardScreen1:drawCardScreen()	
	
		-- Add elements to scene so we can remove them from the screen once the program starts.
		sceneGroup:insert( mainGroup )	
			
	elseif ( phase == "did" ) then
		-- Called when the scene is now on screen.
		-- Insert code here to make the scene come alive.
		-- Example: start timers, begin animation, play audio, etc.	
		
		local CardMusic = require "scripts.classes.card.CardMusic"	-- Card music.
		cardMusic1 = CardMusic.new()
		CardMusic = nil
		
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
		--sceneGroup:remove( mainGroup )
		hideScene()

	end 	
end

-- "scene:destroy()"
function scene:destroy( event )

    sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
	
	destroyScene()
end

------------------------------------------------------------------------------------
--
-- EVENT LISTENERS
--
------------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
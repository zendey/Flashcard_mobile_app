-----------------------------------------------------------------------------------------
--
-- screen-home.lua
-- Home screen shows the app title and main menu.
--
-----------------------------------------------------------------------------------------

-- Include files.
local composer 			= require "composer" 							-- Composer.
local globalVariable 	= require "scripts.common.global-variable"		-- Global variables.
local JsonFile			= require "scripts.classes.file.JsonFile"		-- Json file class.
--local Orientation 		= require "scripts.classes.Orientation"		-- Orientation class.
local scene 			= composer.newScene()

-- Local variables.
local mainGroup
local sceneGroup

-- Redraws the screen whenever the device orientation changes.
local function changeOrientation( event )
	mainGroup = changeScreenOrientation( mainGroup )
end

local function hideScene()

	sceneGroup:remove( mainGroup )
	--mainGroup:removeSelf()  -- -- Creates "attempt to call a table value" error and crashes.  due to get and put method.
	mainGroup = nil

end

local function destroyScene()	
	-- Remove the scene.
	composer.removeScene( self ) 

	sceneGroup:removeSelf()

	-- Garbage disposal.
	composer = nil
	scene = nil
	sceneGroup = nil 
	
	-- Remove the event listener.
	--Runtime:removeEventListener( "orientation", changeOrientation )

end

-----------------------------------------------------
-- Scene listeners.
-----------------------------------------------------

function scene:create( event )
	
	sceneGroup = self.view
	
	--local orientation1 = Orientation:new()
	
	-- Load user preferences from Json file.
	if ( true == globalVariable.toggleFeatureJsonFile ) then	-- Toggle feature while in development.
		jsonFile1 = JsonFile.loadSettings()
		--JsonFile.saveSettings()
	end	
end

function scene:show( event )	
	sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Called when the scene is still off screen (but is about to come on screen).
		
		local HomeScreen = require "scripts.classes.screen.HomeScreen"
		local homeScreen1 = HomeScreen.new()
		mainGroup = homeScreen1:drawScreen()
		
		-- Garbage disposal.
		HomeScreen = nil
		homeScreen1 = nil
		
		-- Insert app design elements into scene group so we can remove it later.
		sceneGroup:insert( mainGroup )
		
	elseif ( phase == "did" ) then
		-- Called when the scene is now on screen.
		-- Insert code here to make the scene come alive.
		-- Example: start timers, begin animation, play audio, etc.
		
		-- Print texture memory used.
		if ( true == globalVariable.toggleFeatureDebugMode ) then
			if ( system.getInfo( "environment" ) == "simulator" ) then
				print( "Texture memory used: " .. system.getInfo( "textureMemoryUsed" ) )
			end
		end
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
		hideScene()
	end 	
end

function scene:destroy( event )
	sceneGroup = self.view
	
	-- Called prior to the removal of scene's view ("sceneGroup").
	-- Insert code here to clean up the scene.
	-- Example: remove display objects, save state, etc.
	
		-- To do:  Save preferences to Json file.
		if ( true == globalVariable.toggleFeatureJsonFile ) then	-- Toggle feature while in development.
			local scoreText = preferences.init(
			{
			   fontSize = 20,
			   font = globalVariable.appFontFace,
			   x = globalVariable.screenCenterX,
			   y = 20,
			   maxDigits = 7,
			   leadingZeros = true,
			})
			
			-- local highscore = preferences.loadPreferences()
			preferences.savePreferences()
		end	

		destroyScene()	

end

-- Event listeners.
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
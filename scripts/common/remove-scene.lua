-----------------------------------------------------------------------------------------
--
-- remove-scene.lua
-- Remove scene.
-- Garbage disposal when removing scenes.
--
-----------------------------------------------------------------------------------------

local removeScene = {}

function removeScene.removeThisScene( composer )

	-- Remove the scene.
	composer.removeScene( self ) 
	
	sceneGroup:removeSelf()

	-- Garbage disposal.
	composer = nil
	scene = nil
	sceneGroup = nil
	

print(composer)	

end	

return removeScene
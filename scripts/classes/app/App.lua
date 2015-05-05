-----------------------------------------------------------------------------------------
--
-- App.lua
-- Application class.
-- Sets application-specific settings.
--		- application ID.
--		- whether the app is lite version or full version.
--		- gets the app directory where all the app's assets (images, sounds, cards) and saves it to global variable.
-----------------------------------------------------------------------------------------

local App = {}

-- Creates a new application and sets the settings. 
function App.new( thisAppID, thisVersion )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local app = Super.new()
	Super = nil
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------

	-- Initialize the app.
	function app:start( thisAppID, thisVersion )
		app:make( "scripts.classes.app.AppID", thisAppID )
		app:make( "scripts.classes.app.AppVersion", thisVersion )	
		app:make( "scripts.classes.app.AppDirectory", thisAppID )	

		-- Garbage disposal.
		app:unmake()
		thisAppID = nil
		thisVersion = nil
	end
	
	app:start( thisAppID, thisVersion )

	-- Garbage disposal.
	thisAppID = nil
	thisVersion = nil
	
	return app
end

return App
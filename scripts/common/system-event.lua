-----------------------------------------------------------------------------------------
--
-- system-event.lua
-- System event
-----------------------------------------------------------------------------------------

local systemEvent = {}

-- Listen for system events.
local function onSystemEvent( event )

	local MainApplication = require "scripts.classes.system-event.MainApplication" -- Application Start class
	local mainApplication1 = MainApplication.new()	-- Starts the application.
	MainApplication = nil
	
	-- On application start.
	if ( event.type == "applicationStart" ) then
	-- This block is executed when application launches (after main.lua).
		print( "Application started." )
		
	-- On application exit.
	elseif ( event.type == "applicationExit" ) then
	-- This block is executed just prior to the app quitting
	-- OS closes least recently used app, user explicitly quits, etc.
      --save_state()
		print( "Application ended." )
		
		mainApplication1:destroy()
		mainApplication1 = nil

	-- On open URL.
	elseif ( event.type == "applicationOpen" ) then
	-- Occurs when the application is asked to open a URL resource (Android and iOS only).
		--load_saved_state()
		print( "Application opened a URL." )
	
	-- On application suspend.
	elseif ( event.type == "applicationSuspend" ) then
	-- this block executed when app goes into “suspend” state
	-- e.g. user receives phone call, presses home button, etc.
		--pause_game()
		print( "Application suspended." )

	elseif ( event.type == "applicationResume" ) then
	-- This block is executed when app resumes from “suspend” state
	-- e.g. user goes back into app (while it is still running in bg).
		print( "Application resumed." )

	end

end 

-- Add system listener.
Runtime:addEventListener( "system", onSystemEvent )

return systemEvent
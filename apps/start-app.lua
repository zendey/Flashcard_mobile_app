-----------------------------------------------------------------------------------------
--
-- start-app.lua
-- Start app.
-- This file is used to switch between apps.
--
-----------------------------------------------------------------------------------------

local startApp = {}

-- Include files.
local App = require "scripts.classes.app.App"	-- Application-specific settings.	-- to replace
local app1

-- Create new application.  Parameters: App ID, Lite version
-- Uncomment the line to toggle between applications.  
app1 = App.new( 1, "full" )	-- My App
--app1 = App.new( 1, "lite" )	-- My App Lite
--app1 = App.new( 2, "full" )	-- Sample App
--app1 = App.new( 2, "lite" )	-- Sample App Lite

-- ******** Don't forget to **********************
	-- Change exclude directory in build.settings.
	-- Change icons.
	-- Turn off debug and assert mode.

-- Garbage disposal.
app1:destroy()
app1 = nil
App = nil
	
return startApp
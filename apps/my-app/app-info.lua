-----------------------------------------------------------------------------------------
--
-- app-info.lua
-- Application-specific information.
-- My App
--
-----------------------------------------------------------------------------------------

local appInfo = {}

local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.
local preferences 		= require "scripts.preferences"		-- User preferences.

-- App Info
function appInfo.getAppInfo()
	local thisAppInfo

		thisAppInfo = 
		{
			appTitle = "Flashcards",
			upgradePackageName = "com.gmail.yourcompanyname.yourappname",  -- Replace this with your upgrade package name.
			helpURL = "http://",  											-- Add your help URL here.
			appURL = "http://",    											-- Add your website here.
			deckDirectory = globalVariable.appDirectory .. "cards/",		
			defaultDeckFilePath = "first-words-en.txt",					
		}
	
		if ( globalVariable.version == "lite" ) then
			thisAppInfo.deckCollection = { "first-words", "colors", "shapes", "transportation", "food-and-drinks", "nature" }
		else
			thisAppInfo.deckCollection = { "first-words", "colors", "shapes", "transportation", "food-and-drinks", "nature" }
		end

	return thisAppInfo
end

return appInfo
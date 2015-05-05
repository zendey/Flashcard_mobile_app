-----------------------------------------------------------------------------------------
--
-- language.lua
-- 
-- Get the system or user-specified language.
--
-----------------------------------------------------------------------------------------
 
-- To do:  need to change to this: http://www.develephant.net/simple-localization-for-corona-apps-and-games/
 
local language = {}

local translations 	= require "scripts.i18n.translations"	-- Load translations module locally

--[[
-- Set the language from the operating system if possible.
local lang
if system.getInfo( "platformName" ) ~= "Android" then
   lang = system.getPreference( "ui", "language" ):lower()
else
   lang = system.getPreference( "locale", "language" ):lower()
end

if lang == "es" or lang == "fr" or lang == "de" or lang == "en" then
   settings["language"] = lang
end
lang = system.getPreference( "locale", "language" ):lower()
print(lang)]]--
 
-- Get the user's defined language (if any) or the device's default language
local systemLanguage = userDefinedLanguage or system.getPreference( "ui", "language" )
if ( systemLanguage == "1033" ) then
	systemLanguage = "en"
end

-- Other localization-related system properties:
-- system.getPreference("locale", "country")
-- system.getPreference("locale", "identifier")
-- system.getPreference("locale", "language")
 
-- Create our text object
local myText = display.newText( translations[ "Hello world" ][ systemLanguage ], 0, 0, native.systemFont, 16 )

return language
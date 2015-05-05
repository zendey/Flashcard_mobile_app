-----------------------------------------------------------------------------------------
--
-- preferences.lua
-- User preferences.
-----------------------------------------------------------------------------------------

local preferences = {}

-- Include files.
local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.

-- Default user preferences.
local userPreferences = 
{
	cardMode 				= "Text then image",
--	cardFontSize 			= 12,
--	cardFontFace 			= globalVariable.cardFontFace,
--	cardPattern 			= "sequential",
	sound					= "off"
}

preferences.score = 0

function preferences.init( options )
   local customOptions = options or {}
   local opt = {}
   opt.fontSize = customOptions.fontSize or 24
   opt.font = customOptions.font or globalVariable.appFontFace
   opt.x = customOptions.x or globalVariable.screenCenterX
   opt.y = customOptions.y or opt.fontSize * 0.5
   opt.maxDigits = customOptions.maxDigits or 6
   opt.leadingZeros = customOptions.leadingZeros or false
   preferences.filename = customOptions.filename or "userPreferences.txt"
   local prefix = ""
   if ( opt.leadingZeros ) then 
      prefix = "0"
   end
   preferences.format = "%" .. prefix .. opt.maxDigits .. "d"
   preferences.scoreText = display.newText( string.format( preferences.format, 0 ), opt.x, opt.y, opt.font, opt.fontSize )
   return preferences.scoreText
end

function preferences.savePreferences()
   local path = system.pathForFile( preferences.filename, system.DocumentsDirectory )
   local file = io.open( path, "w" )
   if ( file ) then
      local contents = tostring( userPreferences.cardPattern )
	  --local contents = tostring( userPreferences )
      file:write( contents )
      io.close( file )
      return true
   else
      print( "Error: could not read ", preferences.filename, "." )
      return false
   end
end

function preferences.loadPreferences()
	local FileHandler = require "scripts.classes.file.FileHandler"		-- File Handler class.
	local preferenceFile = FileHandler.new( preferences.userPreferencesFile, "r", system.DocumentsDirectory )
	local score = tonumber( preferenceFile )
	return score
end

-- Set the default card mode.
function preferences.setCardMode( thisCardMode )
	userPreferences.cardMode = thisCardMode
end

-- Get the default card mode.
function preferences.getCardMode()
	return userPreferences.cardMode
end

--[[ Set the default card pattern.
function preferences.setCardPattern( thisCardPattern )
	userPreferences.cardPattern = thisCardPattern
end

-- Get default card pattern.
function preferences.getCardPattern()
	return userPreferences.cardPattern
end]]--

-- Set the sound.
function preferences.setSound( thisSound )
	userPreferences.sound = thisSound
end

-- Get default card pattern.
function preferences.getSound()
	return userPreferences.sound
end

return preferences
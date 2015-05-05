-----------------------------------------------------------------------------------------
--
-- app-details.lua
-- Application-specific settings.
--
-----------------------------------------------------------------------------------------

local appDetails = {}

-- Include files.
local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.
local appInfo 			= require( globalVariable.appScriptDirectory .. "app-info" )	-- App-specific information.

-- Email support.
function appDetails.emailSupport()
	local constant = require "scripts.constant"

	local options =
	{
		to = constant[ "email" ],
		subject = "Contact support for " .. appInfo.getAppInfo().appTitle,
		body = "",
		--attachment = { baseDir=system.DocumentsDirectory, filename="Screenshot.png", type="image/png" },
	}
	
	constant = nil
	
	native.showPopup( "mail", options )
end

return appDetails
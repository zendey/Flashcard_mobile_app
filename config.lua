-----------------------------------------------------------------------------------------
--
-- config.lua
-- Configuration file.
-- 
-----------------------------------------------------------------------------------------

--native.setActivityIndicator( true )

-- Create new instance of error log class.
local ErrorLog = require "scripts.add-ons.error-log.error-log.ErrorLog"	-- Error log class.
errorLog1 = ErrorLog.new()
ErrorLog = nil

local theLicenseKey

local function startApp()
	-- Start the app.
	local startApp = require "apps.start-app" -- Start app. This is the only place this file should be included.
	startApp = nil
end

local function getAppLicenseKey()
	-- Get the license key.
	local LicenseKey = require "scripts.classes.LicenseKey"
	local licenseKey1 = LicenseKey.new()
	theLicenseKey = licenseKey1:get()
	
	-- Garbage disposal.
	licenseKey1:destroy()
	licenseKey1 = nil
	LicenseKey = nil
	
	if ( system.getInfo( "environment" ) == "simulator" ) then
		--assert( theLicenseKey ~= nil, "No license key in googleLicenseKey file." )
	end	
	
	return theLicenseKey
end

startApp()

-- Calculate the aspect ratio of the device.
local aspectRatio = display.pixelHeight / display.pixelWidth

application = 
{
   content = 
	{
		-- Scales the image depending on the device screen.
		width = aspectRatio > 1.5 and 800 or math.ceil( 1200 / aspectRatio ),
		height = aspectRatio < 1.5 and 1200 or math.ceil( 800 * aspectRatio ),
		scale = "zoomEven",
		fps = 30,
		imageSuffix = { ["@2x"] = 1.3 },
	},
	license = 
	{
		google = 
		{
			-- Get the app's Google license key.
			key = getAppLicenseKey()
		}, 
	}
    --[[
    -- Push notifications
    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    --]]    
}

-- Garbage disposal.
theLicenseKey = nil
aspectRatio = nil

--native.setActivityIndicator( false )
-----------------------------------------------------------------------------------------
--
-- LicenseKey.lua
-- License key class.
--
-----------------------------------------------------------------------------------------

local LicenseKey = {}

function LicenseKey.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super"	-- Super class.
	local licenseKey = Super.new()
	Super = nil
	
	-- Local variables.
	local myLicensePath

	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function licenseKey:buildLicensePath()
		local globalVariable = require "scripts.common.global-variable"	-- Global variables.
	
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( globalVariable.appDirectory ~= nil, "App directory not set for license key." )
			assert( globalVariable.appDirectory ~= "", "App directory license key is blank." )
		end 
		myLicensePath = globalVariable.appDirectory .. "googleLicenseKey"
		
		if ( globalVariable.version == "lite" ) then
			myLicensePath = myLicensePath .. "Lite"
		end
		myLicensePath = myLicensePath .. ".txt"

		-- Garbage disposal.
		globalVariable = nil
		
		return myLicensePath
	end
	
	-- Get license key from file.
	function licenseKey:readLicenseKeyFromFile( myLicensePath )
	
		local options = { filePath = myLicensePath, 
				fileMode = "r",
				systemDirectory = system.ResourceDirectory
			}
		local myLicenseKey = licenseKey:make( "scripts.classes.file.FileHandler", options )			
		licenseKey:set( myLicenseKey )
		
		-- Garbage disposal.
		licenseKey:unmake()
		myLicensePath = nil	
		myLicenseKey = nil
		options = nil
	end
	
	--------------------------------------------------------------
	-- Initialize.
	--------------------------------------------------------------	
	
	function licenseKey:start()
		myLicensePath = licenseKey:buildLicensePath()
		licenseKey:readLicenseKeyFromFile( myLicensePath )
	end

	licenseKey:start()

	return licenseKey
end

return LicenseKey
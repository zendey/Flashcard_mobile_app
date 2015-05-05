-----------------------------------------------------------------------------------------
-- 
-- Honey's Error Log
-- Simple error logging
-- for mobile applications written in Corona SDK and Lua.
-- version 0.0.1
--
-- by Honey Silvas
-- info@zendey.com
-- http://zendey.com
--
-- ErrorLog.lua
-- Error log class
--
-----------------------------------------------------------------------------------------

local ErrorLog = {}

-- Creates a new instance of the error log class.
function ErrorLog.new()
	
	-- Declare the local variables.
	local errorLog = {}
	local errorLogFileName = "error-log.txt"	-- File name of error log file.
	
	-- Get the environment info when the error occurred.
	local function getErrorEnvironmentInfo()

		local errorEnvironmentInfo
		
		-- Get system environment information.
		errorEnvironmentInfo = 	"\n==============================================" ..
			"\n\nDate: " .. os.date( "%c" ) .. 
			"\nEnvironment: " .. system.getInfo( "environment" ) ..
			"\nArchitecture Info: " .. system.getInfo( "architectureInfo" ) ..
			"\nApp name: " .. system.getInfo( "appName" ) .. " version: " .. system.getInfo( "appVersionString" ) ..
			
			"\nTarget App Store: " .. system.getInfo( "targetAppStore" ) .. 
			"\nTexture Memory Used: " .. system.getInfo( "textureMemoryUsed" )  .. " of " .. system.getInfo( "maxTextureSize" ) .. 
			
			"\nModel: " .. system.getInfo( "model" ) .. 
			"\nDevice Name: " .. system.getInfo( "name" ) .. 
			"\nDevice ID: " .. system.getInfo( "deviceID" )  .. 
			"\nCorona Build: " .. system.getInfo( "build" )  .. 
			"\nPlatform: " .. system.getInfo( "platformName" ) .. " version: " .. system.getInfo( "platformVersion" ) .. "\n"

		-- Android-specific environment information.
		if ( system.getInfo( "platformName" ) == "Android" ) then
			errorEnvironmentInfo = errorEnvironmentInfo .. 
				
				"\nApp Package Name: " .. system.getInfo( "androidAppPackageName" ) .. " version " .. system.getInfo( "androidAppVersionCode" ) ..
				"\nApproximate DPI: " .. system.getInfo( "androidDisplayApproximateDpi" ) ..
				"\nDisplay Density Name: " .. system.getInfo( "androidDisplayDensityName" ) ..
				"\nDisplay Size: " .. system.getInfo( "androidDisplayWidthInInches" ) .. " x " .. system.getInfo( "androidDisplayHeightInInches" ) .. " inches " ..
				"\nDisplay: " .. system.getInfo( "androidDisplayXDpi" ) .. " x " .. system.getInfo( "androidDisplayYDpi" ) .. " dpi\n"
		end
								
		return errorEnvironmentInfo
	end

	-- Event listener for unhandled errors.
	local function unhandledErrorListener( event )
		
		-- Declare local variables.
		local errorHandler
		local thisErrorMessage
		
		-- Show the error at runtime if in the Corona simulator.
		if ( system.getInfo ( "environment" ) == "simulator" ) then
			errorHandler = false -- Setting this as false shows the pop-up window showing the error.
			thisErrorMessage = "\nNot handling the unhandled error " .. event.errorMessage
			
		-- Hide the error at runtime if not in the Corona simulator.	
		else
			errorHandler = true -- Setting this as true suppresses the pop-up window showing the error.
			
			thisErrorMessage = "\nHandling the unhandled error " .. event.errorMessage
			
		end	

		-- Write error messages to the error log file. 
		errorLog:writeErrorLog( getErrorEnvironmentInfo() )
		errorLog:writeErrorLog( thisErrorMessage )
		errorLog:writeErrorLog( "\n" .. event.stackTrace .. "\n\n\n" )
		
		return errorHandler
	end

	-- Write error message to error log.
	function errorLog:writeErrorLog( thisErrorMessage )

		-- Get the path to the error log file name.
		local path = system.pathForFile( errorLogFileName, system.DocumentsDirectory )
		
		-- Open the error log file and set to append.
		local file = io.open( path, "a" )
		
		-- If opening file is successful.
		if ( file ) then
			
			-- Write the error message to error log.
			file:write( thisErrorMessage )
			
			-- Close the file.
			io.close( file )
			
			return true
			
		-- If opening file is unsuccessful.		
		else

			print( "Error: could not read " .. errorLogFileName )
			return false

		end
	end

	-- Add event listener to listen for unhandled errors.
	Runtime:addEventListener( "unhandledError", unhandledErrorListener )
	
	return errorLog
end

return ErrorLog
module(..., package.seeall)

local numberOfApps = 5

function test_start()
	print( "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" )
	print( "Start of tests..." )
end

--[[
function test_App()
	local App = require "scripts.classes.app.App"
	local globalVariable = require "scripts.common.global-variable"
	
	local currentAppID = globalVariable.appID
	
	--App.new()	

	for i = 1, numberOfApps do
		App.new( i, "full" )
		App.new( i, "lite" )
	end
	
	globalVariable.appID = currentAppID
	-- Bring it back to normal.
	--local startApp = require "apps.start-app" -- Start app.	
end]]--


--[[
function test_AppDirectory()


	local AppDirectory = require "scripts.classes.app.AppDirectory"
	local appDirectory1
	local theAppDirectory
	for i = 1, numberOfApps do
		appDirectory1 = AppDirectory.new( i )
		theAppDirectory = appDirectory1:getAppDirectory()
		assert( type( tonumber ( theAppDirectory[ 1 ] ) ) == "number", "App ID "  .. theAppDirectory[ 1 ] .. " needs to be a number." )
		assert( type( theAppDirectory[ 2 ] ) == "string", "App directory needs to be a string." )
	end		
	

end]]--

--[[ function test_saveFile()
	require "com.jxl.core.services.ReadFileContentsService"

	local saveFile = SaveFileService:new()
	local data = "moo"
	assert_true(saveFile:saveFile("test.txt", system.DocumentsDirectory, data), "Failed to save test.txt")
end

function test_readFile()
	require "com.jxl.core.services.ReadFileContentsService"
	require "com.jxl.core.services.SaveFileService"

	local saveFile = SaveFileService:new()
	local data = "moo"
	assert_true(saveFile:saveFile("test.txt", system.DocumentsDirectory, data), "Failed to save test.txt for use in reading.")

	local readFile = ReadFileContentsService:new()
	local contents = readFile:readFileContents("test.txt", system.DocumentsDirectory)
	assert_string(contents, "contents are not a string.")
	assert_equal(contents, data, "Data written to file does not match what we just read out of it.")
end
]]--
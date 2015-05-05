-----------------------------------------------------------------------------------------
--
-- BackgroundMusic.lua
-- Background music class.
-- The background music.
--
-----------------------------------------------------------------------------------------

local BackgroundMusic = {}

function BackgroundMusic.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super" -- Super class.
	local backgroundMusic = Super.new()
	Super = nil

	local audioChannel = 2
	
	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function backgroundMusic:getAudioFilename( audioName )
		local globalVariable = require "scripts.common.global-variable"	-- Global variables.
		local appInfo = require( globalVariable.appScriptDirectory .. "app-info" )	-- App-specific information.
		audioName = appInfo.getAppInfo().playlistDirectory .. audioName 
		
		globalVariable = nil
		
		return audioName
	end
	
	-- Pause background music.
	function backgroundMusic:pauseBackgroundMusic()	
		print( "Pausing background music..." )
		media.stopSound()
	
		--if ( true == audio.isChannelActive( audioChannel ) ) then
			
			--audio.stop( audioChannel )
		--end
	end		
	
	-- Play background music.
	function backgroundMusic:playBackgroundMusic( audioName )
		print( "Playing background music..." )
		
		backgroundMusic:pauseBackgroundMusic()
		
		-- Play music.		
		
		audioName = backgroundMusic:getAudioFilename( audioName )
		media.playSound( audioName, system.ResourceDirectory, true )
		
		--[[
		
		local audioOptions =
		{
			channel = audioChannel,
			loops = -1,
		}
		
		local musicPath = system.pathForFile( musicName, system.ResourceDirectory )
		if musicPath then
			local musicHandle = audio.loadSound( musicName )
			audio.play( musicHandle, audioOptions )
			
			-- Garbage disposal.
			musicHandle = nil
		end	]]--

		
		
		-- Garbage disposal.
		audioName = nil
		--musicPath = nil
		--audioOptions = nil
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------
	
	function backgroundMusic:start()

	end
	
	backgroundMusic:start()
	
	return backgroundMusic
	
end	
	
return BackgroundMusic
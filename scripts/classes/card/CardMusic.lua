-----------------------------------------------------------------------------------------
--
-- CardMusic.lua
-- Card sound class.
-- The card sound.
--
-----------------------------------------------------------------------------------------

local CardMusic = {}

function CardMusic.new()

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super" -- Super class.
	local cardMusic = Super.new()
	Super = nil

	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function cardMusic:setCardMusic()
		
		local globalVariable = require "scripts.common.global-variable"	-- Global variables.

		-- Play music.
		if ( true == globalVariable.togglePlayBackgroundMusic ) then

			if ( false == audio.isChannelActive( 2 ) ) then
				print( "Playing background music..." )
				
				local audioName = globalVariable.appDirectory .. "sounds/Pitx_-_Alphabet_Song.mp3"
				media.playSound( audioName, system.ResourceDirectory, true )
				
				--[[local options =
				{
					channel = 2,
					loops = -1,
				}
				local musicName = globalVariable.appDirectory .. "sounds/Pitx_-_Alphabet_Song.mp3"
				local musicPath = system.pathForFile( musicName, system.ResourceDirectory )
				if musicPath then
					local musicHandle = audio.loadSound( musicName )
					audio.play( musicHandle, options )
					
					-- Garbage disposal.
					musicHandle = nil
				end	

				-- Garbage disposal.
				musicName = nil
				musicPath = nil
				options = nil]]--
				
				-- Garbage disposal.
				audioName = nil
			end
		end
		
		globalVariable = nil
	end	
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------
	
	function cardMusic:start()
		cardMusic:setCardMusic()
	end
	
	cardMusic:start()
	
	return cardMusic
	
end	
	
return CardMusic
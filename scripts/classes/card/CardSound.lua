-----------------------------------------------------------------------------------------
--
-- CardSound.lua
-- Card sound class.
-- The card sound.
--
-----------------------------------------------------------------------------------------

local CardSound = {}

function CardSound.new( thisCardFace )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super" -- Super class.
	local cardSound = Super.new()
	Super = nil

	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function cardSound:setCardSound( thisCardSound )
	
		if ( thisCardSound ~= nil ) then -- Only play sound if sound file is specified.
		
			local myCardFilename = cardSound:make( "scripts.classes.card.CardFilename", thisCardSound )
			local audioPath = system.pathForFile( myCardFilename, system.ResourceDirectory )

			-- Determine if file exists before displaying.
			if ( audioPath ) then
				--thisCardSound = audio.loadSound( myCardFilename )
				--audio.play( thisCardSound )	
				media.playSound( myCardFilename, system.ResourceDirectory, false )
			end
			
			--cardSound:set( thisCardSound )
			
			-- Garbage disposal.
			myCardFilename = nil
			audioPath = nil
			--thisCardSound = nil
		end	
		
	end	
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------
	
	cardSound:start()
	
	return cardSound
	
end	
	
return CardSound
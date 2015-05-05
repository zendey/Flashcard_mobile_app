-----------------------------------------------------------------------------------------
--
-- StartPauseButton.lua
-- StartPauseButton class.
--
-----------------------------------------------------------------------------------------

local StartPauseButton = {}

-- StartPauseButton class.	
function StartPauseButton.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Button = require "scripts.classes.widget.button.Button"		-- Button class.
	local startPauseButton = Button.new()
	Button = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.	
	
	local myPlayButton = {}
	local myPauseButton = {}
	local backgroundMusic1
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function startPauseButton:createStartButton( options )
		options.action = startPlaylistSound
		options.defaultFile = "images/icons/ic_play_circle_fill_white_18dp.png"
		options.label = "Play"
		startPauseButton:createButton( options )
		myPlayButton[ options.id ] = startPauseButton:get()
	end
	
	function startPauseButton:createPauseButton( options )
		options.action = pausePlaylistSound
		options.defaultFile = "images/icons/ic_pause_circle_fill_white_18dp.png"
		options.label = "Pause"
		startPauseButton:createButton( options )
		myPauseButton[ options.id ] = startPauseButton:get()
		myPauseButton[ options.id ].isVisible = false
	end
	
	function startPauseButton:buttonLabel( options )
		options.x = options.x + 200
		options.width = 300
		options.fontSize = 45
		local buttonLabel = display.newText( options )
	end
	
	function startPauseButton:createStartPauseButton( options )
		startPauseButton:createPauseButton( options )
		startPauseButton:createStartButton( options )
		startPauseButton:buttonLabel( options )
		
		backgroundMusic1 = startPauseButton:construct( "scripts.classes.audio.BackgroundMusic" )
	end
	
	function pausePlaylistSound( event )
		myPauseButton[ event.target.id ].isVisible = false
		myPlayButton[ event.target.id ].isVisible = true
		backgroundMusic1:pauseBackgroundMusic()
	end
	
	-- Play sound.
	function startPlaylistSound( event )
		myPlayButton[ event.target.id ].isVisible = false
		
		-- TODO: change all pause buttons to play except for the one playing.
		--[[for k, v in pairs( myPauseButton ) do
			print(k)
		end ]]--
		
		myPauseButton[ event.target.id ].isVisible = true

		local options = {
			filePath = event.target.id,
			fileMode = "r",
			systemDirectory = system.ResourceDirectory,
			delimiter = "\n"
		}	
		
		local audioName = startPauseButton:make( "scripts.classes.file.FileParser", options )
		options = {
			stringToSeparate = audioName[ 1 ],
			delimiter = "\t",
		}
		audioName = startPauseButton:make( "scripts.classes.file.DelimiterSeparator", options )
		
		backgroundMusic1:playBackgroundMusic( audioName[ 2 ] )
	end
	
	------------------------------------------------------------------
	-- Instantiate class.
	------------------------------------------------------------------

	function startPauseButton:start( options )	
		startPauseButton:createStartPauseButton( options )
	end	
	
	startPauseButton:start( options )
	
	return startPauseButton
end

return StartPauseButton
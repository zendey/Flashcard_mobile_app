-----------------------------------------------------------------------------------------
--
-- ExitButton.lua
-- ExitButton class.
--
-----------------------------------------------------------------------------------------

local ExitButton = {}

-- ExitButton class.	
function ExitButton.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Button = require "scripts.classes.widget.button.Button" -- Button class.
	local exitButton = Button.new()
	Button = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local globalVariable 	= require "scripts.common.global-variable"				-- Global variables.
	local screen 			= require "scripts.common.screen"						-- Screen functions.	
	
	-- Local variables.
	local myExitButton
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function exitButton:createExitButton( options )
	
		-- Show exit button on top left corner.
		options.x = 50			
		options.y = 50
		options.id = "scripts.screens.screen-confirm-exit"
		options.label = "Exit"
		
		if ( true == globalVariable.toggleFeatureExitButton ) then 
			options.action = screen.openOverlayScreen
			options.defaultFile = "images/icons/ic_cancel_white_18dp.png"
		end 

		exitButton:createButton( options )				

		-- Garbage disposal.
		options = nil		
		
	end
	
	------------------------------------------------------------------
	-- Instantiate class.
	------------------------------------------------------------------

	function exitButton:start( options )
		exitButton:createExitButton( options )
	end 		
	
	exitButton:start( options )
	
	return exitButton
end

return ExitButton
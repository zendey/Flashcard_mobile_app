-----------------------------------------------------------------------------------------
--
-- HomeButton.lua
-- HomeButton class.
--
-----------------------------------------------------------------------------------------

local HomeButton = {}

-- HomeButton class.	
function HomeButton.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Button = require "scripts.classes.widget.button.Button" -- Button class.
	local homeButton = Button.new()
	Button = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local globalVariable 	= require "scripts.common.global-variable"				-- Global variables.
	local screen 			= require "scripts.common.screen"						-- Screen functions.	
	
	-- Local variables.
	local myHomeButton
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function homeButton:createHomeButton( options )
		options.x = globalVariable.screenWidth - 50
		options.y = 50
		options.id = "scripts.screens.screen-home"
		options.action = screen.goToScreen
		options.defaultFile = "images/icons/ic_home_grey600_18dp.png"
		options.label = "Home"
		
		homeButton:createButton( options )

		-- Garbage disposal.
		options = nil		
		
	end
	
	------------------------------------------------------------------
	-- Instantiate class.
	------------------------------------------------------------------

	function homeButton:start( options )
		homeButton:createHomeButton( options )
	end 	
	
	homeButton:start( options )
	
	return homeButton
end

return HomeButton
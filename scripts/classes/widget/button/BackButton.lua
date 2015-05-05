-----------------------------------------------------------------------------------------
--
-- BackButton.lua
-- BackButton class.
--
-----------------------------------------------------------------------------------------

local BackButton = {}

-- BackButton class.	
function BackButton.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Button = require "scripts.classes.widget.button.Button" -- Button class.
	local backButton = Button.new()
	Button = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local globalVariable 	= require "scripts.common.global-variable"				-- Global variables.
	local screen 			= require "scripts.common.screen"						-- Screen functions.	
	
	-- Local variables.
	local myBackButton
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function backButton:createBackButton( options )

		options.x = 50
		options.y = 50
		options.id = "scripts.screens.screen-categories"
		options.action = screen.goToScreen
		options.defaultFile = "images/icons/ic_arrow_back_grey600_18dp.png"
		options.label = "Back"
		
		backButton:createButton( options )

		-- Garbage disposal.
		options = nil		
		
	end
	
	------------------------------------------------------------------
	-- Instantiate class.
	------------------------------------------------------------------

	function backButton:start( options )
		backButton:createBackButton( options )
	end 	
	
	backButton:start( options )
	
	return backButton
end

return BackButton
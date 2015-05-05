-----------------------------------------------------------------------------------------
--
-- MenuButton.lua
-- MenuButton class.
--
-----------------------------------------------------------------------------------------

local MenuButton = {}

-- MenuButton class.	
function MenuButton.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Button = require "scripts.classes.widget.button.Button" -- Button class.
	local menuButton = Button.new()
	Button = nil

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.
	local screen = require "scripts.common.screen" -- Screen functions.	
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function menuButton:createMenuButton( options )
	
		-- Show menu button on bottom right corner.
		options.x = globalVariable.screenWidth - 50
		options.y = globalVariable.screenHeight - 50
		options.id = "scripts.screens.screen-menu"
		options.label = "Menu"	
		
		if ( true == globalVariable.toggleFeatureMenuButton ) then -- Toggle feature while in development.
			--options.action = screen.goToScreen
			options.action = screen.openOverlayScreen
			options.defaultFile = "images/icons/ic_settings_applications_white_18dp.png"
		end

		menuButton:createButton( options )
		
		-- Garbage disposal.
		options = nil					
	end
	
	------------------------------------------------------------------
	-- Initialize class.
	------------------------------------------------------------------
	function menuButton:start( options )
		menuButton:createMenuButton( options )
	end 
	
	menuButton:start( options )
	
	return menuButton
end

return MenuButton
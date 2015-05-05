-----------------------------------------------------------------------------------------
--
-- DebugButton.lua
-- DebugButton class.
--
-----------------------------------------------------------------------------------------

local DebugButton = {}

-- DebugButton class.	
function DebugButton.new( options )

	--------------------------------------------------------------
	-- Inherit from super class.
	--------------------------------------------------------------
	local Button = require "scripts.classes.widget.button.Button"		-- Button class.
	local debugButton = Button.new()
	Button = nil
	
	--------------------------------------------------------------	
	-- Include files.
	--------------------------------------------------------------	
	local globalVariable 	= require "scripts.common.global-variable"				-- Global variables.
	local screen 			= require "scripts.common.screen"						-- Screen functions.	
	
	-- Local variables.
	local myDebugButton
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------

	function debugButton.openDebugMode()
		print("debugging... ***")
		local composer = require "composer"
		composer.gotoScene( "scripts.add-ons.error-log.error-log.debug-email-error-log" )
	end 
	
	function debugButton:createDebugButton( options )

		-- Show debug button on bottom left corner.
		options.x = 125
		options.y = 50 --globalVariable.screenHeight - 50
		options.id = "scripts.add-ons.error-log.error-log.debug-mode"
		
		if ( true == globalVariable.toggleFeatureDebugMode ) then -- Toggle feature while in development.	
			options.label = "Debug mode"
			options.action = debugButton.openDebugMode
			--options.action = screen.goToScreen
			options.defaultFile = "images/icons/ic_bug_report_grey600_18dp.png"
		end
		
		debugButton:createButton( options )

		-- Garbage disposal.
		options = nil
		
	end
	
	------------------------------------------------------------------
	-- Instantiate class.
	------------------------------------------------------------------

	function debugButton:start( options )
		debugButton:createDebugButton( options )
	end 		
			
	debugButton:start( options )
	
	return debugButton
end

return DebugButton
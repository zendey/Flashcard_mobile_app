-----------------------------------------------------------------------------------------
--
-- ButtonGroup.lua
-- ButtonGroup class.
--
-----------------------------------------------------------------------------------------

local ButtonGroup = {}

-- ButtonGroup class.	
function ButtonGroup.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local DisplayGroup = require "scripts.classes.DisplayGroup" -- DisplayObject class.
	local buttonGroup = DisplayGroup.new()
	DisplayGroup = nil
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------

	function buttonGroup:createButtons( options )

		-- Local variables.
		local myButtonGroup = buttonGroup:get()
		local thisButton = {}
		local includeFile
		local ButtonClass
		local i 
		
		for i = 1, #options.buttons do
			-- Show each button.		
			includeFile = "scripts.classes.widget.button." .. options.buttons[ i ] .. "Button"
			ButtonClass = require( includeFile )
			thisButton[i] = ButtonClass.new( {} )				
			myButtonGroup:insert( thisButton[i]:get() )
		end	

		buttonGroup:set( myButtonGroup )
		
		-- Garbage disposal.
		thisButton = nil	
		myButtonGroup = nil
		includeFile = nil
		ButtonClass = nil
		i = nil
	
		return myButtonGroup

	end
	
	------------------------------------------------------------------
	-- Initialize class.
	------------------------------------------------------------------

	function buttonGroup:start( options )
		buttonGroup:createButtons( options )
	end	
	
	buttonGroup:start( options )
	
	return buttonGroup
end

return ButtonGroup
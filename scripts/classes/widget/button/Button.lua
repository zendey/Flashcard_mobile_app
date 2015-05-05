-----------------------------------------------------------------------------------------
--
-- Button.lua
-- Button class.
--
-----------------------------------------------------------------------------------------

local Button = {}

-- Button class.	
function Button.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local DisplayObject	= require "scripts.classes.DisplayObject" -- DisplayObject class.
	local button = DisplayObject.new()
	DisplayObject = nil
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function button:createButton( options )
		local globalVariable = require "scripts.common.global-variable"	-- Global variables.		
		local widget = require "widget"
		
		local buttonOptions = {
			onPress = options.action,
		--	defaultFile = options.defaultFile,
			x = options.x or 50,
			y = options.y or 50,
			id = options.id,
			font = globalVariable.appFontFace,
			width = options.width,
			height = options.height,
		}

		local myFilePath = system.pathForFile( options.defaultFile, system.ResourceDirectory )		
		local fileHandle
		local errorString
		
		if ( myFilePath ~= nil ) then		
			-- io.open opens a file at path. Returns nil if no file found.
			fileHandle, errorString = io.open( myFilePath, "r" )
		else	
			errorString = "File path does not exist." 
		end 
	
		-- TODO:  Check if file exists.
		--if fileHandle then
			buttonOptions.defaultFile = options.defaultFile
		--[[else	
			buttonOptions.label = options.label
			buttonOptions.fontSize = 40
			buttonOptions.labelColor = { default = { 0.9, 0.9, 0.9 }, over = { 0.9, 0.9, 0.9 } }
		end]]--
	
		local myButton = widget.newButton( buttonOptions )
		myButton:toFront()
		
		if ( true == globalVariable.toggleFeatureAssert ) or ( system.getInfo( "environment" ) == "simulator" ) then
			assert( myButton ~= nil, "No button specified." )
		end	

		button:set( myButton )

		-- Garbage disposal.
		globalVariable = nil	
		widget = nil	
		myButton = nil
		options = nil
	end
	
	function button:createButtonText( options )
		local globalVariable = require "scripts.common.global-variable"	-- Global variables.			
		local widget = require "widget"
		
		local myButton = widget.newButton{
			onPress = options.onPress,
			x = options.x or globalVariable.screenCenterX,
			y = options.y or globalVariable.screenCenterY,
			id = options.id,
			label = options.label,
			shape = "roundedRect",
			width = 360,
			height = 50,
			cornerRadius = 10,
			fillColor  = { default = { 0.9, 0.9, 0.9, 1 }, over = { 0.9, 0.9, 0.9, 0.4 } },
			font = globalVariable.appFontFace,

		}
		myButton._view._label.size = 40
		
		button:set( myButton )
		
		-- Garbage disposal.
		globalVariable = nil
		widget = nil
		myButton = nil
		options = nil

	end
	
	------------------------------------------------------------------
	-- Instantiate class.
	------------------------------------------------------------------

	button:start()
	
	return button
end

return Button
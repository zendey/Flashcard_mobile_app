-----------------------------------------------------------------------------------------
--
-- form.lua
-- Form elements
-----------------------------------------------------------------------------------------

local form = {}

local composer 			= require "composer"
local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.
local preferences 		= require "scripts.preferences"
local screen 			= require "scripts.common.screen"
local widget 			= require "widget"
local scene 			= composer.newScene()

-- Handle press events for the buttons - card mode
local function onSwitchPress( event )	
	local switch = event.target
	
	if ( switch.id == "Text then image" ) then	
		preferences.setCardMode( switch.id )
	elseif ( switch.id == "Image then text" ) then
		if ( globalVariable.version == "lite" ) then
			screen.openOverlay( "scripts.screens.screen-upgrade-to-use-feature" )
		else 
			preferences.setCardMode( switch.id )
		end
	elseif ( switch.id == "Text only" ) then
		preferences.setCardMode( switch.id )	
	elseif ( switch.id == "Image only" ) then
		if ( globalVariable.version == "lite" ) then
			screen.openOverlay( "scripts.screens.screen-upgrade-to-use-feature" )
		else 
			preferences.setCardMode( switch.id )	
		end
	elseif ( switch.id == "Image + Text" ) then
		if ( globalVariable.version == "lite" ) then
			screen.openOverlay( "scripts.screens.screen-upgrade-to-use-feature" )
		else 
			preferences.setCardMode( switch.id )	
		end
	end
	

end

-- Display radio buttons.
function form.displayRadioButtons( radioArray )

	-- Create a group for the radio button set
	radioGroup = display.newGroup()

	local radioCounter = 1
	
	while radioCounter <= table.maxn( radioArray ) do
		local radioLabelOptions = 
		{
			text = radioArray[radioCounter],
			x = globalVariable.screenCenterX + 25,
			y = globalVariable.screenCenterY - 200 + ( radioCounter * 80 ),
			width = 300,     -- required for multi-line and alignment
			fontSize = 35,
			font = globalVariable.appFontFace
		}

		local radioButton = widget.newSwitch
		{
			x = globalVariable.screenCenterX - 170,
			y = globalVariable.screenCenterY - 200 + ( radioCounter * 80 ),
			style = "radio",
			id = radioArray[ radioCounter ],
			--initialSwitchState = true,
			onPress = onSwitchPress
		}
		
		if ( radioButton.id == preferences.getCardMode() ) then
			radioButton:setState( { isOn = true } )
		end
			
		radioLabel = display.newText( radioLabelOptions )
		radioGroup:insert( radioLabel )
		radioGroup:insert( radioButton )		
		radioCounter = radioCounter + 1
	end

	return radioGroup
end

-- Display buttons.
function form.displayButton( id, label, action )
	local thisButton = widget.newButton{
		onPress = action,
		x = globalVariable.screenCenterX,
		y = globalVariable.screenCenterY,
		id = id,
		label = label,
		shape = "roundedRect",
		width = 380,
		height = 50,
		cornerRadius = 10,
		fillColor  = { default = { 0.9, 0.9, 0.9, 1 }, over = { 0.9, 0.9, 0.9, 0.4 } },
		font = globalVariable.appFontFace,
	}
	thisButton._view._label.size = 40
	
	return thisButton
end

-- Display button icons.
function form.displayButtonImage( id, label, action, buttonImage )
	local thisButton

	thisButton = widget.newButton{
		onPress = action,
		defaultFile = buttonImage,
		x = globalVariable.screenCenterX,
		y = globalVariable.screenCenterY,
		id = id,
	}
	
	return thisButton
end

return form
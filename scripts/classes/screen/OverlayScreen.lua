-----------------------------------------------------------------------------------------
--
-- OverlayScreen.lua
-- Overlay screen class.
--
-----------------------------------------------------------------------------------------

local OverlayScreen = {}

-- Create new loading screen.
function OverlayScreen.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Screen = require "scripts.classes.screen.Screen"				-- Screen class.
	local overlayScreen = Screen.new()
	Screen = nil
	
	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local composer 			= require "composer"							-- Composer.
	local form				= require "scripts.widgets.form"				-- Form.
	local globalVariable 	= require "scripts.common.global-variable"		-- Global variables.	
	
	--local myOverlayScreen
	--local myOverlayScreen = overlayScreen:getScreen()
	
	-----------------------------------------------------------------
	-- Class methods.
	-----------------------------------------------------------------

	-- Dim screen when using overlay screen.
	function overlayScreen:dimScreen()
		local dimScreen = display.newRect( globalVariable.screenCenterX, globalVariable.screenCenterY, globalVariable.screenWidth, globalVariable.screenHeight )
		
		--dimScreen:setFillColor( 0.1, 0.1, 0.1 )
		dimScreen.alpha = 0.20
		return dimScreen
	end

	-- Create screen overlay.
	function overlayScreen:showOverlay( screenOverlayWidth, screenOverlayHeight )
		if ( screenOverlayWidth == nil ) then
			screenOverlayWidth = 700
		end

		if ( screenOverlayHeight == nil ) then
			screenOverlayHeight = 700
		end	
			
		local screenOverlay = display.newRoundedRect( globalVariable.screenCenterX, globalVariable.screenCenterY, screenOverlayWidth, screenOverlayHeight, 35 )
		--screenOverlay:setFillColor( 0.99, 0.99, 0.99 )
		screenOverlay.alpha = 0.95
		
		return screenOverlay
	end

	-- Show buttons.
	function overlayScreen:showButtons( options )
		
		local Button = require "scripts.classes.widget.button.Button"
		
		--local buttonOptions = {}
		
		local buttonGroup1 = Button.new( options )
		
		
		local buttonGroup = display.newGroup()
		
		local choiceButton = form.displayButton( options[ "buttons" ][ "choiceButton" ][ "screen" ], options[ "buttons" ][ "choiceButton" ][ "label" ], options[ "buttons" ][ "choiceButton" ][ "action" ] )
		choiceButton.x = options[ "buttons" ][ "choiceButton" ][ "x" ] or globalVariable.screenCenterX
		choiceButton.y = options[ "buttons" ][ "choiceButton" ][ "y" ]
		buttonGroup:insert( choiceButton )
		
		local backButton = form.displayButton( options[ "buttons" ][ "backButton" ][ "screen" ], options[ "buttons" ][ "backButton" ][ "label" ], options[ "buttons" ][ "backButton" ][ "action" ] )
		--local backButton = form.displayButton( options[ "buttons" ][ "backButton" ][ "screen" ], options[ "buttons" ][ "backButton" ][ "label" ], composer.hideOverlay( event.target.id ) )
		backButton.x = options[ "buttons" ][ "backButton" ][ "x" ] or globalVariable.screenCenterX
		backButton.y = options[ "buttons" ][ "backButton" ][ "y" ]
		buttonGroup:insert( backButton )
		
	--[[	local backButton = form.displayButton( "scripts.screens.screen-home", "Back", OverlayScreen.closeOverlayScreen )
		backButton.y = globalVariable.screenCenterY + 100
		buttonGroup:insert( backButton )]]--
		
		return buttonGroup

	end

	-- Show exit button.
	function overlayScreen:showExitButton()
		local Button = require "scripts.classes.widget.button.Button"
		
		local options = {
			label = "Exit",
			action = OverlayScreen.closeOverlayScreen
		}
		
		local button1 = Button.new( options )
	end
	
	-- Close overlay screen.
	function overlayScreen:closeOverlayScreen( event )
		composer.hideOverlay( event.target.id )
	end
	
	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------
	
	-- Get the display group.
	function overlayScreen:getOverlayScreen()
		return myOverlayScreen
	end		
	
	-----------------------------------------------------------------------	
	-- Instantiate class.
	-----------------------------------------------------------------------	
	
	function overlayScreen:start()
	--	local overlayScreen = display.newGroup()	
		
		local dimScreen = overlayScreen:dimScreen()
		local screenOverlay = overlayScreen:showOverlay( 700, 350 )

		options[ "screenTextX" ] = globalVariable.screenCenterX
		options[ "screenTextY" ] = globalVariable.screenCenterY - 100
		
		-- TODO: fix overrun of text.
		options[ "screenTextFontSize" ] = 35
	--	local overlayScreen1 = Screen.new( options )
		myOverlayScreen = overlayScreen:createScreen( options )
		
		myOverlayScreen:insert( dimScreen )	
		myOverlayScreen:insert( screenOverlay )	
	--	myOverlayScreen:insert( overlayScreen1 )

	--	local overlayScreenButtons = OverlayScreen.showButtons( options )
	--	overlayScreen:insert( overlayScreenButtons )

		local exitButton = overlayScreen:showExitButton()
	--	overlayScreen:insert( exitButton )
	end
	
	overlayScreen:start()
	
	return overlayScreen
end

return OverlayScreen
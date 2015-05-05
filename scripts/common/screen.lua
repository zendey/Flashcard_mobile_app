-----------------------------------------------------------------------------------------
--
-- screen.lua
-- Screen functions.
-----------------------------------------------------------------------------------------

local screen = {}

-- Include files.
local composer 			= require "composer"
local globalVariable 	= require "scripts.common.global-variable"	-- Global variables.

-- Go to screen.
function screen.goToScreen( event )
	local nextScreen

	-- If button is pressed, pass the target.
	if ( event.target ) then
		nextScreen = event.target.id
	-- If only the parameter is passed, not the button's action.	
	else
		nextScreen = event
	end 
	composer.gotoScene( nextScreen )
end

-- Dim screen when using overlay screen.
function screen.dimScreen()
	local dimScreen = display.newRect( globalVariable.screenCenterX, globalVariable.screenCenterY, globalVariable.screenWidth, globalVariable.screenHeight )
	--dimScreen.alpha = 0
	dimScreen.alpha = 0.20

	return dimScreen
end

-- Create screen overlay.
function screen.displayOverlay( screenOverlayWidth, screenOverlayHeight )
	if ( screenOverlayWidth == nil ) then
		screenOverlayWidth = 700
	end

	if ( screenOverlayHeight == nil ) then
		screenOverlayHeight = 700
	end	
		
	local screenOverlay = display.newRoundedRect( globalVariable.screenCenterX, globalVariable.screenCenterY, screenOverlayWidth, screenOverlayHeight, 35 )
	--screenOverlay:setFillColor( 0, 0, 0 )
	screenOverlay:setFillColor( 0.99, 0.99, 0.99 )
	--screenOverlay.alpha = 1
	screenOverlay:toFront()
	--screenOverlay.alpha = 0.95
	return screenOverlay
end

-- Display screen title.
function screen.displayScreenTitle( screenTitle )
	local screenTitle = display.newText( screenTitle, globalVariable.screenCenterX, globalVariable.screenCenterY - 300, globalVariable.appFontFace, 45 )
	return screenTitle
end

function screen.openOverlayScreen( event )
	local options = {
		isModal = true,
		--effect = "fade",
		time = 400,
		params = {
			sampleVar = "my sample variable"
		}
	}
	
	composer.showOverlay( event.target.id, options )
end

function screen.openOverlay( overlayScreen )
	local options = {
		isModal = true,
		effect = "fade",
		time = 400,
		params = {
			sampleVar = "my sample variable"
		}
	}
	
	composer.showOverlay( overlayScreen )
end

function screen.closeOverlayScreen( event )
	composer.hideOverlay( event.target.id )
end

function screen.goToURL( event )
	--system.openURL( event )
	system.openURL( event.target.id )
end

return screen
-----------------------------------------------------------------------------------------
--
-- Screen.lua
-- Screen class.
--
-----------------------------------------------------------------------------------------

local Screen = {}

-- Screen class.	
function Screen.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local DisplayGroup = require "scripts.classes.DisplayGroup" -- Display object class.
	local screen = DisplayGroup.new()	
	DisplayGroup = nil	

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local globalVariable = require "scripts.common.global-variable" -- Global variables.
	
	-- Local variables.
	local screenTitleObject 
	local screenTextObject
	local myGroup

	-----------------------------------------------------------------
	-- Class methods.
	-----------------------------------------------------------------
	
	-- Show the screen title.
	function screen:showScreenTitle( options )

		if ( options[ "screenTitle" ] ) then
			-- Set defaults.
			options[ "screenTitle" ] = options[ "screenTitle" ] or ""
			options[ "screenTitleX" ] = options[ "screenTitleX" ] or globalVariable.screenCenterX
			options[ "screenTitleY" ] = options[ "screenTitleY" ] or globalVariable.screenCenterY - 300
			options[ "screenTitleFontFace" ] = options[ "screenTitleFontFace" ] or globalVariable.titleFontFace
			options[ "screenTitleFontSize" ] = options[ "screenTitleFontSize" ] or 45
			--options[ "screenTitleFillColorR" ] = options[ "screenTitleFillColorR" ] or 0.1
			--options[ "screenTitleFillColorG" ] = options[ "screenTitleFillColorG" ] or 0.1
			--options[ "screenTitleFillColorB" ] = options[ "screenTitleFillColorB" ] or 0.1

			-- Display screen title.
			screenTitleObject = display.newText( options[ "screenTitle" ], options[ "screenTitleX" ], options[ "screenTitleY" ], options[ "screenTitleFontFace" ], options[ "screenTitleFontSize" ] )
			--screenTitleObject:setFillColor( options[ "screenTitleFillColorR" ], options[ "screenTitleFillColorG" ], options[ "screenTitleFillColorB" ] )
			
			-- Garbage disposal.
			options = nil
			
			return screenTitleObject
		end	
		
	end

	-- Show the screen text.
	function screen:showScreenText( options )		
				
		if ( options[ "screenText" ] ) then
			-- Set defaults.
			options[ "screenText" ] = options[ "screenText" ] or ""
			options[ "screenTextX" ] = options[ "screenTextX" ] or globalVariable.screenCenterX
			options[ "screenTextY" ] = options[ "screenTextY" ] or globalVariable.screenCenterY
			options[ "screenTextFontFace" ] = options[ "screenTextFontFace" ] or globalVariable.appFontFace
			options[ "screenTextFontSize" ] = options[ "screenTextFontSize" ] or 50
			options[ "screenTextFillColorR" ] = options[ "screenTextFillColorR" ] or 0.1
			options[ "screenTextFillColorG" ] = options[ "screenTextFillColorG" ] or 0.1
			options[ "screenTextFillColorB" ] = options[ "screenTextFillColorB" ] or 0.1
			
			screenTextObject = display.newText( options[ "screenText" ], options[ "screenTextX" ], options[ "screenTextY" ], options[ "screenTextFontFace" ], options[ "screenTextFontSize" ] )
			screenTextObject:setFillColor( options[ "screenTextFillColorR" ], options[ "screenTextFillColorG" ], options[ "screenTextFillColorB" ] )
			
			-- Garbage disposal.
			options = nil
			
			return screenTextObject
		end	
	end

	-- Set the background color.
	function screen:setBackgroundColor( options )
		options[ "backgroundColorR" ] = options[ "backgroundColorR" ] or 1
		options[ "backgroundColorG" ] = options[ "backgroundColorG" ] or 1
		options[ "backgroundColorB" ] = options[ "backgroundColorB" ] or 1
		display.setDefault( "background", options[ "backgroundColorR" ], options[ "backgroundColorG" ], options[ "backgroundColorB" ] )
		
		-- Garbage disposal.
		options = nil
	end

	function screen:createScreen( options )
		if ( options ~= nil ) then
			myGroup:insert ( screen:showScreenTitle( options ) )
			myGroup:insert ( screen:showScreenText( options ) )
			screen:setBackgroundColor( options )
		end 
		
		screenTitleObject = nil
		screenTextObject = nil
		
		return myGroup
	end
	
	-- Called when a key event has been received
	function onKeyEvent( event )
		-- Print which key was pressed down/up
		local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
		print( message )

		-- Disable back button.
		-- If the "back" key was pressed on Android or Windows Phone, prevent it from backing out of the app.
		if ( true == globalVariable.toggleFeatureDisableBackButton ) then -- Toggle feature while in development.
			if ( event.keyName == "back" ) or ( event.keyName == "b" ) then
				--goToHome()
				
				local platformName = system.getInfo( "platformName" )
				if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
					return true
				end
			end
		end

		-- Garbage disposal.
		message = nil
		
		-- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
		-- This lets the operating system execute its default handling of the key
		return false
	end
	
	-----------------------------------------------------------------------	
	-- Instantiate class.
	-----------------------------------------------------------------------	

	function screen:start()
		Runtime:addEventListener( "key", onKeyEvent ) 					-- Add the key event listener
	end	
	
	screen:start()
	
	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------			
	
	-- Get remove method from parent class.
	screen.displayGroupDestroy = screen.destroy
	
	-- Remove the screen.
	function screen:destroy()
		-- Garbage disposal.
		globalVariable = nil
		myGroup = nil
	
		Runtime:removeEventListener( "key", onKeyEvent )
	
		-- Call remove method from parent class.
		self = self:displayGroupDestroy()

	end

	return screen
end

return Screen
-----------------------------------------------------------------------------------------
--
-- Font.lua
-- Font class.
--
-----------------------------------------------------------------------------------------

local Font = {}

function Font.new( fontFace )

	--------------------------------------------------------------
	-- Inherit from super class.
	--------------------------------------------------------------
	
	local Super	= require "scripts.classes.Super"	-- Super class.
	local font = Super.new()
	Super = nil
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	
	
	-- Initialize font.
	function font:setFont()
		local fontFace = native.systemFont or "Arial"
		
		local globalVariable = require "scripts.common.global-variable"	-- Global variables. 
		globalVariable.appFontFace = fontFace
		globalVariable.titleFontFace = fontFace
		globalVariable.cardFontFace = fontFace
		globalVariable.cardFontSize = globalVariable.screenCenterX * 0.4
		
		-- Garbage disposal.
		globalVariable = nil
		fontFace = nil
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------

	-- Initialize font.
	function font:start()
		font:setFont()
	end
	
	font:start()
	
	return font
end

return Font
-----------------------------------------------------------------------------------------
--
-- DelimiterSeparator.lua
-- DelimiterSeparator class.
--
-----------------------------------------------------------------------------------------

local DelimiterSeparator = {}
	
-- DelimiterSeparator class.	
function DelimiterSeparator.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Super	= require "scripts.classes.Super" -- Super class.	
	local delimiterSeparator = Super.new()
	Super = nil
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	-- Initialize separator.
	function delimiterSeparator:separate( options )
	
		-- Local variables.
		local strings = require "scripts.common.strings" -- String functions.
		local thisDelimiter = options.delimiter or "\t"	
		
		local thisStringToSeparate = strings.split( options.stringToSeparate, thisDelimiter )
		
		delimiterSeparator:set( thisStringToSeparate )		
		
		-- Garbage disposal.
		thisDelimiter = nil		
		strings = nil
		thisStringToSeparate = nil
		options = nil
	end

	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	function delimiterSeparator:start( options )
		delimiterSeparator:separate( options )
	end
	
	delimiterSeparator:start( options )
	
	return delimiterSeparator
end

return DelimiterSeparator
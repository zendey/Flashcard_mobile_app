-----------------------------------------------------------------------------------------
--
-- Super.lua
-- Super class where all objects are created from.
--
-----------------------------------------------------------------------------------------

local Super = {}
	
-- Super class.	
function Super.new()

	local super = {}

	-- Local variables.	
	local myClass
	local myObject
	local myItem

	--------------------------------------------------------------
	-- Class Methods.
	--------------------------------------------------------------
	
	function super:start()

	end

	function super:construct( thisClass, options )
		thisClass = require( thisClass )
		myClass = thisClass.new( options )
		
		-- Garbage disposal.
		includeFile = nil
		options = nil
		thisClass = nil
		
		return myClass
	end
	
	function super:make( thisClass, options )
		myClass = super:construct( thisClass, options )
		myItem = myClass:get()

		-- Garbage disposal.
		thisClass = nil		
		options = nil
		
		return myItem
	end
	
	function super:unmake()
		myClass:destroy()
		myClass = nil
		myItem = nil	
	end	

	function super:destroy()
		myObject = nil	
		self = nil
	end
	
	--------------------------------------------------------------
	-- Getter and Setter Methods.
	--------------------------------------------------------------	

	function super:get()
		return myObject
	end
	
	function super:set( thisObject )
		myObject = thisObject
		thisObject = nil
	end

	return super
end

return Super
-----------------------------------------------------------------------------------------
--
-- DeckThumbnailButton.lua
-- Deck thumbnail button class.
--
-----------------------------------------------------------------------------------------

local DeckThumbnailButton = {}

-- Deck thumbnail class.
function DeckThumbnailButton.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local Button = require "scripts.classes.widget.button.Button"		-- Button class.
	local deckThumbnailButton = Button.new()
	Button = nil
		
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function deckThumbnailButton:createThumbnailButton( options )

		deckThumbnailButton:createButton( options )	
		
		-- Garbage disposal.
		options = nil
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	function deckThumbnailButton:start( options )
		deckThumbnailButton:createThumbnailButton( options )
	end	
	
	deckThumbnailButton:start( options )

	return deckThumbnailButton
	
end	

return DeckThumbnailButton
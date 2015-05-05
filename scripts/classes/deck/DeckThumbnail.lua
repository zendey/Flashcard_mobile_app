-----------------------------------------------------------------------------------------
--
-- DeckThumbnail.lua
-- Deck thumbnail class.
--
-----------------------------------------------------------------------------------------

local DeckThumbnail = {}

-- Deck thumbnail class.
function DeckThumbnail.new( options )

	--------------------------------------------------------------
	-- Inherit from parent class.
	--------------------------------------------------------------
	local DisplayGroup	= require "scripts.classes.DisplayGroup" -- DisplayGroup class.
	local deckThumbnail = DisplayGroup.new()	
	DisplayGroup = nil	

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------	
	local globalVariable = require "scripts.common.global-variable"	-- Global variables.	
	local appInfo = require( globalVariable.appScriptDirectory .. "app-info" ) -- App-specific information.

	local thumbnailWidth
	local thumbnailHeight
	local thumbnailX = 250
	local thumbnailY = 180
	--local thumbnailX = display.contentWidth / 2 - 250
	--local thumbnailY = display.contentHeight / 2 - 100
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------
	
	function deckThumbnail:setCoordinates()
	
		-- Set width and height.
		local screenRatio = display.contentWidth / display.contentHeight
		thumbnailWidth = display.contentWidth / 4
		thumbnailHeight = thumbnailWidth / screenRatio
		
		-- Garbage disposal.
		screenRatio = nil
	end
	
	function deckThumbnail:createBox( options )
		local myRoundedRect = display.newRoundedRect( thumbnailX, thumbnailY, thumbnailWidth + 25, thumbnailHeight + 50, 10 )
		myRoundedRect.strokeWidth = 2
		myRoundedRect:setFillColor( 0.95, 0.95, 0.95 )
		myRoundedRect:setStrokeColor( 0.9, 0.9, 0.9 )
		myRoundedRect:toBack()
		
		deckThumbnail:put( myRoundedRect )
		
		-- Garbage disposal.
		myRoundedRect = nil
		options = nil
		
	end
	
	function deckThumbnail:createLabel( options )
	
		-- Replace dash in filename with spaces.
		categoryName = string.gsub( options.category, "-", " ")
	
		local deckThumbnailLabel = display.newText( categoryName, options.x, options.y + 150, globalVariable.appFontFace, 40 )
		
		deckThumbnail:put( deckThumbnailLabel )
		
		-- Garbage disposal.
		deckThumbnailLabel = nil
		options = nil
	end
	
	function deckThumbnail:createThumbnail( options )
		options.id = options.category
		if ( globalVariable.version == "lite" ) then
			options.id = options.id .. "-lite"
		end
		options.id = options.id .. "-en.txt" 
		
		options.action = changeDeckCollection 
		options.defaultFile = appInfo.getAppInfo().deckDirectory .. options.category .. "/" .. options.category .. ".jpg"
		options.width = thumbnailWidth
		options.height = thumbnailHeight
		options.x = thumbnailX
		options.y = thumbnailY

		local theDeckThumbnailButton = deckThumbnail:make( "scripts.classes.deck.DeckThumbnailButton", options )
		deckThumbnail:put( theDeckThumbnailButton )
		
		-- Garbage disposal.
		options = nil
		theDeckThumbnailButton = nil
	end
	
	-- Change the card category.
	function changeDeckCollection( event )
		globalVariable.deckFilePath = event.target.id
		
		-- Garbage disposal.
		--globalVariable = nil
		
		-- Go to main card screen.
		local screen = require "scripts.common.screen" -- Screen functions.
		screen.goToScreen( "scripts.screens.screen-cards-main" )
	end		
	
	function deckThumbnail:getDeckThumbnail( options )
		
		--deckThumbnail:createBox( options )
		deckThumbnail:createThumbnail( options )
		deckThumbnail:createLabel( options )
		thumbnailX = thumbnailX + 450
		
		if ( thumbnailX > display.contentWidth ) then
			thumbnailX = 250
			thumbnailY = thumbnailY + 350
		end
		
		return deckThumbnail:get()
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------	
	
	function deckThumbnail:start()
		deckThumbnail:setCoordinates()
	end	
	
	deckThumbnail:start()

	return deckThumbnail
	
end	

return DeckThumbnail
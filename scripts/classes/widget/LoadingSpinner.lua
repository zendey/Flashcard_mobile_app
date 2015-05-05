-----------------------------------------------------------------------------------------
--
-- LoadingSpinner.lua
-- Loading spinner class.
--
-----------------------------------------------------------------------------------------

local LoadingSpinner = {}

-- Loading spinner.
function LoadingSpinner.new()

	-- Include files.
	local widget 		= require( "widget" )
	local DisplayObject = require "scripts.classes.DisplayObject"			-- Display object class.

	-- Local variables.
	local loadingSpinner = DisplayObject.new()
	local loadingSpinnerWidget
	local spinnerSingleSheet
	
	-- Get the spinner sprite sheet.
	local options = {
		width = 128,
		height = 128,
		numFrames = 1,
		sheetContentWidth = 128,
		sheetContentHeight = 128
	}
	spinnerSingleSheet = graphics.newImageSheet( "images/icons/ic_data_usage_grey600_18dp.png", options )
	--loadingSpinner.insert( spinnerSingleSheet )
	
	-- Create the loading spinner widget.
	loadingSpinnerWidget = widget.newSpinner
	{
		x = 75,
		y = 75,
		width = 64,
		height = 64,
		sheet = spinnerSingleSheet,
		startFrame = 1,
		deltaAngle = 10,
		incrementEvery = 20
	}
	--loadingSpinner.insert( loadingSpinnerWidget )
	
	-- Start spinning the loading spinner.
	loadingSpinnerWidget:start()
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	
	
	-- Remove the loading spinner.
	function loadingSpinner:destroy()
		
		-- Stop the spinner from spinning.
		loadingSpinnerWidget:stop()
		
		-- Remove the loading spinner.
		display.remove( loadingSpinnerWidget )
		loadingSpinnerWidget = nil
		
		-- Remove the loading spinner sprite sheet.
		spinnerSingleSheet = nil

	end
	
	return loadingSpinner
end

return LoadingSpinner
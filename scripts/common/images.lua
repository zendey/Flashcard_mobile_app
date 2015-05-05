-----------------------------------------------------------------------------------------
--
-- images.lua
-- Image display functions
--
-----------------------------------------------------------------------------------------

local images = {}

-- Include files.
local globalVariable = require "scripts.common.global-variable"	-- Global variables.

-- Get image scale.
local function getImageScale( options )

	options.scaleAllowance = options.scaleAllowance or 1
	local imageScale

	if ( ( system.orientation == "landscapeLeft" ) or ( system.orientation == "landscapeRight" ) ) and ( true == isCard ) then
		imageScale = ( globalVariable.screenHeight / options.imageHeight ) * options.scaleAllowance
	else
		imageScale = ( globalVariable.screenWidth / options.imageWidth ) * options.scaleAllowance	
	end
	
	-- Garbage disposal.
	options = nil
	
	return imageScale
	
end

function images.showImage( options )

	-- Set defaults.
	options.imageOffsetX = options.imageOffsetX or 0
	options.imageOffsetY = options.imageOffsetY or 0
	options.imageToDisplay = options.imageToDisplay or ""

	local imagePath = system.pathForFile( options.imageToDisplay, system.ResourceDirectory )
	local imageToDisplay
	
	-- Check if image exists before showing to prevent error.
	if ( imagePath ) then
		imageToDisplay = display.newImage( options.imageToDisplay, system.ResourceDirectory )
			
		if ( imageToDisplay ~= nil ) then	
			imageToDisplay.x = globalVariable.screenCenterX + options.imageOffsetX
			imageToDisplay.y = globalVariable.screenCenterY + options.imageOffsetY
			
			local options = {
				imageWidth = imageToDisplay.width, 
				imageHeight = imageToDisplay.height, 
				scaleAllowance = options.scaleAllowance, 
				isCard = options.isCard
			}
			local imageScale = getImageScale( options )
			imageToDisplay:scale( imageScale, imageScale )
			imageScale = nil

		end 
	else
		imageToDisplay = nil
	end 
	
	-- Garbage disposal.
	options = nil
	imagePath = nil
	
	return imageToDisplay
end

return images
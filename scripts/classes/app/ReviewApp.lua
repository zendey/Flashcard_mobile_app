-----------------------------------------------------------------------------------------
--
-- ReviewApp.lua
-- App directory class.
--
-----------------------------------------------------------------------------------------

local ReviewApp = {}

-- Creates a new reviewApp. 
function ReviewApp.new( thisAppID )

	--------------------------------------------------------------
	-- Include files.
	--------------------------------------------------------------
	local Super					= require "scripts.classes.Super"					-- Super class.
	
	-- Inherit from super class.
	local reviewApp = Super.new()
	
	-- Local variables.
	local myReviewAppURL
	
	--------------------------------------------------------------
	-- Class methods.
	--------------------------------------------------------------	

	function rateApp()
		print( "Opening app store for review..." )
		-- If you pass in "appStore", the iTunes App Store and the Nook App Store require the iOSAppId or nookAppEAN to be set in the options table.
		native.showPopup( "appStore" )	-- Open the store where the app was downloaded from.
	end

	--------------------------------------------------------------
	-- Getter and setter methods.
	--------------------------------------------------------------	
	
	function reviewApp:getReviewAppURL()
		return myReviewAppURL
	end 
	
		-- Get the review App URL.
	function reviewApp:setReviewApp()
		-- TODO:  Add Apple Store.
		local androidAppPackageName = system.getInfo( "androidAppPackageName" ) or "simulator"
		myReviewAppURL = "https://play.google.com/store/apps/details?id=" .. androidAppPackageName .. "&reviewId=0"
		
		-- Garbage disposal.
		androidAppPackageName = nil
		
		return myReviewAppURL
	end
	
	--------------------------------------------------------------
	-- Inherited methods.
	--------------------------------------------------------------
	
	-- Get remove method from parent class.
	reviewApp.superDestroy = reviewApp.destroy
	
	-- Remove reviewApp.
	function reviewApp:destroy()
	
		-- Garbage disposal.
		myReviewAppURL = nil
	
		-- Remove object from display.
		reviewApp:removeSelf()
		
		-- Call remove method from parent class.	
		self = self:superDestroy()
	end
	
	--------------------------------------------------------------
	-- Initialize class.
	--------------------------------------------------------------		

	-- Get the review App URL.
	function reviewApp:start()
		reviewApp:setReviewApp()
	end
	
	reviewApp:start()

	--------------------------------------------------------------
	-- Garbage disposal.
	--------------------------------------------------------------	
	Super = nil
	
	return reviewApp
end

return ReviewApp
-----------------------------------------------------------------------------------------
--
-- app-design.lua
-- Application design.
-- Visual Stimulation Cards
--
-----------------------------------------------------------------------------------------

local appDesign = {}

-- App design
function appDesign.getAppDesign()
	local thisAppDesign
		thisAppDesign =
		{
			titleImage = "apps/sample-app/design/title.png",
			titleBackgroundColorR = 0.4,
			titleBackgroundColorG = 0.8,
			titleBackgroundColorB = 1,
		}
		
	return thisAppDesign
end

return appDesign
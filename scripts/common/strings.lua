-----------------------------------------------------------------------------------------
--
-- strings.lua
-- String manipulation arrays.
--
-----------------------------------------------------------------------------------------

local strings = {}

local string = require "string"

-- Split the string into separate strings.
function strings.split( hay, inSplitPattern, outResults )

   if not outResults then
      outResults = { }
   end
   local theStart = 1

   local theSplitStart, theSplitEnd = string.find( hay, inSplitPattern, theStart )
   while theSplitStart do
      table.insert( outResults, string.sub( hay, theStart, theSplitStart - 1 ) )
      theStart = theSplitEnd + 1
      theSplitStart, theSplitEnd = string.find( hay, inSplitPattern, theStart )
   end
   table.insert( outResults, string.sub( hay, theStart ) )
   return outResults
end

-- Trim spaces from before and after the string.
function strings.trim( s )
	
	-- Check if s is not nil before doing trim.
	if ( s ~= nil ) then
		s = string.match( s,"^()%s*$" ) and "" or string.match( s,"^%s*(.*%S)" )
	end	
	
	return s
end

-- Change title case of string.
function strings.titleCase( first, rest )
   return first:upper()..rest:lower()
end

-- Text wrap the string.
function strings.textWrap( str, limit, indent, indent1 )

   limit = limit or 72
   indent = indent or ""
   indent1 = indent1 or indent

   local here = 1 - #indent1
   return indent1..str:gsub( "(%s+)()(%S+)()",
      function( sp, st, word, fi )
         if fi-here > limit then
            here = st - #indent
            return "\n"..indent..word
         end
      end )
end

function strings.print_r( arr, indentLevel )
    local str = ""
    local indentStr = "#"

    if( indentLevel == nil ) then
        print(strings.print_r(arr, 0))
        return
    end

    for i = 0, indentLevel do
        indentStr = indentStr.."\t"
    end

    for index,value in pairs(arr) do
        if type(value) == "table" then
            str = str..indentStr..index..": \n"..strings.print_r(value, (indentLevel + 1))
        else 
            str = str..indentStr..index..": "..value.."\n"
        end
    end
    return str
end

return strings
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Error Log
-- Simple error logging for mobile applications written in Corona SDK and Lua.
-- version 0.0.1
--
-- by Honey Silvas
-- info@zendey.com
-- http://zendey.com
--
-----------------------------------------------------------------------------------------

-- To log the errors in your application, simply add the next 2 lines to your main.lua file.
local ErrorLog 	= require "error-log.ErrorLog"	-- Require the error log class.
errorLog1 		= ErrorLog.new()				-- Create a new instance of the error log class.
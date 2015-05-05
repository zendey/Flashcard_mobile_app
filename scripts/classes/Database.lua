-----------------------------------------------------------------------------------------
--
-- Database.lua
-- TODO: Save cards into database.
--
-----------------------------------------------------------------------------------------

local Database = {}

local path = system.pathForFile ("data.db", system.DocumentsDirectory)
local db = sqlite3.open (path)

local tablesetup = [[CREATE TABLE IF NOT EXISTS words (id INTEGER PRIMARY KEY autoincrement, word);]]
db:exec (tablesetup)

	local i = 1

while (i < table.maxn(words)) do
	
	local insertQuery = [[INSERT INTO words VALUE (']] .. words[i] .. [['); ]]
	--print (insertQuery)
	i=i+1
	-- db:exec(insertQuery)
end

return Database
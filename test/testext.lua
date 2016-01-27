local luaext = require "luaext"
--[[
a = luaext.encrypt("gexy")
print(a)
print(luaext.decrypt(a))
print(luaext.md5("gexy"))
local id = luaext.guid()
print(id)
--]]
local luaext_pipe = require "luaext.pipe"
local pipe = luaext_pipe.new("ipconfig /all")
local macs = {}
repeat
	local line = pipe:getline()
	if line then
		local mac = string.match(line,"%s+(%x%x%-%x%x%-%x%x%-%x%x%-%x%x%-%x%x)%s+")
		if mac then macs[mac] = true end
	end
until not line
for k,v in pairs(macs) do
	print(k)
end
pipe:closeout()
pipe:closein()

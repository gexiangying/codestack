crypto = require "crypto"
local digest = crypto.digest

for i,t in ipairs({"sha1","md5"}) do
local d = digest.new(t)
local F = arg[1] or "test.lua"
local f = assert(io.open(F,"rb"))
local s = f:read("*all")
f:close()
local s1 = d:final(s)
print(s1 .. " " .. t)
d:reset()
end

--[[
require "luaext"

local F = arg[1] or "main.lua"
local f = assert(io.open(F,"rb"))
local s = f:read("*all")
local s1= luaext.md5(s)
print(s1)
--]]

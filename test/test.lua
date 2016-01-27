local socket = require("socket")
print(socket._VERSION)
local http = require("socket.http")
local response = http.request("http://localhost")
print(response)

--[[
local sock = assert(socket.connect("www.baidu.com",80))
sock:send("GET " .. "/" .. " HTTP/1.0\r\n\r\n") 
repeat
	local chunk,status,partial = sock:receive(1024)
	print(chunk or partial)
until status == "closed"
sock:close()
--]]

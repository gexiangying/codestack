local luaext = require "luaext"
logined = false
local fh = io.open("reg.data","rb")
local id,macs
if fh then
	id = fh:read("*a")
	fh:close()
else
	local luaext_pipe = require "luaext.pipe"
	local pipe = luaext_pipe.new("ipconfig /all")
	macs = {}
	repeat
		local line = pipe:getline()
		if line then
			local mac = string.match(line,"%s+(%x%x%-%x%x%-%x%x%-%x%x%-%x%x%-%x%x)%s+")
			if mac then macs[mac] = true end
		end
	until not line
	pipe:closeout()
	pipe:closein()
end

local loginstr
if id then 
	loginstr = "ids = " .. string.format("%q",id)  
else
	loginstr = "ids = {"
	for k,v in pairs(macs) do
		loginstr = loginstr .. string.format("%q",k) .. ","
	end
	loginstr = loginstr .. "}"
end
local socket = require("socket")
local sock = socket.connect("115.159.81.210",8000)
--local sock = socket.connect("192.168.31.224",8000)
local rs = luaext.md5(loginstr)
loginstr = "ap2d\r\n" .. loginstr .. "\r\n"
loginstr = string.len(loginstr) .. "\r\n" .. loginstr
sock:send(loginstr)
local chunk,status,partial = sock:receive(32)
sock:close()

--print(chunk)
if chunk == rs then
	logined = true
end

package.cpath = package.cpath .. ";../?.dll"
require "luacom"
local fso = luacom.CreateObject("Scripting.FileSystemObject")
local myFoler = fso:GetFolder("C:\\")
for _,file in luacom.pairs(myFoler.SubFolders) do
	print(file.name)
end

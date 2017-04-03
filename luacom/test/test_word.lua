package.cpath = package.cpath .. ";../?.dll;?.dll"
require "luacom"  
local luaext  = require "luaext"  
wordApp = luacom.CreateObject("Word.Application")  
wordApp.Visible = true  
  
wordDoc = wordApp.Documents:Add()  
wordApp.Selection:TypeText(luaext.a2u8("中文真的可以吗，我也不知道啊！"))  
wordDoc:SaveAs2(luaext.a2u8("C:\\gexy\\中文的文件名哦还挺长的.docx"))  
  
wordDoc:Close(0)  
wordApp:Quit(0)  

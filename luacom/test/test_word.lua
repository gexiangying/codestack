package.cpath = package.cpath .. ";../?.dll;?.dll"
require "luacom"  
local luaext  = require "luaext"  
wordApp = luacom.CreateObject("Word.Application")  
wordApp.Visible = true  
  
wordDoc = wordApp.Documents:Add()  
wordApp.Selection:TypeText(luaext.a2u8("������Ŀ�������Ҳ��֪������"))  
wordDoc:SaveAs2(luaext.a2u8("C:\\gexy\\���ĵ��ļ���Ŷ��ͦ����.docx"))  
  
wordDoc:Close(0)  
wordApp:Quit(0)  

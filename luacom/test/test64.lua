require "ado"

local db_string = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=test.mdb"
local db = ADO_Open(db_string)
db:exec("select * from [ReceivedData]")
local t = db:row()
while t ~= nil do
print(tostring(t[1]).."\t"..tostring(t["Contract"]))
t = db:row()
end
db:close()



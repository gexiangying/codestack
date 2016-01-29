require "ado"

local db_string = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=test.mdb"
local db = ADO_Open(db_string)
db:exec("select * from [ReceivedData]")
local t = db:row()
while t ~= nil do
print(tostring(t[1]).."\t"..tostring(t[6]))
t = db:row()
end
db:close()

--[[
require "ado"

local db_string = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=test.mdb"
local db = ADO_Open(db_string)
 
db:exec("create table test (name char(30), phone char(20))")
db:exec("insert into test values ('Bill Gates', '666-6666')")
db:exec("insert into test values ('Paul Allen', '606-0606')")
db:exec("insert into test values ('George Bush', '123-4567')")
 
db:exec("select * from test where name <> 'Bill Gates'")
 
t = db:row()
 
while t ~= nil do
print(tostring(t.name).."\t"..tostring(t.phone))
t = db:row()
end
 
db:exec("drop table test")
db:close()
--]]

print("hello world\n")
--start(code)
--send(channel,...)
--receive(channel,...)

local send_code = [[
  send("hello","1","2")
]]

local recv_code = [[
	local a,b = receive("hello")
  print(tonumber(a) + tonumber(b))
]]

start(send_code)
start(recv_code)

exit()

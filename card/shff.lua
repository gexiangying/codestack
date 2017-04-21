local set = {}
local deal = {}
local left = 52

local color = {"C","D","H","S"}
local no = {"A","2","3","4","5","6","7","8","9","T","J","Q","K"}
function init()
	math.randomseed(os.time())
	for i=1,52 do
		set[i] = i
	end
end

function shuff()
	for i=1,52 do
		index = math.random(1,left)
		deal[i] = set[index]
		set[index],set[left] = set[left],set[index]
		left = left -1
	end
end

function strcard(num)
	local c = (num - (num -1)%13 - 1) // 13 + 1
	local n = num - (c-1) * 13
	return color[c] .. no[n]
end

function out()
	local players = {}
	local plnum = 6
	for i =1,plnum do
		players[i] = strcard(deal[i]) .. " " .. strcard(deal[i+plnum])
		print("player" .. i .. ":" .. players[i])
	end
	local str = "board: "
	for i=1,5 do
		str = str .. strcard(deal[i+2*plnum]) .. " "
	end
	print(str)
end

init()
shuff()
out()

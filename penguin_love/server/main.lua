require "LUBE"
require "console"

function onConnect(ip, port)
  	mPrint("Connection from " .. ip)
end
function onReceive(data, ip, port)
  	mPrint(ip .. ' ' .. data)
end
function onDisconnect(ip, port)
  	mPrint("Disconnection from " .. ip)
end

server = lube.server(18025)
server:setCallback(onReceive, onConnect, onDisconnect)
server:setHandshake("penguin")


function love.update(dt)
  	server:update(dt)
end

function love.draw()
	drawMessages()
end		
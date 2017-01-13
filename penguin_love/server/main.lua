require "LUBE"
require "console"

sock = require "sock.sock"
bitser = require "sock.spec.bitser"

-- users

function love.load()
    server = sock.newServer()
    server:setSerialization(bitser.dumps, bitser.loads)

    server:on("connect", function(data, client)
        mPrint("Connection from " .. tostring(client:getAddress()) .. " (" .. client:getConnectId() .. ")")
        server:sendToAllBut(client, "player_join", {
            ["ip"]=client:getAddress(),
            ["connectid"]=client:getConnectId()
        })
    end)
    
    server:on("broadcast", function(data, client)
        mPrint("broadcast: " .. data.msg_type)
        local msg_type = data.msg_type
        data.msg_type = nil
        server:sendToAllBut(client, msg_type, data)
    end)
end

function love.update(dt)
  	server:update()
end

function love.draw()
	drawMessages()
end		
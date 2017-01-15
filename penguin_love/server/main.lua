require "LUBE"
require "console"

sock = require "sock.sock"
bitser = require "sock.spec.bitser"

msg_count = 0

function msg(content)
    msg_count = msg_count + 1
    if msg_count > 9 then msg_count = 0 end
    mPrint(tostring(msg_count) .. " " .. content)
end

function love.load()
    server = sock.newServer()
    server:setSerialization(bitser.dumps, bitser.loads)

    server:on("connect", function(data, client)
        msg("Connection from " .. tostring(client:getAddress()) .. " (" .. client:getConnectId() .. ")")
                
        server:sendToAllBut(client, "player_join", {
            ["ip"]=client:getAddress(),
            ["connectid"]=client:getConnectId()
        })
    end)
    
    server:on("disconnect", function(client)
        
    end)
    
    server:on("broadcast", function(data, client)
        msg("broadcast: " .. data.msg_type)
        local msg_type = data.msg_type
        data.msg_type = nil
        
        if msg_type == "player_leave" then
            msg("Disconnection" .. tostring(client:getAddress()) .. " (" .. client:getConnectId() .. ")")
        end
        
        server:sendToAllBut(client, msg_type, data)
    end)
end

function love.update(dt)
  	server:update()
end

function love.draw()
	drawMessages()
end		

-- call tmrw: cmpe gateway req
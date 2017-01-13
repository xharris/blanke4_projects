--[[
	Play state code
]]--

local Play = {}

local camera
local cam_angle = 0
local world = {}

local level_offset = {
    ['x'] = 0,
    ['y'] = 100
}
local level_height = 1

local client

penguins = {}
tiles = {}
frags = {}

kill_wall_v = 0 -- 1.1
kill_wall = HC.rectangle(level_offset.x, -1000000, 1, 2000000)
kill_wall.type = "kill_wall"
HC.register(kill_wall)

-- returns x,y coords from a mapdata index
function calcMapPos(index, layer)
   	local x, y
    l_width = layer.width
    l_height = layer.height
    
    x = index % layer.width
    y = math.floor(index / layer.width)
    
    return x, y
end

function load_level(name)
    map = require("assets.levels." .. name)
    
    -- get offset markers
    player_spawn = {}
    l_start = {}
    l_end = {}
    l_tiles = {}
    for o, layer in pairs(map.layers) do
        if layer.name == "markers" then
            for m, mark in pairs(layer.objects) do
                if mark.name == "start" then
                    l_start = {
                        ['x']=mark.x,
                        ['y']=mark.y
                    }
                end            
                if mark.name == "end" then
                    l_end = {
                        ['x']=mark.x,
                        ['y']=mark.y
                    }
                end
            end
        end
        
        if layer.name == "tiles" then
            l_tiles = layer
        end
    end
    
    -- load tiles
    for t, tile in pairs(l_tiles.data) do
        if tile ~= 0 then
            x, y = calcMapPos(t, l_tiles)
            table.insert(tiles, Ground(x*32 + level_offset.x - l_start.x, y*32 + level_offset.y - l_start.y, tile, map))
        end
    end

    -- reload map with new offset
    level_offset.x = level_offset.x + (l_end.x - l_start.x)
    level_offset.y = level_offset.y + (l_end.y - l_start.y)
end

-- Called once, and only once, before entering the state the first time.
function Play:init()

end

-- Called every time when entering the state.
function Play:enter(previous)
    love.graphics.setBackgroundColor(224, 247, 250)
	new_player = Player()
    
    -- networking stuff
    client = sock.newClient()
    client:setSerialization(bitser.dumps, bitser.loads)
    
    client:on("connect", function()
        print("connected to server")
    	client:send("broadcast", {
            ["msg_type"]="add_penguin",
            ["id"]=client:getConnectId(),
            ["color"]=new_player.penguin.color,
            ["x"]=new_player.penguin.x,
            ["y"]=new_player.penguin.y
        }) 
   	end)
    
    client:on("player_join", function(player)
        print("new player: " .. player.connectid)
    end)
    
    -- new player has joined server
    client:on("add_penguin", function(info)
        print("add penguin: " .. tostring(info.id) .. " x=" .. tostring(info.x) .. " y=" .. tostring(info.y) .. 
                " color=" .. tostring(info.color[1]) .. ',' .. tostring(info.color[2]) .. ',' .. tostring(info.color[3]))
            
        local cam_x, cam_y = camera:position()
        local new_penguin = Penguin(info.x - cam_x, info.y - cam_y)
        new_penguin.color = info.color
        table[tostring(info.id)] = new_penguin
   	end)
    
    client:connect()
    

    camera = Camera(new_player.x, new_player.y, 1, math.rad(cam_angle))
    
    --load_level("test2")
    load_level("test")
    load_level("1")
    load_level("test")
end 

function Play:update(dt)
    client:update()
    
	new_player:update(dt)
    camera:lookAt(new_player.x, new_player.y)
    
    for m, map in pairs(world) do
        map:update()
    end
    
    if kill_wall ~= nil then    
    	kill_wall:move(kill_wall_v, 0)
        
        local kill_wall_collisions = HC.collisions(kill_wall)
        -- colliding with ground
        for other, seperating_vector in pairs(kill_wall_collisions) do
            if other.type == "ground" then
                other.parent:fragment()
            end
            
            if other.type == "frag" then
               	other.parent.hit = true 
            end
        end
    end 
end	

function Play:draw()
    camera:attach()  
    for p, peng in pairs(penguins) do
       	peng:draw() 
    end
    for t, tile in pairs(tiles) do
	 	tile:draw()
    end
    camera:detach()
    

   	new_player:draw() 
end

function Player:quit()
   	client:disconnect() 
end

return Play
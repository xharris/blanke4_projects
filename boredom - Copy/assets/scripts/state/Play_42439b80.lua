--[[
	Play state code
]]--

local sb_ground
local coll_ground = {}

local player
local camera

function load_level(name)
	local data = require('assets.levels.' .. name)
    local img_ground = assets:img_ground()
    
    for it, t in pairs(data.layers) do
        -- load ground tiles
       	if t.name == "ground" or t.name == "groundxoff" or t.name == "groundyoff" then
           	for id, d in pairs(t.data) do
            	if d > 0 then
                   	local x = id % t.width * 32 - 32 + t.offsetx
                    local y = math.floor(id / t.width) * 32 + t.offsety
                    
                    d = d - 1
                    local img_x = d % 4 * 33
                    local img_y = math.floor(d / 4) * 33
                    
                    local quad = love.graphics.newQuad(img_x, img_y, 33, 33, img_ground:getWidth(), img_ground:getHeight())
                    sb_ground:add(quad, x, y)
                end
            end
        end
        
        -- ground collision boxes
		if t.name == "collision" then
           	for io, o in pairs(t.objects) do
                local args = {}
               	for ip, p in pairs(o.polyline) do
                    if ip < #o.polyline then
                        table.insert(args, p.x + o.x)
                        table.insert(args, p.y + o.y) 
                    end
                end
                local new_poly = HC.polygon(unpack(args))
                new_poly.type = "ground"
                table.insert(coll_ground, new_poly)
            end
        end
        
        -- spawn the player
        if t.name == "player" then
           	for io, o in pairs(t.objects) do
               	player = Player(o.x, o.y) 
            end
        end
    end
end

local Play = {}

-- Called once, and only once, before entering the state the first time.
function Play:init()

end

-- Called every time when entering the state.
function Play:enter(previous)
    love.graphics.setBackgroundColor(255, 255, 255)
    
    sb_ground = love.graphics.newSpriteBatch(assets:img_ground())
    
	load_level('level1')
    camera = Camera(player.x, player.y)
end

function Play:leave()

end 

function Play:update(dt)
    player:update(dt)
    camera:lookAt(player.x, player.y)
end

function Play:draw()
    camera:attach()
    player:draw() 
	love.graphics.draw(sb_ground)
    
    -- draw ground hitboxes
    if false then
        love.graphics.setColor(255, 0, 0)
        for ic, c in pairs(coll_ground) do
            c:draw('line') 
        end
    end
    
    camera:detach()
    
    love.graphics.setColor(255, 255, 255)
end	

return Play


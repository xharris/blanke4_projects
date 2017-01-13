--[[
	Play state code
]]--

local Play = {}

local img_ground
local sb_ground

local coll_ground = {}
local entities = {}

local collider

-- Called once, and only once, before entering the state the first time.
function Play:init()
	collider = HC.new()
end

-- Called every time when entering the state.
function Play:enter(previous)
	love.graphics.setBackgroundColor(255,255,255)
    
    -- setup ground spritebatch
    img_ground = assets:img_ground()
    sb_ground = love.graphics.newSpriteBatch(img_ground)
        
    level = load_level('level1')
end

function Play:leave()

end 

function Play:update(dt)
    for ie, e in pairs(entities) do
       	e:update(dt) 
    end
end

function Play:draw()
    for ie, e in pairs(entities) do
       	e:draw()
    end
    
	love.graphics.draw(sb_ground)
    
    love.graphics.setColor(255,0,0)
    for icg, cg in pairs(coll_ground) do
       	cg:draw('line') 
    end
    love.graphics.setColor(255,255,255)
end	

function load_level(level_name)
    map = love.filesystem.load('/assets/levels/' .. level_name .. '.lua')()
       
    for il, l in pairs(map.layers) do
        -- add ground tiles to spritebatch
    	if l.name == "ground" then            
        	for it, t in pairs(l.data) do
                if t > 0 then
                    x = it % l.width
                    y = math.floor(it / l.width)
                    
                    t = t - 1
                    fx = t % 4
                    fy = math.floor(t / 4)

                    quad = love.graphics.newQuad(fx * 33, fy * 33, 33, 33, img_ground:getWidth(), img_ground:getHeight())
               		sb_ground:add(quad, x * 32, y * 32)
                end
            end
        end
        
        -- ground collision polygons
        if l.name == "collision" then
            for io, o in pairs(l.objects) do
                
				local coords = {}
               	for ip, p in pairs(o.polyline) do
                    if (ip < #o.polyline) then
                        -- 32 and 1 are weird offsets that needed to be set
                        table.insert(coords, p.x + o.x + 32)
                        table.insert(coords, p.y + o.y + 1)
                    end
                end
                
                local new_poly = collider:polygon(unpack(coords))
                new_poly.type = "ground"
                collider:register(new_poly)
               	table.insert(coll_ground, new_poly)
            end
        end
        
        -- spawn player
        if l.name == "player" then
           	local x = l.objects[1].x
            local y = l.objects[1].y
            
            table.insert(entities, Player(x, y))
        end
    end
end

return Play
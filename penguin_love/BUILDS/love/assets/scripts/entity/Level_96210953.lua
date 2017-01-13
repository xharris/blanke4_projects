--[[
	Level entity class
]]--

Level = Class{} 

local level_offset = {
    ['x'] = 0,
    ['y'] = 0
}

function Level:init(level_id)
    self.tiles = {}
    self.frags = {}
    
    self.kill_wall_v = 0 --1.1
    self.kill_wall = HC.rectangle(level_offset.x, 0, 1, 400)
    self.kill_wall.type = "kill_wall"
    HC.register(self.kill_wall)
   
    self.map = sti("assets/levels/" .. level_id .. ".lua", level_offset.x, level_offset.y)
    
    -- get player spawn
    self.player_spawn = {}
    for k, object in pairs(self.map.objects) do
        print("NEW -------")
       	if object.name == "player_spawn" then
           	self.player_spawn = {
             	['x']=object.x,
                ['y']=object.y
            }
        end
    end
    
    Signal.register('love.update', function(dt) self:update(dt) end)
end

function Level:update(dt)
    self.map:update(dt)
    
	self.kill_wall:move(self.kill_wall_v, 0)
    
    local kill_wall_collisions = HC.collisions(self.kill_wall)
    -- colliding with ground
    for other, seperating_vector in pairs(kill_wall_collisions) do
        if other.type == "ground" then
            table.insert(self.frags, other.parent:fragment())
        end
        
        if other.type == "frag" then
           	other.parent.hit = true 
        end
    end
end

function Level:draw() 
    self.kill_wall:draw('line')
    
 	self.map:draw()
end

return Level
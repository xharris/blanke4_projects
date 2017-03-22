--[[
	state0 state code
]]--

local state0 = {}

local map_lvl1
local player

-- Called once, and only once, before entering the state the first time.
function state0:init()

end

-- Called every time when entering the state.
function state0:enter(previous)
    love.graphics.setBackgroundColor(255,255,255)
        
    map_lvl1 = Map("assets.levels.level1-csv")
    
    player_data = map_lvl1:getEntity("ent_penguin", "player")
    player = ent_penguin(player_data.x, player_data.y)
end

function state0:leave()

end 

function state0:update(dt)
    player:update(dt)
    map_lvl1:update(dt)
end	

function state0:draw()
    player:draw()
    map_lvl1:draw()
end	

return state0
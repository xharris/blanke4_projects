--[[
	state0 state code
]]--

local state0 = {}

local map_lvl1
local ent_player
local snd_beat2

-- Called once, and only once, before entering the state the first time.
function state0:init()
	
end

-- Called every time when entering the state.
function state0:enter(previous)
    love.graphics.setBackgroundColor(255,255,255)
        
    map_lvl1 = Map("assets.levels.level1-csv")
    
    player_data = map_lvl1:getEntity("player")
    ent_player = player(player_data.x, player_data.y)
end

function state0:leave()

end 

function state0:update(dt)
    ent_player:update(dt)
    map_lvl1:update(dt)
end	

function state0:draw()
    ent_player:draw()
    map_lvl1:draw()
    
    love.graphics.setColor(255,0,0)
    map_lvl1:debugCollision()
    love.graphics.setColor(255,255,255)
end	

return state0
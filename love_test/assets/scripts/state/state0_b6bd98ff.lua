--[[
	state0 state code
]]--

local state0 = {}

-- Called once, and only once, before entering the state the first time.
function state0:init()
    love.graphics.setBackgroundColor(255,255,255)
	self.ent = entity1()
end

-- Called every time when entering the state.
function state0:enter(previous)

end

function state0:leave()

end 

function state0:update(dt)
	self.ent:update(dt)
end

function state0:draw()
	self.ent:draw()
end	

return state0
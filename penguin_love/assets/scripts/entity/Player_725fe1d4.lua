--[[
	Player entity class
]]--

Player = Class{} 

function Player:init()
    self.is_net_player = false
    
    self.x = 100
    self.y = 100
    self.angle = 0
    
    self.debug = true --false
    
	self.penguin = Penguin(self.x, self.y)
    self.body = HC.circle(self.x, self.y, 12)
    self.feet = HC.rectangle(self.x + 12, self.y - 2, 8, 1)
    
    self.dx = 0
    self.dy = 0.1
    
    self.vx = 1
    self.jump_power = 100
    self.GRAVITY = 2-- 8.5
    self.gravity = 0
    self.can_jump = false
    self.on_floor = false
    
    HC.register(self.body)
end

function Player:keypressed(key)
    -- networking events
    if key == "left" or key == "right" or key == "up" then
        self:net_update()
    end
end

function Player:keyreleased(key)    
    -- networking events
    if key == "left" or key == "right" or key == "up" then
        self:net_update()
    end
end

function Player:net_update()
    if not self.is_net_player then
    	Signal.emit("player_move", self.x, self.y, self.dx, self.dy)
    end
end

function Player:jump()
    self.dy = -self.jump_power
    self.can_jump = false
    self:net_update()
end

function Player:convertNetPlayer()
    self.is_net_player = true 
end

function Player:update(dt)
    local body_collisions = HC.collisions(self.body)
    local feet_collisions = HC.collisions(self.feet)
    
    -- jumping
    if love.keyboard.isDown('up') and self.dy == 0 then
        self:jump()
    end
    
    -- colliding with ground
    local ground_r = false
    local ground_l = false
    local ground_d = false
    
    local ground_top = nil
    
    for other, seperating_vector in pairs(body_collisions) do
        self_left, self_top, self_right, self_bottom = self.body:bbox()
        other_left, other_top, other_right, other_bottom = other:bbox()
        
        if other.type == "ground" then
            if self_right >= other_left and self_bottom > other_top and self_top < other_bottom then ground_r = true end
            if self_left <= other_right and self_bottom > other_top and self_top < other_bottom then ground_l = true end
            if self_bottom > other_top and self_left + self.vx < other_right and self_right - self.vx > other_left then
                ground_d = true 
                ground_top = other_top
            end
        end  
    end
    
    -- left/right movement
    local dx_add = 0
    if love.keyboard.isDown('left') then
        dx_add = dx_add - self.vx
    end
    if love.keyboard.isDown('right') then
        dx_add = dx_add + self.vx
    end
    self.dx = dx_add
    
    if ground_r then
        self.dx = -dx_add
    end
    if ground_l then
        self.dx = -dx_add
    end
    self.body:move(self.dx, 0)
    
    -- gravity
    if self.dy ~= 0 then
        self.body:move(0, self.dy * dt)
        self.dy = self.dy + 200 * dt
    end
    if ground_d then
        self.body:moveTo(self.x, ground_top - 12)
        self.dy = 0
    end
    
    
	self.x, self.y = self.body:center()  
    self.y = self.y - 20
end

function Player:draw()
    if self.debug then
        -- draw penguin hitbox
        love.graphics.setColor(255,0,0)
        love.graphics.print(tostring(jump_timer) .. " " .. tostring(self.dy) .. " " .. tostring(self.on_floor) .. " " .. tostring(self.can_jump), 20, 20)
        self.body:draw('line')
        self.feet:draw('line')
        love.graphics.setColor(255,255,255)
    end
    
    if love.keyboard.isDown("left") then
        self.penguin.xscale = -1
    end
    if love.keyboard.isDown("right") then
    	self.penguin.xscale = 1
    end
    
    if not self.is_net_player then
        self.penguin.x = self.x -- love.graphics.getWidth()/2
        self.penguin.y = self.y -- love.graphics.getHeight()/2
    else
       	self.penguin.x = self.x
        self.penguin.y = self.y
    end
    self.penguin.angle = self.angle
    self.penguin:draw()
end

return Player
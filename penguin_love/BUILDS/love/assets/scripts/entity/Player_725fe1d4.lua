--[[
	Player entity class
]]--

Player = Class{} 

function Player:init()
    self.is_net_player = false
    
    self.x = 150
    self.y = 100
    self.angle = 0
    
    self.debug = false
    
	self.penguin = Penguin(self.x, self.y)
    self.body = HC.circle(self.x, self.y, 12)
    self.feet = HC.rectangle(self.x + 10, self.y, 10, 8)
    
    self.dx = 0
    self.dy = 0
    
    self.vx = 2
    self.jump_power = 5
    self.GRAVITY = 8.5
    self.gravity = 0
    self.can_jump = false
    
    HC.register(self.body)
end

function Player:keypressed(key)
    -- left/right movement
    if key == "left" then
        self.dx = -self.vx
    end
    if key == "right" then
        self.dx = self.vx
    end

    -- networking events
    if key == "left" or key == "right" or key == "up" then
        self:net_update()
    end
end

function Player:keyreleased(key)
    -- left/right movement
    if key == "left" or key == "right" then
        self.dx = 0
    end
    
    -- jumping
    if key == "up" and self.can_jump then
        self:jump()
    end

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
    
    self.body:move(self.dx, 0)
       
   	-- gravity    
    self.dy = self.dy + (self.gravity * dt)
    
    self.feet:moveTo(self.x, self.y + 34 + self.dy)
    
    -- colliding with ground
    for other, seperating_vector in pairs(body_collisions) do
        if other.type == "ground" then
    		self.body:move(seperating_vector.x, seperating_vector.y)
        end
        
        self_left, self_top, self_right, self_bottom = self.body:bbox()
        other_left, other_top, other_right, other_bottom = other:bbox()
        if other.type == "ground" then
            if other_top >= self_bottom then
                self.dy = 0
                self.gravity = 0
            elseif other_bottom <= self_top then
               	self.dy = 0 
            end
        else
           self.gravity = self.GRAVITY 
        end
    end	
    
    for other, seperating_vector in pairs(feet_collisions) do
        if other.type == "ground" and math.abs(self.dy) < 1 then
           self.can_jump = true 
        end
    end
    
    self.body:move(0, self.dy)
	self.x, self.y = self.body:center()
    
    self.y = self.y - 20
end

function Player:draw()
    if self.debug then
        -- draw penguin hitbox
        love.graphics.setColor(255,0,0)
        love.graphics.print(tostring(self.gravity) .. " " .. tostring(self.dy) .. " " .. tostring(self.can_jump), 20, 20)
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
        self.penguin.x = love.graphics.getWidth()/2--self.x
        self.penguin.y = love.graphics.getHeight()/2--self.y
    else
       	self.penguin.x = self.x
        self.penguin.y = self.y
    end
    self.penguin.angle = self.angle
    self.penguin:draw()
end

return Player
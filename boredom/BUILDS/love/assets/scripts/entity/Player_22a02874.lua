--[[
	Player entity class
]]--

Player = Class{} 

function Player:init(x, y)
    self.x = x
    self.y = y
    
    self.dx = 2
    self.jump_power = 5
    self.GRAVITY = 8.5
    self.dy = 0
    self.gravity = 0
    self.can_jump = true
    
    self.body = HC.rectangle(self.x,self.y,18,35)
    self.head = HC.rectangle(14,0,6,1)
    self.feet = HC.rectangle(14,33,6,1)
    
	self.img_stand = assets:img_player_stand()
    self.img_walk = assets:img_player_walk()
   	self.spr_walk = assets:spr_player_walk()
    
    self.anim = anim8.newAnimation(self.spr_walk('1-2',1), 0.1)
    
    self.debug = true
end

function Player:update(dt)
    self.anim:update(dt)
        
    local body_collisions = HC.collisions(self.body)
    local feet_collisions = HC.collisions(self.feet)

    -- left/right movement
    if love.keyboard.isDown("left") then
        self.body:move(-self.dx, 0)
    end
    if love.keyboard.isDown("right") then
        self.body:move(self.dx, 0)
    end

    -- gravity    
    self.dy = self.dy + (self.gravity * dt)
    self.gravity = self.GRAVITY 

    -- body collisions
    for other, seperating_vector in pairs(body_collisions) do
        if other.type == "ground" then
            self.body:move(seperating_vector.x, seperating_vector.y)
        end        
    end 
    
    -- head collisions
    if math.abs(self.dy) > 0 then
    	local head_collisions = HC.collisions(self.head)
        for other, seperating_vector in pairs(head_collisions) do
            if other.type == "ground" then
                self.dy = 0.25
            end
        end
    end

    -- feet collisions
    for other, seperating_vector in pairs(feet_collisions) do
        if other.type == "ground" and math.abs(self.dy) < 1 then
           self.can_jump = true 
        end
        if other.type == "ground" then
            self.dy = 0
            self.gravity = 0
        end
    end
    
    -- jumping
    if love.keyboard.isDown("up") and self.can_jump then
        
        self.dy = -self.jump_power
        self.can_jump = false
    end

    self.body:move(0, self.dy)
    self.x, self.y = self.body:center()

    self.x = self.x - 9
    self.y = self.y - 16
    
    self.head:moveTo(self.x + 9, self.y - 2)
    self.feet:moveTo(self.x + 9, self.y + 34)
end

function Player:draw()
	self.anim:draw(self.img_walk, self.x, self.y)
    
    if self.debug then
        love.graphics.setColor(255, 0, 0)
        self.body:draw('line')
        love.graphics.setColor(0, 255, 0)
        if math.abs(self.dy) > 0 then
        	self.head:draw('line')
        end
        self.feet:draw('line')
        love.graphics.print(tostring(self.can_jump) .. ' ' .. tostring(vx) .. ' ' .. tostring(vy), 5, 5)
        love.graphics.setColor(255, 255, 255)
    end
end

return Player
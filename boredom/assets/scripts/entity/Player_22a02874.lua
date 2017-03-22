--[[
	Player entity class
]]--

Player = Class{} 
Player:include(_Entity)

function Player:init(x, y)
    self.x = x
    self.y = y
    
    self.DX = 2
    self.JUMP_POWER = 6
    self.GRAVITY = 0.20
    self.can_jump = true
    
    self:addAnimation("stand", "img_player_stand")
    self:addAnimation("walk", "spr_player_walk", {'1-2',1}, 0.1)
    self:addAnimation("fall", "spr_player_walk", {2,1}, 1)
    
    self.sprite_index = "stand"
    
    self.body = HC.rectangle(self.x,self.y,18,35)
    self.head = HC.rectangle(14,0,6,1)
    self.feet = HC.rectangle(10,33,10,1)

    self.debug = false
end

function Player:preUpdate(dt)
    -- animation
    if love.keyboard.isDown("left") or love.keyboard.isDown("right") then
	    -- walk on ground
    	if self.can_jump then
           self.sprite_index = "walk" 
        -- falling
        else 
            self.sprite_index = "fall"
        end
    else
    	-- falling
        if math.abs(self.vspeed) ~= 0 then
        	self.sprite_index = "fall"
        else
            self.sprite_index = "stand"
        end
        
        self.hspeed = 0
    end
    
    local body_collisions = HC.neighbors(self.body)
    local feet_collisions = HC.collisions(self.feet)
    
    -- gravity    
    self.gravity = self.GRAVITY
    self.gravity_direction = 90
    
    -- left/right movement    
    if love.keyboard.isDown("left") then
        self.sprite_xscale = -1
        self.sprite_xoffset = self.sprite_width
        self.hspeed = -self.DX
    end
    if love.keyboard.isDown("right") then
        self.sprite_xscale = 1
        self.sprite_xoffset = 0
        self.hspeed = self.DX
    end
    self.body:move(self.hspeed, 0)
    
    -- body collisions
    for other, seperating_vector in pairs(body_collisions) do
        if other.type == "ground" then
            self.body:move(seperating_vector.x, seperating_vector.y)
            if math.abs(seperating_vector.x) > 0 then
                self.hspeed = 0
            end
        end        
    end
    
    -- head collisions
    if math.abs(self.vspeed) > 0 then
    	local head_collisions = HC.collisions(self.head)
        for other, seperating_vector in pairs(head_collisions) do
            if other.type == "ground" then
                self.vspeed = 0.25
            end
        end
    end
    
	-- feet collisions
    for other, seperating_vector in pairs(feet_collisions) do
        if other.type == "ground" and math.abs(self.vspeed) < 1 then
           self.can_jump = true 
        end
        if other.type == "ground" then
            self.vspeed = 0
            self.gravity = 0
        end
    end
    
    -- jumping
    if love.keyboard.isDown("up") and self.can_jump then
        self.vspeed = -self.JUMP_POWER
        self.can_jump = false
    end
    

end

function Player:postUpdate(dt)
    self.body:move(0, self.vspeed)
    self.x, self.y = self.body:center()

    self.x = self.x - 9
    self.y = self.y - 16

    self.head:moveTo(self.x + 9, self.y - 2)
    self.feet:moveTo(self.x + 9, self.y + 34)
end

function Player:preDraw()
    if self.debug then
    	love.graphics.setColor(255, 0, 0)
        self.body:draw('line')
        love.graphics.setColor(0, 255, 0)
        if math.abs(self.vspeed) > 0 then
            self.head:draw('line')
        end
        self.feet:draw('line')
        love.graphics.setColor(255, 255, 255)
    end 
end

return Player
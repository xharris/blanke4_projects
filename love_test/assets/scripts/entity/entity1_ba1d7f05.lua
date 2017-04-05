--[[
	player entity class
]]--

player = Class{}

function player:init(x, y) 
	self:include(_Entity)
    
    self.x = x
    self.y = y
    
    self:addShape("main", "rectangle", {0, 0, 32, 32})
    self:setMainShape("main")
    
	self:addAnimation('walk', 'spr_penguin_walk', {'1-2', 1}, 0.4)
    self.sprite_index = "walk"
    
    self.friction = 0.05
    self.gravity_direction = 90
    self.gravity = 0.5
    
    self.move_speed = 60    
    self.can_jump = true
    self.jump_power = 200
    
    self.onCollision["ground"] = function(other, sep_vector)
        -- floor collision
        if sep_vector.y < 0 then
			self:collisionStopY()
            self.can_jump = true
        end
        -- ceiling collision
        if sep_vector.y > 0 then
           	self:collisionStopY()
        end
        -- horizontal collision
        if math.abs(sep_vector.x) > 0 then
           	self:collisionStopX() 
        end
	end
end

function player:preUpdate(dt)
    local k_right = love.keyboard.isDown("right")
    local k_left = love.keyboard.isDown("left")
    local k_up = love.keyboard.isDown("up")
    
    -- horizontal movement
	if k_right or k_left then
        if k_left then
	    	self.hspeed = -self.move_speed    
        end
        if k_right then
           	self.hspeed = self.move_speed 
        end
    else
       	self.hspeed = 0 
    end
    
    -- jumping
    if k_up and self.can_jump then
        self.vspeed = -self.jump_power
        self.can_jump = false
    end	
end	

function player:preDraw()
	self.sprite_xoffset = self.sprite_width / 2
    self.sprite_yoffset = self.sprite_height / 2
end

function player:postDraw()
    love.graphics.setColor(255,0,0)
	self:debugCollision()
    love.graphics.setColor(0,0,0)
end

return player
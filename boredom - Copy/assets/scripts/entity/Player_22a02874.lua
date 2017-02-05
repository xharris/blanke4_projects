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
    self.feet = HC.rectangle(10,33,10,1)
    
	self.img_stand = assets:img_player_stand()
    self.img_walk = assets:img_player_walk()
   	self.spr_walk = assets:spr_player_walk()
    
    self.anim_walk = anim8.newAnimation(self.spr_walk('1-2',1), 0.1)

    self.anim_state = "walk"
    
    self.xscale = 1
    
    self.debug = false
end

function Player:update(dt)
    -- animation
    if love.keyboard.isDown("left") or love.keyboard.isDown("right") then
	    -- walk on ground
    	if self.can_jump then
           self.anim_state = "walk" 
        -- falling
        else 
            self.anim_state = "fall"
        end
    else
    	-- falling
        if math.abs(self.dy) ~= 0 then
        	self.anim_state = "fall"
        else
            self.anim_state = "stand"
        end
    end
    
    if self.anim_state == "walk" then
	    self.anim_walk:update(dt)
    end
    
        
    local body_collisions = HC.collisions(self.body)
    local feet_collisions = HC.collisions(self.feet)

    -- gravity    
    self.dy = self.dy + (self.gravity * dt)
    self.gravity = self.GRAVITY 

    -- left/right movement    
    if love.keyboard.isDown("left") then
        self.xscale = -1
        self.body:move(-self.dx, 0)
    end
    if love.keyboard.isDown("right") then
        self.xscale = 1
        self.body:move(self.dx, 0)
    end
    
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
    local drawx = self.x
    local drawy = self.y
    
    -- flip offset
    local flip_offx = 0
    if self.xscale == -1 then
       	flip_offx = 16
    end
    
    -- draw animation
    if self.anim_state == "walk" then
        self.anim_walk:resume()
		self.anim_walk:draw(self.img_walk, drawx, drawy, 0, self.xscale, 1, flip_offx)
    elseif self.anim_state == "fall" then
        self.anim_walk:pauseAtEnd()
		self.anim_walk:draw(self.img_walk, drawx, drawy, 0, self.xscale, 1, flip_offx)
    elseif self.anim_state == "stand" then
        love.graphics.draw(self.img_stand, drawx, drawy, 0, self.xscale, 1, flip_offx)
    end
        
    
    if self.debug then
        love.graphics.setColor(255, 0, 0)
        love.graphics.print(self.anim_state, 20, 20)
        self.body:draw('line')
        love.graphics.setColor(0, 255, 0)
        if math.abs(self.dy) > 0 then
        	self.head:draw('line')
        end
        self.feet:draw('line')
        love.graphics.setColor(255, 255, 255)
    end
end

return Player
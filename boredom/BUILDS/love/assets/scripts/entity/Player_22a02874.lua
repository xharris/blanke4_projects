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
    self.body = HC.circle(5,5,20)
    self.feet = HC.rectangle(5,5,20,20)
    
	self.img_stand = assets:img_player_stand()
    self.img_walk = assets:img_player_walk()
   	self.spr_walk = assets:spr_player_walk()
    
    self.anim = anim8.newAnimation(self.spr_walk('1-2',1), 0.1)
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

    -- jumping
    if love.keyboard.isDown("up") and self.can_jump then
        self.dy = -self.jump_power
        self.can_jump = false
    end

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
	self.anim:draw(self.img_walk, self.x, self.y)
end

return Player
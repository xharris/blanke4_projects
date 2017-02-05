--[[
	entity1 entity class
]]--

entity1 = Class{}
entity1:include(_Entity)

function entity1:init() 
	self:addAnimation('walk', 'spritesheet0', '1-2', 1, 0.4)
    self.sprite_index = "walk"
    
    self.x = love.graphics.getWidth()/2
    self.y = love.graphics.getHeight()/2
    
    self.direction = -90
    self.friction = 0.05
    self.gravity_direction = 90
end

function entity1:preUpdate(dt) 
    self.gravity = 7
    if love.keyboard.isDown('up') then
       	self.vspeed = -100
        self.gravity = 0
    end
    
    if love.keyboard.isDown('left') then
        self.direction = self.direction - 1
    end
    if love.keyboard.isDown('right') then
       	self.direction = self.direction + 1
    end
    
    self.sprite_angle = self.direction + 90
end

function entity1:postUpdate(dt)

end	

function entity1:preDraw()
	self.sprite_xoffset = self.sprite_width / 2
    self.sprite_yoffset = self.sprite_height / 2
    
    love.graphics.setColor(255,0,0)
    self:debugDraw()
    love.graphics.setColor(255,255,255)
end

function entity1:postDraw()

end

return entity1
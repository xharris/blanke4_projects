--[[
	entity1 entity class
]]--

entity1 = Class{}
entity1:include(_Entity)

function entity1:init() 
	self:addAnimation('walk', 'spritesheet0', {'1-2', 1}, 0.4)
    self.sprite_index = "walk"
    
    self.x = love.graphics.getWidth()/2
    self.y = love.graphics.getHeight()/2
    
    self.friction = 0.05
    self.gravity_direction = 90
end

function entity1:preUpdate(dt) 
    if love.mouse.isDown(1) then
       	self:move_towards_point(love.mouse.getX(), love.mouse.getY(), 100) 
    end
    
    self.sprite_angle = self.direction + 90
end

function entity1:postUpdate(dt)

end	

function entity1:preDraw()
	self.sprite_xoffset = self.sprite_width / 2
    self.sprite_yoffset = self.sprite_height / 2
    
    --[[
    love.graphics.setColor(255,0,0)
    self:debugDraw()
    love.graphics.setColor(255,255,255)
    ]]--
end

function entity1:postDraw()

end

return entity1
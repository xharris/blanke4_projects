--[[
	ent_penguin entity class
]]--

ent_penguin = Class{}

function ent_penguin:init(x, y)
    ent_penguin:include(_Entity)

    self.x = x
    self.y = y
    
    self:addShape("main", "rectangle", {0, 0, 32, 32})
    self:setMainShape("main")
    
	self:addAnimation('walk', 'spr_penguin_walk', {'1-2', 1}, 0.4)
    self.sprite_index = "walk"
    
    self.friction = 0.05
end

function ent_penguin:preUpdate(dt) 
    if love.mouse.isDown(1) then
       	self:move_towards_point(love.mouse.getX(), love.mouse.getY(), 100) 
    end
    
    self.sprite_angle = self.direction + 90
end

function ent_penguin:postUpdate(dt)

end	

function ent_penguin:preDraw()
	self.sprite_xoffset = self.sprite_width / 2
    self.sprite_yoffset = self.sprite_height / 2
    
    --[[
    love.graphics.setColor(255,0,0)
    self:debugDraw()
    love.graphics.setColor(255,255,255)
    ]]--
end

function ent_penguin:postDraw()

end

return ent_penguin
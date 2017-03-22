--[[
	ent_penguin entity class
]]--

ent_ground = Class{}

ground_index = 0

function ent_ground:init(x, y)
	self:include(_Entity) 
    
    self.x = x
    self.y = y
            
    self:addShape("main", "rectangle", {0,0,32,32}, "ground")
    self:setMainShape("main")
end

function ent_ground:preUpdate(dt)

end

function ent_ground:postUpdate(dt)

end	

function ent_ground:preDraw()
	love.graphics.setColor(255,0,0)
    self:debugSprite()
    self:debugCollision()
    love.graphics.setColor(255,255,255)
end

function ent_ground:postDraw()

end

return ent_ground
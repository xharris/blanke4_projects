--[[
	Frag entity class
]]--

Frag = Class{} 

function Frag:init(img, quad, x, y, parent)    
	self.img = img
    self.quad = quad
    self.x = x
    self.y = y
    self.parent = parent
    self.hit = false
    self.dy = 0
    self.alpha = 255
    
    self.rect = HC.rectangle(x, y, quad:getTextureDimensions())
    self.rect.type = "frag"
    self.rect.parent = self
    HC.register(self.rect)
    
    self.vx = math.random()
    self.gravity = 0.25
end

function Frag:draw()
	if self.hit then
        self.x = self.x - self.vx
        self.y = self.y + self.dy
        self.dy = self.dy + self.gravity
    end
    
    self.alpha = self.alpha - 1
    love.graphics.setColor(255,255,255,self.alpha)
	love.graphics.draw(self.img, self.quad, self.x, self.y)
    love.graphics.setColor(255,255,255,255)
end

return Frag
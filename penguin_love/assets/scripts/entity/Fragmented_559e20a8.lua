--[[
	Fragmented entity class
]]--

Fragmented = Class{} 

function Fragmented:init(x, y, img, quad)
    self.x = x
    self.y = y
    self.img = img
    self.quad = quad
    
    self.frag_w = 8
    self.frag_h = 8
    
    self.frags = {}
    
    -- break up the images
    q_x = 0
    q_y = 0
    q_w = img:getWidth()
    q_h = img:getHeight()
    
    if self.quad then
    	q_x, q_y, q_w, q_h = self.quad:getViewport()
    end

    mx = 0
    my = 0
    for fx = q_x, q_x+q_w - 1, self.frag_w do
       	for fy = q_y, q_y+q_h - 1, self.frag_h do
        	quad = love.graphics.newQuad(fx, fy, self.frag_w, self.frag_h, self.img:getDimensions())
            table.insert(self.frags, Frag(self.img, quad, self.x + mx, self.y + my))
            my = my + self.frag_h
        end
        mx = mx + self.frag_w
        my = 0
    end
end

function Fragmented:draw()
	for i_f, f in pairs(self.frags) do
    	f:draw()
        
        if f.alpha < 10 then
           	self.frags[i_f] = nil 
        end
   	end
end

return Fragmented
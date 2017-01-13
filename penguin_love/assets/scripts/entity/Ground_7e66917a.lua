--[[
	Ground entity class
]]--

Ground = Class{} 

function Ground:init(x, y, tile_index, map)   
    self.x = x
    self.y = y 
    self.frame_x = 1
    self.frame_y = 1
    
    self.frag = nil
    
    -- get the tileset
    for s, set in pairs(map.tilesets) do
       	if set.name == "g_normal" then --tile_index > map.firstgid and tile_index < map.tilecount then
            columns = set.imagewidth / set.tilewidth
            rows = set.imageheight / set.tileheight
            
            self.frame_x = tile_index % columns
            self.frame_y = math.ceil(tile_index / columns)
            
            if self.frame_x == 0 then self.frame_x = columns end
			if self.frame_y == 0 then self.frame_y = rows end                 
        end
    end
    
    self.img = assets:img_ground_norm()
    self.spr = assets:spr_ground_norm()
    self.anim = anim8.newAnimation(self.spr(self.frame_x, self.frame_y), 1)
    
    self.rect = HC.rectangle(self.x, self.y, 32, 32)
    self.rect.type = "ground"
    self.rect.parent = self
    HC.register(self.rect)
    
    self.destroyed = false
end

function Ground:fragment()
    local frame_x = (self.frame_x)*32 - 32
    local frame_y = (self.frame_y)*32 - 32

    self.frag = Fragmented(self.x, self.y, self.img, self.anim:getFrameInfo(self.frame_x, self.frame_y))
    self.destroyed = true

    HC.remove(self.rect)
end

function Ground:draw()
    if not self.destroyed then 
		self.anim:draw(self.img, self.x, self.y)
    end
    if self.frag ~= nil then
       	self.frag:draw() 
    end
end

return Ground
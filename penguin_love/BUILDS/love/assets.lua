local assets = {}

function assets:img_peng_outline()
	return love.graphics.newImage('assets/image/penguin.png');
end

function assets:img_peng_fill()
	return love.graphics.newImage('assets/image/penguin_filler.png');
end

function assets:img_ground_norm()
	return love.graphics.newImage('assets/image/ground.png');
end

function assets:spr_peng_outline()
	local img = self:img_peng_outline()
	return anim8.newGrid(32, 32, img:getWidth(), img:getHeight());
end

function assets:spr_peng_fill()
	local img = self:img_peng_fill()
	return anim8.newGrid(32, 32, img:getWidth(), img:getHeight());
end

function assets:spr_ground_norm()
	local img = self:img_ground_norm()
	return anim8.newGrid(32, 32, img:getWidth(), img:getHeight());
end



return assets
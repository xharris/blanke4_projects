local assets = {}

function assets:image0()
	return love.graphics.newImage('assets/image/penguin.png');
end

function assets:spritesheet0()
	local img = self:image0()
	return anim8.newGrid(32, 32, img:getWidth(), img:getHeight());
end



return assets
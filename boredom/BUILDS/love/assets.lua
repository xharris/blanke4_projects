local assets = {}

function assets:img_ground()
	return love.graphics.newImage('assets/image/tile_ground.png');
end

function assets:img_player_stand()
	return love.graphics.newImage('assets/image/player_stand.png');
end

function assets:img_player_walk()
	return love.graphics.newImage('assets/image/player_walk.png');
end

function assets:spr_player_walk()
	local img = self:img_player_walk()
	return anim8.newGrid(17, 33, img:getWidth(), img:getHeight());
end



return assets
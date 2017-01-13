Signal = require 'plugins.hump.signal'
Gamestate = require 'plugins.hump.gamestate'
Class = require 'plugins.hump.class'
Timer = require 'plugins.hump.timer'
Vector = require 'plugins.hump.vector'
Camera = require 'plugins.hump.camera'
anim8 = require 'plugins.anim8'
HC = require 'assets.includes.HC'
require 'assets.includes.LUBE'

sock = require 'assets.includes.sock.sock'
bitser = require 'assets.includes.sock.spec.bitser'

require "assets.includes.printr"

assets = require 'assets'

Level = require "assets/scripts/entity/Level_96210953"
Player = require "assets/scripts/entity/Player_725fe1d4"
Penguin = require "assets/scripts/entity/Penguin_57defb76"
Ground = require "assets/scripts/entity/Ground_7e66917a"
Fragmented = require "assets/scripts/entity/Fragmented_559e20a8"
Frag = require "assets/scripts/entity/Frag_fbc5e841"
Play = require "assets/scripts/state/Play_75cf7563"


function love.load()        
	-- register gamestates
	Gamestate.registerEvents()
	Gamestate.switch(Play)
    
	Signal.emit('love.load')
end

function love.update(dt)
	Signal.emit('love.update',dt)
end

function love.draw()
	Signal.emit('love.draw')
end

function love.mousepressed(x, y, button, istouch)
	Signal.emit('love.mousepressed', x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
	Signal.emit('love.mousereleased', x, y, button, istouch)
end

function love.keypressed(key)
	Signal.emit('love.keypressed', key)
end

function love.keyreleased(key)
	Signal.emit('love.keyreleased', key)
end

function love.focus(f)
	Signal.emit('love.focus', f)
end

function love.quit()
	Signal.emit('love.quit')
end

function on_collide(dt, shape_a, shape_b)
    
end
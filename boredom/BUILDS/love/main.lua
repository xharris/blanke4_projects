Signal = require 'plugins.hump.signal'
Gamestate = require 'plugins.hump.gamestate'
Class = require 'plugins.hump.class'
Timer = require 'plugins.hump.timer'
Vector = require 'plugins.hump.vector'
Camera = require 'plugins.hump.camera'
anim8 = require 'plugins.anim8'

HC = require 'assets.includes.HC'
require 'assets.includes.printr'

assets = require 'assets'

Player = require "assets/scripts/entity/Player_22a02874"
Play = require "assets/scripts/state/Play_42439b80"


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
require 'includes'


function love.load()
 	Signal.emit('love.load')
end

--[[

other love functions:
- love.update(dt)
- love.draw()
- love.mousepressed(x, y, button, istouch)
- love.mousereleased(x, y, button, istouch)
- love.keypressed(key)
- love.keyreleased(key)
- love.focus(f)
- love.quit()

]]--
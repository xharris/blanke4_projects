require 'includes'

function love.load()
	-- register gamestates
	Gamestate.registerEvents()
	Gamestate.switch(<FIRST_STATE>)
  
  	local b, c, h = http.request("api.umbc.me/v0/getAll?limit=2&startAt=AFST")
	print(b, c, h)
end
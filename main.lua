require("mainVariables")
require("playfield")

g_playfield = playfield

function love.load()
	g_playfield.setup()
end

function love.draw()

	love.graphics.clear()
	g_playfield.draw(40,100)
end
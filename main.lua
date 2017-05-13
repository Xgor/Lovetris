require("mainVariables")
require("playfield")
require("assets")
g_playfield = playfield

testdt = 0
function love.load()
	g_playfield.setup()
	assets.load()
end

function love.update(dt)
	g_playfield.update(dt) 
--	g_playfield.lineCheck()
	testdt = dt
end

function love.draw()

	love.graphics.clear()
--	love.graphics.setColor(255, 255, 255)
--	love.graphics.print(testdt,20,20)
	g_playfield.draw(40,100)
end
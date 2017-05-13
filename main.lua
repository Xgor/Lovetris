require("mainVariables")
require("playfield")
require("assets")
require("tetromino")

g_playfield = playfield



function love.load()
	g_playfield.setup()
	assets.load()

	tetroBlock = getTetromino()
end

function love.update(dt)
	g_playfield.update(dt) 
--	g_playfield.lineCheck()

end

function love.draw()
	love.graphics.clear()
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("next",20,20)
	g_playfield.draw(PLAYFIELD_XOFFSET,PLAYFIELD_YOFFSET)

	drawTetromino(tetroBlock)
end

function love.keypressed( key, scancode, isrepeat )
	if key == "r" then rotateTetromino(tetroBlock) end 

end

function drawBlock(color,x,y)
	if color == 1 then love.graphics.setColor(255, 0, 0)
	elseif color == 2 then love.graphics.setColor(0, 255, 0)
	elseif color == 3 then love.graphics.setColor(0, 0, 255)
	elseif color == 4 then love.graphics.setColor(255, 255, 0)
	elseif color == 5 then love.graphics.setColor(0, 255, 255)
	elseif color == 6 then love.graphics.setColor(255, 0, 255)
	elseif color == 7 then love.graphics.setColor(128, 128, 128)
	elseif color == -1 then love.graphics.setColor(255, 255, 255)
	else goto continue
	end	

	love.graphics.draw(assets.block,x,y)
	::continue::
end
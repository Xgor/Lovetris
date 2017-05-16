require("mainVariables")
require("playfield")
require("assets")
require("tetromino")
require("tetrominoTypes")

g_playfield = playfield


function love.load()
	currentTetromino = getNewTetromino()
	nextTetromino = getNewTetromino()

	g_playfield.setup()
	assets.load()

	


end

function love.update(dt)
	g_playfield.update(dt)
	updateTetromino(currentTetromino,dt)
--	g_playfield.lineCheck()

end

function love.draw()
	love.graphics.clear()
	love.graphics.setColor(255, 255, 255)

	g_playfield.draw(PLAYFIELD_XOFFSET,PLAYFIELD_YOFFSET)

	love.graphics.print("next",20,20)
	drawTetromino(PLAYFIELD_XOFFSET,PLAYFIELD_YOFFSET,currentTetromino)
	drawTetromino(-64,30,nextTetromino)
end

function love.keypressed( key, scancode, isrepeat )
	if key == "z" then rotateTetromino(currentTetromino) end 
	if key == "left" and 
		not checkTetrominoCollision(currentTetromino,currentTetromino.xPos-1,currentTetromino.yPos,g_playfield)
		then currentTetromino.xPos = currentTetromino.xPos -1 
	end
	if key == "right" and 
		not checkTetrominoCollision(currentTetromino,currentTetromino.xPos+1,currentTetromino.yPos,g_playfield)
		then currentTetromino.xPos = currentTetromino.xPos +1 end
--	if key == "right" then

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


function table.clone(org)
  return {table.unpack(org)}
end
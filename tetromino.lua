function getNewTetromino()
	local tetromino ={}

	tetromino.xPos =PLAYFIELD_WIDTH/2
	tetromino.yPos = 0

	local blockType = love.math.random(7)
 	tetromino.block = zTetromino
	if blockType == 1 then tetromino.block = iTetromino 
	elseif blockType == 2 then tetromino.block = oTetromino 
	elseif blockType == 3 then tetromino.block = tTetromino 
	elseif blockType == 4 then tetromino.block = jTetromino 
	elseif blockType == 5 then tetromino.block = lTetromino 
	elseif blockType == 6 then tetromino.block = sTetromino 
	else tetromino.block = zTetromino end


	return tetromino
end
	
function updateTetromino(tetromino,dt)
	TetrominoFallTimer = TetrominoFallTimer- dt

	if love.keyboard.isDown("down") and TetrominoFallTimer>MAX_FALL_SPEED then
		TetrominoFallTimer = MAX_FALL_SPEED
	end

	if TetrominoFallTimer < 0 then
		fallUpdate(tetromino)
	end


	for x = 0,3 do
		for y = 0,3 do
			if tetromino.block[x+y*4] > 0 then
				if 	playfield.blocks[xOffset+x][yOffset+y] > 0 then
					print("...")
				end
			end
		end
	end
--	if love.keyboard.isDown("left") then currentTetromino.xPos = currentTetromino.xPos -1 end
--	if love.keyboard.isDown("right") then currentTetromino.xPos = currentTetromino.xPos +1 end

end

function fallUpdate(tetromino)
	tetromino.yPos = tetromino.yPos +1
	
	TetrominoFallTimer = FALL_SPEED

	if checkTetrominoCollision(tetromino.xPos,tetromino.yPos+1,tetromino,g_playfield) then
		for x = 0,3 do
			for y = 0,3 do
			--	if 	playfield.blocks[tetromino.xPos+x][tetromino.yPos+y] > 0 then
					playfield.blocks[tetromino.xPos+x][tetromino.yPos+y] = 1
			--	end
			end
		end
		getNextTetromino()
	end

end

function checkTetrominoCollision(xOffset,yOffset,tetromino,playfield)
--	collision = false

	if xOffset <0 or xOffset>7 or yOffset>17 then
		return true
	end

	for x = 0,3 do
		for y = 0,3 do
			if tetromino.block[x+y*4] > 0 then
				if 	playfield.blocks[xOffset+x][yOffset+y] > 0 then
					return true
				end
			end
		end
	end
	return false

end

function getNextTetromino()
	currentTetromino = nextTetromino
	nextTetromino = getNewTetromino()
	currentTetromino.xPos=PLAYFIELD_WIDTH/2
end

--	0  1  2  3
--	4  5  6  7
--	8  9  10 11
--	12 13 14 15

function rotateTetromino(tetromino)
	local t

	t = tetromino.block[5]
	tetromino.block[5] = tetromino.block[6]
	tetromino.block[6] = tetromino.block[10]
	tetromino.block[10]= tetromino.block[9]
	tetromino.block[9] = t

	t = tetromino.block[1]
	tetromino.block[1]=tetromino.block[7]
	tetromino.block[7]=tetromino.block[14]
	tetromino.block[14]=tetromino.block[8]
	tetromino.block[8] = t

	t = tetromino.block[2]
	tetromino.block[2] = tetromino.block[11]
	tetromino.block[11]=tetromino.block[13]
	tetromino.block[13]=tetromino.block[4]
	tetromino.block[4] = t

--	t = tetromino.block[0]
--	tetromino.block[0] = tetromino.block[3]
--	tetromino.block[3]=tetromino.block[12]
--	tetromino.block[12]=tetromino.block[15]
--	tetromino.block[15] = t

end
--math.floor(

function drawTetromino(xOffset,yOffset,tetromino)
	for x = 0,3 do
		for y = 0,3 do
	--		love.graphics.print("Test", x, y)
	--		drawBlock(2,2,2)
			drawBlock(tetromino.block[x+y*4],xOffset+ math.floor(x+tetromino.xPos)*BLOCK_WIDTH,
				yOffset+math.floor(y+tetromino.yPos)*BLOCK_HEIGHT)
		end
	end
end


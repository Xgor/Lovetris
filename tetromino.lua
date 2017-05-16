function getNewTetromino()
	local t ={}

	t.xPos =PLAYFIELD_WIDTH/2
	t.yPos = 0

	local blockType = love.math.random(7)
 	t.block = zTetromino
	if blockType == 1 then t.block = iTetromino 
	elseif blockType == 2 then t.block = oTetromino 
	elseif blockType == 3 then t.block = tTetromino 
	elseif blockType == 4 then t.block = jTetromino 
	elseif blockType == 5 then t.block = lTetromino 
	elseif blockType == 6 then t.block = sTetromino 
	else t.block = zTetromino end
 

	return t
end
	
function updateTetromino(tetromino,dt)
	TetrominoFallTimer = TetrominoFallTimer- dt

	if love.keyboard.isDown("down") and TetrominoFallTimer>MAX_FALL_SPEED then
		TetrominoFallTimer = MAX_FALL_SPEED
	end

	if TetrominoFallTimer < 0 then
		fallUpdate(tetromino)
	end



--	if love.keyboard.isDown("left") then currentTetromino.xPos = currentTetromino.xPos -1 end
--	if love.keyboard.isDown("right") then currentTetromino.xPos = currentTetromino.xPos +1 end

end

function fallUpdate(tetromino)
	tetromino.yPos = tetromino.yPos +1
	
	TetrominoFallTimer = FALL_SPEED

	if checkTetrominoCollision(tetromino,tetromino.xPos,tetromino.yPos+1,g_playfield) then
		for x = 0,3 do
			for y = 0,3 do
				if tetromino.block[1+x+y*4] > 0 then
					playfield.blocks[tetromino.xPos+x][tetromino.yPos+y] = tetromino.block[1+x+y*4]
				end
			end
		end
		getNextTetromino()
	end
end

function checkTetrominoCollision(tetromino,xOffset,yOffset,playfield)

	local bounds={}
	bounds.xMin = 0
	bounds.xMax = 3
	bounds.yMax = 3
	for x = 0,3 do
		for y = 0,3 do
			if tetromino.block[1+x+y*4] > 0 then
				if bounds.xMin < x then bounds.xMin = x end
				if bounds.xMax > x then bounds.xMax = x end
				if bounds.yMax > y then bounds.yMax = y end
			end
		end
	end

	if xOffset <0-bounds.xMin or xOffset>7+bounds.xMax or yOffset>16+bounds.yMax then
		return true
	end

	for x = 0,3 do
		for y = 0,3 do
			if tetromino.block[1+x+y*4] > 0 then
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

--	1  2  3  4
--	5  6  7  8
--	9  10 11 12
--	13 14 15 16

function rotateTetromino(tetromino)
	local t

	t = tetromino.block[6]
	tetromino.block[6] = tetromino.block[7]
	tetromino.block[7] = tetromino.block[11]
	tetromino.block[11]= tetromino.block[10]
	tetromino.block[10] = t

	t = tetromino.block[2]
	tetromino.block[2]=tetromino.block[8]
	tetromino.block[8]=tetromino.block[15]
	tetromino.block[15]=tetromino.block[9]
	tetromino.block[9] = t

	t = tetromino.block[3]
	tetromino.block[3] = tetromino.block[12]
	tetromino.block[12]=tetromino.block[14]
	tetromino.block[14]=tetromino.block[5]
	tetromino.block[5] = t

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
			drawBlock(tetromino.block[1+x+y*4],xOffset+ math.floor(x+tetromino.xPos)*BLOCK_WIDTH,
				yOffset+math.floor(y+tetromino.yPos)*BLOCK_HEIGHT)
		end
	end
end


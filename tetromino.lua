-- tetromino = { 
--	block = {}, 
--	xPos=0,
--	yPos=0
--	xPos =PLAYFIELD_WIDTH/2,
--	yPos = PLAYFIELD_HEIGHT
-- }

function getTetromino()
	local iTetromino= {0,1,0,0,
				 	   0,1,0,0,
				 	   0,1,0,0,
				 	   0,1,0,0}

	local oTetromino = {0,0,0,0,
				  		2,2,0,0,
				  		2,2,0,0,
				  		0,0,0,0}


	local tTetromino = {0,0,0,0,
					  	3,3,3,0,
					  	0,3,0,0,
					  	0,0,0,0}


	local jTetromino = {0,0,0,0,
					  	4,4,4,0,
					  	0,0,4,0,
					  	0,0,0,0}


	local lTetromino = {0,0,0,0,
				 	 	5,5,5,0,
				 	 	5,0,0,0,
				 	 	0,0,0,0}


	local sTetromino = {0,0,0,0,
				  		0,6,6,0,
				  		6,6,0,0,
				  		0,0,0,0}


	local zTetromino = {0,0,0,0,
				 		7,7,0,0,
				 		0,7,7,0,
				 		0,0,0,0}

	local tetromino ={}

	tetromino.xPos =PLAYFIELD_WIDTH/2
	tetromino.yPos = 0

	local blockType = love.math.random(7)

	if blockType == 1 then tetromino.block = iTetromino 
	elseif blockType == 2 then tetromino.block = oTetromino 
	elseif blockType == 3 then tetromino.block = tTetromino 
	elseif blockType == 4 then tetromino.block = jTetromino 
	elseif blockType == 5 then tetromino.block = lTetromino 
	elseif blockType == 6 then tetromino.block = sTetromino 
	else tetromino.block = zTetromino end


	return tetromino
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
--
--	t = tetromino.block[0]
--	tetromino.block[0] = tetromino.block[3]
--	tetromino.block[3]=tetromino.block[12]
--	tetromino.block[12]=tetromino.block[15]
--	tetromino.block[15] = t

end

function drawTetromino(tetromino)
	for x = 0,3 do
		for y = 0,3 do
	--		love.graphics.print("Test", x, y)
	--		drawBlock(2,2,2)
			drawBlock(tetromino.block[x*4+y],PLAYFIELD_XOFFSET+ (x+tetromino.xPos)*BLOCK_WIDTH,
				PLAYFIELD_YOFFSET+(y+tetromino.yPos)*BLOCK_HEIGHT)
		end
	end
end

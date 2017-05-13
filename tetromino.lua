tetromino = { 
	block = {}, 
	xPos=0,
	yPos=0
--	xPos =PLAYFIELD_WIDTH/2,
--	yPos = PLAYFIELD_HEIGHT
}

iTetromino = tetromino
iTetromino.block = {0,0,1,0,
					0,0,1,0,
					0,0,1,0,
					0,0,1,0}

oTetromino = tetromino
oTetromino.block = {0,0,0,0,
					0,2,2,0,
					0,2,2,0,
					0,0,0,0}

tTetromino = tetromino
tTetromino.block = {0,0,0,0,
					0,3,3,3,
					0,0,3,0,
					0,0,0,0}

jTetromino = tetromino
jTetromino.block = {0,0,0,0,
					4,4,4,0,
					0,0,4,0,
					0,0,0,0}

lTetromino = tetromino
lTetromino.block = {0,0,0,0,
					0,5,5,5,
					0,5,0,0,
					0,0,0,0}

sTetromino = tetromino
sTetromino.block = {0,0,0,0,
					0,0,6,6,
					0,6,6,0,
					0,0,0,0}

zTetromino = tetromino
zTetromino.block = {0,0,0,0,
					7,7,0,0,
					0,7,7,0,
					0,0,0,0}

function tetromino.rotate()

end


function tetromino.draw()
	for x = 0,4 do
		for y = 0,4 do
	--		love.graphics.print("Test", x, y)
	--		drawBlock(2,2,2)
			drawBlock(tetromino.block[x*4+y],PLAYFIELD_XOFFSET+ (x+tetromino.xPos)*BLOCK_WIDTH,
				PLAYFIELD_YOFFSET+(y+tetromino.yPos)*BLOCK_HEIGHT)
		end
	end
end

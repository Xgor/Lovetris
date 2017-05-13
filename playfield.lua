playfield = {}
playfield.blocks ={}
playfield.destroyTimer = 0
playfield.currentTetromino = tetromino
playfield.nextTetromino = tetromino
function playfield.setup()
	for x = 0,PLAYFIELD_WIDTH do
		playfield.blocks[x] = {}
		for y = 0,PLAYFIELD_HEIGHT do
			playfield.blocks[x][y] = love.math.random(8)-1
		end
	end
end

function playfield.update(dt)
	playfield.lineCheck()
end

function playfield.lineCheck()
	local completeRow

	for y = 0,PLAYFIELD_HEIGHT do
		completeRow = true
		for x = 0,PLAYFIELD_WIDTH do
			if playfield.blocks[x][y] < 1 then 
				completeRow = false
				break
			end

		end
		if completeRow then
			for x = 0,PLAYFIELD_WIDTH do
				playfield.blocks[x][y] = -1
			end
		end
	end

	playfield.clearLines()
end

function playfield.clearLines()
--	local tempBlocks = playfield.blocks

	for y = 1,PLAYFIELD_HEIGHT do
		if playfield.blocks[0][y] < 1 then 
			for x = 0,PLAYFIELD_WIDTH do
				playfield.blocks[x][y] = playfield.blocks[x][y-1]
				playfield.blocks[x][y-1] = 0
			end
		end
	end
end

function playfield.draw(xOffset,yOffset)
	for x = 0,PLAYFIELD_WIDTH do
		for y = 0,PLAYFIELD_HEIGHT do

			drawBlock(playfield.blocks[x][y] ,xOffset+ x*BLOCK_WIDTH,yOffset+ y*BLOCK_HEIGHT)
		end
	end
end
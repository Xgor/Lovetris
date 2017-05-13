playfield = {}
playfield.blocks ={}
playfield.destroyTimer = 0
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
			if playfield.blocks[x][y] == 1 then love.graphics.setColor(255, 0, 0)
			elseif playfield.blocks[x][y] == 2 then love.graphics.setColor(0, 255, 0)
			elseif playfield.blocks[x][y] == 3 then love.graphics.setColor(0, 0, 255)
			elseif playfield.blocks[x][y] == 4 then love.graphics.setColor(255, 255, 0)
			elseif playfield.blocks[x][y] == 5 then love.graphics.setColor(0, 255, 255)
			elseif playfield.blocks[x][y] == 6 then love.graphics.setColor(255, 0, 255)
			elseif playfield.blocks[x][y] == 7 then love.graphics.setColor(128, 128, 128)
			elseif playfield.blocks[x][y] == -1 then love.graphics.setColor(255, 255, 255)
			else goto continue
			end


			love.graphics.draw(assets.block,xOffset+ x*BLOCK_WIDTH,yOffset+ y*BLOCK_HEIGHT)
			::continue::
		end
	end
end
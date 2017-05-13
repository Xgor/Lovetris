playfield = { blocks ={} }

function playfield.setup()
	for x = 0,PLAYFIELD_WIDTH do
		playfield.blocks[x] = {}
		for y = 0,PLAYFIELD_HEIGHT do
			playfield.blocks[x][y] = love.math.random(3)-1
		end
	end
	block = love.graphics.newImage("content/block.png")
end

function playfield.update(dt)

end

function playfield.lineCheck()

end

function playfield.draw(xOffset,yOffset)
	for x = 0,PLAYFIELD_WIDTH do
		for y = 0,PLAYFIELD_HEIGHT do
			if playfield.blocks[x][y] == 1 then love.graphics.setColor(255, 0, 0)
			elseif playfield.blocks[x][y] == 2 then love.graphics.setColor(0, 255, 0)
			elseif playfield.blocks[x][y] == 3 then love.graphics.setColor(0, 0, 255)
			else goto continue
			end


			love.graphics.draw(block,xOffset+ x*BLOCK_WIDTH,yOffset+ y*BLOCK_HEIGHT)
			::continue::
		end
	end
end
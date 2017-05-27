local quadGenerator = require("QuadGenerator")

function love.load()
	--(firstId, imageFile, tileWidth, tileHeight, margin, spacing)
	test1 = quadGenerator.create(1, "img/map2.png", 70, 70, 0, 0)
end

function love.update(dt)
end

function love.draw()
	imagem, quad = test1:getQuad(97)
	love.graphics.draw( imagem, quad, 40, 40)
	imagem, quad = test1:getQuad(15)
	love.graphics.draw( imagem, quad, 200, 200)
end
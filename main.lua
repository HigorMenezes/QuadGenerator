local quadGenerator = require("QuadGenerator")

function love.load()
	quadGenerator:create({quadName = "test1", imgFile = "img/quad1.png", width = 21, height = 21, margin = 2, spacing = 2})
	quadGenerator:create({quadName = "test2", imgFile = "img/quad1.png", width = 21, height = 21, margin = 2, spacing = 2})
end

function love.update(dt)
end

function love.draw()
	imagem, quad = quadGenerator:getQuad("test1", 20)
	love.graphics.draw( imagem, quad, 40, 40)
	imagem, quad = quadGenerator:getQuad("test2", 168)
	love.graphics.draw( imagem, quad, 80, 80, 0, 2, 2)
end
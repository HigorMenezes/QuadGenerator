local quadGenerator = require("QuadGenerator")

function love.load()
	quadGenerator:create({quadName = "test1", imageFile = "img/map2.png", tileWidth = 70, tileHeight = 70, margin = 0, spacing = 0})
	quadGenerator:create({quadName = "test2", imageFile = "img/map2.png", tileWidth = 70, tileHeight = 70, margin = 0, spacing = 0})
end

function love.update(dt)
end

function love.draw()
	imagem, quad = quadGenerator:getQuad("test1", 14)
	love.graphics.draw( imagem, quad, 40, 40)
	imagem, quad = quadGenerator:getQuad("test2", 14)
	love.graphics.draw( imagem, quad, 200, 200)
end
local quads = require("QuadGenerator")

function love.load()
	quads:create({quadName = "test1", imgFile = "img/quad1.png", width = 21, height = 21, margin = 2, spacing = 2})
	quads:create({quadName = "test2", imgFile = "img/quad1.png", width = 21, height = 21, margin = 2, spacing = 2})
end

function love.update(dt)
end

function love.draw()
	img = quads:getQuad("test1", 20)
	love.graphics.draw( img.img, img.quad, 40, 40)
	img = quads:getQuad("test2", 168)
	love.graphics.draw( img.img, img.quad, 80, 80)
end
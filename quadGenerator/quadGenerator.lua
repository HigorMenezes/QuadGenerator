local QuadGenerator = {}

local quads = {}

local metTable = {
	__index = function (self, key) 
		self[key] = createQuad(self, key)
		return self[key] 
	end
}

function QuadGenerator:create(param)
	local quad = {}
	--assert((param.quadName == nil), "quadName is nil")
	--assert(param.img == nil, "img is nil")
	--assert(param.img == nil, "width is nil")
	--assert(param.img == nil, "Height is nil")
	quad.name = param.quadName
	quad.img = love.graphics.newImage(param.imageFile)
	quad.img:setFilter("nearest", "nearest")
	quad.margin = param.margin or 0
	quad.spacing = param.spacing or 0
	quad.tileWidth = param.tileWidth
	quad.tileHeight = param.tileHeight
	quad.tilesColumn = ((quad.img:getWidth() - quad.margin)/(quad.tileWidth+quad.spacing))
	quad.tilesLine = ((quad.img:getHeight() - quad.margin)/(quad.tileHeight+quad.spacing)) + 1
	quad.quads = {}

	quad.quads.quad = quad
	setmetatable(quad.quads, metTable)
	quads["quadName"] = quad
end

function QuadGenerator:getQuad(quadName, quadId)
	--assert(quadName == nil, "quadName is nil")
	--assert(quadId == nil, "quadId is nil")
	local quad = quads["quadName"].quads[quadId]
	local img = quads["quadName"].img

	return img, quad
end

function createQuad(quads, quadId)
	r = quads.quad

	local column = (quadId - 1)%r.tilesColumn
	local line = math.floor((quadId - 1)/r.tilesColumn)

	local x = r.margin + (r.spacing + r.tileWidth)*column
	local y = r.margin + (r.spacing + r.tileHeight)*line

	return love.graphics.newQuad(x, y, r.tileWidth, r.tileHeight, r.img:getDimensions())
end

return QuadGenerator
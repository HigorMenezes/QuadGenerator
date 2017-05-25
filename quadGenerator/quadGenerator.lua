local QuadGenerator = {}

local quads = {}

local metTable = {
	__index = function (self, key) 
		self[key] = createQuad(key-1) 
		return self[key] 
	end
}

function QuadGenerator:create(param)
	local quad = {}
	--assert((param.quadName == nil), "quadName is nil")
	quad.name = param.quadName
	--assert(param.img == nil, "img is nil")
	quad.img = love.graphics.newImage(param.imageFile)
	quad.margin = param.margin or 0
	quad.spacing = param.spacing or 0
	--assert(param.img == nil, "width is nil")
	quad.tileWidth = param.tileWidth
	--assert(param.img == nil, "Height is nil")
	quad.tileHeight = param.tileHeight
	quad.tilesColumn = ((quad.img:getWidth() - quad.margin)/(quad.tileWidth+quad.spacing))
	quad.tilesLine = ((quad.img:getHeight() - quad.margin)/(quad.tileHeight+quad.spacing)) + 1
	print(quad.tilesLine, quad.tilesColumn)
	quad.quads = {}
	setmetatable(quad.quads, metTable)

	quads["quadName"] = quad
end

function QuadGenerator:getQuad(quadName, quadId)
	--assert(quadName == nil, "quadName is nil")
	--assert(quadId == nil, "quadId is nil")
	local r = quads["quadName"]

	local column = (quadId - 1)%r.tilesColumn
	local line = math.floor((quadId - 1)/r.tilesColumn)

	local x = r.margin + (r.spacing + r.tileWidth)*column
	local y = r.margin + (r.spacing + r.tileHeight)*line

	return r.img, love.graphics.newQuad(x, y, r.tileWidth, r.tileHeight, r.img:getDimensions())
end


return QuadGenerator
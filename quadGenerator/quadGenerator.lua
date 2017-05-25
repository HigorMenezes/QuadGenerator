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
	quad.img = love.graphics.newImage(param.imgFile)
	quad.margin = param.margin or 0
	quad.spacing = param.spacing or 0
	--assert(param.img == nil, "width is nil")
	quad.width = param.width
	--assert(param.img == nil, "Height is nil")
	quad.height = param.height
	quad.tilesLine = ((quad.img:getWidth() - quad.margin)/(quad.width+quad.spacing))
	quad.tilesColumn = ((quad.img:getHeight() - quad.margin)/(quad.height+quad.spacing))
	quad.quads = {}
	setmetatable(quad.quads, metTable)

	quads["quadName"] = quad
end

function QuadGenerator:getQuad(quadName, quadId)
	--assert(quadName == nil, "quadName is nil")
	--assert(quadId == nil, "quadId is nil")
	local r = quads["quadName"]

	local column = (quadId - 1)%r.tilesColumn
	local line = math.floor((quadId - 1)/r.tilesLine)

	local x = r.margin + (r.spacing + r.width)*column
	local y = r.margin + (r.spacing + r.height)*line

	return r.img, love.graphics.newQuad(x, y, r.width, r.height, r.img:getDimensions())
end


return QuadGenerator
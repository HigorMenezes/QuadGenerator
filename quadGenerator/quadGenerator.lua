local QuadGenerator = {}

local metTable = {
	__index = function (self, key) 
		self[key] = createQuad(self, key)
		return self[key] 
	end
}

function QuadGenerator.create(firstId, imageFile, tileWidth, tileHeight, margin, spacing)
	local sSheet = {}
	--assert((quadName == nil), "quadName is nil")
	--assert(img == nil, "img is nil")
	--assert(img == nil, "width is nil")
	--assert(img == nil, "Height is nil")
	sSheet.firstId = firstId or 1
	sSheet.img = love.graphics.newImage(imageFile)
	sSheet.img:setFilter("nearest", "nearest")
	sSheet.tileWidth = tileWidth
	sSheet.tileHeight = tileHeight
	sSheet.margin = margin or 0
	sSheet.spacing = spacing or 0

	sSheet.tilesColumn = ((sSheet.img:getWidth() - sSheet.margin)/(sSheet.tileWidth+sSheet.spacing))
	sSheet.tilesLine = ((sSheet.img:getHeight() - sSheet.margin)/(sSheet.tileHeight+sSheet.spacing)) + 1

	sSheet.quads = {}
	sSheet.quads.sSheet = sSheet
	setmetatable(sSheet.quads, metTable)

	function sSheet:getQuad(quadId)
		--assert(quadId == nil, "quadId is nil")
		quadId = quadId - self.firstId
		return self.img, self.quads[quadId]
	end

	return sSheet
end

function createQuad(quads, quadId)
	r = quads.sSheet

	local column = (quadId)%r.tilesColumn
	local line = math.floor((quadId)/r.tilesColumn)

	local x = r.margin + (r.spacing + r.tileWidth)*column
	local y = r.margin + (r.spacing + r.tileHeight)*line

	return love.graphics.newQuad(x, y, r.tileWidth, r.tileHeight, r.img:getDimensions())
end

return QuadGenerator
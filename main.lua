local f = {} -- f for 'functions'
local s = {} -- s for 'state'
function love.load()
	local function load(module) f[tostring(module)] = require("func." .. tostring(module)) end -- helper to load 1 library/class
	load "camera"
	load "tileset"
	load "world"

	s.camera = f.camera.new()
	s.tileset = f.tileset.new()
	s.world = f.world.new(64)

	s.tileset:loadAssetPack("testTiles")

	s.world:setBlock(1, 1, s.tileset.uuids["7510ba13-f92c-4e73-86cc-e6e19d20159a"])
end

function love.update(delta)

end

function love.draw()
	s.world:draw(s.tileset, s.camera)
end
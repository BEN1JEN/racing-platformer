local terrainGen = {}

local uuidMap = {
	testTiles_simple = "578a7491-c211-49e1-8704-0c08331bc667",
	testTiles_grass = "7510ba13-f92c-4e73-86cc-e6e19d20159a",
	testTiles_car = "584a1a1c-19ff-4e23-8cae-cd03b9491a6e",
}

function terrainGen.new(seed)
	return setmetatable({
		seed = seed,
		lastX = 0,
	}, {__index=terrainGen})
end

function terrainGen:generateNext(tilemap, world, amount)
	for y = self.lastX, self.lastX+amount do
		if y < 50 then
			for x = 1, world.width do
				world:setBlock(x, y, tilemap.uuids[uuidMap[math.random() > 0.99 and "testTiles_car" or (y == 49 and "testTiles_grass" or "testTiles_simple")]])
			end
		elseif y == 51 then
			world:setBlock(15, y, tilemap.uuids[uuidMap["testTiles_car"]])
		else
			world:newRow(y)
		end
	end
end

return terrainGen
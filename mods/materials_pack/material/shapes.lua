-- Grailtest 5 --
-- mods/materials_pack/material/shapes.lua

-- Coloured blocks --

for _, row in ipairs(dye.dyes) do
	local colour = row[1]
	--local desc = row[2]
	--local colourdef = row[4]

	shape.register_blocks("material:clay_"..colour)
	shape.register_blocks("material:"..colour.."_wood")
	shape.register_blocks("material:glass_"..colour)

	shape.register_blocks("material:stone_brick_"..colour)
	shape.register_blocks("material:stone_tile_"..colour)
end

shape.register_blocks("material:brick")
shape.register_blocks("material:stone_brick")
shape.register_blocks("material:desert_stone_brick")
shape.register_blocks("material:sandstone_brick")
shape.register_blocks("material:basalt_brick")
shape.register_blocks("material:bluestone_brick")
shape.register_blocks("material:greenstone_brick")
shape.register_blocks("material:whitestone_brick")
shape.register_blocks("material:shingles_clay")
shape.register_blocks("material:shingles_wood")
shape.register_blocks("material:shingles_slate")
shape.register_blocks("material:wood_tile")
shape.register_blocks("material:stone_tile")
shape.register_blocks("material:white_stone_tile")
shape.register_blocks("material:green_stone_tile")
shape.register_blocks("material:blue_stone_tile")
shape.register_blocks("material:basalt_tile")
shape.register_blocks("material:red_stone_tile")

-- stair, slab and slope only
shape.register_blocks2("material:stone_chequer")
shape.register_blocks2("material:green_stone_chequer")
shape.register_blocks2("material:blue_stone_chequer")
shape.register_blocks2("material:basalt_chequer")
shape.register_blocks2("material:glass")
shape.register_blocks2("material:glass_obsidian")
shape.register_blocks2("plant:straw_bale")
shape.register_blocks2("material:cob")

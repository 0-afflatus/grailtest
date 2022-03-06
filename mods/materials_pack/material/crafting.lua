-- Grailtest 5 --
-- mods/materials_pack/material/crafting.lua

-- Craft items

minetest.register_craftitem("material:stick", {
	description = "Stick",
	inventory_image = "material_stick.png",
	groups = {stick = 1},
})

minetest.register_craftitem("material:paper", {
	description = "Paper",
	inventory_image = "material_paper.png",
})

minetest.register_craftitem("material:string", {
	description = "String",
	inventory_image = "material_string.png",
})

-- Recipes

minetest.register_craft({
	output = "material:string",
	recipe = {
		{"plant:fibre"},
	},
})

minetest.register_craft({
	output = 'plant:fibre',
	recipe = {
		{'group:leaves', 'group:leaves', 'group:leaves'},
		{'group:leaves', 'group:leaves', 'group:leaves'},
	}
})

minetest.register_craft({
	output = 'plant:fibre',
	recipe = {
		{'plant:straw', 'plant:straw', 'plant:straw'},
	}
})

minetest.register_craft({
	output = 'material:brick',
	recipe = {
		{'mineral:clay_brick', 'mineral:clay_brick'},
		{'mineral:clay_brick', 'mineral:clay_brick'},
	}
})

minetest.register_craft({
	output = 'mineral:clay_brick 4',
	recipe = {
		{'material:brick'},
	}
})

minetest.register_craft({
	output = 'material:paper',
	recipe = {
		{'plant:papyrus', 'plant:papyrus', 'plant:papyrus'},
	}
})

minetest.register_craft({
	output = 'material:paper 2',
	recipe = {
		{'plant:fibre', 'plant:fibre', 'plant:fibre'},
		{'plant:fibre', 'mineral:clay_lump', 'plant:fibre'},
	}
})

minetest.register_craft({
	output = 'wool:white',
	recipe = {
		{'plant:fibre', 'plant:fibre', 'plant:fibre'},
		{'plant:fibre', 'plant:fibre', 'plant:fibre'},
		{'plant:fibre', 'plant:fibre', 'plant:fibre'},
	}
})

minetest.register_craft({
	output = 'material:stick 4',
	recipe = {
		{'group:wood'},
	}
})

minetest.register_craft({
	output = 'material:sandstone_brick 4',
	recipe = {
		{'element:sandstone', 'element:sandstone'},
		{'element:sandstone', 'element:sandstone'},
	}
})

minetest.register_craft({
	output = 'material:stone_brick 4',
	recipe = {
		{'element:stone', 'element:stone'},
		{'element:stone', 'element:stone'},
	}
})

minetest.register_craft({
	output = 'material:desert_stone_brick 4',
	recipe = {
		{'element:desert_stone', 'element:desert_stone'},
		{'element:desert_stone', 'element:desert_stone'},
	}
})

minetest.register_craft({
	output = 'material:adobe_brick 4',
	recipe = {
		{'material:cob', 'material:cob'},
		{'material:cob', 'material:cob'},
	}
})

minetest.register_craft({
	output = 'material:basalt_brick 4',
	recipe = {
		{'mineral:basalt', 'mineral:basalt'},
		{'mineral:basalt', 'mineral:basalt'},
	}
})

minetest.register_craft({
	output = 'material:bluestone_brick 4',
	recipe = {
		{'mineral:bluestone', 'mineral:bluestone'},
		{'mineral:bluestone', 'mineral:bluestone'},
	}
})

minetest.register_craft({
	output = 'material:greenstone_brick 4',
	recipe = {
		{'mineral:greenstone', 'mineral:greenstone'},
		{'mineral:greenstone', 'mineral:greenstone'},
	}
})

minetest.register_craft({
	output = 'material:whitestone_brick 4',
	recipe = {
		{'mineral:white_stone', 'mineral:white_stone'},
		{'mineral:white_stone', 'mineral:white_stone'},
	}
})

-- Shingles

minetest.register_craft({
	output = 'material:shingles_clay',
	recipe = {
		{'', 'mineral:clay_brick', ''},
		{'mineral:clay_brick', '', 'mineral:clay_brick'},
		{'', 'mineral:clay_brick', ''},
	}
})

minetest.register_craft({
	output = 'material:shingles_wood 4',
	recipe = {
		{'', 'group:wood', ''},
		{'group:wood', '', 'group:wood'},
		{'', 'group:wood', ''},
	}
})

minetest.register_craft({
	output = 'material:shingles_slate 4',
	recipe = {
		{'', 'group:stone', ''},
		{'group:stone', '', 'group:stone'},
		{'', 'group:stone', ''},
	}
})

-- Tiles

minetest.register_craft({
	output = "material:wood_tile 9",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

minetest.register_craft({
	output = "material:white_stone_tile 9",
	recipe = {
		{"mineral:white_stone", "mineral:white_stone", "mineral:white_stone"},
		{"mineral:white_stone", "mineral:white_stone", "mineral:white_stone"},
		{"mineral:white_stone", "mineral:white_stone", "mineral:white_stone"},
	}
})

minetest.register_craft({
	output = "material:white_stone_tile_split",
	recipe = {
		{"material:white_stone_tile"},
	}
})

minetest.register_craft({
	output = "material:stone_tile 9",
	recipe = {
		{"element:stone", "element:stone", "element:stone"},
		{"element:stone", "element:stone", "element:stone"},
		{"element:stone", "element:stone", "element:stone"},
	}
})

minetest.register_craft({
	output = "material:stone_tile_split",
	recipe = {
		{"material:stone_tile"},
	}
})

minetest.register_craft({
	output = "material:stone_chequer 4",
	recipe = {
		{"material:whitestone_brick", "material:stone_brick"},
		{"material:stone_brick", "material:whitestone_brick"},
	}
})

minetest.register_craft({
	output = "material:stone_chequer 4",
	recipe = {
		{"material:stone_brick", "material:whitestone_brick"},
		{"material:whitestone_brick", "material:stone_brick"},
	}
})

minetest.register_craft({
	output = "material:stone_chequer 4",
	recipe = {
		{"material:white_stone_tile_split", "material:stone_tile_split"},
		{"material:stone_tile_split", "material:white_stone_tile_split"},
	}
})

minetest.register_craft({
	output = "material:stone_chequer 4",
	recipe = {
		{"material:stone_tile_split", "material:white_stone_tile_split"},
		{"material:white_stone_tile_split", "material:stone_tile_split"},
	}
})

minetest.register_craft({
	output = "material:green_stone_tile 9",
	recipe = {
		{"mineral:greenstone", "mineral:greenstone", "mineral:greenstone"},
		{"mineral:greenstone", "mineral:greenstone", "mineral:greenstone"},
		{"mineral:greenstone", "mineral:greenstone", "mineral:greenstone"},
	}
})

minetest.register_craft({
	output = "material:green_stone_tile_split",
	recipe = {
		{"material:green_stone_tile"},
	}
})

minetest.register_craft({
	output = "material:green_stone_chequer 4",
	recipe = {
		{"material:whitestone_brick", "material:greenstone_brick"},
		{"material:greenstone_brick", "material:whitestone_brick"},
	}
})

minetest.register_craft({
	output = "material:green_stone_chequer 4",
	recipe = {
		{"material:greenstone_brick", "material:whitestone_brick"},
		{"material:whitestone_brick", "material:greenstone_brick"},
	}
})

minetest.register_craft({
	output = "material:green_stone_chequer 4",
	recipe = {
		{"material:white_stone_tile_split", "material:green_stone_tile_split"},
		{"material:green_stone_tile_split", "material:white_stone_tile_split"},
	}
})

minetest.register_craft({
	output = "material:green_stone_chequer 4",
	recipe = {
		{"material:green_stone_tile_split", "material:white_stone_tile_split"},
		{"material:white_stone_tile_split", "material:green_stone_tile_split"},
	}
})

minetest.register_craft({
	output = "material:blue_stone_tile 9",
	recipe = {
		{"mineral:bluestone", "mineral:bluestone", "mineral:bluestone"},
		{"mineral:bluestone", "mineral:bluestone", "mineral:bluestone"},
		{"mineral:bluestone", "mineral:bluestone", "mineral:bluestone"},
	}
})

minetest.register_craft({
	output = "material:blue_stone_tile_split",
	recipe = {
		{"material:blue_stone_tile"},
	}
})

minetest.register_craft({
	output = "material:blue_stone_chequer 4",
	recipe = {
		{"material:whitestone_brick", "material:bluestone_brick"},
		{"material:bluestone_brick", "material:whitestone_brick"},
	}
})

minetest.register_craft({
	output = "material:blue_stone_chequer 4",
	recipe = {
		{"material:bluestone_brick", "material:whitestone_brick"},
		{"material:whitestone_brick", "material:bluestone_brick"},
	}
})

minetest.register_craft({
	output = "material:blue_stone_chequer 4",
	recipe = {
		{"material:white_stone_tile_split", "material:blue_stone_tile_split"},
		{"material:blue_stone_tile_split", "material:white_stone_tile_split"},
	}
})

minetest.register_craft({
	output = "material:blue_stone_chequer 4",
	recipe = {
		{"material:blue_stone_tile_split", "material:white_stone_tile_split"},
		{"material:white_stone_tile_split", "material:blue_stone_tile_split"},
	}
})

minetest.register_craft({
	output = "material:basalt_tile 9",
	recipe = {
		{"mineral:basalt", "mineral:basalt", "mineral:basalt"},
		{"mineral:basalt", "mineral:basalt", "mineral:basalt"},
		{"mineral:basalt", "mineral:basalt", "mineral:basalt"},
	}
})

minetest.register_craft({
	output = "material:basalt_tile_split",
	recipe = {
		{"material:basalt_tile"},
	}
})

minetest.register_craft({
	output = "material:basalt_chequer 4",
	recipe = {
		{"material:whitestone_brick", "material:basalt_brick"},
		{"material:basalt_brick", "material:whitestone_brick"},
	}
})

minetest.register_craft({
	output = "material:basalt_chequer 4",
	recipe = {
		{"material:basalt_brick", "material:whitestone_brick"},
		{"material:whitestone_brick", "material:basalt_brick"},
	}
})

minetest.register_craft({
	output = "material:basalt_chequer 4",
	recipe = {
		{"material:white_stone_tile_split", "material:basalt_tile_split"},
		{"material:basalt_tile_split", "material:white_stone_tile_split"},
	}
})

minetest.register_craft({
	output = "material:basalt_chequer 4",
	recipe = {
		{"material:basalt_tile_split", "material:white_stone_tile_split"},
		{"material:white_stone_tile_split", "material:basalt_tile_split"},
	}
})

minetest.register_craft({
	output = "material:red_stone_tile 9",
	recipe = {
		{"element:desert_stone", "element:desert_stone", "element:desert_stone"},
		{"element:desert_stone", "element:desert_stone", "element:desert_stone"},
		{"element:desert_stone", "element:desert_stone", "element:desert_stone"},
	}
})

minetest.register_craft({
	output = "material:red_stone_tile 9",
	recipe = {
		{"mineral:clay_brick", "mineral:clay_brick", "mineral:clay_brick"},
		{"mineral:clay_brick", "mineral:clay_brick", "mineral:clay_brick"},
		{"mineral:clay_brick", "mineral:clay_brick", "mineral:clay_brick"},
	}
})

minetest.register_craft({
	output = "material:red_stone_tile_split",
	recipe = {
		{"material:red_stone_tile"},
	}
})

minetest.register_craft({
	output = "material:red_stone_chequer 4",
	recipe = {
		{"material:whitestone_brick", "material:desert_stone_brick"},
		{"material:desert_stone_brick", "material:whitestone_brick"},
	}
})

minetest.register_craft({
	output = "material:red_stone_chequer 4",
	recipe = {
		{"material:desert_stone_brick", "material:whitestone_brick"},
		{"material:whitestone_brick", "material:desert_stone_brick"},
	}
})

minetest.register_craft({
	output = "material:red_stone_chequer 4",
	recipe = {
		{"material:white_stone_tile_split", "material:red_stone_tile_split"},
		{"material:red_stone_tile_split", "material:white_stone_tile_split"},
	}
})

minetest.register_craft({
	output = "material:red_stone_chequer 4",
	recipe = {
		{"material:red_stone_tile_split", "material:white_stone_tile_split"},
		{"material:white_stone_tile_split", "material:red_stone_tile_split"},
	}
})

minetest.register_craft({
	output = "material:stone_rune 8",
	recipe = {
		{"material:stone_tile", "material:stone_tile", "material:stone_tile"},
		{"material:stone_tile", "", "material:stone_tile"},
		{"material:stone_tile", "material:stone_tile", "material:stone_tile"}
	}
})

-- Cob

minetest.register_craft({
	output = 'material:cob 2',
	type = 'shapeless',
	recipe = {'plant:straw_bale', 'mineral:clay'}
})

minetest.register_craft({
	output = 'material:cob 4',
	type = 'shapeless',
	recipe = {'plant:straw_bale', 'mineral:clay', 'element:sand', 'mineral:clay'}
})

minetest.register_craft({
	output = 'material:cob 4',
	type = 'shapeless',
	recipe = {'plant:straw_bale', 'mineral:clay', 'group:soil', 'mineral:clay'}
})

minetest.register_craft({
	output = 'material:cob 8',
	type = 'shapeless',
	recipe = {
		'plant:straw_bale',
		'mineral:clay',
		'element:sand',
		'mineral:clay',
		'group:soil',
		'mineral:clay',
		'plant:straw_bale',
		'plant:straw_bale'
	}
})

minetest.register_craft({
	output = "material:glass_white",
	type = 'shapeless',
	recipe = {"material:glass_obsidian", 'group:dye,'..'basecolor_white'},
})

minetest.register_craft({
	output = "material:glass_blue",
	type = 'shapeless',
	recipe = {"material:glass_obsidian", 'group:dye,'..'basecolor_blue'},
})

minetest.register_craft({
	output = "material:glass_cyan",
	type = 'shapeless',
	recipe = {"material:glass_obsidian", 'group:dye,'..'basecolor_cyan'},
})

minetest.register_craft({
	output = "material:glass_green",
	type = 'shapeless',
	recipe = {"material:glass_obsidian", 'group:dye,'..'basecolor_green'},
})

minetest.register_craft({
	output = "material:glass_yellow",
	type = 'shapeless',
	recipe = {"material:glass_obsidian", 'group:dye,'..'basecolor_yellow'},
})

minetest.register_craft({
	output = "material:glass_red",
	type = 'shapeless',
	recipe = {"material:glass_obsidian", 'group:dye,'..'basecolor_red'},
})

minetest.register_craft({
	output = "material:glass_diamond",
	type = 'shapeless',
	recipe = {"material:glass"},
})

minetest.register_craft({
	output = "material:glass",
	type = 'shapeless',
	recipe = {"material:glass_diamond"},
})

-- Coloured blocks
for _, row in ipairs(dye.dyes) do
	local colour = row[1]
	--local colourdef = row[4]

	--[[
	minetest.register_craft({
	output = 'material:'..colour..'_square 6',
	recipe = {
		{'material:clay_'..colour, "", 'material:clay_'..colour},
		{'material:clay_'..colour, "", 'material:clay_'..colour},
		{'material:clay_'..colour, "", 'material:clay_'..colour},
	}
	})

	minetest.register_craft({
	output = 'material:clay_'..colour,
	recipe = {
		{'material:'..colour..'_square'},
	}
	})

	minetest.register_craft({
	output = 'material:'..colour..'_arch 5',
	recipe = {
		{'', 'material:clay_'..colour, ''},
		{'material:clay_'..colour, '', 'material:clay_'..colour},
		{'material:clay_'..colour, '', 'material:clay_'..colour},
	}
	})

	minetest.register_craft({
	output = 'material:clay_'..colour,
	recipe = {
		{'material:'..colour..'_arch'},
	}
	})
	]]

	minetest.register_craft({
		output = 'material:stone_brick'..colour..' 4',
		recipe = {
			{'element:stone_'..colour, 'element:stone_'..colour},
			{'element:stone_'..colour, 'element:stone_'..colour},
		}
	})

	minetest.register_craft({
		output = 'material:stone_tile'..colour..' 9',
		recipe = {
			{'element:stone_'..colour, 'element:stone_'..colour, 'element:stone_'..colour},
			{'element:stone_'..colour, 'element:stone_'..colour, 'element:stone_'..colour},
			{'element:stone_'..colour, 'element:stone_'..colour, 'element:stone_'..colour},
		}
	})

	minetest.register_craft({
		output = "material:stone_tile_split'..colour",
		recipe = {
			{'material:stone_tile'..colour},
		}
	})
end

-- Stone blocks
local stone_types = {
	"element:stone",
	"material:stone_brick",
	"element:sandstone",
	"material:sandstone_brick",
	"element:desert_stone",
	"material:desert_stone_brick",
	"mineral:bluestone",
	"material:bluestone_brick",
	"mineral:greenstone",
	"material:greenstone_brick",
	"mineral:white_stone",
	"material:whitestone_brick",
	"mineral:basalt",
	"material:basalt_brick"
}

for _, ingredient in ipairs(stone_types) do

	local blob = string.split(ingredient, ":")
	local iname = blob[2]

	minetest.register_craft({
	output = "material:"..iname..'_square 6',
	recipe = {
		{ingredient, "", ingredient},
		{ingredient, "", ingredient},
		{ingredient, "", ingredient},
	}
	})

	minetest.register_craft({
	output = ingredient,
	recipe = {
		{"material:"..iname..'_square'},
	}
	})

	minetest.register_craft({
	output = "material:"..iname..'_arch 5',
	recipe = {
		{'', ingredient, ''},
		{ingredient, '', ingredient},
		{ingredient, '', ingredient},
	}
	})

	minetest.register_craft({
	output = ingredient,
	recipe = {
		{"material:"..iname..'_arch'},
	}
	})

end

-- Cooking

minetest.register_craft({
	type = "cooking",
	output = "material:glass",
	recipe = "group:sand",
})

minetest.register_craft({
	type = "cooking",
	output = "material:glass_obsidian",
	recipe = "mineral:obsidian_shard",
})

minetest.register_craft({
	type = "cooking",
	output = "mineral:clay_brick 4",
	recipe = "mineral:clay",
})

-- Fuels

minetest.register_craft({
	type = "fuel",
	recipe = "group:wood",
	burntime = 7,
})



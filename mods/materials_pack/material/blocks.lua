-- Grailtest 5 --
-- mods/materials_pack/material/blocks.lua

-- Coloured blocks --

for _, row in ipairs(dye.dyes) do
	local colour = row[1]
	local desc = row[2]
	local colourdef = row[4]

	minetest.register_node("material:clay_"..colour, {
		description = desc.." block",
		groups = { crumbly = 2, oddly_breakable_by_hand = 1},
		tiles = { "element_clay.png^[multiply:"..colourdef },
		sounds = base.node_sound_defaults(),
	})

	minetest.register_node("material:"..colour.."_wood", {
		description = colour.." wood",
		tiles = { "material_wood.png^[multiply:"..colourdef },
		is_ground_content = false,
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = base.node_sound_defaults(),
	})

	minetest.register_node("material:stone_brick_"..colour, {
		description = colour.." stone brick",
		tiles = { "material_stone_brick.png^[brighten^[multiply:"..colourdef },
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {cracky=2, stone=1},
		sounds = base.node_sound_defaults(),
	})

	minetest.register_node("material:stone_tile_"..colour, {
		description = colour.." stone tile",
		tiles = { "material_stone_tile.png^[multiply:"..colourdef },
		groups = {cracky=3},
		sounds = base.node_sound_defaults(),
	})

	minetest.register_node("material:stone_tile_split_"..colour, {
		description = colour.." split stone tile",
		tiles = { "material_stone_tile_split.png^[multiply:"..colourdef },
		groups = {cracky=3},
		sounds = base.node_sound_defaults(),
	})

	minetest.register_node("material:glass_"..colour, {
		description = colour.." glass",
		drawtype = "glasslike",
		tiles = {"material_trans.png^[multiply:"..colourdef},
		use_texture_alpha = "blend",
		paramtype = "light",
		sunlight_propagates = true,
		light_source = 2,
		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3},
		sounds = base.node_sound_defaults(),
	})
end

minetest.register_node("material:stone_square", {
	description = "Stone square",
	tiles = {
		"element_stone.png^material_square.png",
		"element_stone.png^material_square.png",
		"element_stone.png^material_recess.png"
	 },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:stone_arch", {
	description = "Stone arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"element_stone.png^material_circle.png",
		"element_stone.png^material_circle.png",
		"element_stone.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:desert_stone_square", {
	description = "Desert stone square",
	tiles = {
		"element_desert_stone.png^material_square.png",
		"element_desert_stone.png^material_square.png",
		"element_desert_stone.png^material_recess.png",
	 },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:desert_stone_arch", {
	description = "Desert stone arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"element_desert_stone.png^material_circle.png",
		"element_desert_stone.png^material_circle.png",
		"element_desert_stone.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:sandstone_square", {
	description = "Sandstone square",
	tiles = {
		"element_sandstone.png^material_square.png",
		"element_sandstone.png^material_square.png",
		"element_sandstone.png^material_recess.png"
	},
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:sandstone_arch", {
	description = "Sandstone arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"element_sandstone.png^material_circle.png",
		"element_sandstone.png^material_circle.png",
		"element_sandstone.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:white_stone_square", {
	description = "White stone square",
	tiles = {
		"mineral_white_stone.png^material_square.png",
		"mineral_white_stone.png^material_square.png",
		"mineral_white_stone.png^material_recess.png"
	},
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:white_stone_arch", {
	description = "White stone arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"mineral_white_stone.png^material_circle.png",
		"mineral_white_stone.png^material_circle.png",
		"mineral_white_stone.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:greenstone_square", {
	description = "Greenstone square",
	tiles = {
		"mineral_greenstone.png^material_square.png",
		"mineral_greenstone.png^material_square.png",
		"mineral_greenstone.png^material_recess.png"
	  },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:greenstone_arch", {
	description = "Greenstone arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"mineral_greenstone.png^material_circle.png",
		"mineral_greenstone.png^material_circle.png",
		"mineral_greenstone.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:basalt_square", {
	description = "Basalt square",
	tiles = {
		"mineral_basalt.png^material_square.png",
		"mineral_basalt.png^material_square.png",
		"mineral_basalt.png^material_recess.png"
	  },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:basalt_arch", {
	description = "Basalt arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"mineral_basalt.png^material_circle.png",
		"mineral_basalt.png^material_circle.png",
		"mineral_basalt.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:bluestone_square", {
	description = "Bluestone square",
	tiles = {
		"mineral_bluestone.png^material_square.png",
		"mineral_bluestone.png^material_square.png",
		"mineral_bluestone.png^material_recess.png"
	  },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:bluestone_arch", {
	description = "Bluestone arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"mineral_bluestone.png^material_circle.png",
		"mineral_bluestone.png^material_circle.png",
		"mineral_bluestone.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

--- Brick arches

minetest.register_node("material:stone_brick_square", {
	description = "Stone brick square",
	tiles = {
		"material_stone_brick.png^material_square.png",
		"material_stone_brick.png^material_square.png",
		"material_stone_brick.png^material_recess.png"
	  },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:stone_brick_arch", {
	description = "Stone brick arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"material_stone_brick.png^material_circle.png",
		"material_stone_brick.png^material_circle.png",
		"material_stone_brick.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:desert_stone_brick_square", {
	description = "Desert stone brick square",
	tiles = {
		"material_desert_stone_brick.png^material_square.png",
		"material_desert_stone_brick.png^material_square.png",
		"material_desert_stone_brick.png^material_recess.png"
	  },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:desert_stone_brick_arch", {
	description = "Desert stone brick arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"material_desert_stone_brick.png^material_circle.png",
		"material_desert_stone_brick.png^material_circle.png",
		"material_desert_stone_brick.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:sandstone_brick_square", {
	description = "Sandstone brick square",
	tiles = {
		"material_sandstone_brick.png^material_square.png",
		"material_sandstone_brick.png^material_square.png",
		"material_sandstone_brick.png^material_recess.png"
	  },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:sandstone_brick_arch", {
	description = "Sandstone brick arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"material_sandstone_brick.png^material_circle.png",
		"material_sandstone_brick.png^material_circle.png",
		"material_sandstone_brick.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:white_stone_brick_square", {
	description = "White stone brick square",
	tiles = {
		"material_whitestone_brick.png^material_square.png",
		"material_whitestone_brick.png^material_square.png",
		"material_whitestone_brick.png^material_recess.png"
	  },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:white_stone_brick_arch", {
	description = "White stone brick arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"material_whitestone_brick.png^material_circle.png",
		"material_whitestone_brick.png^material_circle.png",
		"material_whitestone_brick.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:greenstone_brick_square", {
	description = "Greenstone brick square",
	tiles = {
		"material_greenstone_brick.png^material_square.png",
		"material_greenstone_brick.png^material_square.png",
		"material_greenstone_brick.png^material_recess.png"
	  },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:greenstone_brick_arch", {
	description = "Greenstone brick arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"material_greenstone_brick.png^material_circle.png",
		"material_greenstone_brick.png^material_circle.png",
		"material_greenstone_brick.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:basalt_brick_square", {
	description = "Basalt brick square",
	tiles = {
		"material_basalt_brick.png^material_square.png",
		"material_basalt_brick.png^material_square.png",
		"material_basalt_brick.png^material_recess.png"
	  },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:basalt_brick_arch", {
	description = "Basalt brick arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"material_basalt_brick.png^material_circle.png",
		"material_basalt_brick.png^material_circle.png",
		"material_basalt_brick.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:bluestone_brick_square", {
	description = "Bluestone brick square",
	tiles = {
		"material_bluestone_brick.png^material_square.png",
		"material_bluestone_brick.png^material_square.png",
		"material_bluestone_brick.png^material_recess.png"
	  },
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("material:bluestone_brick_arch", {
	description = "Bluestone brick arch",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	groups = {cracky = 3, stone = 1},
	tiles = {
		"material_bluestone_brick.png^material_circle.png",
		"material_bluestone_brick.png^material_circle.png",
		"material_bluestone_brick.png^material_arch.png"
	},
	sounds = base.node_sound_defaults(),
})

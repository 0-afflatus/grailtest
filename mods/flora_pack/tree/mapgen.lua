-- Grailtest 5 --
-- mods/flora_pack/tree/mapgen.lua --

-- Mapgen

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.02,
		scale = 0.005,
		spread = {x=127, y=63, z=127},
		seed = 5555,
		octaves = 3,
		persist = 0.8,
	},
	biomes = {"woodland", "chapparal"},
	y_min = 2,
	y_max = 42,
	schematic = minetest.get_modpath("tree").."/schematics/apple_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass", "element:dirt_with_grass_light"},
	sidelen = 8,
	noise_params = {
		offset = 0,
		scale = 0.001,
		spread = {x=127, y=63, z=127},
		seed = 666,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"woodland", "chapparal"},
	y_min = 15,
	y_max = 75,
	schematic = minetest.get_modpath("tree").."/schematics/oak_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass", "element:dirt_with_grass_light"},
	sidelen = 4,
	noise_params = {
		offset = 0,
		scale = 0.0005,
		spread = {x=127, y=63, z=127},
		seed = 666,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"woodland", "chapparal"},
	y_min = 15,
	y_max = 65,
	schematic = minetest.get_modpath("tree").."/schematics/oak_tree_large.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass_light"},
	sidelen = 4,
	noise_params = {
		offset = 0,
		scale = 0.0005,
		spread = {x=127, y=63, z=127},
		seed = 777,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"chapparal"},
	y_min = 5,
	y_max = 65,
	schematic = minetest.get_modpath("tree").."/schematics/olive_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.005,
		scale = 0.005,
		spread = {x=127, y=63, z=127},
		seed = 2538,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"woodland"},
	y_min = 2,
	y_max = 80,
	schematic = minetest.get_modpath("tree").."/schematics/beech_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass", "element:dirt_with_snow", "element:dirt_with_ice", },
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.005,
		spread = {x=127, y=63, z=127},
		seed = 1237,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"woodland", "taiga", "alpine"},
	y_min = 2,
	y_max = 100,
	schematic = minetest.get_modpath("tree").."/schematics/birch_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass"},
	sidelen = 8,
	noise_params = {
		offset = 0.002,
		scale = 0.001,
		spread = {x=127, y=63, z=127},
		seed = 333,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"woodland"},
	y_min = 7,
	y_max = 65,
	schematic = minetest.get_modpath("tree").."/schematics/ash_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass"},
	sidelen = 4,
	noise_params = {
		offset = 0,
		scale = 0.0005,
		spread = {x=127, y=63, z=127},
		seed = 333,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"woodland"},
	y_min = 7,
	y_max = 55,
	schematic = minetest.get_modpath("tree").."/schematics/ash_tree_large.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass_light", "element:dirt_with_grass_jungle"},
	sidelen = 16,
	noise_params = {
		offset = 0.007,
		scale = 0.005,
		spread = {x=127, y=63, z=127},
		seed = 936,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"rainforest"},
	y_min = 2,
	y_max = 30,
	schematic = minetest.get_modpath("tree").."/schematics/banana_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:sand"},
	sidelen = 8,
	noise_params = {
		offset = 0,
		scale = 0.005,
		spread = {x=127, y=63, z=127},
		seed = 38469,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"mediterranean_ocean", "steppe_ocean", "savanna", "savanna_ocean", "tropical_ocean"},
	y_min = 1,
	y_max = 30,
	schematic = minetest.get_modpath("tree").."/schematics/palm_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {
		"element:dirt_with_grass",
		"element:dirt",
		"element:dirt_jungle",
		"element:dirt_with_grass_jungle",
		"element:mud"
	},
	sidelen = 80,
	fill_ratio = 0.06,
	biomes = {"rainforest", "rainforest_swamp"},
	y_min = 0,
	y_max = 45,
	schematic = minetest.get_modpath("tree").."/schematics/jungle_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_snow", "element:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.02,
		scale = 0.005,
		spread = {x=127, y=63, z=127},
		seed = 272,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"taiga", "alpine"},
	y_min = 2,
	y_max = 130,
	schematic = minetest.get_modpath("tree").."/schematics/pine_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_dry_grass"},
	sidelen = 80,
	noise_params = {
		offset = 0,
		scale = 0.005,
		spread = {x = 250, y = 250, z = 250},
		seed = 477,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"savanna"},
	y_min = 2,
	y_max = 60,
	schematic = minetest.get_modpath("tree").."/schematics/acacia_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass", "element:dirt_with_ice", "element:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.004,
		spread = {x=127, y=63, z=127},
		seed = 777,
		octaves = 3,
		persist = 0.8
	},
	biomes = {"woodland", "taiga"},
	y_min = 1,
	y_max = 5,
	schematic = minetest.get_modpath("tree").."/schematics/willow_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random"
})


moretrees.beech_biome = {
	surface = "default:dirt_with_grass",
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 4,
	min_elevation = 5,
	max_elevation = 70,
	temp_min = 0.2,
	temp_max = -0.5,
	humidity_min = -0.2,
	humidity_max = -0.99,
	plantlife_limit = -0.4,
	seed_diff = 2,
	rarity = 35,
	max_count = 17,
}

moretrees.palm_biome = {
	surface = "default:sand",
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 7,
	seed_diff = 330,
	min_elevation = -1,
	max_elevation = 2,
	near_nodes = {"default:water_source"},
	near_nodes_size = 13,
	near_nodes_count = 10,
	temp_min = -0.23,
	temp_max = -0.77,
	humidity_min = 0.8,
	humidity_max = -0.23,
	plantlife_limit = -0.5,
	rarity = 85,
	max_count = 6,
}

moretrees.apple_tree_biome = {
	surface = "default:dirt_with_grass",
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 11,
	seed_diff = 331,
	min_elevation = 1,
	max_elevation = 23,
	temp_min = 0.3,
	temp_max = -0.3,
	humidity_min = -0.1,
	humidity_max = -0.99,
	plantlife_limit = -0.5,
	rarity = 60,
	max_count = 5,
}

moretrees.oak_biome = {
	surface = "default:dirt_with_grass",
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 9,
	seed_diff = 332,
	min_elevation = 0,
	max_elevation = 55,
	temp_min = 0.3,
	temp_max = -0.3,
	humidity_min = -0.1,
	humidity_max = -0.99,
	plantlife_limit = -0.3,
	rarity = 42,
	max_count = 11,
}

moretrees.sequoia_biome = {
	surface = "default:dirt_with_grass",
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 10,
	seed_diff = 333,
	min_elevation = 0,
	max_elevation = 10,
	temp_min = 1,
	temp_max = -0.4,
	rarity = 90,
	max_count = 5,
}

moretrees.birch_biome = {
	surface = {
		"default:dirt_with_grass", 
		"default:dirt_with_ice", 
	},
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 6,
	seed_diff = 334,
	min_elevation = 5,
	max_elevation = 45,
	temp_min = 0.9,
	temp_max = 0.1,
	humidity_min = -0.1,
	humidity_max = -0.9,
	plantlife_limit = -0.7,
	rarity = 65,
	max_count = 6,
}

moretrees.willow_biome = {
	surface = "default:dirt_with_grass",
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 9,
	seed_diff = 337,
	min_elevation = 1,
	max_elevation = 13,
	temp_min = 0.3,
	temp_max = -0.3,
	humidity_min = -0.1,
	humidity_max = -0.99,
	plantlife_limit = -0.6,
	near_nodes = {"group:water"},
	near_nodes_size = 15,
	near_nodes_count = 5,
	rarity = 50,
	max_count = 9,
}

moretrees.acacia_biome = {
	surface = { "default:dirt_with_grass", "default:dirt_with_dry_grass", "default:desert_sand" },
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 16,
	seed_diff = 1,
	rarity = 50,
	max_count = 13,
	plantlife_limit = -0.6,
	humidity_min = 0.4,
	humidity_max = 0,
}

moretrees.orange_tree_biome = {
	surface = {"default:dirt_with_dry_grass", "default:dirt_with_grass"},
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 15,
	seed_diff = 748,
	rarity = 85,
	max_count = 3,
	plantlife_limit = -0.6,
	humidity_min = 0.2,
	humidity_max = -0.4,
	temp_min = -0.3,
	temp_max = -0.6,
	min_elevation = 5,
	max_elevation = 40,
	
}

moretrees.jungletree_biome = {
	surface = {
		"default:dirt",
		"default:dirt_with_grass",
		"woodsoils:dirt_with_leaves_1",
		"woodsoils:grass_with_leaves_1",
		"woodsoils:grass_with_leaves_2"
	},
	avoid_nodes = {"moretrees:jungletree_trunk"},
	max_count = 12,
	avoid_radius = 3,
	rarity = 80,
	seed_diff = 329,
	min_elevation = 0,
	max_elevation = 40,
	temp_min = -0.5,
	temp_max = -0.99,
	humidity_min = -0.4,
	humidity_max = -0.99,
	plantlife_limit = -0.7,
	near_nodes = {"group:water"},
	near_nodes_size = 23,
	near_nodes_count = 5,
}

moretrees.spruce_biome = {
	surface = {
		"default:dirt_with_grass", 
		"default:dirt_with_ice", 
		"default:dirt_with_snow"
	},
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 11,
	seed_diff = 335,
	min_elevation = 20,
	max_elevation = 123,
	temp_min = 0.9,
	temp_max = 0.3,
	humidity_min = -0.1,
	humidity_max = -0.99,
	rarity = 55,
	max_count = 9,
	plantlife_limit = -0.2,
}

moretrees.pine_biome = {
	surface = {
		"default:dirt_with_grass", 
		"default:dirt_with_ice",
		"default:dirt_with_snow",
	},
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 13,
	humidity_min = 0.25,
	humidity_max = -0.75,
	plantlife_limit = -0.5,
	seed_diff = 336,
	near_nodes = {"group:water"},
	near_nodes_size = 13,
	near_nodes_count = 5,
	rarity = 80,
	max_count = 12,
}

moretrees.fir_biome = {
	surface = {
		"default:dirt_with_grass", 
		"default:dirt_with_ice",
		"default:dirt_with_snow",
	},
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 9,
	seed_diff = 359,
	min_elevation = 5,
	max_elevation = 123,
	temp_min = 0.95,
	temp_max = 0.1,
	humidity_min = -0.3,
	humidity_max = -0.99,
	rarity = 45,
	max_count = 23,
	plantlife_limit = -0.8,
}

moretrees.fir_biome_snow = {
	surface = {
		"default:dirt_with_snow",
	},
	avoid_nodes = moretrees.avoidnodes,
	avoid_radius = 7,
	seed_diff = 359,
	rarity = 30,
	max_count = 23,
	min_elevation = 3,
	max_elevation = 123,
	temp_min = 0.9,
	temp_max = 0.5,
	plantlife_limit = -0.95,
}

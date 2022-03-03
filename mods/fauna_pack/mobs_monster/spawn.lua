-- Dirt Monster

mobs:spawn({
	name = "mobs_monster:dirt_monster",
	nodes = {"element:dirt_with_grass", "element:dirt_with_grass_light"},
	min_light = 0,
	max_light = 7,
	chance = 6000,
	active_object_count = 2,
	min_height = 0,
	day_toggle = false,
})

mobs:register_spawn("mobs_monster:dirt_monster",
	{"element:dirt_with_grass", "element:dirt_with_grass_light"}, 7, 0, 7000, 1, 31000, false)

-- Dungeon Master

mobs:spawn({
	name = "mobs_monster:dungeon_master",
	nodes = {"element:stone"},
	max_light = 5,
	chance = 9000,
	active_object_count = 1,
	max_height = -70,
})
mobs:register_spawn("mobs_monster:dungeon_master", {"element:stone"}, 7, 0, 9000, 1, -120)
-- Lava Flan

mobs:spawn({
	name = "mobs_monster:lava_flan",
	nodes = {"element:lava_source"},
	chance = 1500,
	active_object_count = 1,
	max_height = 0,
})
mobs:register_spawn("mobs_monster:lava_flan", {"element:lava_source"}, 15, 0, 2300, 2, -123)

-- Oerkki

mobs:spawn({
	name = "mobs_monster:oerkki",
	nodes = {"element:stone"},
	max_light = 7,
	chance = 7000,
	max_height = -10,
})
mobs:register_spawn("mobs_monster:oerkki", {"element:stone"}, 7, 0, 10000, 1, -10)
-- Sand Monster

mobs:spawn({
	name = "mobs_monster:sand_monster",
	nodes = {"element:desert_sand", "element:sandstone"},
	chance = 7000,
	active_object_count = 2,
	min_height = 0,
})
mobs:register_spawn("mobs_monster:sand_monster", {"element:desert_sand", "element:sandstone"}, 20, 0, 8000, 1, 31000)
-- Spider (above ground)

mobs:spawn({
	name = "mobs_monster:spider",
	nodes = {
		"default:dirt_with_rainforest_litter", "default:snowblock",
		"default:snow", "ethereal:crystal_dirt", "ethereal:cold_dirt"
	},
	min_light = 0,
	max_light = 8,
	chance = 7000,
	active_object_count = 1,
	min_height = 25,
	max_height = 31000,
})
mobs:register_spawn("mobs_monster:spider",
	{"element_stone", "mineral:mithril_stone", "element:desert_stone", "element:dirt_with_grass_jungle"}, 13, 0, 7000, 1, 71)
-- Spider (below ground)
mobs:spawn({
	name = "mobs_monster:spider",
	nodes = {"default:stone_with_mese", "default:mese", "default:stone"},
	min_light = 0,
	max_light = 7,
	chance = 7000,
	active_object_count = 1,
	min_height = -31000,
	max_height = -40,
})

-- Stone Monster

mobs:spawn({
	name = "mobs_monster:stone_monster",
	nodes = {"element:stone", "element:desert_stone", "element:sandstone"},
	max_light = 7,
	chance = 7000,
	max_height = 0,
})
mobs:register_spawn("mobs_monster:stone_monster", {"element:stone", "element:desert_stone", "element:sandstone"}, 7, 0, 9000, 1, 0)
-- Tree Monster

mobs:spawn({
	name = "mobs_monster:tree_monster",
	nodes = {"plant:leaves", "tree:jungle_leaves", "tree:oak_leaves", "tree:willow_leaves"},
	max_light = 7,
	chance = 7000,
	min_height = 0,
	day_toggle = false,
})
mobs:register_spawn("mobs_monster:tree_monster",
	{"plant:leaves", "tree:jungle_leaves", "tree:oak_leaves", "tree:willow_leaves"}, 7, 0, 10000, 1, 31000, false)

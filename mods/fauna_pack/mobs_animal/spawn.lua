-- Bee

mobs:spawn({
	name = "mobs_animal:bee",
	nodes = {"group:flower"},
	min_light = 14,
	interval = 60,
	chance = 7000,
	min_height = 3,
	max_height = 200,
	day_toggle = true,
})

mobs:register_spawn("mobs:bee", {"group:flower"}, 20, 12, 7000, 1, 300, true)

-- Bunny

mobs:spawn({
	name = "mobs_animal:bunny",
	nodes = {"element:dirt_with_grass_light"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})

mobs:register_spawn("mobs_animal:bunny",
	{"element:dirt_with_grass_light"}, 20, 14, 8000, 2, 200, true)

-- Chicken

mobs:spawn({
	name = "mobs_animal:chicken",
	nodes = {"element:dirt_with_dry_grass", "element:dirt_with_grass_jungle"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 9000,
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})

mobs:register_spawn("mobs_animal:chicken",
	{"element:dirt_with_dry_grass", "element:dirt_with_grass_jungle"}, 20, 14, 9000, 1, 200, true)

-- Cow

mobs:spawn({
	name = "mobs_animal:cow",
	nodes = {"element:dirt_with_grass"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 10000,
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})

mobs:register_spawn("mobs_animal:cow",
	{"element:dirt_with_grass"}, 20, 14, 10000, 1, 200, true)

-- Kitten

mobs:spawn({
	name = "mobs_animal:kitten",
	nodes = {"element:dirt_with_grass_light"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 10000,
	min_height = 5,
	max_height = 50,
	day_toggle = true,
})

mobs:register_spawn("mobs_animal:kitten",
	{"element:dirt_with_grass_light"}, 20, 12, 12000, 1, 50, true)

-- Panda

mobs:spawn({
	name = "mobs_animal:panda",
	nodes = {"ethereal:bamboo_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 10,
	max_height = 80,
	day_toggle = true,
})

-- Penguin

mobs:spawn({
	name = "mobs_animal:penguin",
	nodes = {"element:snowblock"},
	min_light = 14,
	interval = 60,
	chance = 20000,
	min_height = 0,
	max_height = 200,
	day_toggle = true,
})

mobs:register_spawn("mobs_animal:penguin",
	{"element:snowblock"}, 20, 14, 20000, 1, 200, true)

-- Rat

mobs:spawn({
	name = "mobs_animal:rat",
	nodes = {"element:stone"},
	min_light = 3,
	max_light = 9,
	interval = 60,
	chance = 8000,
	max_height = 0,
})

-- Sheep

mobs:spawn({
	name = "mobs_animal:sheep_white",
	nodes = {"element:dirt_with_grass", "element:dirt_with_grass_light"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 0,
	max_height = 200,
	day_toggle = true,
})

mobs:register_spawn("mobs_animal:sheep_white",
	{"element:dirt_with_grass", "element:dirt_with_grass_light"}, 20, 14, 8000, 1, 200, true)

-- Warthog

mobs:spawn({
	name = "mobs_animal:pumba",
	nodes = {"element:dirt_with_grass", "element:dirt_with_snow","tree:oak_trunk", "tree:beech_trunk", "tree:pine_trunk"},
	neighbors = {"group:water"},
	min_light = 14,
	interval = 60,
	chance = 8000,
	min_height = 0,
	max_height = 200,
	day_toggle = true,
})

mobs:register_spawn("mobs_animal:pumba",
	{"element:dirt_with_grass", "element:dirt_with_snow","tree:oak_trunk", "tree:beech_trunk", "tree:pine_trunk"}, 20, 14, 8000, 1, 300, true)

-- mobs:register_spawn(name, nodes, max_light, min_light, chance, active_object_count, max_height, day_toggle)

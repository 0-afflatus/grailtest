-- Grailtest 5 --
-- mods/flora_pack/plant/vegetables.lua --

-- translation support.
local S = minetest.get_translator("plant")

-- Beetroot --

plant.register_plant("plant:beetroot", {
	description = S("Beetroot"),
	harvest_description = "beetroot_leaves",
	food_value = 2,
	paramtype2 = "meshoptions",
	inventory_image = "plant_beetroot.png",
	steps = 4,
	grow_time = 237,
	minlight = 12,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_beetroot = 1, flammable = 2, vegetable = 1},
	seed_groups = {food_beetroot = 1, seed = 1, snappy = 3, attached_node = 1, vegetable = 1},
	place_param2 = 3,
})

-- Garlic --

plant.register_plant("plant:garlic", {
	description = S("Garlic"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_garlic.png",
	steps = 5,
	grow_time = 275,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_garlic = 1, flammable = 2},
	seed_groups = {food_garlic = 1, seed = 1, snappy = 3, attached_node = 1, vegetable = 1},
	place_param2 = 3,
})

-- Turnip --

plant.register_plant("plant:turnip", {
	description = S("Turnip"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_turnip.png",
	steps = 5,
	grow_time = 242,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_turnip = 1, flammable = 2},
	seed_groups = {food_turnip = 1, seed = 1, snappy = 3, attached_node = 1, vegetable = 1},
	place_param2 = 3,
})

-- Carrot --

plant.register_plant("plant:carrot", {
	description = S("Carrot"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_carrot.png",
	steps = 4,
	grow_time = 286,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_carrot = 1, flammable = 2},
	seed_groups = {food_carrot = 1, seed = 1, snappy = 3, attached_node = 1, vegetable = 1, salad = 1},
	place_param2 = 3,
	food_value = 2,
})

-- Onion --

plant.register_plant("plant:onion", {
	description = S("Onion"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_onion.png",
	steps = 5,
	grow_time = 242,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_onion = 1, flammable = 2},
	seed_groups = {food_onion = 1, seed = 1, snappy = 3, attached_node = 1, vegetable = 1},
	place_param2 = 3,
})

-- Spinach --

plant.register_plant("plant:spinach", {
	description = S("Spinach"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_spinach.png",
	steps = 5,
	grow_time = 242,
	minlight = 12,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_spinach = 1, flammable = 2},
	seed_groups = {food_spinach = 1, seed = 1, snappy = 3, attached_node = 1, vegetable = 1, salad = 1},
	place_param2 = 3,
	food_value = 1,
})

-- Fat Hen (Goosefoot) --

plant.register_plant("plant:fathen", {
	description = S("Fat Hen"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_fathen.png",
	steps = 4,
	grow_time = 242,
	minlight = 12,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_fathen = 1, flammable = 2, flora = 1},
	seed_groups = {food_fathen = 1, seed = 1, snappy = 3, attached_node = 1, vegetable = 1},
	place_param2 = 3,
	food_value = 1,
})

-- Beans

plant.register_plant("plant:beans", {
	description = S("Beans"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_beans.png",
	steps = 4,
	grow_time = 242,
	minlight = 12,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_beans = 1, flammable = 2},
	seed_groups = {food_beans = 1, seed = 1, snappy = 3, attached_node = 1, vegetable = 1, vegetable = 1, salad = 1, pulse = 1},
	place_param2 = 3,
	food_value = 2,
})

-- Lentils

plant.register_plant("plant:lentil", {
	description = S("Lentils"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_lentil.png",
	steps = 4,
	grow_time = 242,
	minlight = 12,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_lentils = 1, flammable = 2},
	seed_groups = {food_lentils = 1, seed = 1, snappy = 3, attached_node = 1, vegetable = 1, vegetable = 1, pulse = 1},
	place_param2 = 3,
})

-- Cabbage --

plant.register_plant("plant:cabbage", {
	description = S("Cabbage"),
	paramtype2 = "meshoptions",
	inventory_image = "plant_cabbage.png",
	steps = 4,
	grow_time = 242,
	minlight = 12,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_cabbage = 1, flammable = 2, flora = 1},
	seed_groups = {food_cabbage = 1, seed = 1, snappy = 3, attached_node = 1, vegetable = 1},
	place_param2 = 3,
	food_value = 1,
})


--
-- Mapgen --
--

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"element:dirt_with_grass"},
	sidelen = 80,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 128, y = 128, z = 128},
		seed = 709,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"grassland", "woodland"},
	y_min = 5,
	y_max = 50,
	decoration = {"plant:beetroot_4", "plant:spinach_5", "plant:turnip_5", "plant:beans_4", "plant:fathen_4", "plant:cabbage_4" },
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"element:dirt_with_grass_light"},
	sidelen = 80,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 128, y = 128, z = 128},
		seed = 709,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"chapparal", "mediterranean"},
	y_min = 5,
	y_max = 50,
	decoration = {"plant:carrot_4", "plant:onion_5", "plant:garlic_5", "plant:lentil_4"},
})


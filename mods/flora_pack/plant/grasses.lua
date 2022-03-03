-- Grailtest 5 --
-- mods/flora_pack/plant/grasses.lua --

-- translation support.
local S = minetest.get_translator("plant")

--
-- Dry Shrub
--

minetest.register_node("plant:dry_shrub", {
	description = S("Dry Shrub"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"plant_dry_shrub.png"},
	inventory_image = "plant_dry_shrub.png",
	wield_image = "plant_dry_shrub.png",
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = true,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = plant.sel,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"element:desert_sand",
		"element:sand",
		"element:dirt_with_snow",
		"element:dirt_with_ice",
		"element:dirt_with_dry_grass"
	},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.015,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert", "steppe", "tundra", "savanna" },
	y_min = 2,
	y_max = 120,
	decoration = "plant:dry_shrub",
})

--
-- Grass
--

minetest.register_node("plant:grass_1", {
	description = S("Grass"),
	drawtype = "plantlike",
	tiles = {"plant_grass_1.png"},
	inventory_image = "plant_grass_3.png",
	wield_image = "plant_grass_3.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:grass_1'}},
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = plant.sel,
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("plant:grass_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("plant:grass_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

for i=2,5 do
	minetest.register_node("plant:grass_"..i, {
		description = S("Grass"),
		drawtype = "plantlike",
		tiles = {"plant_grass_"..i..".png"},
		inventory_image = "plant_grass_"..i..".png",
		wield_image = "plant_grass_"..i..".png",
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		drop = {
			max_items = 1,
			items = {
				{items = {'plant:oats'},rarity = 9},
				{items = {'plant:barley'},rarity = 9},
				{items = {'plant:hay'},rarity = 2},
				{items = {'plant:grass_1'},rarity = 2},
			}
		},
		groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory = 1},
		sounds = base.node_sound_leaves_defaults(),
		selection_box = plant.sel,
	})
end

minetest.register_craft({
	type = "fuel",
	recipe = "plant:grass_1",
	burntime = 2,
})

local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"element:dirt_with_grass", "element:dirt_with_grass_light"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.75
		},
		biomes = {"grassland", "woodland", "alpine", "woodland_swamp", "mediterranean", "chapparal"},
		y_min = 1,
		y_max = 100,
		decoration = "plant:grass_"..length,
	})
end

register_grass_decoration(0.09, 0.06,  3)
register_grass_decoration(0.11, 0.045, 2)
register_grass_decoration(0.13, 0.03,  1)
register_grass_decoration(0.07, 0.075, 4)
register_grass_decoration(0.05, 0.09,  5)

--
-- Golden Grass
--

minetest.register_node("plant:golden_grass_1", {
	description = S("Golden Grass"),
	drawtype = "plantlike",
	tiles = {"plant_golden_grass_1.png"},
	-- use a bigger inventory image
	inventory_image = "plant_golden_grass_3.png",
	wield_image = "plant_golden_grass_3.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:golden_grass_1'}},
		}
	},
	groups = {snappy=3,flammable=3,flora=1,attached_node=1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = plant.sel,
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random golden_grass node
		local stack = ItemStack("plant:golden_grass_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("plant:golden_grass_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

for i=2,5 do
	minetest.register_node("plant:golden_grass_"..i, {
		description = S("Golden Grass"),
		drawtype = "plantlike",
		tiles = {"plant_golden_grass_"..i..".png"},
		inventory_image = "plant_golden_grass_"..i..".png",
		wield_image = "plant_golden_grass_"..i..".png",
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		drop = {
			max_items = 1,
			items = {
				{items = {'plant:wheat'},rarity = 10},
				{items = {'plant:wheat'},rarity = 10},
				{items = {'plant:hay'},rarity = 2},
				{items = {'plant:golden_grass_1'},rarity = 2},
			}
		},
		groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1},
		sounds = base.node_sound_leaves_defaults(),
		selection_box = plant.sel,
	})
end

minetest.register_craft({
	type = "fuel",
	recipe = "plant:golden_grass_1",
	burntime = 2,
})

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"element:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.75
		},
		biomes = {"savanna", "steppe"},
		y_min = 2,
		y_max = 100,
		decoration = "plant:golden_grass_"..length,
	})
end

register_dry_grass_decoration(0.09, 0.01,  3)
register_dry_grass_decoration(0.11, -0.01, 2)
register_dry_grass_decoration(0.13, -0.03, 1)
register_dry_grass_decoration(0.07, 0.03,  4)
register_dry_grass_decoration(0.05, 0.05,  5)

-- Juncus

minetest.register_node("plant:juncus_0", {
	description = S("Juncus"),
	drawtype = "plantlike",
	tiles = {"plant_juncus_02.png"},
	inventory_image = "plant_juncus_inv.png",
	wield_image = "plant_juncus_inv.png",
	visual_scale = 3.0,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:juncus_0'}},
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = plant.sel,
})

minetest.register_node("plant:juncus_1", {
	description = S("Juncus"),
	drawtype = "plantlike",
	tiles = {"plant_juncus_03.png"},
	inventory_image = "plant_juncus_inv.png",
	wield_image = "plant_juncus_inv.png",
	visual_scale = 3.0,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:juncus_1'}},
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = plant.sel,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"element:sand"},
	spawn_by = "group:soil",
	num_spawn_by = 2,
	sidelen = 16,
	noise_params = {
		offset = 0.2,
		scale = 0.005,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {
		"grassland",
		"grassland_ocean",
		"woodland_swamp",
		"woodland",
		"woodland_ocean",
		"mediterranean",
		"steppe",
		"savanna",
		"savanna_swamp",
		"savanna_ocean",
		"tropical_ocean",
		"rainforest_swamp"
	},
	y_min = 1,
	y_max = 40,
	decoration = {
		"plant:juncus_0",
		"plant:juncus_1",
		"plant:reedmace_height_2",
		"plant:reedmace_height_3",
		"plant:reedmace_height_3_spikes"
	}
})

--
-- Wheat
--

plant.register_plant("plant:wheat", {
	description = S("Wheat"),
	harvest_description = "straw",
	paramtype2 = "meshoptions",
	inventory_image = "plant_wheat_seed.png",
	steps = 8,
	grow_time = 286,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_wheat = 1, flammable = 4},
	seed_groups = {food_wheat = 1, grain = 1, seed = 1, snappy = 3, attached_node = 1},
	place_param2 = 3,
})

--
-- Oats
--

plant.register_plant("plant:oats", {
	description = S("Oats"),
	harvest_description = "straw",
	paramtype2 = "meshoptions",
	inventory_image = "plant_oats_seed.png",
	steps = 8,
	grow_time = 242,
	minlight = 11,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_oats = 1, flammable = 4},
	seed_groups = {food_oats = 1, grain = 1, seed = 1, snappy = 3, attached_node = 1},
	place_param2 = 3,
})

--
-- Barley
--

plant.register_plant("plant:barley", {
	description = S("Barley"),
	harvest_description = "straw",
	paramtype2 = "meshoptions",
	inventory_image = "plant_barley_seed.png",
	steps = 7,
	grow_time = 264,
	minlight = 13,
	maxlight = base.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {food_barley = 1, flammable = 4},
	seed_groups = {food_barley = 1, grain = 1, seed = 1, snappy = 3, attached_node = 1},
	place_param2 = 3,
})

-- Papyrus

minetest.register_node("plant:papyrus", {
	description = S("Papyrus Reed"),
	drawtype = "plantlike",
	tiles = {"plant_papyrus.png"},
	inventory_image = "plant_papyrus.png",
	wield_image = "plant_papyrus.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {snappy=3,flammable=2},
	sounds = base.node_sound_leaves_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
		base.dig_up(pos, node, digger)
	end,
})

function plant.grow_papyrus(pos, node)
	pos.y = pos.y - 1
	--local name = minetest.get_node(pos).name
	if not minetest.find_node_near(pos, 3, {"group:water"}) then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "plant:papyrus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	minetest.set_node(pos, {name = "plant:papyrus"})
	return true
end

minetest.register_craft({
	type = "fuel",
	recipe = "plant:papyrus",
	burntime = 1,
})

minetest.register_abm({
	nodenames = {"plant:papyrus"},
	neighbors = {"element:dirt", "element:dirt_with_grass", "element:sand"},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		plant.grow_papyrus(pos, node)
	end
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {
		"element:dirt",
		"element:dirt_with_grass",
		"element:dirt_red", "element:dirt_jungle",
		"element:dirt_with_grass_jungle",
		"element:mud", "element:sand"
	},
	sidelen = 16,
	noise_params = {
		offset = -0.7,
		scale = 0.7,
		spread = {x = 200, y = 200, z = 200},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"savanna_swamp", "rainforest_swamp", "savanna_ocean", "tropical_ocean" },
	y_min = 0,
	y_max = 1,
	schematic = minetest.get_modpath("plant").."/schematics/papyrus.mts",
})

-- Papyrus

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"element:dirt_with_grass"},
	sidelen = 8,
	noise_params = {
		offset = -0.3,
		scale = 0.7,
		spread = {x = 100, y = 100, z = 100},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	y_min = 0,
	y_max = 1,
	decoration = "plant:papyrus",
	height = 2,
	height_max = 4,
	spawn_by = "element:water_source",
	num_spawn_by = 1,
})

-- Grailtest 5 --
-- mods/flora_pack/plant/shrubs.lua --

--
-- Heath shrubs
--

local random = math.random

-- Bush

minetest.register_node("plant:bush_stem", {
	description = "Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.18,
	tiles = {"plant_bush_stem.png"},
	inventory_image = "plant_bush_stem.png",
	wield_image = "plant_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.54, 7 / 16},
	},
})

minetest.register_node("plant:bush_leaves", {
	description = "Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"plant_bush.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:bush_sapling"}, rarity = 5},
			{items = {"plant:bush_leaves"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
})

function plant.grow_bush(pos)
	local path = minetest.get_modpath("plant") .. "/schematics/bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end

minetest.register_node("plant:bush_sapling", {
	description = "Bush Sapling",
	drawtype = "plantlike",
	tiles = {"plant_bush_sapling.png"},
	inventory_image = "plant_bush_sapling.png",
	wield_image = "plant_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = plant.grow_bush,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"plant:bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "element:dirt_with_grass_light", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 137,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"grassland", "woodland", "chapparal", "alpine"},
	y_min = 1,
	y_max = 110,
	schematic = minetest.get_modpath("plant") .. "/schematics/bush.mts",
	flags = "place_center_x, place_center_z",
})

-- Acacia bush

minetest.register_node("plant:acacia_bush_stem", {
	description = "Acacia Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.18,
	tiles = {"plant_acacia_bush_stem.png"},
	inventory_image = "plant_acacia_bush_stem.png",
	wield_image = "plant_acacia_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.54, 7 / 16},
	},
})

minetest.register_node("plant:acacia_bush_leaves", {
	description = "Acacia Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"plant_acacia_bush.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:acacia_sapling"}, rarity = 5},
			{items = {"plant:acacia_eaves"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
})

function plant.grow_acacia_bush(pos)
	local path = minetest.get_modpath("plant") .. "/schematics/acacia_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end

minetest.register_node("plant:acacia_bush_sapling", {
	description = "Acacia Bush Sapling",
	drawtype = "plantlike",
	tiles = {"plant_acacia_bush_sapling.png"},
	inventory_image = "plant_acacia_bush_sapling.png",
	wield_image = "plant_acacia_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = plant.grow_acacia_bush,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"plant:acacia_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 90155,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"savanna"},
	y_min = 1,
	y_max = 70,
	schematic = minetest.get_modpath("plant") .. "/schematics/acacia_bush.mts",
	flags = "place_center_x, place_center_z",
})

--
-- fuschia
--

minetest.register_node("plant:fuschia", {
	description = "Fuschia",
	drawtype = "allfaces_optional",
	tiles = {"plant_fuschia.png"},
	waving = 0,
	paramtype = "light",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, flower=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:fuschia_sapling"}, rarity = 5},
			{items = {"plant:fuschia"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
})

minetest.register_node("plant:fuschia_flowers", {
	description = "Fuschia",
	drawtype = "allfaces_optional",
	tiles = {"plant_fuschia_flowers.png"},
	waving = 0,
	paramtype = "light",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, flower=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:fuschia_sapling"}, rarity = 5},
			{items = {"plant:fuschia"}}
		}
	},
	on_timer = function(pos)
	    lumin = minetest.get_node_light(pos, nil)
	    if lumin < 4 then
	        minetest.set_node(pos, {name="plant:fuschia"})
	    elseif lumin > 12 then
	        minetest.get_node_timer(pos):start(random(223, 1299))
	    end
	end,
	sounds = base.node_sound_leaves_defaults(),
})


function plant.grow_fuschia(pos)
	local path = minetest.get_modpath("plant") .. "/schematics/fuschia_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end

minetest.register_node("plant:fuschia_sapling", {
	description = "Fuschia Sapling",
	drawtype = "plantlike",
	tiles = {"plant_fuschia_sapling.png"},
	inventory_image = "plant_fuschia_sapling.png",
	wield_image = "plant_fuschia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = plant.grow_fuschia,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"plant:fuschia_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass_jungle"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = 0.02,
		spread = {x = 63, y = 63, z = 63},
		seed = 6396,
		octaves = 3,
		persist = 0.5
	},
	biomes = {"rainforest"},
	--spawn_by = "",
	y_min = 2,
	y_max = 80,
	schematic = minetest.get_modpath("plant").."/schematics/fuschia_bush.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

--
-- bearberry
--

minetest.register_node("plant:bearberry", {
	description = "Bearberry",
	drawtype = "allfaces_optional",
	tiles = {"plant_bearberry.png"},
	waving = 0,
	paramtype = "light",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, flower=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:bearberry_sapling"}, rarity = 5},
			{items = {"plant:bearberry"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
})

function plant.grow_bearberry(pos)
	local path = minetest.get_modpath("plant") .. "/schematics/bearberry_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end

minetest.register_node("plant:bearberry_sapling", {
	description = "Bearberry Sapling",
	drawtype = "plantlike",
	tiles = {"plant_bearberry_sapling.png"},
	inventory_image = "plant_bearberry_sapling.png",
	wield_image = "plant_bearberry_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = plant.grow_bearberry,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"plant:bearberry_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_ice"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 35467,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"tundra", "taiga"},
	--spawn_by = "",
	y_min = 3,
	y_max = 80,
	schematic = minetest.get_modpath("plant").."/schematics/bearberry_bush.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

--
-- gorse
--

minetest.register_node("plant:gorse", {
	description = "Gorse Flowers",
	drawtype = "plantlike",
	visual_scale = 1.15,
	tiles = {"plant_heath_gorse.png"},
	inventory_image = "plant_heath_gorse.png",
	use_texture_alpha = "clip",
	waving = 0,
	paramtype = "light",
	on_timer = plant.grow_shrub,
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, salad=1, flower=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:gorse_sapling"}, rarity = 5},
			{items = {"plant:gorse"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
})

function plant.grow_gorse(pos)
	local path = minetest.get_modpath("plant") .. "/schematics/gorse_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end

minetest.register_node("plant:gorse_sapling", {
	description = "Gorse Sapling",
	drawtype = "plantlike",
	tiles = {"plant_gorse_sapling.png"},
	inventory_image = "plant_gorse_sapling.png",
	wield_image = "plant_gorse_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = plant.grow_gorse,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"plant:gorse_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_node("plant:gorse_trunk", {
	description = "Gorse trunk",
	drawtype = "nodebox",
	node_box = {
			type = "fixed",
			fixed = {
			   {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			   {-0.5, 0.25, -0.5, 0.5, 0.5, 0.5},
			   {-0.375, 0, -0.375, 0.375, 0.5, 0.375},
		    },
		},
	tiles = {"plant_heath_gorse.png"},
	inventory_image = "plant_heath_gorse.png",
	use_texture_alpha = "clip",
	waving = 0,
	paramtype = "light",
	drop = "plant:gorse",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, salad=1, flower=1},
	sounds = base.node_sound_leaves_defaults(),
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 611,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"grassland", "steppe", "alpine"},
	--spawn_by = "",
	y_min = 13,
	y_max = 80,
	schematic = minetest.get_modpath("plant").."/schematics/gorse_bush.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

--
-- blackberry
--

minetest.register_node("plant:blackberry", {
	description = "Blackberry Leaves",
	drawtype = "allfaces_optional",
	tiles = {"plant_blackberry_leaves.png"},
	waving = 0,
	paramtype = "light",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:blackberry_sapling"}, rarity = 5},
			{items = {'plant:blackberry_fruit'},rarity=8},
			{items = {'plant:blackberry_fruit'},rarity=16},
			{items = {'plant:blackberry'},rarity=4},
		}
	},
	sounds = base.node_sound_leaves_defaults(),
})

minetest.register_node("plant:blackberry_flowers", {
	description = "Blackberry Leaves",
	drawtype = "allfaces_optional",
	tiles = {"plant_blackberry_flowers.png"},
	waving = 0,
	paramtype = "light",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:blackberry_sapling"}, rarity = 5},
			{items = {'plant:blackberry_fruit'},rarity=8},
			{items = {'plant:blackberry_fruit'},rarity=16},
			{items = {'plant:blackberry'},rarity=4},
		}
	},
    on_timer = plant.grow_fruit,
	sounds = base.node_sound_leaves_defaults(),
})


function plant.grow_blackberry(pos)
	local path = minetest.get_modpath("plant") .. "/schematics/bramble_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end

minetest.register_node("plant:blackberry_sapling", {
	description = "Blackberry Sapling",
	drawtype = "plantlike",
	tiles = {"plant_blackberry_sapling.png"},
	inventory_image = "plant_blackberry_sapling.png",
	wield_image = "plant_blackberry_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = plant.grow_blackberry,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"plant:blackberry_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_node("plant:blackberry_fruit", {
	description = "Blackberry",
	tiles = {"plant_blackberry_fruit.png"},
	inventory_image = "plant_blackberry_fruit.png",
	wield_image = "plant_blackberry_fruit.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3, dig_immediate=3, flammable=2, leafdecay=3, leafdecay_drop=1, fruit=1},
	sounds = base.node_sound_defaults(),
	on_use = minetest.item_eat(1),
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 715,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"grassland", "woodland"},
	--spawn_by = "",
	y_min = 5,
	y_max = 50,
	schematic = minetest.get_modpath("plant").."/schematics/bramble_bush.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

--
-- hawthorn
--

minetest.register_node("plant:hawthorn", {
	description = "Hawthorn Leaves",
	drawtype = "allfaces_optional",
	tiles = {"plant_hawthorn.png^[transformR180", "plant_hawthorn.png"},
	waving = 0,
	paramtype = "light",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, salad=1, flower=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:hawthorn_sapling"}, rarity = 5},
			{items = {"plant:hawthorn"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
})

minetest.register_node("plant:hawthorn_flowers", {
	description = "Hawthorn Leaves",
	drawtype = "allfaces_optional",
	tiles = {"plant_hawthorn_flowers.png^[transformR180", "plant_hawthorn_flowers.png"},
	waving = 0,
	paramtype = "light",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, salad=1, flower=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:hawthorn_sapling"}, rarity = 5},
			{items = {"plant:hawthorn"}}
		}
	},
	on_timer = function(pos)
	    lumin = minetest.get_node_light(pos, nil)
	    if lumin < 4 then
	        minetest.set_node(pos, {name="plant:hawthorn"})
	    elseif lumin > 12 then
	        minetest.get_node_timer(pos):start(random(223, 1299))
	    end
	end,
	sounds = base.node_sound_leaves_defaults(),
})

function plant.grow_hawthorn(pos)
	local path = minetest.get_modpath("plant") .. "/schematics/hawthorn_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end

minetest.register_node("plant:hawthorn_sapling", {
	description = "Hawthorn Sapling",
	drawtype = "plantlike",
	tiles = {"plant_hawthorn_sapling.png"},
	inventory_image = "plant_hawthorn_sapling.png",
	wield_image = "plant_hawthorn_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = plant.grow_hawthorn,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"plant:hawthorn_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass", "element:dirt_with_ice", "element:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 555,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"woodland", "alpine"},
	y_min = 3,
	y_max = 100,
	schematic = minetest.get_modpath("plant").."/schematics/hawthorn_bush.mts",
	flags = "place_center_x, place_center_z",
	rotation = "180",
})

--
-- holly
--

minetest.register_node("plant:holly", {
	description = "Holly Leaves",
	drawtype = "allfaces_optional",
	tiles = {"plant_holly.png^[transformR180", "plant_holly.png"},
	waving = 0,
	paramtype = "light",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:holly_sapling"}, rarity = 5},
			{items = {"plant:holly"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
})

function plant.grow_holly(pos)
	local path = minetest.get_modpath("plant") .. "/schematics/holly_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end

minetest.register_node("plant:holly_sapling", {
	description = "Holly Sapling",
	drawtype = "plantlike",
	tiles = {"plant_holly_sapling.png"},
	inventory_image = "plant_holly_sapling.png",
	wield_image = "plant_holly_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = plant.grow_holly,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"plant:holly_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"element:dirt_with_grass", "element:dirt_with_ice", "element:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 555,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"woodland", "alpine"},
	y_min = 3,
	y_max = 100,
	schematic = minetest.get_modpath("plant").."/schematics/holly_bush.mts",
	flags = "place_center_x, place_center_z",
	rotation = "180",
})

--
-- juniper
--

minetest.register_node("plant:juniper", {
	description = "Juniper Leaves",
	drawtype = "allfaces_optional",
	tiles = {"plant_juniper.png"},
	waving = 0,
	paramtype = "light",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"plant:juniper_sapling"}, rarity = 5},
			{items = {"plant:juniper"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
})

function plant.grow_juniper(pos)
	local path = minetest.get_modpath("plant") .. "/schematics/juniper_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end

minetest.register_node("plant:juniper_sapling", {
	description = "Juniper Sapling",
	drawtype = "plantlike",
	tiles = {"plant_juniper_sapling.png"},
	inventory_image = "plant_juniper_sapling.png",
	wield_image = "plant_juniper_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = plant.grow_juniper,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"plant:juniper_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:dirt_with_grass_light", "default:dirt_with_dry_grass" },
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 777,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"woodland", "tundra", "grassland", "mediterranean", "chapparal", "savanna"},
	y_min = 3,
	y_max = 100,
	schematic = minetest.get_modpath("plant").."/schematics/juniper_bush.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

--
-- Strawberry
--

minetest.register_node("plant:strawberry", {
	description = "Strawberry Leaves",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
	},
	tiles = {"plant_strawberry_leaves.png"},
	waving = 0,
	paramtype = "light",
	use_texture_alpha = "clip",
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:strawberry_fruit'},rarity=8},
			{items = {'plant:strawberry_fruit'},rarity=16},
			{items = {'plant:strawberry'},rarity=2},
			{items = {'plant:strawberry'},rarity=4},
		}
	},
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, flower=1, flora = 1},
	sounds = base.node_sound_leaves_defaults(),
})

minetest.register_node("plant:strawberry_fruit", {
	description = "Strawberry",
	tiles = {"plant_strawberry_fruit.png"},
	inventory_image = "plant_strawberry_fruit.png",
	wield_image = "plant_strawberry_fruit.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1,fruit=1},
	sounds = base.node_sound_defaults(),
	on_use = minetest.item_eat(1),
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"element:dirt_with_grass", "element:dirt_with_ice"},
	sidelen = 80,
	noise_params = {
		offset = -0.85,
		scale = 1,
		spread = {x = 63, y = 63, z = 63},
		seed = 233,
		octaves = 3,
		persist = 0.32
	},
	biomes = {"woodland", "alpine"},
	--spawn_by = "",
	y_min = 5,
	y_max = 60,
	decoration = {"plant:strawberry"},
})

-- Tundra rocks

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"element:dirt_with_ice", "element:stone"},
	sidelen = 80,
	noise_params = {
		offset = 0,
		scale = 0.015,
		spread = {x = 200, y = 200, z = 200},
		seed = 23623,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"tundra", "tundra_ocean", "alpine"},
	y_min = 1,
	y_max = 31000,
	decoration = {
		"shape:slab_stone_with_lichen_1",
		"shape:slab_stone_with_lichen_2",
		"shape:slab_stone_with_lichen_3",
		"shape:slab_mossycobble",
		"shape:slab_gravel",
	},
})

--
-- Heath
--
local rock_surfaces = {
	"element:stone",
	"mineral:bluestone",
	"mineral:basalt",
	"element:stone_with_lichen_1",
	"element:stone_with_lichen_2",
	"element:stone_with_lichen_3",
	"element:mossycobble",
	"mineral:coal_stone",
	"mineral:iron_stone",
	"mineral:tin_stone",
	"mineral:silver_stone",
}

local rockplant_biomes = {
	"tundra",
	"tundra_ocean",
	"crystal_caves",
	"steppe",
	"grassland",
	"cool_caves",
	"woodland",
	"woodland_swamp",
	"forest_caves",
	"alpine",
	"mountain"
}

local heath_surfaces = {
	"element:dirt_with_ice",
	"element:stone",
	"element:gravel",
	"element:mossycobble",
	"element:stone_with_lichen_1",
	"element:stone_with_lichen_2",
	"element:stone_with_lichen_3",
	"mineral:coal_stone",
	"mineral:iron_stone",
	"mineral:tin_stone",
	"mineral:silver_stone",
}

local heath_biomes_cool = {"tundra", "tundra_ocean", "grassland", "grassland_ocean", "alpine", "mountain"}

local heath_biomes_warm = {
	"grassland",
	"woodland",
	"woodland_swamp",
	"chapparal",
	"savanna",
	"savanna_swamp",
	"savanna_ocean",
	"rainforest_swamp",
	"sandy_shore"
}

minetest.register_node("plant:heath_sandwort", {
	description = "Sandwort",
	drawtype = "plantlike",
	visual_scale = 1.23,
	paramtype = "light",
	tiles = {"plant_heath_sandwort.png"},
	inventory_image = "plant_heath_sandwort.png",
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1, flower=1, flora = 1
	},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
	drop = "plant:heath_sandwort",
})

minetest.register_node("plant:heath_saxifrage_purple", {
	description = "Saxifrage",
	drawtype = "plantlike",
	visual_scale = 1.23,
	paramtype = "light",
	tiles = {"plant_heath_saxifrage_purple.png"},
	inventory_image = "plant_heath_saxifrage_purple.png",
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1, flower=1, flora = 1
	},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
	drop = "plant:heath_saxifrage_purple",
})

minetest.register_node("plant:heath_purple", {
	description = "Heather",
	drawtype = "plantlike",
	visual_scale = 1.23,
	paramtype = "light",
	tiles = {"plant_heath_purple.png"},
	inventory_image = "plant_heath_purple.png",
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1, flower=1, flora = 1
	},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
	drop = "plant:heath_purple",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = rock_surfaces,
	sidelen = 80,
	spawn_by = "group:crumbly",
	num_spawn_by = 1,
	noise_params = {
		offset = -0.08,
		scale = 0.5,
		spread = {x = 127, y = 127, z = 127},
		seed = 391,
		octaves = 4,
		persist = 0.3
	},
	y_min = 1,
	y_max = 83,
	biomes = rockplant_biomes,
	decoration = {"plant:heath_saxifrage_purple", "plant:heath_sandwort", },
	rotation = "random",
})


minetest.register_decoration({
	deco_type = "simple",
	place_on = heath_surfaces,
	sidelen = 80,
	noise_params = {
		offset = 0,
		scale = 0.01,
		spread = {x = 127, y = 127, z = 127},
		seed = 32496,
		octaves = 4,
		persist = 0.3
	},
	y_min = 1,
	y_max = 83,
	biomes = rockplant_biomes,
	decoration = {"plant:heath_purple"},
})


minetest.register_node("plant:heath_green", {
	description = "Heath",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
	},
	paramtype = "light",
	tiles = {"plant_heath_green_top.png"},
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1, flora = 1
	},
	sounds = base.node_sound_leaves_defaults(),
	drop = "plant:heath_green",
})

minetest.register_node("plant:heath_gold", {
	description = "Heath",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
	},
	paramtype = "light",
	tiles = {"plant_heath_gold_top.png"},
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1, flora = 1
	},
	sounds = base.node_sound_leaves_defaults(),
	drop = "plant:heath_gold",
})

minetest.register_node("plant:heath_red", {
	description = "Heath",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
	},
	paramtype = "light",
	tiles = {"plant_heath_red_top.png"},
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1, flora = 1
	},
	sounds = base.node_sound_leaves_defaults(),
	drop = "plant:heath_red",
})

minetest.register_abm({
        label = "Heath grow gold",
		nodenames = {"element:dirt_with_ice"},
		neighbors = {"plant:heath_gold"},
		interval = 997,
		chance = 23,
		catch_up = false,
		action = function(pos, node)
			local above = {x = pos.x, y = pos.y + 1, z = pos.z}
			local anode = minetest.get_node(above)
			if anode.name == "air" then
				minetest.set_node(above, {name = "plant:heath_gold"})
			end
		end,
})

minetest.register_abm({
        label = "Heath grow red",
		nodenames = {"element:dirt_with_ice"},
		neighbors = {"plant:heath_red"},
		interval = 995,
		chance = 23,
		catch_up = false,
		action = function(pos, node)
			local above = {x = pos.x, y = pos.y + 1, z = pos.z}
			local anode = minetest.get_node(above)
			if anode.name == "air" then
				minetest.set_node(above, {name = "plant:heath_red"})
			end
		end,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = heath_surfaces,
	sidelen = 80,
	noise_params = {
			offset = -0.1,
			scale = 0.2,
			spread = {x = 127, y = 127, z = 127},
			seed = 94875,
			octaves = 3,
			persist = 0.4,
		},
	y_min = 1,
	y_max = 87,
	biomes = heath_biomes_cool,
	decoration = {"plant:heath_gold"},
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = heath_surfaces,
	sidelen = 80,
	noise_params = {
			offset = -0.1,
			scale = 0.2,
			spread = {x = 127, y = 127, z = 127},
			seed = 474,
			octaves = 3,
			persist = 0.4,
		},
	y_min = 1,
	y_max = 87,
	biomes = heath_biomes_cool,
	decoration = {"plant:heath_red"},
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = heath_surfaces,
	sidelen = 80,
	noise_params = {
			offset = -0.1,
			scale = 0.2,
			spread = {x = 127, y = 127, z = 127},
			seed = 537,
			octaves = 3,
			persist = 0.4,
		},
	y_min = 1,
	y_max = 87,
	biomes = heath_biomes_warm,
	decoration = {"plant:heath_green"},
})

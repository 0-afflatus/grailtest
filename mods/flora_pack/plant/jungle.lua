-- Grailtest 5 --
-- mods/flora_pack/plant/jungle.lua --

-- translation support.
local S = minetest.get_translator("plant")

--
-- Junglegrass
--

minetest.register_node("plant:junglegrass", {
	description = S("Jungle Grass"),
	drawtype = "plantlike",
	visual_scale = 1.5,
	tiles = {"plant_junglegrass.png"},
	inventory_image = "plant_junglegrass.png",
	wield_image = "plant_junglegrass.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:maize_seed'},rarity = 8},
			{items = {'plant:junglegrass'}},
		}
	},
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = plant.sel,
})

minetest.register_node("plant:big_leaf_palm", {
	description = S("Big leaf palm"),
	drawtype = "plantlike",
	visual_scale = 2.0,
	tiles = {"plant_big_leaf_palm.png"},
	inventory_image = "plant_big_leaf_palm.png",
	wield_image = "plant_big_leaf_palm.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = plant.sel2,
})

minetest.register_node("plant:drakensberg_cycad", {
	description = S("Drakensberg cycad"),
	drawtype = "plantlike",
	visual_scale = 3.0,
	tiles = {"plant_drakensberg_cycad.png"},
	inventory_image = "plant_drakensberg_cycad.png",
	wield_image = "plant_drakensberg_cycad.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = plant.sel2,
})

minetest.register_node("plant:dwarf_sugar_palm", {
	description = S("Dwarf sugar palm"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"plant_dwarf_sugar_palm.png"},
	inventory_image = "plant_dwarf_sugar_palm.png",
	wield_image = "plant_dwarf_sugar_palm.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = plant.sel,
})

minetest.register_node("plant:racinaea_fraseri", {
	description = "Racinaea fraseri",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"plant_racinaea_fraseri.png"},
	inventory_image = "plant_racinaea_fraseri.png",
	wield_image = "plant_racinaea_fraseri.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = plant.sel1,
})


minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "element:dirt_with_grass_jungle", "element:mud"},
	sidelen = 80,
	fill_ratio = 0.37,
	biomes = {"rainforest", "rainforest_swamp"},
	y_min = 1,
	y_max = 70,
	decoration = {
		"plant:junglegrass",
		"plant:big_leaf_palm",
		"plant:drakensberg_cycad",
		"plant:dwarf_sugar_palm",
		"plant:racinaea_fraseri"
	}
})

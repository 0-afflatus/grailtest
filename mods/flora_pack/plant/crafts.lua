-- Grailtest 5 --
-- mods/flora_pack/plant/crafts.lua --

-- translation support.
local S = minetest.get_translator("plant")

minetest.register_craftitem("plant:straw", {
	description = S("Sheaf of Straw"),
	inventory_image = "plant_straw.png",
})

minetest.register_craftitem("plant:hay", {
	description = S("Sheaf of Hay"),
	inventory_image = "plant_hay.png",
})

minetest.register_node("plant:straw_bale", {
        description = S("Straw Bale"),
        tiles = {"plant_straw_bale.png"},
	walkable = true,
	groups = {flammable=3,crumbly=3},
	sounds = base.node_sound_dirt_defaults()
})

minetest.register_node("plant:hay_bale", {
        description = S("Hay Bale"),
        tiles = {"plant_hay_bale.png"},
	walkable = true,
	groups = {flammable=2,crumbly=2, falling_node=1},
	sounds = base.node_sound_dirt_defaults()
})

minetest.register_craft({
	output = 'plant:hay_bale',
	recipe = {
		{'plant:hay', 'plant:hay'},
		{'plant:hay', 'plant:hay'},
	}
})

minetest.register_craft({
	output = 'plant:straw_bale',
	recipe = {
		{'plant:straw', 'plant:straw'},
		{'plant:straw', 'plant:straw'},
	}
})

minetest.register_craft({
	output = 'plant:straw 4',
	recipe = {
		{'plant:straw_bale'}
	}
})

minetest.register_craft({
	output = 'plant:hay 4',
	recipe = {
		{'plant:hay_bale'}
	}
})

--
-- Fibre plants
--

minetest.register_craftitem("plant:fibre", {
	description = S("Plant Fibre"),
	inventory_image = "plant_fibre.png",
})

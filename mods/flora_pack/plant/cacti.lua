-- Grailtest 5 --
-- mods/flora_pack/plant/cacti.lua --

-- translation support.
local S = minetest.get_translator("plant")

-- Node

minetest.register_node("plant:cactus", {
	description = S("Cactus"),
	tiles = {"plant_cactus_top.png", "plant_cactus_top.png", "plant_cactus_side.png"},
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy = 1, choppy = 3},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	after_dig_node = function(pos, node, metadata, digger)
		base.dig_up(pos, node, digger)
	end,
})

-- Grow Function

function plant.grow_cactus(pos, node)
	if node.param2 >= 4 then
		return
	end
	pos.y = pos.y - 1
	if minetest.get_item_group(minetest.get_node(pos).name, "sand") == 0 then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "plant:cactus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	minetest.set_node(pos, {name = "plant:cactus"})
	return true
end

minetest.register_abm({
	nodenames = {"plant:cactus"},
	neighbors = {"group:sand"},
	interval = 50,
	chance = 20,
	action = function(...)
		plant.grow_cactus(...)
	end
})

-- Fuel def

minetest.register_craft({
	type = "fuel",
	recipe = "plant:cactus",
	burntime = 15,
})

-- MapGen

-- Large cactus

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"element:desert_sand"},
		sidelen = 80,
		noise_params = {
			offset = -0.0005,
			scale = 0.0015,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_min = 5,
		y_max = 31000,
		schematic = minetest.get_modpath("plant").."/schematics/large_cactus.mts",
		flags = "place_center_x",
		rotation = "random",
	})

	-- Cactus

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"element:desert_sand"},
		sidelen = 80,
		noise_params = {
			offset = -0.0005,
			scale = 0.0015,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_min = 5,
		y_max = 31000,
		decoration = "plant:cactus",
		height = 2,
		height_max = 5,
	})

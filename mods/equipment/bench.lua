-- Bench
-- From cottages mod by Sokomine
-- License: GPLv3

minetest.register_node("equipment:bench", {
	drawtype = "nodebox",
	description = "Wooden bench",
	tiles = {"material_wood.png", "material_wood.png",  "material_wood.png",  "material_wood.png",  "material_wood.png",  "material_wood.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			-- sitting area
			{-0.5, -0.15, 0.1,  0.5,  -0.05, 0.5},

			-- legs
			{-0.4, -0.5,  0.2, -0.3, -0.15, 0.4},
			{ 0.3, -0.5,  0.2,  0.4, -0.15, 0.4},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, 0.5, 0, 0.5},
		}
	},
	is_ground_content = false,
})

minetest.register_craft({
	output = "equipment:bench",
	recipe = {
		{"",              "group:wood", "", },
		{"equipment:fence_wood", "",             "equipment:fence_wood", }
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:bench",
	burntime = 10,
})

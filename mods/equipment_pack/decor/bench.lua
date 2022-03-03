-- Bench
-- From cottages mod by Sokomine
-- modified for grailtest by afflatus
-- License: GPLv3

minetest.register_node(":decor:bench", {
	drawtype = "nodebox",
	description = "Wooden bench",
	tiles = {
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = base.node_sound_wood_defaults(),
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
	output = "decor:bench",
	recipe = {
		{ "", "group:wood", "", },
		{ "group:stick", "", "group:stick", }
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "decor:bench",
	burntime = 10,
})

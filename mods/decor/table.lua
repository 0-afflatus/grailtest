-- Table
-- From cottages mod by Sokomine
-- modified for grailtest by afflatus
-- License: GPLv3

minetest.register_node(":equipment:table", {
		description = "Table",
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"equipment_wood_panel.png", 
			"equipment_wood_panel.png", 
			"equipment_wood_panel.png^[transformR270", 
			"equipment_wood_panel.png^[transformR270", 
			"equipment_wood_panel.png^[transformR270", 
			"equipment_wood_panel.png^[transformR270"},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2},
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.1, -0.5, -0.1,  0.1, 0.4,  0.1},
				{ -0.5,  0.4, -0.5,  0.5, 0.5,  0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5,  0.5, 0.5,  0.5},
			},
		},
		is_ground_content = false,
})

minetest.register_craft({
	output = "equipment:table",
	recipe = {
		{"", "equipment:panel_wood", "", },
		{"", "equipment:fence_wood", "" }
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:table",
	burntime = 15,
})

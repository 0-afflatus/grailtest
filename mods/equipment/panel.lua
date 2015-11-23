minetest.register_node("equipment:panel_wood", {
	description = "Wooden Panel",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	inventory_image = "equipment_wood_panel.png",
	tiles = {"equipment_wood_panel.png"},
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	output = 'equipment:panel_wood 16',
	recipe = {
		{'group:wood', 'group:wood', },
		{'group:wood', 'group:wood', },
	}
})

local fence_texture = "equipment_fence_overlay.png^material_wood.png^equipment_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("equipment:fence_wood", {
	description = "Wooden Fence",
	drawtype = "fencelike",
	tiles = {"material_wood.png"},
	inventory_image = fence_texture,
	wield_image = fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})


minetest.register_craft({
	output = 'equipment:fence_wood 2',
	recipe = {
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:fence_wood",
	burntime = 15,
})


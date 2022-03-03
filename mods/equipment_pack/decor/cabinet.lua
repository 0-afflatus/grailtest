local screwdriver = {}
-- local xbg = default.gui_bg..default.gui_bg_img..default.gui_slots

decor.register("cabinet", {
	description = "Wood Cabinet",
	inventory = {size=24},
	infotext = "Wood Cabinet",
	groups = {choppy=2, oddly_breakable_by_hand=1, flammable=3},
	sounds = base.node_sound_wood_defaults(),
	on_rotate = screwdriver.rotate_simple,
	tiles = {
		"equipment_cabinet_sides.png", "equipment_cabinet_sides.png",
		"equipment_cabinet_sides.png", "equipment_cabinet_sides.png",
		"equipment_cabinet_sides.png", "equipment_cabinet_front.png"
	}
})

minetest.register_craft({
	output = "decor:cabinet",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"doors:trapdoor", "", "doors:trapdoor"},
		{"group:wood", "group:wood", "group:wood"}
	}
})

decor.register("cabinet_half", {
	description = "Half Wood Cabinet",
	inventory = {size=8},
	infotext = "Half Wood Cabinet",
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=3},
	sounds = base.node_sound_wood_defaults(),
	node_box = decor.nodebox.slab_y(0.5, 0.5),
	tiles = {
		"equipment_cabinet_sides.png", "equipment_cabinet_sides.png",
		"equipment_half_cabinet_sides.png", "equipment_half_cabinet_sides.png",
		"equipment_half_cabinet_sides.png", "equipment_half_cabinet_front.png"
	}
})

minetest.register_craft({
	output = "decor:cabinet_half 2",
	recipe = {
		{"decor:cabinet"}
	}
})

decor.register("crate", {
	description = "Crate",
	inventory = {size=24},
	infotext = "Crate",
	tiles = {"equipment_chest_top.png"},
	groups = {choppy=2, oddly_breakable_by_hand=1, flammable=3},
	sounds = base.node_sound_wood_defaults()
})

minetest.register_craft({
	output = "decor:crate",
	recipe = {
		{"group:wood", "group:wood", "group:stick"},
		{"group:wood", "group:stick", "group:wood"},
		{"group:stick", "group:wood", "group:wood"}
	}
})

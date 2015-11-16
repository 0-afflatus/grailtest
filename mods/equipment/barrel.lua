minetest.register_node("equipment:barrel", {
	description = "Barrel",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"equipment_barrel_top.png", "equipment_barrel_top.png^[transformR180", "equipment_barrel_side.png",
			"equipment_barrel_side.png", "equipment_barrel_side.png", "equipment_barrel_side.png"},
	groups = { tree = 1, snappy = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2
	},
	drop = "equipment:barrel",
	is_ground_content = false,
})

minetest.register_craft({
	output = "equipment:barrel",
	recipe = {
		{"group:wood",          "",              "group:wood" },
		{"default:steel_ingot", "",              "default:steel_ingot"},
		{"group:wood",          "group:wood",    "group:wood" },
	},
})


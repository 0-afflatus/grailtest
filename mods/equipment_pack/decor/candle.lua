decor.register("candle", {
	description = "Candle",
	light_source = 12,
	drawtype = "torchlike",
	inventory_image = "equipment_candle_inv.png",
	wield_image = "equipment_candle_wield.png",
	paramtype2 = "wallmounted",
	legacy_wallmounted = true,
	walkable = false,
	groups = {dig_immediate=3, attached_node=1},
	tiles = {
		{ name = "equipment_candle_floor.png",
			animation = {type="vertical_frames", length=1.5} },
		{ name = "equipment_candle_ceiling.png",
			animation = {type="vertical_frames", length=1.5} },
		{ name = "equipment_candle_wall.png",
			animation = {type="vertical_frames", length=1.5} }
	},
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.3, -0.4, -0.3, 0.3, 0.5, 0.3},
		wall_bottom = {-0.25, -0.5, -0.25, 0.25, 0.1, 0.25},
		wall_side = {-0.5, -0.35, -0.15, -0.15, 0.4, 0.15}
	}
})

-- Crafting

minetest.register_craft({
	output = "decor:candle",
	recipe = {
		{"default:torch"}
	}
})


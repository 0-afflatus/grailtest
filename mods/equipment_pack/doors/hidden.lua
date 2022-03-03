-- hidden_doors
-- ============
-- Based on my_hidden_doors by DonBatman
-- Forum - https://forum.minetest.net/viewtopic.php?f=11&t=10626

local hdoor_list = {   --Number , Description, Material
	{ "wood", "Hidden Wood Door", "group:wood"},
	{ "stone_brick", "Hidden Stone Brick Door", "material:stone_brick"},
	{ "desert_stone_brick", "Hidden Deset Stone Brick Door", "material:desert_stone_brick"},
	{ "basalt_brick", "Hidden Basalt Brick Door", "material:basalt_brick"},
	{ "sandstone_brick", "Hidden Sandstone Brick Door", "material:sandstone_brick"},
	{ "brick", "Hidden Brick Door", "material:brick"},
	{ "furnace", "Hidden Furnace Door", "equipment:furnace"},
	{ "chest", "Hidden Chest Door", "equipment:chest"},
	{ "bookshelf", "Hidden Bookshelf Door", "equipment:bookshelf"},
	{ "wood_panel", "Hidden Wooden Panel Door", "equipment:panel_wood"},
}

for i in ipairs(hdoor_list) do
	local img = hdoor_list[i][1]
	local desc = hdoor_list[i][2]
	local material = hdoor_list[i][3]

	doors.register("doors:hidden_door"..img, {
		tiles = {{ name = "doors_"..img..".png", backface_culling = true }},
		description = desc.." Locked",
		inventory_image = "doors_"..img.."_inv.png",
		use_texture_alpha = "clip",
		protected = false,
		groups = {choppy = 2, cracky = 2},
		recipe = {
			{"doors:hidden_door_grey", material, ""},
			{"", "", ""},
			{"", "", ""},
		}
	})
end

doors.register("doors:hidden_door_grey", {
	description = "Grey Door Locked",
	inventory_image = "doors_grey_inv.png",
	groups = {choppy = 2, cracky = 2},
	tiles = {{ name = "doors_grey.png", backface_culling = true }},
	recipe = {
		{"mineral:diamond_gem", "mineral:diamond_gem", ""},
		{"mineral:diamond_gem", "mineral:diamond_gem", ""},
		{"mineral:diamond_gem", "mineral:diamond_gem", ""}
	}
})

doors.register_trapdoor("doors:trapdoor_stone", {
	description = "Hidden Trapdoor",
	inventory_image = "material_stone_tile.png",
	wield_image = "material_stone_tile.png",
	tile_front = "material_stone_tile.png",
	tile_side = "material_stone_tile.png",
	protected = true,
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = {cracky=3, level=2, door=1},
})

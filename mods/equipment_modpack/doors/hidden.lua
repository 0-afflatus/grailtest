-- hidden_doors
-- ============
-- Based on my_hidden_doors by DonBatman
-- Forum - https://forum.minetest.net/viewtopic.php?f=11&t=10626

local hdoor_list = {   --Number , Description, Material
	{ "cobble" , "Hidden Cobble Door", "default:cobble"},
	{ "stone" , "Hidden Stone Door", "default:stone"},	
	{ "wood", "Hidden Wood Door", "group:wood"},
	{ "stone_brick", "Hidden Stone Brick Door", "material:stone_brick"},
	{ "brick", "Hidden Brick Door", "material:brick"},
	{ "desert_cobble", "Hidden Desert Cobble Door", "default:desert_cobble"},
	{ "furnace", "Hidden Furnace Door", "equipment:furnace"},
	{ "chest", "Hidden Chest Door", "equipment:chest"},
	{ "bookshelf", "Hidden Bookshelf Door", "equipment:bookshelf"},
}

for i in ipairs(hdoor_list) do
	local img = hdoor_list[i][1]
	local desc = hdoor_list[i][2]
	local material = hdoor_list[i][3]

	doors.register("doors:hidden_door"..img, {
		tiles = {{ name = "doors_"..img..".png", backface_culling = true }},
		description = desc.." Locked",
		inventory_image = "doors_"..img.."_inv.png",
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

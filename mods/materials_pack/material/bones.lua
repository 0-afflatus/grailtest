-- Grailtest 5 --
-- mods/materials_pack/material/bones.lua

minetest.register_node("material:bones", {
	description = "Bones",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"bones_front.png"
	},
	paramtype2 = "facedir",
	place_param2 = nil,
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults(),
})

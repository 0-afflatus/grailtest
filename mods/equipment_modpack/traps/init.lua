-- dofile(minetest.get_modpath("traps").."/mine.lua")
dofile(minetest.get_modpath("traps").."/cage.lua")
dofile(minetest.get_modpath("traps").."/lava.lua")


if not minetest.get_modpath("bobblocks") then
	dofile(minetest.get_modpath("traps").."/spikes.lua")
end

minetest.register_craft({
	output="traps:cage",
	recipe={
		{"","default:mese_crystal",""},
		{"","default:mese_crystal",""},
		{"","default:dirt",""}
	}
})

minetest.register_craft({
	output="traps:mine",
	recipe={
		{"","default:coal_lump",""},
		{"","default:coal_lump",""},
		{"default:mese_crystal","default:dirt","default:mese_crystal"}
	}
})


minetest.register_node("traps:trap_sand", {
	description = "Trap Sand",
	tiles = {"default_sand.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	walkable = false,
})

minetest.register_craft({
	output = 'traps:trap_sand',
	recipe = {
		{'', '', ''},
		{'', 'default:sand', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_node("traps:stone_tile", {
	description = "Fake Stone Tile",
	tiles = {"material_stone_tile.png"},
	is_ground_content = false,
	walkable = false,
	groups = {cracky=3, oddly_breakable_by_hand = 2, not_in_creative_inventory=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = 'traps:stone_tile',
	recipe = {
		{'', '', ''},
		{'', "material:stone_tile", ''},
		{'', 'default:stick', ''},
	}
})

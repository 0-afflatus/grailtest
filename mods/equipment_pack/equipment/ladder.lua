-- Grailtest 5 --
-- mods/equipment/ladder.lua --

-- Load translation support.
local S = minetest.get_translator("equipment")

minetest.register_node("equipment:ladder", {
	description = S("Wooden Ladder"),
	drawtype = "signlike",
	tiles = {"equipment_ladder_wood.png"},
	inventory_image = "equipment_ladder_wood.png",
	wield_image = "equipment_ladder_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <equipment>
		--wall_bottom = = <equipment>
		--wall_side = = <equipment>
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = base.node_sound_wood_defaults(),
})


minetest.register_craft({
	output = 'equipment:ladder 3',
	recipe = {
		{'group:stick', '', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', '', 'group:stick'},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:ladder",
	burntime = 5,
})

minetest.register_node("equipment:ladder_steel", {
	description = S("Steel Ladder"),
	drawtype = "signlike",
	tiles = {"equipment_ladder_steel.png"},
	inventory_image = "equipment_ladder_steel.png",
	wield_image = "equipment_ladder_steel.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {cracky = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = 'equipment:ladder_steel 15',
	recipe = {
		{'mineral:steel_ingot', '', 'mineral:steel_ingot'},
		{'mineral:steel_ingot', 'mineral:steel_ingot', 'mineral:steel_ingot'},
		{'mineral:steel_ingot', '', 'mineral:steel_ingot'},
	}
})

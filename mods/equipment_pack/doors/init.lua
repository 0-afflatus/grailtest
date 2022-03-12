--------------------------------------------------------
-- Minetest :: Doors Redux Mod v1.0 (doors)
--
-- See README.txt for licensing and other information.
-- Copyright (c) 2016-2020, Leslie E. Krause
--
-- ./games/minetest_game/mods/doors/init.lua
--------------------------------------------------------

-- "One of the most essential but often overlooked elements of world design is door selection.
-- Doors set the tone and character and having the wrong style of door can make or break a build."

dofile( minetest.get_modpath( "doors" ) .. "/api.lua" )

------------------------
-- Door Registrations --
------------------------

doors.register_door( "doors:door_wood", {
	tiles = {{ name = "doors_door_wood.png", backface_culling = true }},
	description = "Wooden Door",
	inventory_image = "doors_item_wood.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood" },
		{ "group:wood", "group:wood" },
		{ "group:wood", "group:wood" },
	},
	can_center = true,
} )


doors.register("doors:door_oak", {
	tiles = {{ name = "doors_door_oak.png", backface_culling = true }},
	description = "Oak Door",
	inventory_image = "doors_item_oak.png",
	groups = { snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	recipe = {
		{"tree:oak_wood", "tree:oak_wood"},
		{"tree:oak_wood", "mineral:steel_ingot"},
		{"tree:oak_wood", "tree:oak_wood"}
	},
	is_lockable = true,
	is_closable = true,
})

doors.register_door( "doors:door_woodpanel1", {
	-- Colonial Style (6 panel)
	tiles = {{ name = "doors_door_woodpanel1.png", backface_culling = true }},
	description = "Wooden Colonial Door",
	inventory_image = "doors_item_woodpanel1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "material:stick" },
		{ "group:wood", "group:wood", "material:stick" },
		{ "group:wood", "group:wood", "material:stick" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_woodglass1", {
	tiles = {{ name = "doors_door_woodglass1.png", backface_culling = true }},
	description = "Wooden Single-Lite Door",
	inventory_image = "doors_item_woodglass1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "material:glass", "material:glass", "material:stick" },
		{ "group:wood", "group:wood", "" },
		{ "group:wood", "group:wood", "" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_woodglass2", {
	tiles = {{ name = "doors_door_woodglass2.png", backface_culling = true }},
	description = "Wooden Double-Lite Door",
	inventory_image = "doors_item_woodglass2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
		recipe = {
		{ "material:glass", "material:glass", "material:stick" },
		{ "group:wood", "group:wood", "material:stick" },
		{ "group:wood", "group:wood", "" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_cottage1", {
	tiles = {{ name = "doors_door_cottage1.png", backface_culling = true }},
	description = "Cottage Interior Door",
	inventory_image = "doors_item_cottage1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood" },
		{ "material:stick", "material:stick" },
		{ "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_cottage2", {
	tiles = {{ name = "doors_door_cottage2.png", backface_culling = true }},
	description = "Cottage Exterior Door",
	inventory_image = "doors_item_cottage2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "material:glass", "material:glass" },
		{ "material:stick", "material:stick" },
		{ "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_barn1", {
	tiles = {{ name = "doors_door_barn1.png", backface_culling = true }},
	description = "Barn Interior Door",
	inventory_image = "doors_item_barn1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "material:stick", "material:stick", "material:stick" },
		{ "group:wood", "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_barn2", {
	tiles = {{ name = "doors_door_barn2.png", backface_culling = true }},
	description = "Barn Exterior Door",
	inventory_image = "doors_item_barn2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "material:steel_rod", "material:steel_rod", "material:steel_rod" },
		{ "group:wood", "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_castle1", {
	tiles = {{ name = "doors_door_castle1.png", backface_culling = true }},
	description = "Castle Interior Door",
	inventory_image = "doors_item_castle1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "material:stick", "group:wood", "group:wood" },
		{ "", "group:wood", "group:wood" },
		{ "material:stick", "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_castle2", {
	tiles = {{ name = "doors_door_castle2.png", backface_culling = true }},
	description = "Castle Exterior Door",
	inventory_image = "doors_item_castle2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "material:steel_rod", "group:wood", "group:wood" },
		{ "", "group:wood", "group:wood" },
		{ "material:steel_rod", "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_mansion1", {
	tiles = {{ name = "doors_door_mansion1.png", backface_culling = true }},
	description = "Mansion Interior Door",
	inventory_image = "doors_item_mansion1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "material:steel_rod" },
		{ "group:wood", "group:wood", "dye:white" },
		{ "group:wood", "group:wood", "material:steel_rod" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_mansion2", {
	tiles = {{ name = "doors_door_mansion2.png", backface_culling = true }},
	description = "Mansion Exterior Door ",
	inventory_image = "doors_item_mansion2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "material:steel_rod" },
		{ "group:wood", "group:wood", "dye:black" },
		{ "group:wood", "group:wood", "material:steel_rod" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_steel", {
	tiles = {{ name = "doors_door_steel.png", backface_culling = true}},
	description = "Steel Door",
	inventory_image = "doors_item_steel.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = base.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "mineral:steel_ingot", "mineral:steel_ingot" },
		{ "mineral:steel_ingot", "mineral:steel_ingot" },
		{ "mineral:steel_ingot", "mineral:steel_ingot" },
	},
	can_center = true,
	is_lockable = true,
} )

doors.register("doors:door_gold", {
	tiles = {{ name = "doors_door_gold.png", backface_culling = true }},
	description = "Gold Door",
	inventory_image = "doors_item_gold.png",
	protected = true,
	groups = { snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2 },
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{"mineral:gold_ingot", "mineral:gold_ingot"},
		{"mineral:gold_ingot", "mineral:gold_ingot"},
		{"mineral:gold_ingot", "mineral:gold_ingot"},
	},
	can_center = true,
	is_lockable = true,
})

doors.register("doors:door_metal_bar", {
	tiles = {{ name = "doors_door_metal_bar.png", backface_culling = true }},
	description = "metal_bar Door",
	inventory_image = "doors_item_metal_bar.png",
	protected = true,
	groups = { choppy=3, cracky=3, oddly_breakable_by_hand=1, bendy = 2, melty = 2, level = 2 },
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{"xpanes:bar", "xpanes:bar"},
		{"xpanes:bar", "xpanes:bar"},
		{"xpanes:bar", "xpanes:bar"}
	},
	can_center = true,
	is_lockable = true,
})

doors.register("doors:door_rust_bar", {
	tiles = {{ name = "doors_door_rust_bar.png", backface_culling = true }},
	description = "rust_bar Door",
	inventory_image = "doors_item_rust_bar.png",
	protected = true,
	groups = { choppy=3, cracky=3, oddly_breakable_by_hand=1, bendy = 2, melty = 2, level = 2 },
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{"xpanes:rust_bar", "xpanes:rust_bar"},
		{"xpanes:rust_bar", "xpanes:rust_bar"},
		{"xpanes:rust_bar", "xpanes:rust_bar"}
	},
	can_center = true,
	is_lockable = true,
})

doors.register_door( "doors:door_dungeon1", {
	tiles = {{ name = "doors_door_dungeon1.png", backface_culling = true}},
	description = "Dungeon Interior Door",
	inventory_image = "doors_item_dungeon1.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = base.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "mineral:steel_ingot", "material:steel_rod", "mineral:steel_ingot" },
		{ "material:steel_rod", "material:steel_rod", "material:steel_rod" },
		{ "mineral:steel_ingot", "material:steel_rod", "mineral:steel_ingot" },
	},
	is_lockable = true,
} )

doors.register_door( "doors:door_dungeon2", {
	tiles = {{ name = "doors_door_dungeon2.png", backface_culling = true}},
	description = "Dungeon Exterior Door",
	inventory_image = "doors_item_dungeon2.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = base.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "material:steel_rod", "material:steel_rod", "material:steel_rod" },
		{ "mineral:steel_ingot", "mineral:steel_ingot", "mineral:steel_ingot" },
		{ "mineral:steel_ingot", "mineral:steel_ingot", "mineral:steel_ingot" },
	},
	is_lockable = true,
} )

doors.register_door( "doors:door_glass", {
	tiles = { "doors_door_glass.png" },
	description = "Glass Door",
	inventory_image = "doors_item_glass.png",
	groups = { cracky = 3, oddly_breakable_by_hand = 3 },
	sounds = base.node_sound_glass_defaults(),
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	recipe = {
		{ "material:glass", "material:glass" },
		{ "material:glass", "material:glass" },
		{ "material:glass", "material:glass" },
	},
	can_center = true,
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_obsidian_glass", {
	tiles = { "doors_door_obsidian_glass.png" },
	description = "Obsidian Glass Door",
	inventory_image = "doors_item_obsidian_glass.png",
	groups = { cracky = 3 },
	sounds = base.node_sound_glass_defaults(),
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	recipe = {
		{ "material:obsidian_glass", "material:obsidian_glass" },
		{ "material:obsidian_glass", "material:obsidian_glass" },
		{ "material:obsidian_glass", "material:obsidian_glass" },
	},
	can_center = true,
	is_lockable = true,
	is_closable = true,
} )

----------------------------
-- Trapdoor Registrations --
----------------------------

doors.register_trapdoor( "doors:trapdoor", {
	description = "Trapdoor",
	inventory_image = "doors_trapdoor.png",
	wield_image = "doors_trapdoor.png",
	tile_front = "doors_trapdoor.png",
	tile_side = "doors_trapdoor_side.png",

	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, door = 1 },

	is_closable = true,
} )

doors.register_trapdoor( "doors:trapdoor_steel", {
	description = "Steel Trapdoor",
	inventory_image = "doors_trapdoor_steel.png",
	wield_image = "doors_trapdoor_steel.png",
	tile_front = "doors_trapdoor_steel.png",
	tile_side = "doors_trapdoor_steel_side.png",
	protected = true,

	sounds = base.node_sound_metal_defaults( ),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",

	groups = { cracky = 1, level = 2, door = 1 },

	is_lockable = true,
	is_closable = true,
} )

minetest.register_craft( {
	output = "doors:trapdoor 2",
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "group:wood", "group:wood", "group:wood" },
	}
} )

minetest.register_craft( {
	output = "doors:trapdoor_steel",
	recipe = {
		{ "mineral:steel_ingot", "mineral:steel_ingot" },
		{ "mineral:steel_ingot", "mineral:steel_ingot" },
	}
} )

-----------------------------
-- Fencegate Registrations --
-----------------------------
--[[
doors.register_fencegate( "doors:gate_wood", {
	description = "Wooden Fence Gate",
	texture = "default_wood.png",
	material = "default:wood",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 }
} )
]]--

doors.register_fencegate("doors:gate_acacia_wood", {
	description = "Acacia Fence Gate",
	texture = "tree_acacia_wood.png",
	material = "tree:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

doors.register_fencegate("doors:gate_junglewood", {
	description = "Junglewood Fence Gate",
	texture = "tree_junglewood.png",
	material = "tree:junglewood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

-- Grail Fence Gates

doors.register_fencegate("doors:gate_apple_wood", {
	description = "Apple wood Fence Gate",
	texture = "tree_apple_tree_wood.png",
	material = "tree:apple_tree_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})

doors.register_fencegate("doors:gate_ash_wood", {
	description = "Ash wood Fence Gate",
	texture = "tree_ash_wood.png",
	material = "tree:ash_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})

doors.register_fencegate("doors:gate_banana_wood", {
	description = "Banana wood Fence Gate",
	texture = "tree_banana_wood.png",
	material = "tree:banana_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})

doors.register_fencegate("doors:gate_beech_wood", {
	description = "Beech wood Fence Gate",
	texture = "tree_beech_wood.png",
	material = "tree:beech_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})

doors.register_fencegate("doors:gate_birch_wood", {
	description = "Birch wood Fence Gate",
	texture = "tree_birch_wood.png",
	material = "tree:birch_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})

doors.register_fencegate("doors:gate_pine_wood", {
	description = "Pine wood Fence Gate",
	texture = "tree_pine_wood.png",
	material = "tree:pine_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})

doors.register_fencegate("doors:gate_oak_wood", {
	description = "Oak wood Fence Gate",
	texture = "tree_oak_wood.png",
	material = "tree:oak_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})

doors.register_fencegate("doors:gate_palm_wood", {
	description = "Palm wood Fence Gate",
	texture = "tree_palm_wood.png",
	material = "tree:palm_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})

doors.register_fencegate("doors:gate_willow_wood", {
	description = "Willow wood Fence Gate",
	texture = "tree_willow_wood.png",
	material = "tree:willow_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})

------------------------
-- Fuel Registrations --
------------------------

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_wood",
	burntime = 14,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_woodpanel1",
	burntime = 12,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_woodglass1",
	burntime = 12,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_woodglass2",
	burntime = 14,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_japanese",
	burntime = 10,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_french",
	burntime = 10,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_cottage1",
	burntime = 16,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_cottage2",
	burntime = 16,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:trapdoor",
	burntime = 7,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:gate_wood_closed",
	burntime = 7,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:gate_acacia_wood_closed",
	burntime = 8,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:gate_junglewood_closed",
	burntime = 9,
} )

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_pine_wood_closed",
	burntime = 6,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:gate_aspen_wood_closed",
	burntime = 5,
} )

dofile(minetest.get_modpath("doors").."/hidden.lua")

-- Minetest 0.4 mod: vessels
-- See README.txt for licensing and other information.

local vessels_shelf_formspec =
	"size[8,7;]"..
	base.gui_bg..
	base.gui_bg_img..
	base.gui_slots..
	"list[context;vessels;0,0.3;8,2;]"..
	"list[current_player;main;0,2.85;8,1;]"..
	"list[current_player;main;0,4.08;8,3;8]"..
	"listring[context;vessels]"..
	"listring[current_player;main]"..
	base.get_hotbar_bg(0,2.85)

minetest.register_node("vessels:shelf", {
	description = "Vessels shelf",
	tiles = {
		"equipment_chest_top.png",
		"equipment_chest_top.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"vessels_shelf.png",
		"vessels_shelf.png"
	},
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = base.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", vessels_shelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("vessels", 8*2)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("vessels")
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local to_stack = inv:get_stack(listname, index)
		if listname == "vessels" then
			if minetest.get_item_group(stack:get_name(), "vessel") ~= 0
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		local to_stack = inv:get_stack(to_list, to_index)
		if to_list == "vessels" then
			if minetest.get_item_group(stack:get_name(), "vessel") ~= 0
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
			   " moves stuff in vessels shelf at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			   " moves stuff to vessels shelf at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			   " takes stuff from vessels shelf at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_craft({
	output = 'vessels:shelf',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:vessel', 'group:vessel', 'group:vessel'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_node("vessels:glass_bottle", {
	description = "Glass Bottle (empty)",
	drawtype = "plantlike",
	tiles = {"vessels_glass_bottle.png"},
	inventory_image = "vessels_glass_bottle_inv.png",
	wield_image = "vessels_glass_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = base.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "vessels:glass_bottle 12",
	recipe = {
		{ "", "material:glass", "" },
		{ "material:glass", "", "material:glass" },
		{ "material:glass", "material:glass", "material:glass" }
	}
})

minetest.register_craft( {
	output = "vessels:glass_bottle 10",
	recipe = {
		{ "material:glass", "", "material:glass" },
		{ "material:glass", "", "material:glass" },
		{ "", "material:glass", "" }
	}
})

minetest.register_node("vessels:drinking_glass", {
	description = "Drinking Glass (empty)",
	drawtype = "plantlike",
	tiles = {"vessels_drinking_glass.png"},
	inventory_image = "vessels_drinking_glass.png",
	wield_image = "vessels_drinking_glass.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
	},
	groups = {vessel = 1,dig_immediate = 3,attached_node = 1},
	sounds = base.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "vessels:drinking_glass 8",
	recipe = {
		{ "material:glass", "", "material:glass" },
		{ "", "material:glass", "" },
		{ "", "material:glass", "" }
	}
})

minetest.register_craft( {
	output = "vessels:drinking_glass 14",
	recipe = {
		{ "material:glass", "", "material:glass" },
		{ "material:glass", "", "material:glass" },
		{ "material:glass", "material:glass", "material:glass" }
	}
})

--[[
minetest.register_node("vessels:beaker", {
	description = "Beaker (empty)",
	drawtype = "plantlike",
	tiles = {"vessels_beaker.png"},
	inventory_image = "vessels_beaker.png",
	wield_image = "vessels_beaker.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel = 1,dig_immediate = 3,attached_node = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft( {
	output = "vessels:beaker 7",
	recipe = {
		{ "mineral:clay_lump", "", "mineral:clay_lump" },
		{ "mineral:clay_lump", "", "mineral:clay_lump" },
		{ "mineral:clay_lump", "mineral:clay_lump", "mineral:clay_lump" }
	}
})
]]

minetest.register_node("vessels:steel_bottle", {
	description = "Heavy Steel Bottle (empty)",
	drawtype = "plantlike",
	tiles = {"vessels_steel_bottle.png"},
	inventory_image = "vessels_steel_bottle_inv.png",
	wield_image = "vessels_steel_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = base.node_sound_defaults(),
})

minetest.register_craft( {
	output = "vessels:steel_bottle 6",
	recipe = {
		{ "", "mineral:steel_ingot", "" },
		{ "mineral:steel_ingot", "", "mineral:steel_ingot" },
		{ "mineral:steel_ingot", "mineral:steel_ingot", "mineral:steel_ingot" }
	}
})

minetest.register_craft( {
	output = "vessels:steel_bottle 5",
	recipe = {
		{ "mineral:steel_ingot", "", "mineral:steel_ingot" },
		{ "mineral:steel_ingot", "", "mineral:steel_ingot" },
		{ "", "mineral:steel_ingot", "" }
	}
})


-- Make sure we can recycle them

minetest.register_craftitem("vessels:glass_fragments", {
	description = "Pile of Glass Fragments",
	inventory_image = "vessels_glass_fragments.png",
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"vessels:glass_bottle",
		"vessels:glass_bottle",
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"vessels:drinking_glass",
		"vessels:drinking_glass",
	},
})

minetest.register_craft({
	type = "cooking",
	output = "material:glass",
	recipe = "vessels:glass_fragments",
})

minetest.register_craft( {
	type = "cooking",
	output = "mineral:steel_ingot",
	recipe = "vessels:steel_bottle",
})

dofile(minetest.get_modpath("vessels").."/barrel.lua")

dungeon_loot.register({
    {name = "vessels:barrel", chance = 0.123, y = {-1023, 1023}},
    {name = "vessels_glass_bottle", chance = 0.1, y = {-1023, 1023}},
})

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

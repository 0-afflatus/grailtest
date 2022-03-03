minetest.register_node("more_chests:wifi", {
	description = "Teleport Chest",
	tiles = {"wifi_top.png", "wifi_top.png", "wifi_side.png",
		"wifi_side.png", "wifi_side.png", "wifi_front.png"},
	paramtype2 = "facedir",
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2,},
	legacy_facedir_simple = true,
	sounds = base.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				base.gui_bg ..
				base.gui_bg_img ..
				base.gui_slots ..
				"list[current_player;more_chests:wifi;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]" ..
				"listring[current_player;more_chests:wifi]" ..
				"listring[current_player;main]")
		meta:set_string("infotext", "Teleport Chest")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves " .. stack:get_name() ..
				" in wifi chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves " .. stack:get_name() ..
				" to wifi chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes " .. stack:get_name() ..
				" from wifi chest at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_craft({
	output = 'more_chests:wifi',
	recipe = {
		{"tree:oak_wood","tree:oak_wood","tree:oak_wood"},
		{"tree:oak_wood","mineral:topaz_gem","tree:oak_wood"},
		{"tree:oak_wood","tree:oak_wood","tree:oak_wood"}
	}
})

minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("more_chests:wifi", 8*4)
end)


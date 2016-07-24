--[[
	Money Mod by Kotolegokot and Xiong
	Edited by TenPlus1 (13th May 2016)
]]

-- Does player have permissions for this shop?

local function has_shop_privilege(meta, player)
	return player:get_player_name() == meta:get_string("owner")
	or minetest.get_player_privs(player:get_player_name())["protection_bypass"] -- was server
end

-- Barter shop

minetest.register_node("market:barter_shop", {
	description = "Barter Shop",
	tiles = {
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_shop.png",
		"equipment_shop.png"
	},
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",

	after_place_node = function(pos, placer)

		local meta = minetest.get_meta(pos)

		meta:set_string("owner", placer:get_player_name())
		meta:set_string("infotext", "Untuned Barter Shop (owned by "
			.. placer:get_player_name() .. ")")
	end,

	on_construct = function(pos)

		local meta = minetest.get_meta(pos)

		meta:set_string("formspec", "size[8,7]"
			.. default.gui_bg
			.. default.gui_bg_img
			.. default.gui_slots
			.. "field[0.3,0.50;8,1;bartershopname;Shop name:;]"
			.. "field[0.3,1.75;8,1;nodename1;Name of item to give player:;]"
			.. "field[0.3,3.00;8,1;amount1;How many to give:;]"
			.. "field[0.3,4.25;8,1;nodename2;Name of what shop wants in return:;]"
			.. "field[0.3,5.50;8,1;amount2;Number to take:;]"
			.. "button_exit[3,6.25;2,1;button;Tune]")

		meta:set_string("infotext", "Untuned Barter Shop")
		meta:set_string("owner", "")
		meta:set_string("form", "yes")
	end,

	-- retune

	on_punch = function(pos, node, player)

		local meta = minetest.get_meta(pos)

		if player:get_player_name() ~= meta:get_string("owner") then
			return
		end

		meta:set_string("formspec", "size[8,7]"
			.. default.gui_bg
			.. default.gui_bg_img
			.. default.gui_slots
			.. "field[0.3,0.50;8,1;bartershopname;Shop name:;${bartershopname}]"
			.. "field[0.3,1.75;8,1;nodename1;Name of item to give player:;${nodename1}]"
			.. "field[0.3,3.00;8,1;amount1;How many to give:;${amount1}]"
			.. "field[0.3,4.25;8,1;nodename2;Name of what shop wants in return:;${nodename2}]"
			.. "field[0.3,5.50;8,1;amount2;Number to take:;${amount2}]"
			.. "button_exit[3,6.25;2,1;button;Retune]")

		meta:set_string("infotext", "Detuned Barter Shop")
		meta:set_string("form", "yes")

		minetest.chat_send_player(player:get_player_name(), "Barter Shop detuned.")
	end,

	-- end retune

	can_dig = function(pos, player)

		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		return inv:is_empty("main")
			and (meta:get_string("owner") == player:get_player_name()
			or minetest.get_player_privs(player:get_player_name())["protection_bypass"])
	end,

	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)

		local meta = minetest.get_meta(pos)

		if not has_shop_privilege(meta, player) then

			minetest.log("action", player:get_player_name()
				.. " tried to access barter shop belonging to "
				.. meta:get_string("owner").." at "
				.. minetest.pos_to_string(pos))

			return 0
		end

		return count
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)

		local meta = minetest.get_meta(pos)

		if not has_shop_privilege(meta, player) then

			minetest.log("action", player:get_player_name()
				.. " tried to access barter shop belonging to "
				.. meta:get_string("owner").." at "
				.. minetest.pos_to_string(pos))

			return 0
		end

		-- if item is worn do not put in shop
		if stack:get_wear() > 0 then
			return 0
		end

		return stack:get_count()
	end,

	allow_metadata_inventory_take = function(pos, listname, index, stack, player)

		local meta = minetest.get_meta(pos)

		if not has_shop_privilege(meta, player) then

			minetest.log("action", player:get_player_name()
				.. " tried to access barter shop belonging to "
				.. meta:get_string("owner").." at "
				.. minetest.pos_to_string(pos))

			return 0
		end

		return stack:get_count()
	end,
--[[
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
			" moves stuff in barter shop at "..minetest.pos_to_string(pos))
	end,

	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			" puts stuff in barter shop at "..minetest.pos_to_string(pos))
	end,

	on_metadata_inventory_take = function(pos, listname, index, count, player)
		minetest.log("action", player:get_player_name()..
			" takes stuff from barter shop at "..minetest.pos_to_string(pos))
	end,
]]
	on_receive_fields = function(pos, formname, fields, sender)

		local meta = minetest.get_meta(pos)

		if meta:get_string("form") == "yes" then

			if fields.bartershopname ~= ""
			and minetest.registered_items[fields.nodename1]
			and minetest.registered_items[fields.nodename2]
			and tonumber(fields.amount1)
			and tonumber(fields.amount1) >= 1
			and tonumber(fields.amount2)
			and tonumber(fields.amount2) >= 1
			and (meta:get_string("owner") == sender:get_player_name()
			or minetest.get_player_privs(sender:get_player_name())["protection_bypass"]) then

				meta:set_string("formspec", "size[8,10]"
					.. default.gui_bg
					.. default.gui_bg_img
					.. default.gui_slots
					.. "list[context;main;0,0;8,4;]"
					.. "label[0,4.25.0;Selling "
						.. fields.amount1 .."x "
						.. fields.nodename1 .. " for "
						.. fields.amount2 .. "x "
						.. fields.nodename2 .. "]"
					.. "button[3,5;2,1;button;Exchange]"
					.. "list[current_player;main;0,6;8,4;]"
					.. "listring[]")

				meta:set_string("bartershopname", fields.bartershopname)
				meta:set_string("nodename1", fields.nodename1)
				meta:set_string("nodename2", fields.nodename2)
				meta:set_string("amount1", fields.amount1)
				meta:set_string("amount2", fields.amount2)
				meta:set_string("infotext", "Barter Shop \"" .. fields.bartershopname .. "\" (owned by " .. meta:get_string("owner") .. ")")
				meta:set_string("form", "no")
				meta:get_inventory():set_size("main", 8*4)
			end

		elseif fields["button"] then

			local sender_name = sender:get_player_name()
			local inv = meta:get_inventory()
			local sender_inv = sender:get_inventory()

			if not inv:contains_item("main", meta:get_string("nodename1") .. " " .. meta:get_string("amount1")) then
				minetest.chat_send_player(sender_name, "Barter shop does not have enough goods.")
				return

			elseif not sender_inv:contains_item("main", meta:get_string("nodename2") .. " " .. meta:get_string("amount2")) then
				minetest.chat_send_player(sender_name, "You do not have enough goods to trade.")
				return

			elseif not inv:room_for_item("main", meta:get_string("nodename2") .. " " .. meta:get_string("amount2")) then
				minetest.chat_send_player(sender_name, "Not enough space in barter shop.")
				return

			elseif not sender_inv:room_for_item("main", meta:get_string("nodename1") .. " " .. meta:get_string("amount1")) then
				minetest.chat_send_player(sender_name, "Your inventory is too full.")
				return
			end

			-- take items from shop
			inv:remove_item("main", meta:get_string("nodename1") .. " " .. meta:get_string("amount1"))

			-- take items from player
			sender_inv:remove_item("main", meta:get_string("nodename2") .. " " .. meta:get_string("amount2"))

			-- add items to shop
			inv:add_item("main", meta:get_string("nodename2") .. " " .. meta:get_string("amount2"))

			-- give paid for items to player
			sender_inv:add_item("main", meta:get_string("nodename1") .. " " .. meta:get_string("amount1"))

			minetest.chat_send_player(sender_name, "You exchanged "
				.. meta:get_string("amount2") .. "x "
				.. meta:get_string("nodename2") .. " for "
				.. meta:get_string("amount1") .. "x "
				.. meta:get_string("nodename1") .. ".")
		end
	end,
})

-- Barter Shop recipe

minetest.register_craft({
	type = "shapeless",
	output = "market:barter_shop",
	recipe = {"default:sign_wall", "default:chest_locked"},
})

-- Admin barter shop

minetest.register_node("market:admin_barter_shop", {
	description = "Admin Barter Shop",
	tiles = {
		"equipment_leather_panel.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_shop.png",
		"equipment_shop.png"},
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",

	on_construct = function(pos)

		local meta = minetest.get_meta(pos)

		meta:set_string("formspec", "size[8,6]"
			.. default.gui_bg
			.. default.gui_bg_img
			.. default.gui_slots
			.. "field[0.256,0.5;8,1;nodename1;What are you giving to player:;]"
			.. "field[0.256,1.75;8,1;amount1;Amount to give:;]"
			.. "field[0.256,3;8,1;nodename2;In exchange for what:;]"
			.. "field[0.256,4.25;8,1;amount2;Amount to take:;]"
			.. "button_exit[3.1,5;2,1;button;Proceed]")

		meta:set_string("infotext", "Untuned Admin Barter Shop")
		meta:set_string("form", "yes")
	end,

	can_dig = function(pos,player)
		return minetest.get_player_privs(player:get_player_name())["protection_bypass"]
	end,

	on_receive_fields = function(pos, formname, fields, sender)

		local meta = minetest.get_meta(pos)

		if meta:get_string("form") == "yes" then

			if minetest.registered_items[fields.nodename1]
			and minetest.registered_items[fields.nodename2]
			and tonumber(fields.amount1)
			and tonumber(fields.amount1) >= 1
			and tonumber(fields.amount2)
			and tonumber(fields.amount2) >= 1
			and (meta:get_string("owner") == sender:get_player_name()
			or minetest.get_player_privs(sender:get_player_name())["protection_bypass"]) then

				meta:set_string("formspec", "size[8,6]"
					.. default.gui_bg
					.. default.gui_bg_img
					.. default.gui_slots
					.. "label[0,0.0;Selling "
						.. fields.amount1 .."x "
						.. fields.nodename1 .. " for "
						.. fields.amount2 .. "x "
						.. fields.nodename2 .. "]"
					.. "button[3,0.75;2,1;button;Exchange]"
					.. "list[current_player;main;0,2;8,4;]")

				meta:set_string("nodename1", fields.nodename1)
				meta:set_string("nodename2", fields.nodename2)
				meta:set_string("amount1", fields.amount1)
				meta:set_string("amount2", fields.amount2)
				meta:set_string("form", "no")
				meta:set_string("infotext", "Selling "
					.. fields.amount1 .. "x "
					.. fields.nodename1 .. " for "
					.. fields.amount2 .. "x "
					.. fields.nodename2)
			end

		elseif fields["button"] then

			local sender_name = sender:get_player_name()
			local sender_inv = sender:get_inventory()

			if not sender_inv:contains_item("main", meta:get_string("nodename2") .. " " .. meta:get_string("amount2")) then
				minetest.chat_send_player(sender_name, "You do not have enough goods to trade.")
				return

			elseif not sender_inv:room_for_item("main", meta:get_string("nodename1") .. " " .. meta:get_string("amount1")) then
				minetest.chat_send_player(sender_name, "Your inventory is too full.")
				return
			end

			-- take payment from player
			sender_inv:remove_item("main", meta:get_string("nodename2") .. " " .. meta:get_string("amount2"))

			-- add item(s) you purchased
			sender_inv:add_item("main", meta:get_string("nodename1") .. " " .. meta:get_string("amount1"))

			minetest.chat_send_player(sender_name, "You exchanged "
				.. meta:get_string("amount2") .. "x "
				.. meta:get_string("nodename2") .. " for "
				.. meta:get_string("amount1") .. "x "
				.. meta:get_string("nodename1") .. ".")
		end
	end,
})

-- add /holding command to tell player what they are holding

minetest.register_chatcommand("holding", {
	params = "",
	description = "show node name of item in hand",
	privs = {},

	func = function(name, param)

		local player = minetest.get_player_by_name(name)

		if player == nil then
			minetest.log("error", "Unable to get info, player is nil")
			return true
		end

		if player:get_wielded_item():is_empty() then
			minetest.chat_send_player(name, 'no item in hand.')
		else
			minetest.chat_send_player(name,
				'holding: name = '
				..player:get_wielded_item():get_name()
				..' , count = '
				.. player:get_wielded_item():get_count()
				..' , wear = '
				.. player:get_wielded_item():get_wear() )
		end
	end,
})

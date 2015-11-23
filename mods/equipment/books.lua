local bookshelf_formspec =
	"size[8,7;]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[context;books;0,0.3;8,1;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;books]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,2.85)

minetest.register_node("equipment:bookshelf", {
	description = "Bookshelf",
	tiles = {"equipment_chest_top.png", "equipment_chest_top.png", "equipment_bookshelf.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", bookshelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("books", 8 * 1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("books")
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local to_stack = inv:get_stack(listname, index)
		if listname == "books" then
			if minetest.get_item_group(stack:get_name(), "book") ~= 0
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	allow_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		local to_stack = inv:get_stack(to_list, to_index)
		if to_list == "books" then
			if minetest.get_item_group(stack:get_name(), "book") ~= 0
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in bookshelf at " .. minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff to bookshelf at " .. minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from bookshelf at " .. minetest.pos_to_string(pos))
	end,
})


local function book_on_use(itemstack, user, pointed_thing)
	local player_name = user:get_player_name()
	local data = minetest.deserialize(itemstack:get_metadata())
	local title, text, owner = "", "", player_name
	if data then
		title, text, owner = data.title, data.text, data.owner
	end
	local formspec
	if owner == player_name then
		formspec = "size[8,8]"..default.gui_bg..
			"field[0.5,1;7.5,0;title;Title:;"..
				minetest.formspec_escape(title).."]"..
			"textarea[0.5,1.5;7.5,7;text;Contents:;"..
				minetest.formspec_escape(text).."]"..
			"button_exit[2.5,7.5;3,1;save;Save]"
	else
		formspec = "size[8,8]"..default.gui_bg..
			"label[0.5,0.5;by "..owner.."]"..
			"label[0.5,0;"..minetest.formspec_escape(title).."]"..
			"tableoptions[background=#00000000;highlight=#00000000;border=false]"..
			"table[0.5,1.5;7.5,7;;"..minetest.formspec_escape(text):gsub("\n", ",")..";1]"
	end
	minetest.show_formspec(user:get_player_name(), "equipment:book", formspec)
end

minetest.register_on_player_receive_fields(function(player, form_name, fields)
	if form_name ~= "equipment:book" or not fields.save or
			fields.title == "" or fields.text == "" then
		return
	end
	local inv = player:get_inventory()
	local stack = player:get_wielded_item()
	local new_stack, data
	if stack:get_name() ~= "equipment:book_written" then
		local count = stack:get_count()
		if count == 1 then
			stack:set_name("equipment:book_written")
		else
			stack:set_count(count - 1)
			new_stack = ItemStack("equipment:book_written")
		end
	else
		data = minetest.deserialize(stack:get_metadata())
	end
	if not data then data = {} end
	data.title = fields.title
	data.text = fields.text
	data.owner = player:get_player_name()
	local data_str = minetest.serialize(data)
	if new_stack then
		new_stack:set_metadata(data_str)
		if inv:room_for_item("main", new_stack) then
			inv:add_item("main", new_stack)
		else
			minetest.add_item(player:getpos(), new_stack)
		end
	else
		stack:set_metadata(data_str)
	end
	player:set_wielded_item(stack)
end)

minetest.register_craft({
	output = 'equipment:book',
	recipe = {
		{'material:paper'},
		{'material:paper'},
		{'material:paper'},
	}
})

minetest.register_craft({
	output = 'equipment:bookshelf',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'equipment:book', 'equipment:book', 'equipment:book'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:bookshelf",
	burntime = 30,
})

minetest.register_craftitem("equipment:book", {
	description = "Book",
	inventory_image = "equipment_book.png",
	groups = {book=1},
	on_use = book_on_use,
})

minetest.register_craftitem("equipment:book_written", {
	description = "Book With Text",
	inventory_image = "equipment_book.png",
	groups = {book=1, not_in_creative_inventory=1},
	stack_max = 1,
	on_use = book_on_use,
})


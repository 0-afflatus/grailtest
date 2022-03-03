-- Grailtest 5 --
-- mods/equipment/books.lua --

-- Load translation support.
local S = minetest.get_translator("equipment")

local bookshelf_formspec =
	"size[8,7;]" ..
	base.gui_bg ..
	base.gui_bg_img ..
	base.gui_slots ..
	"list[context;books;0,0.3;8,1;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;books]" ..
	"listring[current_player;main]" ..
	base.get_hotbar_bg(0,2.85)

local function update_bookshelf(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local invlist = inv:get_list("books")

	local formspec = bookshelf_formspec
	-- Inventory slots overlay
	local bx, by = 0, 0.3
	local n_written, n_empty = 0, 0
	for i = 1, 16 do
		if i == 9 then
			bx = 0
			by = by + 1
		end
		local stack = invlist[i]
		if stack:is_empty() then
			formspec = formspec ..
				"image[" .. bx .. "," .. by .. ";1,1;equipment_bookshelf_slot.png]"
		else
			local metatable = stack:get_meta():to_table() or {}
			if metatable.fields and metatable.fields.text then
				n_written = n_written + stack:get_count()
			else
				n_empty = n_empty + stack:get_count()
			end
		end
		bx = bx + 1
	end
	meta:set_string("formspec", formspec)
	if n_written + n_empty == 0 then
		meta:set_string("infotext", S("Empty Bookshelf"))
	else
		meta:set_string("infotext", S("Bookshelf (@1 written, @2 empty books)", n_written, n_empty))
	end
end

minetest.register_node("equipment:bookshelf", {
	description = S("Bookshelf"),
	tiles = {
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_wood_panel.png",
		"equipment_bookshelf.png",
		"equipment_bookshelf.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = base.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("books", 8 * 2)
		update_bookshelf(pos)
	end,
	can_dig = function(pos,player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("books")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack)
		if minetest.get_item_group(stack:get_name(), "book") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in bookshelf at " .. minetest.pos_to_string(pos))
		update_bookshelf(pos)
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" puts stuff into bookshelf at " .. minetest.pos_to_string(pos))
		update_bookshelf(pos)
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from bookshelf at " .. minetest.pos_to_string(pos))
		update_bookshelf(pos)
	end,
	on_blast = function(pos)
		local drops = {}
		base.get_inventory_drops(pos, "books", drops)
		drops[#drops+1] = "equipment:bookshelf"
		minetest.remove_node(pos)
		return drops
	end,
})

local function book_on_use(itemstack, user)
	local player_name = user:get_player_name()
	local data = minetest.deserialize(itemstack:get_metadata())
	local formspec, title, text, owner = "", "", "", player_name
	local page, page_max, cpp = 1, 1, 650

	if data then
		title = data.title
		text = data.text
		owner = data.owner

		if data.page then
			page = data.page
			page_max = data.page_max
			cpp = data.chars_per_page
		end
	end

	if owner == player_name then
		formspec = "size[8,8]" .. base.gui_bg ..
			base.gui_bg_img ..
			"field[0.5,1;7.5,0;title;Title:;" ..
				minetest.formspec_escape(title) .. "]" ..
			"textarea[0.5,1.5;7.5,7;text;Contents:;" ..
				minetest.formspec_escape(text) .. "]" ..
			"button_exit[2.5,7.5;3,1;save;Save]"
	else
		formspec = "size[8,8]" .. base.gui_bg ..
			base.gui_bg_img ..
			"label[0.5,0.5;by " .. owner .. "]" ..
			"tablecolumns[color;text]" ..
			"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
			"table[0.4,0;7,0.5;title;#FFFF00," .. minetest.formspec_escape(title) .. "]" ..
			"textarea[0.5,1.5;7.5,7;;" .. minetest.formspec_escape(text:sub(
				(cpp * page) - cpp, cpp * page)) .. ";]" ..
			"button[2.4,7.6;0.8,0.8;book_prev;<]" ..
			"label[3.2,7.7;Page " .. page .. " of " .. page_max .. "]" ..
			"button[4.9,7.6;0.8,0.8;book_next;>]"
	end

	minetest.show_formspec(player_name, "equipment:book", formspec)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "equipment:book" then return end
	local inv = player:get_inventory()
	local stack = player:get_wielded_item()

	if fields.save and fields.title ~= "" and fields.text ~= "" then
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
		data.text_len = fields.text:len()
		data.page = 1
		data.chars_per_page = 650
		data.page_max = math.ceil(data.text_len / data.chars_per_page)
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

	elseif fields.book_next or fields.book_prev then
		local data = minetest.deserialize(stack:get_metadata())
		if not data.page then return end

		if fields.book_next then
			data.page = data.page + 1
			if data.page > data.page_max then
				data.page = 1
			end
		else
			data.page = data.page - 1
			if data.page == 0 then
				data.page = data.page_max
			end
		end

		local data_str = minetest.serialize(data)
		stack:set_metadata(data_str)
		book_on_use(stack, player)
	end
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
	inventory_image = "equipment_book_written.png",
	groups = {book=1, not_in_creative_inventory=1},
	stack_max = 1,
	on_use = book_on_use,
})

minetest.register_craft({
	type = "shapeless",
	output = "equipment:book_written",
	recipe = { "equipment:book", "equipment:book_written" }
})

minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	if itemstack:get_name() ~= "equipment:book_written" then
		return
	end

	--local copy = ItemStack("equipment:book_written")
	local original
	local index
	for i = 1, player:get_inventory():get_size("craft") do
		if old_craft_grid[i]:get_name() == "equipment:book_written" then
			original = old_craft_grid[i]
			index = i
		end
	end
	if not original then
		return
	end
	local copymeta = original:get_metadata()
	-- copy of the book held by player's mouse cursor
	itemstack:set_metadata(copymeta)
	-- put the book with metadata back in the craft grid
	craft_inv:set_stack("craft", index, original)
end)

-- False bookcase

minetest.register_node("equipment:bookcase", {
	description = S("Bookcase"),
	tiles = {"equipment_chest_top.png", "equipment_chest_top.png", "equipment_bookshelf.png"},
	is_ground_content = false,
	walkable = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, not_in_craft_guide = 1, not_in_creative_inventory = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = 'equipment:bookcase',
	type = "shapeless",
	recipe = {"equipment:bookshelf", "doors:door_wood"},
})

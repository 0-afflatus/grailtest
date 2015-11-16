-- Definitions made by this mod that other mods can use too
equipment = {}

-- Load files
dofile(minetest.get_modpath("equipment").."/cauldron.lua")
dofile(minetest.get_modpath("equipment").."/furnace.lua")
dofile(minetest.get_modpath("equipment").."/barrel.lua")


equipment.bookshelf_formspec =
	"size[8,7;]"..
	"list[context;books;0,0.3;8,1;]"..
	"list[current_player;main;0,2.85;8,1;]"..
	"list[current_player;main;0,4.08;8,3;8]"
	
minetest.register_node("equipment:bookshelf", {
	description = "Bookshelf",
	tiles = {"equipment_chest_top.png", "equipment_chest_top.png", "equipment_bookshelf.png"},
	is_ground_content = false,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", equipment.bookshelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("books", 8*1)
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
			if stack:get_name() == "equipment:book" and to_stack:is_empty() then
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
		if to_list == "books" then
			if minetest.get_item_group(stack:get_name(), "book") ~= 0
					and to_stack:is_empty() then
				return 1
			else
				return 0
			end
		end
	end,

	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
			   " moves stuff in bookshelf at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			   " moves stuff to bookshelf at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			   " takes stuff from bookshelf at "..minetest.pos_to_string(pos))
	end,
})

equipment.chest_formspec = 
	"size[8,9]"..
	"list[current_name;main;0,0;8,4;]"..
	"list[current_player;main;0,5;8,4;]"

function equipment.get_locked_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," ..pos.z
	local formspec =
		"size[8,9]"..
		"list[nodemeta:".. spos .. ";main;0,0;8,4;]"..
		"list[current_player;main;0,5;8,4;]"
	return formspec
end


minetest.register_node("equipment:chest", {
	description = "Chest",
	tiles = {"equipment_chest_top.png", "equipment_chest_top.png", "equipment_chest_side.png",
		"equipment_chest_side.png", "equipment_chest_side.png", "equipment_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",equipment.chest_formspec)
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

local function has_locked_chest_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end

minetest.register_node("equipment:chest_locked", {
	description = "Locked Chest",
	tiles = {"equipment_chest_top.png", "equipment_chest_top.png", "equipment_chest_side.png",
		"equipment_chest_side.png", "equipment_chest_side.png", "equipment_chest_lock.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Locked Chest (owned by "..
				meta:get_string("owner")..")")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Locked Chest")
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and has_locked_chest_privilege(meta, player)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access a locked chest belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return count
	end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access a locked chest belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return stack:get_count()
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access a locked chest belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return stack:get_count()
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in locked chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to locked chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from locked chest at "..minetest.pos_to_string(pos))
	end,
	on_rightclick = function(pos, node, clicker)
		local meta = minetest.get_meta(pos)
		if has_locked_chest_privilege(meta, clicker) then
			minetest.show_formspec(
				clicker:get_player_name(),
				"equipment:chest_locked",
				equipment.get_locked_chest_formspec(pos)
			)
		end
	end,
})

minetest.register_node("equipment:fence_wood", {
	description = "Wooden Fence",
	drawtype = "fencelike",
	tiles = {"material_wood.png"},
	inventory_image = "equipment_fence.png",
	wield_image = "equipment_fence.png",
	paramtype = "light",
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("equipment:ladder", {
	description = "Ladder",
	drawtype = "signlike",
	tiles = {"equipment_ladder.png"},
	inventory_image = "equipment_ladder.png",
	wield_image = "equipment_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("equipment:sign_wall", {
	description = "Sign",
	drawtype = "nodebox",
	tiles = {"equipment_sign_wall.png"},
	inventory_image = "equipment_sign_wall_inv.png",
	wield_image = "equipment_sign_wall_inv.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	node_box = {
		type = "wallmounted",
		wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
		wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
		wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),

	on_construct = function(pos)
		--local n = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
		if minetest.is_protected(pos, sender:get_player_name()) then
			minetest.record_protection_violation(pos, sender:get_player_name())
			return
		end
		local meta = minetest.get_meta(pos)
		if not fields.text then return end
		minetest.log("action", (sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"'..fields.text..'"')
	end,
})

minetest.register_node("equipment:torch", {
	description = "Torch (lit)",
	drawtype = "torchlike",
	tiles = {
		{name="equipment_torch_on_floor_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="equipment_torch_on_ceiling_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="equipment_torch_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	inventory_image = "equipment_torch_on_floor.png",
	wield_image = "equipment_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = default.LIGHT_MAX - 2,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,attached_node=1,hot=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	on_use = function(itemstack, user, pointed_thing)
	    fire.strike_fire(user, pointed_thing)
	    itemstack:add_wear(65535/16)
	    return itemstack
	end
})

minetest.register_node("equipment:torch_unlit", {
	description = "Torch",
	drawtype = "torchlike",
	tiles = {"equipment_torch_on_floor.png", "equipment_torch_on_ceiling.png", "equipment_torch.png"},
	inventory_image = "equipment_torch_on_floor.png",
	wield_image = "equipment_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,flammable=1,attached_node=1},
	
	-- lighting a placed torch when hit by a burning one
	after_dig_node = function(pos, node, oldmetadata, puncher)
		local wield = puncher:get_wielded_item():get_name()
		if wield == "equipment:torch" then
			node.name = "equipment:torch"
			minetest.set_node(pos, node)
			local inv = puncher:get_inventory()
			inv:remove_item("main", "equipment:torch_unlit")
		end
	end,
	
	-- lighting the torch in hand when hitting a burning one
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			local n = minetest.get_node(pointed_thing.under)
			if minetest.get_item_group(n.name, "igniter") ~= 0 or n.name == "equipment:torch" or n.name == "equipment:furnace_active" then
				local torch_count = user:get_wielded_item():get_count()
				itemstack:replace("equipment:torch "..torch_count.."")
				return itemstack
			else
				minetest.punch_node(pointed_thing.under)
			end
		else
			return
		end
	end,
	
	sounds = default.node_sound_defaults(),
})

minetest.register_node("equipment:lantern", {
	description = "Lantern",
	drawtype = "glasslike",
	tiles = {"equipment_lantern.png"},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,dig_immediate=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("equipment:panel_wood", {
	description = "Wooden Panel",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	inventory_image = "equipment_wood_panel.png",
	tiles = {"equipment_wood_panel.png"},
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults()
})

--

dofile(minetest.get_modpath("equipment").."/crafting.lua")
dofile(minetest.get_modpath("equipment").."/aliases.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

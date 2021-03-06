
--
-- Formspecs
--

local function active_formspec(fuel_percent, item_percent)
	local formspec = 
		"size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"list[current_name;src;1.75,0.5;3,3;]"..
		"image[4.75,2.5;1,1;equipment_furnace_fire_bg.png^[lowpart:"..
		(100-fuel_percent)..":equipment_furnace_fire_fg.png]"..
		"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
		(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
		"list[current_name;dst;5.75,1.5;1,1;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		default.get_hotbar_bg(0, 4.25)
	return formspec
end

local inactive_formspec =
	"size[8,8.5]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;src;1.75,0.5;3,3;]"..
	"image[4.75,2.5;1,1;equipment_furnace_fire_bg.png]"..
	"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"list[current_name;dst;5.75,1.5;1,1;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	default.get_hotbar_bg(0, 4.25)

--
-- Node callback functions that are the same for active and inactive cauldron
--

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("dst") and inv:is_empty("src")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	--local inv = meta:get_inventory()
	if listname == "src" then
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

local function on_heat(pos)
	local under = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
	local heat = false
	if minetest.get_item_group(under.name, "hot") > 1 then
		heat = true
	else
		heat = false
	end
	return heat
end

--
-- Node definitions
--

minetest.register_node("equipment:cauldron", {
	description = "Cauldron",
	tiles = {
		"equipment_cauldron_inner.png^equipment_cauldron_top.png", "equipment_cauldron_bottom.png",
		"equipment_cauldron_side.png", "equipment_cauldron_side.png",
		"equipment_cauldron_side.png", "equipment_cauldron_side.png"
	},
	paramtype2 = "facedir",
	groups = {dig_immediate=2, oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	
	can_dig = can_dig,
	
	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

minetest.register_node("equipment:cauldron_active", {
	description = "Cauldron",
	tiles = {
		{ name = "equipment_cauldron_top_anim_soup.png",
			animation = {type="vertical_frames", length=3.0} },
		"equipment_cauldron_side.png"
	},
	paramtype2 = "facedir",
	drop = "equipment:cauldron",
	groups = {dig_immediate=2, oddly_breakable_by_hand=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	
	can_dig = can_dig,
	
	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

--
-- ABM
--

local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

minetest.register_abm({
	nodenames = {"equipment:cauldron", "equipment:cauldron_active"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		--
		-- Inizialize metadata
		--
		local meta = minetest.get_meta(pos)
		local src_time = meta:get_float("src_time") or 0
		
		--
		-- Inizialize inventory
		--
		local inv = meta:get_inventory()
		for listname, size in pairs({
				src = 9,
				dst = 1,
		}) do
			if inv:get_size(listname) ~= size then
				inv:set_size(listname, size)
			end
		end
		local srclist = inv:get_list("src")
		--local dstlist = inv:get_list("dst")
		
		--
		-- Cooking
		--
		
		-- Check if we have craftable content
		local preplist = {}
		local crafted, aftercrafted = minetest.get_craft_result({method = "shapeless", width = 9, items = srclist})
		local craftable = true
		if craftable then
			preplist[1] = crafted.item
		else
			preplist = srclist
		end
		
		-- Check if we have cookable content
		local cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = preplist})
		local cookable = true
		
		if cooked.time == 0 then
			cookable = false
		end
		
		-- Check if we have enough fuel to burn
		if on_heat(pos) then
			-- The cauldron is currently active and has enough fuel
			-- If there is a cookable item then check if it is ready yet
			if cookable then
				src_time = src_time + 1
				if src_time >= cooked.time then
					-- Place result in dst list if possible
					if inv:room_for_item("dst", cooked.item) then
						inv:add_item("dst", cooked.item)
						inv:set_list("src", aftercrafted.items)
						inv:set_stack("src", 1, aftercooked.items[1])
						src_time = 0
					end
				end
			end
		else
			-- cauldron is not on the heat
			if inv:room_for_item("dst", cooked.item) then
				inv:add_item("dst", preplist[1])
				inv:set_list("src", aftercrafted.items)
				src_time = 0
			end
		end
		
		--
		-- Update formspec, infotext and node
		--
		local formspec = inactive_formspec
		local item_state = ""
		local item_percent = 0
		if cookable then
			item_percent =  math.floor(src_time / cooked.time * 100)
			item_state = item_percent .. "%"
		else
			if srclist[9]:is_empty() then
				item_state = "Empty"
			else
				item_state = "Not cookable"
			end
		end
		
		local fuel_state = "Cold"
		local active = "inactive "
		if on_heat(pos) then
			active = "active "
			local fuel_percent = 23
			fuel_state = "Hot"
			formspec = active_formspec(fuel_percent, item_percent)
			swap_node(pos, "equipment:cauldron_active")
		else
			fuel_state = "Cold"
			swap_node(pos, "equipment:cauldron")
		end
		
		local infotext =  "cauldron " .. active .. "(Item: " .. item_state .. "; Temp: " .. fuel_state .. ")"
		
		--
		-- Set meta values
		--
		meta:set_float("src_time", src_time)
		meta:set_string("formspec", formspec)
		meta:set_string("infotext", infotext)
	end,
})

minetest.register_craft({
	output = 'equipment:cauldron',
	recipe = {
		{'group:metal', '', 'group:metal'},
		{'group:metal', '', 'group:metal'},
		{'group:metal', 'group:metal', 'group:metal'},
	}
})


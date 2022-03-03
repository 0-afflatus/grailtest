-- Grailtest 5 --
-- mods/base/functions.lua

--
-- Sounds
--

function base.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "", gain = 0.5}
	table.dug = table.dug or
			{name = "base_dug_node", gain = 0.25}
	table.place = table.place or
			{name = "base_place_node_hard", gain = 1.0}
	return table
end

function base.node_sound_stone_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_hard_footstep", gain = 0.25}
	table.dug = table.dug or
			{name = "base_hard_footstep", gain = 1.0}
	base.node_sound_defaults(table)
	return table
end

function base.node_sound_dirt_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_dirt_footstep", gain = 0.25}
	table.dig = table.dig or
			{name = "default_dig_crumbly", gain = 0.4}
	table.dug = table.dug or
			{name = "base_dirt_footstep", gain = 1.0}
	table.place = table.place or
			{name = "base_place_node", gain = 0.8}
	base.node_sound_defaults(table)
	return table
end

function base.node_sound_sand_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_sand_footstep", gain = 0.1}
	table.dug = table.dug or
			{name = "base_sand_footstep", gain = 0.4}
	table.place = table.place or
			{name = "base_place_node", gain = 1.0}
	base.node_sound_defaults(table)
	return table
end

function base.node_sound_gravel_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_gravel_footstep", gain = 0.25}
	table.dig = table.dig or
			{name = "base_gravel_dig", gain = 0.35}
	table.dug = table.dug or
			{name = "base_gravel_dug", gain = 1.0}
	table.place = table.place or
			{name = "base_place_node", gain = 1.0}
	base.node_sound_defaults(table)
	return table
end

function base.node_sound_wood_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_wood_footstep", gain = 0.15}
	table.dig = table.dig or
			{name = "default_dig_choppy", gain = 0.4}
	table.dug = table.dug or
			{name = "base_wood_footstep", gain = 1.0}
	base.node_sound_defaults(table)
	return table
end

function base.node_sound_leaves_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_grass_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "base_grass_footstep", gain = 0.7}
	table.dig = table.dig or
			{name = "base_dig_crumbly", gain = 0.4}
	table.place = table.place or
			{name = "base_place_node", gain = 1.0}
	base.node_sound_defaults(table)
	return table
end

function base.node_sound_glass_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_glass_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "base_break_glass", gain = 1.0}
	base.node_sound_defaults(table)
	return table
end

function base.node_sound_ice_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_ice_footstep", gain = 0.15}
	table.dig = table.dig or
			{name = "base_ice_dig", gain = 0.5}
	table.dug = table.dug or
			{name = "base_ice_dug", gain = 0.5}
	base.node_sound_defaults(table)
	return table
end

function base.node_sound_metal_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_metal_footstep", gain = 0.2}
	table.dig = table.dig or
			{name = "base_dig_metal", gain = 0.5}
	table.dug = table.dug or
			{name = "base_dug_metal", gain = 0.5}
	table.place = table.place or
			{name = "base_place_node_metal", gain = 0.5}
	base.node_sound_defaults(table)
	return table
end

function base.node_sound_water_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_water_footstep", gain = 0.2}
	base.node_sound_defaults(table)
	return table
end

function base.node_sound_snow_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "base_snow_footstep", gain = 0.1}
	table.dig = table.dig or
			{name = "base_snow_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "base_snow_footstep", gain = 0.3}
	table.place = table.place or
			{name = "base_place_node", gain = 1.0}
	base.node_sound_defaults(table)
	return table
end

--
-- dig upwards
--

function base.dig_up(pos, node, digger)
	if digger == nil then return end
	local np = {x = pos.x, y = pos.y + 1, z = pos.z}
	local nn = minetest.get_node(np)
	if nn.name == node.name then
		minetest.node_dig(np, nn, digger)
	end
end

--
-- Optimized helper to put all items in an inventory into a drops list
--

function base.get_inventory_drops(pos, inventory, drops)
	local inv = minetest.get_meta(pos):get_inventory()
	local n = #drops
	for i = 1, inv:get_size(inventory) do
		local stack = inv:get_stack(inventory, i)
		if stack:get_count() > 0 then
			drops[n+1] = stack:to_table()
			n = n + 1
		end
	end
end

--
-- Checks if specified volume intersects a protected volume
--

function base.intersects_protection(minp, maxp, player_name, interval)
	-- 'interval' is the largest allowed interval for the 3D lattice of checks

	-- Compute the optimal float step 'd' for each axis so that all corners and
	-- borders are checked. 'd' will be smaller or equal to 'interval'.
	-- Subtracting 1e-4 ensures that the max co-ordinate will be reached by the
	-- for loop (which might otherwise not be the case due to rounding errors).
	local d = {}
	for _, c in pairs({"x", "y", "z"}) do
		if maxp[c] > minp[c] then
			d[c] = (maxp[c] - minp[c]) / math.ceil((maxp[c] - minp[c]) / interval) - 1e-4
		elseif maxp[c] == minp[c] then
			d[c] = 1 -- Any value larger than 0 to avoid division by zero
		else -- maxp[c] < minp[c], print error and treat as protection intersected
			minetest.log("error", "maxp < minp in 'base.intersects_protection()'")
			return true
		end
	end

	for zf = minp.z, maxp.z, d.z do
		local z = math.floor(zf + 0.5)
		for yf = minp.y, maxp.y, d.y do
			local y = math.floor(yf + 0.5)
			for xf = minp.x, maxp.x, d.x do
				local x = math.floor(xf + 0.5)
				if minetest.is_protected({x = x, y = y, z = z}, player_name) then
					return true
				end
			end
		end
	end

	return false
end

--
-- Register a craft to copy the metadata of items
--

function base.register_craft_metadata_copy(ingredient, result)
	minetest.register_craft({
		type = "shapeless",
		output = result,
		recipe = {ingredient, result}
	})

	minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
		if itemstack:get_name() ~= result then
			return
		end

		local original
		local index
		for i = 1, #old_craft_grid do
			if old_craft_grid[i]:get_name() == result then
				original = old_craft_grid[i]
				index = i
			end
		end
		if not original then
			return
		end
		local copymeta = original:get_meta():to_table()
		itemstack:get_meta():from_table(copymeta)
		-- put the book with metadata back in the craft grid
		craft_inv:set_stack("craft", index, original)
	end)
end

--
-- NOTICE: This method is not an official part of the API yet.
-- This method may change in future.
--

function base.can_interact_with_node(player, pos)
	if player and player:is_player() then
		if minetest.check_player_privs(player, "protection_bypass") then
			return true
		end
	else
		return false
	end

	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("owner")

	if not owner or owner == "" or owner == player:get_player_name() then
		return true
	end

	-- Is player wielding the right key?
	local item = player:get_wielded_item()
	if minetest.get_item_group(item:get_name(), "key") == 1 then
		local key_meta = item:get_meta()

		if key_meta:get_string("secret") == "" then
			local key_oldmeta = item:get_metadata()
			if key_oldmeta == "" or not minetest.parse_json(key_oldmeta) then
				return false
			end

			key_meta:set_string("secret", minetest.parse_json(key_oldmeta).secret)
			item:set_metadata("")
		end

		return meta:get_string("key_lock_secret") == key_meta:get_string("secret")
	end

	return false
end

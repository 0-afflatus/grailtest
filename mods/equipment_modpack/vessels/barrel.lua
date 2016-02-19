


local barrel_liquids = {}
for k, blob in pairs(bucket.liquids) do
	blob["returns"] = "bucket:bucket_empty"
	barrel_liquids[blob.itemname] = blob
end
for k, blob in pairs(bucket.contents) do
	blob["returns"] = "bucket:wooden_empty"
	barrel_liquids[blob.itemname] = blob
end

minetest.register_node("vessels:barrel", {
	description = "Barrel",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"vessels_barrel_top.png", "vessels_barrel_top.png^[transformR180", "vessels_barrel_side.png",
			"vessels_barrel_side.png", "vessels_barrel_side.png", "vessels_barrel_side.png"},
	groups = {tree = 1, snappy = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	drop = "vessels:barrel",
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	
	on_construct = function(pos)
                local meta = minetest.get_meta(pos);
		meta:set_string("infotext", "Barrel [empty]")
                local inv = meta:get_inventory();
                inv:set_size("main", 1);
        end,

	on_punch = function(pos, node, player, pointed_thing)
		local meta = minetest.get_meta(pos);
	        local inv = meta:get_inventory();
		local wielded = player:get_wielded_item():get_name()
	        local liquiddef = barrel_liquids[wielded]
		
		if liquiddef and liquiddef.source then
			local leftover = inv:add_item("main", liquiddef.source)
			if leftover:get_name() ~= "" then
				-- return leftover
				player:set_wielded_item(liquiddef.itemname)
			else
				-- return empty_bucket
				player:set_wielded_item(liquiddef.returns)
			end
			local max = inv:get_stack("main", 1):get_stack_max()
			local ful = inv:get_stack("main", 1):get_count()
			local def = inv:get_stack("main", 1):get_definition()
			local desc = def.description	
                	meta:set_string('infotext', "Barrel of "..desc.." ["..ful.."/"..max.."] ");
		end
		
	end,
	
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos);
	        local inv = meta:get_inventory();
	        local invstack = inv:get_stack("main", 1)
		local contents = invstack:get_name()
		local item_count = player:get_wielded_item():get_count()
		
		local liquiddef = nil
		local bucket_type = itemstack:get_name()
		if bucket_type == "bucket:bucket_empty" then
			liquiddef = bucket.liquids[contents]
		elseif bucket_type == "bucket:wooden_empty" then
			liquiddef = bucket.contents[contents]
		else
			bucket_type = nil
		end
		
		-- remove liquid node from barrel_contents
		if liquiddef and liquiddef.itemname then
			--[[
			if check_protection(pointed_thing.under,
					player:get_player_name(),
					"take ".. contents) then
				return
			end
			]]
			-- default set to return filled bucket
			local giving_back = liquiddef.itemname

			-- check if holding more than 1 empty bucket
			if item_count > 1 then

				-- if space in inventory add filled bucket, otherwise drop as item
				local p_inv = player:get_inventory()
				if p_inv:room_for_item("main", {name=liquiddef.itemname}) then
					p_inv:add_item("main", liquiddef.itemname)
				else
					pos = player:getpos()
					pos.y = math.floor(pos.y + 0.5)
					minetest.add_item(pos, liquiddef.itemname)
				end

				-- set to return empty buckets minus 1
				giving_back = bucket_type.." "..tostring(item_count-1)
			end

			inv:remove_item("main", invstack:take_item())
			local ful = invstack:get_count()
			if ful > 0 then
				local max = invstack:get_stack_max()
				local def = invstack:get_definition()
				local desc = def.description	
                		meta:set_string('infotext', "Barrel of "..desc.." ["..ful.."/"..max.."] ");
			else
				meta:set_string('infotext', "Barrel [empty] ");
			end
			return ItemStack(giving_back)
		end
	end,
	
	can_dig = function(pos, player)
	        local  meta = minetest.get_meta(pos);
	        local  inv = meta:get_inventory();
	        return inv:is_empty("main");
	end,		
})

minetest.register_craft({
	output = "vessels:barrel",
	recipe = {
		{"group:wood",          "",              "group:wood" },
		{"mineral:steel_ingot", "",              "mineral:steel_ingot"},
		{"group:wood",          "group:wood",    "group:wood" },
	},
})

minetest.register_craft({
	type = "fuel",
	recipe = "vessels:barrel",
	burntime = 30,
})

--
-- Fermenting ABM
--

local fermentable = {
	['food:blackberry'] = 'food:blackberry_wine',
	['food:apple'] = 'food:cider',
	['food:barley_water'] = 'food:beer',
	['food:gorse'] = 'food:gorse_beer',
	['food:honey'] = 'food:mead',
	['food:milk'] = 'mobs:cheese',
}

minetest.register_abm({
	nodenames = {"vessels:barrel"},
	interval = 631,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		-- Get metadata
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local invstack = inv:get_stack("main", 1)
		local contents = invstack:get_name()
		local item_count = invstack:get_count()
		
		-- Swap nodes
		invstack:replace(fermentable[contents] or contents)
		invstack:set_count(item_count)
		inv:set_stack("main", 1, invstack)
		
		-- Update infotext
		local max = invstack:get_stack_max()
		local ful = invstack:get_count()
		local def = invstack:get_definition()
		local desc = def.description	
                meta:set_string('infotext', "Barrel of "..desc.." ["..ful.."/"..max.."] ")
	end,
})

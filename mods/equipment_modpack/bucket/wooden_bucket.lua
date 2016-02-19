-- Minetest 0.4 mod: bucket
-- A wooden bucket, which can pick up water and milk

minetest.register_craft({
	output = 'bucket:wooden_empty 1',
	recipe = {
		{'group:wood', '', 'group:wood'},
		{'', 'group:wood', ''},
	}
})

bucket.contents = {}

local function check_protection(pos, name, text)
	if minetest.is_protected(pos, name) then
		minetest.log("action", (name ~= "" and name or "A mod")
			.. " tried to " .. text
			.. " at protected position "
			.. minetest.pos_to_string(pos)
			.. " with a bucket")
		minetest.record_protection_violation(pos, name)
		return true
	end
	return false
end

-- Register a new liquid
--   source = name of the source node
--   flowing = name of the flowing node
--   itemname = name of the new bucket item (or nil if liquid is not takeable)
--   inventory_image = texture of the new bucket item (ignored if itemname == nil)
--    name = text description of the bucket item
--    groups = (optional) groups of the bucket item, for example {water_bucket = 1}
-- This function can be called from any mod (that depends on bucket).
function bucket.register_contents(source, flowing, itemname, inventory_image, name, groups)
	bucket.contents[source] = {
		source = source,
		flowing = flowing,
		itemname = itemname,
	}
	bucket.contents[flowing] = bucket.contents[source]

	if itemname ~= nil then
		minetest.register_craftitem(itemname, {
			description = name,
			inventory_image = inventory_image,
			stack_max = 1,
			liquids_pointable = true,
			groups = groups,
			on_place = function(itemstack, user, pointed_thing)
				-- Must be pointing to node
				if pointed_thing.type ~= "node" then
					return
				end
				
				local node = minetest.get_node_or_nil(pointed_thing.under)
				local ndef
				if node then
					ndef = minetest.registered_nodes[node.name]
				end
				-- Call on_rightclick if the pointed node defines it
				if ndef and ndef.on_rightclick and
				   user and not user:get_player_control().sneak then
					return ndef.on_rightclick(
						pointed_thing.under,
						node, user,
						itemstack) or itemstack
				end

				local place_liquid = function(pos)
					if check_protection(pos,
							user and user:get_player_name() or "",
							"place "..source) then
						return
					end
					minetest.add_node(pos, {name=source})
				end

				-- Check if pointing to a buildable node
				if ndef and ndef.buildable_to then
					-- buildable; replace the node
					place_liquid(pointed_thing.under, node,
							source, flowing)
				else
					-- not buildable to; place the liquid above
					-- check if the node above can be replaced
					node = minetest.get_node_or_nil(pointed_thing.above)
					if node and minetest.registered_nodes[node.name].buildable_to then
						place_liquid(pointed_thing.above,
								node, source,
								flowing)
					else
						-- do not remove the bucket with the liquid
						return
					end
				end
				return {name="bucket:wooden_empty"}
			end
		})
	end
end

minetest.register_craftitem("bucket:wooden_empty", {
	description = "Empty wooden bucket",
	inventory_image = "bucket_wood.png",
	stack_max = 99,
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
		-- Must be pointing to node
		if pointed_thing.type ~= "node" then
			return
		end
		-- Check if pointing to a liquid source
		local node = minetest.get_node(pointed_thing.under)
		local liquiddef = bucket.contents[node.name]
		local item_count = user:get_wielded_item():get_count()
		
		if node.name == "default:lava" or 
				node.name == "default:lava_flowing" or 
				node.name == "default:lava_source" then
			-- remove bucket from inventory
			-- place fire on top of node
			local on_top = vector.add(pointed_thing.above,{x=0,y=1,z=0}) 
			minetest.place_node(on_top, {name="fire:basic_flame"})
			itemstack:take_item()
			return itemstack
		
		elseif liquiddef ~= nil and liquiddef.itemname ~= nil and
				node.name == liquiddef.source then
			if check_protection(pointed_thing.under,
					user:get_player_name(),
					"take ".. node.name) then
				return
			end

			-- default set to return filled bucket
			local giving_back = liquiddef.itemname

			-- check if holding more than 1 empty bucket
			if item_count > 1 then

				-- if space in inventory add filled bucket, otherwise drop as item
				local inv = user:get_inventory()
				if inv:room_for_item("main", {name=liquiddef.itemname}) then
					inv:add_item("main", liquiddef.itemname)
				else
					local pos = user:getpos()
					pos.y = math.floor(pos.y + 0.5)
					minetest.add_item(pos, liquiddef.itemname)
				end

				-- set to return empty buckets minus 1
				giving_back = "bucket:wooden_empty "..tostring(item_count-1)

			end

			minetest.add_node(pointed_thing.under, {name="air"})

			return ItemStack(giving_back)
		end
	end,
})

bucket.register_contents(
	"default:water_source",
	"default:water_flowing",
	"bucket:wooden_water",
	"bucket_wood_water.png",
	"Pail of Water",
	{water_bucket = 1}
)

bucket.register_contents(
	"default:river_water_source",
	"default:river_water_flowing",
	"bucket:wooden_river_water",
	"bucket_wood_water.png",
	"Pail of River Water",
	{water_bucket = 1}
)

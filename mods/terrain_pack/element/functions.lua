-- Grailtest 5 --
-- mods/element/functions.lua --

----------
-- ABMs --
----------

-- If Snow near Water, change Water to Ice
minetest.register_abm({
	label = "Water freeze",
	nodenames = {
	    "element:dirt_with_ice",
	    "element:snow",
	    "element:snowblock",
	    "element:dirt_with_snow",
	    "element:permafrost"
	},
	neighbors = {"element:water_source"},
	interval = 313,
	chance = 157,
	catch_up = false,
	action = function(pos, node)
		local pos0 = {x = pos.x-1,y = pos.y-1,z = pos.z-1}
		local pos1 = {x = pos.x+1,y = pos.y+1,z = pos.z+1}

		local water = minetest.find_nodes_in_area(pos0, pos1, "element:water_source")
		if water then
			minetest.set_node(water[1], {name = "element:ice"})
		end
	end,
})

-- If Heat Source near Ice or Snow then melt
minetest.register_abm({
	label = "Snow melt",
	nodenames = {
	    "element:ice",
	    "element:snowblock",
	    "element:snow",
	    "element:dirt_with_snow"
	},
	neighbors = {
	    "equipment:basic_fire",
	    "equipment:bonfire",
	    "element:lava_source",
	    "element:lava_flowing",
	    "equipment:furnace_active",
	    "equipment:torch"
	},
	interval = 17,
	chance = 11,
	catch_up = false,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if node.name == "element:ice" or node.name == "element:snowblock" then
			minetest.add_node(pos,{name = "element:water_source"})
		elseif node.name == "element:snow" then
			minetest.add_node(pos,{name = "air"})
		elseif node.name == "element:snowblock" then -- or string.split(node.name, ":")[1]then
			minetest.add_node(pos,{name = "element:water_flowing"})
		elseif node.name == "element:dirt_with_snow" then
			minetest.add_node(pos,{name = "element:dirt_with_ice"})
		end
	end,
})

--
-- Moss growth on cobble near water
--
minetest.register_abm({
	label = "Mossy growth",
	nodenames = {"element:cobble"},
	neighbors = {"group:water"},
	interval = 53,
	chance = 293,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "element:mossycobble"})
	end
})

--
-- Lavacooling
--

element.cool_lava_source = function(pos)
	minetest.set_node(pos, {name = "mineral:obsidian"})
	minetest.sound_play("base_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

element.cool_lava_flowing = function(pos)
	minetest.set_node(pos, {name = "mineral:basalt"})
	minetest.sound_play("base_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

minetest.register_abm({
	label = "Lavacooling flowing",
	nodenames = {"element:lava_flowing"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 2,
	catch_up = false,
	action = function(...)
		element.cool_lava_flowing(...)
	end,
})

minetest.register_abm({
	label = "Lavacooling source",
	nodenames = {"element:lava_source"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 2,
	catch_up = false,
	action = function(...)
		element.cool_lava_source(...)
	end,
})

---
--- Grass & Soil
---

--
-- Grass and dry grass removed in darkness
--

minetest.register_abm({
	label = "Flora dieoff",
	nodenames = {"group:flora"},
	interval = 71,
	chance = 19,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "air"})
		end
	end
})

-- Die off

minetest.register_abm({
	label = "Grass dieoff",
	nodenames = {"element:dirt_with_grass"},
	interval = 41,
	chance = 13,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "element:dirt"})
		end
	end
})

minetest.register_abm({
	label = "Grass light dieoff",
	nodenames = {"element:dirt_with_grass_light"},
	interval = 43,
	chance = 13,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "element:dirt_light"})
		end
	end
})

minetest.register_abm({
	label = "Grass dry dieoff",
	nodenames = {"element:dirt_with_dry_grass"},
	interval = 59,
	chance = 17,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y+1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef
				and not ((nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "element:dirt_red"})
		end
	end
})

minetest.register_abm({
	label = "Grass jungle dieoff",
	nodenames = {"element:dirt_with_grass_jungle"},
	interval = 67,
	chance = 13,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "element:dirt_jungle"})
		end
	end
})

minetest.register_abm({
	label = "Permafrost grass growth",
	nodenames = {"element:permafrost"},
	interval = 37,
	chance = 223,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y+1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none"
				and (minetest.get_node_light(above) or 0) >= 13 then
			if name == "element:snow" or name == "element:snowblock" then
				minetest.set_node(pos, {name = "element:dirt_with_snow"})
			else
				minetest.set_node(pos, {name = "element:dirt_with_ice"})
			end
		end
	end
})

minetest.register_abm({
	label = "dirt yellow dieoff",
	nodenames = {"element:dirt_yellow"},
	interval = 47,
	chance = 223,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y+1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none"
				and (minetest.get_node_light(above) or 0) >= 13 then
			if name == "element:snow" or name == "element:snowblock" then
				minetest.set_node(pos, {name = "air"})
			end
		end
	end
})

minetest.register_abm({
	label = "dirt snow dieoff",
	nodenames = {"element:dirt_with_snow"},
	interval = 73,
	chance = 19,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y+1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef
				and not ((nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "element:dirt_yellow"})
		end
	end
})

-- If Water Source near mutable, change to grass
minetest.register_abm({
	label = "Wet Grass",
	nodenames = {"group:mutable"},
	neighbors = {"group:water", "element:mud"},
	interval = 149,
	chance = 7,
	catch_up = false,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local anode = minetest.get_node(above)
		if (minetest.get_node_light(above) or 0) < 13 or
			minetest.get_item_group(anode.name, "liquid") > 0 then
			return
		end
		minetest.add_node(pos,{name = "element:dirt_with_grass"})
	end,
})

---
--- Grass mutation
---

function element.mutate(pos, node)
	local nodelist = {
		{ x = pos.x, y = pos.y + 1, z = pos.z },
		{ x = pos.x, y = pos.y - 1, z = pos.z },
		{ x = pos.x, y = pos.y, z = pos.z + 1 },
		{ x = pos.x, y = pos.y, z = pos.z - 1 },
		{ x = pos.x + 1, y = pos.y, z = pos.z },
		{ x = pos.x - 1, y = pos.y, z = pos.z },
	}
	local score = {}
	--local defence = 0
	for _, npos in pairs(nodelist) do
		local nname = minetest.get_node(npos).name
		if minetest.get_item_group(node.name, "field") > 0 then
			break
		elseif minetest.get_item_group(nname, "mutable") > 0 then
			score[#score + 1] = nname
		end
		local count = 0
		for n = 1, #score do
			if nname ~= node.name and nname == score[n] then
				count = count + 1
			end
		end
		if count > (#score / 2) then
			minetest.swap_node(pos, {name = nname})
		end
	end
end

minetest.register_abm({
    label = "Grass mutation",
	nodenames = {"group:mutable"},
    neighbors = {"group:mutable"},
    interval = 139,
    chance = 31,
	catch_up = false,
    action = function(pos, node)
		element.mutate(pos, node)
	end,
})

minetest.register_abm({
	label = "Grass spread",
	nodenames = {
	    "element:dirt",
	    "element:dirt_light",
	    "element:dirt_red",
	    "element:dirt_yellow",
	    "element:dirt_jungle",
	    "element:permafrost",
	    "element:mud"
	},
	neighbors = {"group:mutable"},
	interval = 71,
	chance = 5,
	catch_up = false,
	action = function(pos, node)
		-- Check for darkness: night, shadow or under a light-blocking node
		-- Returns if ignore above
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		element.mutate(pos, node)
	end
})

---
--- Farming soil
---

minetest.register_abm({
	nodenames = {"group:field"},
	interval = 31,
	chance = 5,
	catch_up = false,
	action = function(pos, node)
		local n_def = minetest.registered_nodes[node.name] or nil
		local wet = n_def.soil.wet or nil
		local base = n_def.soil.base or nil
		local dry = n_def.soil.dry or nil
		if not n_def or not n_def.soil or not wet or not base or not dry then
			return
		end

		pos.y = pos.y + 1
		local nn = minetest.get_node_or_nil(pos)
		if not nn or not nn.name then
			return
		end
		local nn_def = minetest.registered_nodes[nn.name] or nil
		pos.y = pos.y - 1

		if nn_def and nn_def.walkable and minetest.get_item_group(nn.name, "plant") == 0 then
			minetest.set_node(pos, {name = base})
			return
		end
		-- check if there is water nearby
		local wet_lvl = minetest.get_item_group(node.name, "wet")
		if minetest.find_node_near(pos, 3, {"group:water"}) then
			-- if it is dry soil and not base node, turn it into wet soil
			if wet_lvl == 0 then
				minetest.set_node(pos, {name = wet})
			end
		else
			-- only turn back if there are no unloaded blocks (and therefore
			-- possible water sources) nearby
			if not minetest.find_node_near(pos, 3, {"ignore"}) then
				-- turn it back into base if it is already dry
				if wet_lvl == 0 then
					-- only turn it back if there is no plant/seed on top of it
					if minetest.get_item_group(nn.name, "plant") == 0 and minetest.get_item_group(nn.name, "seed") == 0 then
						minetest.set_node(pos, {name = base})
					end

				-- if its wet turn it back into dry soil
				elseif wet_lvl == 1 then
					minetest.set_node(pos, {name = dry})
				end
			end
		end
	end,
})

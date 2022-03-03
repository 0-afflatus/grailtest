-- Grailtest 5 --
-- mods/flora_pack/plant/api.lua --

-- translation support.
local S = minetest.get_translator("plant")
local random = math.random

-- how often node timers for plants will tick, +/- some random value
local function tick(pos)
	local n = minetest.get_node(pos)
	local def = minetest.registered_nodes[n.name]
	local soiltype = 3 -- get real value from node under
	if def.grow_time then
	    local t = def.grow_time / soiltype * 2.5 -- default is 3, lower values to speed up testing --
	    --minetest.log("action", n.name .. ": " .. tostring(t))
	    minetest.get_node_timer(pos):start(math.random(t / 2, t))
	else
	    --minetest.log("action", n.name ..": normal")
	    minetest.get_node_timer(pos):start(math.random(137, 242))
	end
end
-- how often a growth failure tick is retried (e.g. too dark)
local function tick_again(pos)
	minetest.get_node_timer(pos):start(math.random(40, 80))
end

-- Seed placement
plant.place_seed = function(itemstack, placer, pointed_thing, plantname)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)
	local above = minetest.get_node(pt.above)

	if minetest.is_protected(pt.under, placer:get_player_name()) then
		minetest.record_protection_violation(pt.under, placer:get_player_name())
		return
	end
	if minetest.is_protected(pt.above, placer:get_player_name()) then
		minetest.record_protection_violation(pt.above, placer:get_player_name())
		return
	end

	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end

	-- check if pointing at the top of the node
	if pt.above.y ~= pt.under.y+1 then
		return
	end

	-- check if you can replace the node above the pointed node
	if not minetest.registered_nodes[above.name].buildable_to then
		return
	end

	-- check if pointing at soil
	if minetest.get_item_group(under.name, "soil") < 2 then
		return
	end

	-- add the node and remove 1 item from the itemstack
	minetest.add_node(pt.above, {name = plantname, param2 = 1})
	tick(pt.above)
	if not minetest.settings:get_bool("creative_mode") then
		itemstack:take_item()
	end
	return itemstack
end

plant.grow_plant = function(pos, elapsed)
	local node = minetest.get_node(pos)
	local name = node.name
	local def = minetest.registered_nodes[name]

	if not def.next_plant then
		-- disable timer for fully grown plant
		return
	end

	-- grow seed
	if minetest.get_item_group(node.name, "seed") and def.fertility then
		local soil_node = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not soil_node then
			tick_again(pos)
			return
		end
		-- omitted is a check for light, we assume seeds can germinate in the dark.
		for _, v in pairs(def.fertility) do
			if minetest.get_item_group(soil_node.name, v) ~= 0 then
				minetest.swap_node(pos, {name = def.next_plant})
				if minetest.registered_nodes[def.next_plant].next_plant then
					tick(pos)
					return
				end
			end
		end

		return
	end

	-- check if on wet soil
	local below = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
	if minetest.get_item_group(below.name, "soil") < 2 then
		tick_again(pos)
		return
	end

	-- check light
	local light = minetest.get_node_light(pos)
	if not light or light < def.minlight or light > def.maxlight then
		tick_again(pos)
		return
	end

	-- grow
	minetest.swap_node(pos, {name = def.next_plant})

	-- new timer needed?
	if minetest.registered_nodes[def.next_plant].next_plant then
		tick(pos)
	end
	return
end

-- Register plants
plant.register_plant = function(name, def)
	local mname = name:split(":")[1]
	local pname = name:split(":")[2]

	-- Check def table
	if not def.description then
		def.description = S("Seed")
	end
	if not def.inventory_image then
		def.inventory_image = "unknown_item.png"
	end
	if not def.steps then
		return nil
	end
	if not def.grow_time then
		def.grow_time = 242
	end
	if not def.minlight then
		def.minlight = 1
	end
	if not def.maxlight then
		def.maxlight = 14
	end
	if not def.fertility then
		def.fertility = {}
	end
	if not def.harvest_description then
		def.harvest_description = ""
	end
	if not def.seed_groups then
		def.seed_groups = {seed = 1, snappy = 3, attached_node = 1}
	end

	-- Register seed
	local lbm_nodes = {mname .. ":" .. pname}
	local g = def.seed_groups
	for k, v in pairs(def.fertility) do
		g[v] = 1
	end
	minetest.register_node(":" .. mname .. ":" .. pname, {
		description = def.description,
		tiles = {def.inventory_image},
		inventory_image = def.inventory_image,
		wield_image = def.inventory_image,
		drawtype = "signlike",
		groups = g,
		paramtype = "light",
		paramtype2 = "wallmounted",
		walkable = false,
		sunlight_propagates = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		fertility = def.fertility,
		sounds = base.node_sound_dirt_defaults({
			dug = {name = "base_grass_footstep", gain = 0.2},
			place = {name = "base_place_node", gain = 0.25},
		}),

		on_place = function(itemstack, placer, pointed_thing)
			return plant.place_seed(itemstack, placer, pointed_thing, mname .. ":" .. pname .. "_1")
		end,
		next_plant = mname .. ":" .. pname .. "_1",
		on_timer = plant.grow_plant,
		grow_time = def.grow_time,
		minlight = def.minlight,
		maxlight = def.maxlight,
		on_use = minetest.item_eat(def.food_value or 0)
	})

	-- Register harvest
	if def.harvest_description ~= "" then
	minetest.register_craftitem(":" .. mname .. ":" .. def.harvest_description, {
		description = def.harvest_description:gsub("^%l", string.upper),
		inventory_image = mname .. "_" .. def.harvest_description .. ".png",
		groups = def.groups or {flammable = 2},
	})
	end

	-- Register growing steps
	for i = 1, def.steps do
		local chance = def.steps + 1
		local drop = {
		    max_items = 3,
		    items = {
			    { items = {mname .. ":" .. pname}, rarity = chance - i },
			    { items = {mname .. ":" .. pname}, rarity = (chance * 2) - i * 2 },
			    { items = {mname .. ":" .. pname}, rarity = (chance * 3) - i * 3 },
		    }
	    }
		if def.harvest_description ~= "" then
		drop = {
			items = {
				{items = {mname .. ":" .. def.harvest_description}, rarity = chance - i},
				{items = {mname .. ":" .. def.harvest_description}, rarity = chance - i * 2},
				{items = {mname .. ":" .. def.harvest_description}, rarity = (chance * 2) - i * 2},
				{items = {mname .. ":" .. pname}, rarity = chance - i},
				{items = {mname .. ":" .. pname}, rarity = (chance * 2) - i * 2},
				{items = {mname .. ":" .. pname}, rarity = (chance * 3) - i * 3},
			}
		}
		end
		local nodegroups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1}
		nodegroups[pname] = i

		local next_plant = nil
		--local on_timer = nil

		if i < def.steps then
			next_plant = mname .. ":" .. pname .. "_" .. (i + 1)
			--on_timer = plant.grow_plant
			lbm_nodes[#lbm_nodes + 1] = mname .. ":" .. pname .. "_" .. i
		end

		minetest.register_node(mname .. ":" .. pname .. "_" .. i, {
			drawtype = "plantlike",
			waving = 1,
			tiles = {mname .. "_" .. pname .. "_" .. i .. ".png"},
			paramtype = "light",
			walkable = false,
			buildable_to = true,
			drop = drop,
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			},
			groups = nodegroups,
			sounds = base.node_sound_leaves_defaults(),
			next_plant = next_plant,
			on_timer = plant.grow_plant,
		    grow_time = def.grow_time,
			minlight = def.minlight,
			maxlight = def.maxlight,
		})
	end

	-- replacement LBM for pre-nodetimer plants
	minetest.register_lbm({
		name = ":" .. mname .. ":start_nodetimer_" .. pname,
		nodenames = lbm_nodes,
		action = function(pos, node)
			tick_again(pos)
		end,
	})

	-- Return
	local r = {
		seed = mname .. ":" .. pname,
		harvest = mname .. ":" .. def.harvest_description
	}
	return r
end

local fruit = {
	blackberry = "blackberry_fruit",
	fuschia = "",
	hawthorn = "",
	}

local nodenames = {
	"plant:blackberry",
	"plant:fuschia",
	"plant:hawthorn",
	}

minetest.register_abm({
	nodenames = nodenames,
	interval = 223,
	chance = 13,

	action = function(pos, node)
		if minetest.get_node_light(pos, nil) > 12 then
			local branch = minetest.get_node(pos).name
			local flowers = branch .. "_flowers"
			minetest.set_node(pos, { name = flowers })
			minetest.get_node_timer(pos):start(random(223, 1299))
			--minetest.log("action", branch .. " --> flowers ***")
		end
	end
})

function plant.grow_fruit(pos)
	if minetest.get_node(pos) then
		local n = minetest.get_node(pos).name
		local branch = string.split(n, "_flowers")[1]
		local species = string.split(branch, ":")[2]
		local leaves = branch
		minetest.set_node(pos, { name = leaves })
		local above = { x = pos.x, y = pos.y + 1, z = pos.z, }
		if minetest.get_node(above).name == "air" then
			if random(1,13) == 1 then
				local fruit_name = "plant:" .. fruit[species]
				minetest.set_node(above, { name = fruit_name })
				--minetest.log("action", n .. " --> " .. fruit[species])
			end
		end
	end
end

-- Grailtest 5 --
-- mods/flora_pack/tree/init.lua --

-- Load translation support.
local S = minetest.get_translator("tree")

tree = {}
local random = math.random

-- Tree Felling --
-- requires setting

local felling_enabled = minetest.settings:get_bool("enable_tree_felling")

function tree.fell(pos, node, digger)
	if felling_enabled == false then return end
	if digger == nil then return end
	-- for node in find nodes in area
	local species = string.split(string.split(node.name, ":")[2], "_")[1]
	local offset = tree.lookup[species][3]
	local minp = {x = pos.x - offset, y = pos.y + 1, z = pos.z - offset}
	local maxp = {x = pos.x + offset, y = pos.y + offset, z = pos.z + offset}
	local nodelist = minetest.find_nodes_in_area(minp, maxp, node.name)
	for _, np in ipairs(nodelist) do
		local nn = minetest.get_node(np)
		if nn.name == node.name and
			nn.param2 < 4 then
			minetest.node_dig(np, nn, digger)
		end
	end
end

-- Autoplant (from Hamlet's Quest) --
-- requires setting

local autoplant_enabled = minetest.settings:get_bool("enable_autoplant")

local parent_add_item = minetest.add_item
function minetest.add_item(pos, name)
	-- quick-n-dirty solution, but obviosly may produce a bug
	if autoplant_enabled == false then return end
	if type(name) == 'string' and name:match('sapling$') then
		local i = 0
		local node_under
		repeat
			i = i + 1
			node_under = minetest.get_node({ x = pos.x, y = pos.y - i, z = pos.z })
		until i > 23 or
			(node_under.name ~= 'air' and
			minetest.get_item_group(node_under.name, 'leafdecay') == 0)
		if minetest.get_item_group(node_under.name, 'soil') > 0 then
			local target = { x = pos.x, y = pos.y - i + 1, z = pos.z }
			if minetest.get_node(target).name == 'air' then
				return minetest.set_node(target, { name = name })
			end
		end
	end
	return parent_add_item(pos, name)
end

-- New tree

function tree.gen(pos, name, offset)
	local schem = minetest.get_modpath("tree") .. "/schematics/" .. name .. "_tree.mts"
	minetest.place_schematic({x = pos.x - offset, y = pos.y - 1, z = pos.z - offset},
		schem, 0, nil, false)
end

-- 'can grow' function

function tree.can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	if minetest.get_item_group(node_under.name, "soil") == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 13 then
		return false
	end
	return true
end

function tree.grow_sapling(pos, name, offset)
	if not tree.can_grow(pos) then
		-- try again 5 min later
		minetest.get_node_timer(pos):start(300)
		return
	end

	local node = minetest.get_node(pos)
	if node.name == "tree:" .. name .. "_sapling" then
		minetest.log("action", "A " .. name .. " sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		tree.gen(pos, name, offset)
	end
end

function tree.sapling_on_place(itemstack, placer, pointed_thing,
		sapling_name, minp_relative, maxp_relative, interval)
	-- Position of sapling
	local pos = pointed_thing.under
	local node = minetest.get_node_or_nil(pos)
	local pdef = node and minetest.registered_nodes[node.name]

	if pdef and pdef.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
		return pdef.on_rightclick(pos, node, placer, itemstack, pointed_thing)
	end

	if not pdef or not pdef.buildable_to then
		pos = pointed_thing.above
		node = minetest.get_node_or_nil(pos)
		pdef = node and minetest.registered_nodes[node.name]
		if not pdef or not pdef.buildable_to then
			return itemstack
		end
	end

	local player_name = placer and placer:get_player_name() or ""
	-- Check sapling position for protection
	if minetest.is_protected(pos, player_name) then
		minetest.record_protection_violation(pos, player_name)
		return itemstack
	end
	-- Check tree volume for protection
	if minetest.is_area_protected(
			vector.add(pos, minp_relative),
			vector.add(pos, maxp_relative),
			player_name,
			interval) then
		minetest.record_protection_violation(pos, player_name)
		-- Print extra information to explain
--		minetest.chat_send_player(player_name,
--			itemstack:get_definition().description .. " will intersect protection " ..
--			"on growth")
		minetest.chat_send_player(player_name,
			S("@1 will intersect protection on growth.",
			itemstack:get_definition().description))
		return itemstack
	end

	minetest.log("action", player_name .. " places node "
			.. sapling_name .. " at " .. minetest.pos_to_string(pos))

	local take_item = not (creative and creative.is_enabled_for
		and creative.is_enabled_for(player_name))
	local newnode = {name = sapling_name}
	local ndef = minetest.registered_nodes[sapling_name]
	minetest.set_node(pos, newnode)

	-- Run callback
	if ndef and ndef.after_place_node then
		-- Deepcopy place_to and pointed_thing because callback can modify it
		if ndef.after_place_node(table.copy(pos), placer,
				itemstack, table.copy(pointed_thing)) then
			take_item = false
		end
	end

	-- Run script hook
	for _, callback in ipairs(minetest.registered_on_placenodes) do
		-- Deepcopy pos, node and pointed_thing because callback can modify them
		if callback(table.copy(pos), table.copy(newnode),
				placer, table.copy(node or {}),
				itemstack, table.copy(pointed_thing)) then
			take_item = false
		end
	end

	if take_item then
		itemstack:take_item()
	end

	return itemstack
end

-- Register Tree --

function tree.register_tree(name, desc, offset, delay, energy)
	minetest.register_node("tree:" .. name .. "_trunk", {
		description = desc .. S(" Tree Trunk"),
		tiles = {"tree_" .. name .. "_trunk_top.png", "tree_" .. name .. "_trunk_top.png", "tree_" .. name .. "_trunk.png"},
		drawtype = 'mesh',
		mesh = 'round_trunk.obj',
		paramtype = 'light',
		paramtype2 = 'facedir',
		selection_box = {
			type = 'fixed',
			fixed = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4}
		},
		collision_box = {
			type = 'fixed',
			fixed = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4}
		},
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 1},
		sounds = base.node_sound_wood_defaults(),
		after_dig_node = function(pos, node, metadata, digger)
			tree.fell(pos, node, digger)
		end,
		on_place = minetest.rotate_node
	})

	minetest.register_node("tree:" .. name .. "_log", {
		description = desc .. " Tree Log",
		tiles = {"tree_" .. name .. "_trunk_top.png", "tree_" .. name .. "_trunk_top.png", "tree_" .. name .. "_trunk.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2, log=1},
		sounds = base.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("tree:" .. name .. "_wood", {
		description = desc .. S(" Wood Planks"),
		tiles = {"tree_" .. name .. "_wood.png"},
		is_ground_content = false,
		paramtype2 = "facedir",
		place_param2 = 0,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = base.node_sound_wood_defaults(),
	})

	minetest.register_node("tree:" .. name .. "_sapling", {
		description = desc .. S(" Tree Sapling"),
		drawtype = "plantlike",
		visual_scale = 1.5,
		tiles = {"tree_" .. name .. "_sapling.png"},
		inventory_image = "tree_" .. name .. "_sapling.png",
		wield_image = "tree_" .. name .. "_sapling.png",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		on_timer = function(pos, elapsed)
			tree.grow_sapling(pos, name, offset)
		end,
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = base.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(random(delay, delay * 3))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
				"tree:" .. name .. "_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = (offset + 1) * -1, y = 1, z = (offset + 1) * -1},
				{x = offset + 1, y = 23, z = offset + 1},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_node("tree:" .. name .. "_leaves", {
		description = desc .. S(" Tree Leaves"),
		drawtype = "allfaces_optional",
		waving = 1,
		visual_scale = 1.3,
		tiles = {"tree_" .. name .. "_leaves.png"},
		paramtype = "light",
		is_ground_content = false,
		walkable = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{
					-- player will get sapling with 1/20 chance
					items = {"tree:" .. name .. "_sapling"},
					rarity = 29,
				},
				{
					-- player will get leaves only if he get no saplings,
					-- this is because max_items is 1
					items = {"tree:" .. name .. "_leaves"},
				}
			}
		},
		sounds = base.node_sound_leaves_defaults(),

		after_place_node = tree.after_place_leaves,
	})

	tree.register_leafdecay({
			trunks = {"tree:" .. name .. "_trunk"},
			leaves = {"tree:" .. name .. "_leaves"},
			radius = offset,
		})

	minetest.register_craft({
		output = "tree:" .. name .. "_log",
		recipe = {
			{"tree:" .. name .. "_trunk"},
		}
	})

	minetest.register_craft({
		output = "tree:" .. name .. "_wood 4",
		recipe = {
			{"tree:" .. name .. "_log"},
		}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "tree:" .. name .. "_log",
		burntime = (energy * 4) + 2,
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "tree:" .. name .. "_wood",
		burntime = energy,
	})

end

--
-- Leafdecay
--

-- Prevent decay of placed leaves

tree.after_place_leaves = function(pos, placer, itemstack, pointed_thing)
	if placer and placer:is_player() then
		local node = minetest.get_node(pos)
		node.param2 = 1
		minetest.set_node(pos, node)
	end
end

-- Leafdecay
local function leafdecay_after_destruct(pos, oldnode, def)
	for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, def.radius),
			vector.add(pos, def.radius), def.leaves)) do
		local node = minetest.get_node(v)
		local timer = minetest.get_node_timer(v)
		if node.param2 ~= 1 and not timer:is_started() then
			timer:start(math.random(20, 120) / 10)
		end
	end
end

local movement_gravity = tonumber(
	minetest.settings:get("movement_gravity")) or 9.81

local function leafdecay_on_timer(pos, def)
	if minetest.find_node_near(pos, def.radius, def.trunks) then
		return false
	end

	local node = minetest.get_node(pos)
	local drops = minetest.get_node_drops(node.name)
	for _, item in ipairs(drops) do
		local is_leaf
		for _, v in pairs(def.leaves) do
			if v == item then
				is_leaf = true
			end
		end
		if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
				not is_leaf then
			minetest.add_item({
				x = pos.x - 0.5 + math.random(),
				y = pos.y - 0.5 + math.random(),
				z = pos.z - 0.5 + math.random(),
			}, item)
		end
	end

	minetest.remove_node(pos)
	minetest.check_for_falling(pos)

	-- spawn a few particles for the removed node
	minetest.add_particlespawner({
		amount = 8,
		time = 0.001,
		minpos = vector.subtract(pos, {x=0.5, y=0.5, z=0.5}),
		maxpos = vector.add(pos, {x=0.5, y=0.5, z=0.5}),
		minvel = vector.new(-0.5, -1, -0.5),
		maxvel = vector.new(0.5, 0, 0.5),
		minacc = vector.new(0, -movement_gravity, 0),
		maxacc = vector.new(0, -movement_gravity, 0),
		minsize = 0,
		maxsize = 0,
		node = node,
	})
end

function tree.register_leafdecay(def)
	assert(def.leaves)
	assert(def.trunks)
	assert(def.radius)
	for _, v in pairs(def.trunks) do
		minetest.override_item(v, {
			after_destruct = function(pos, oldnode)
				leafdecay_after_destruct(pos, oldnode, def)
			end,
		})
	end
	for _, v in pairs(def.leaves) do
		minetest.override_item(v, {
			on_timer = function(pos)
				leafdecay_on_timer(pos, def)
			end,
		})
	end
end

-- Fruit and blossom --

local fruit = {
	apple = "apple",
	banana = "banana",
	oak = "acorn",
	palm = "coconut",
	pine = "pine_cone",
	olive = "olive_fruit"
	}

local nodenames = {
	"tree:apple_leaves",
	"tree:banana_leaves",
	"tree:oak_leaves",
	"tree:palm_leaves",
	"tree:pine_leaves",
	"tree:olive_leaves"
	}

minetest.register_abm({
	nodenames = nodenames,
	interval = 223,
	chance = 33,

	action = function(pos, node)
		if minetest.get_node_light(pos, nil) > 12 then
			local branch = string.split(minetest.get_node(pos).name, "_leaves")[1]
			local flowers = branch .. "_flowers"
			minetest.set_node(pos, { name = flowers })
			minetest.get_node_timer(pos):start(random(113, 599))
			--minetest.log("action", branch .. " --> flowers ***")
		end
	end
})

function tree.grow_fruit(pos)
	if minetest.get_node(pos) then
		local n = minetest.get_node(pos).name
		local branch = string.split(n, "_flowers")[1]
		local species = string.split(branch, ":")[2]
		local leaves = branch .. "_leaves"
		minetest.set_node(pos, { name = leaves })
		local below = { x = pos.x, y = pos.y - 1, z = pos.z, }
		if minetest.get_node(below).name == "air" then
			if random(1,9) == 1 then
				local fruit_name = "tree:" .. fruit[species]
				minetest.set_node(below, { name = fruit_name })
				--minetest.log("action", n .. " --> " .. fruit[species])
			end
		end
	end
end

dofile(minetest.get_modpath("tree").."/nodes.lua")

minetest.register_abm {
	nodenames = {"group:leafdecay"},
	chance = 3,
	interval = 97,
	action = function(pos)
		-- get nodedef(pos)
		local noden = string.split(string.split(minetest.get_node(pos).name, ":")[2], "_")[1]
		--minetest.log("action", "Leafdecay: " .. noden)
		local radius = 3
		if tree.lookup[noden] then
			radius = tree.lookup[noden][3]
		end
		-- use def.radius
		if minetest.find_node_near(pos, radius, {"tree:" .. noden .. "_trunk"}) == nil then
			minetest.set_node(pos,{name = "air"})
		end
	end
}

dofile(minetest.get_modpath("tree").."/shapes.lua")
dofile(minetest.get_modpath("tree").."/aliases.lua")
dofile(minetest.get_modpath("tree").."/mapgen.lua")

-- Log message
minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")


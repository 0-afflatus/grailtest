-- Minetest 0.4 mod: stairs
-- See README.txt for licensing and other information.


-- Global namespace for functions

stairs = {}


-- Register aliases for new pine node names

minetest.register_alias("stairs:stair_pinewood", "stairs:stair_pine_wood")
minetest.register_alias("stairs:slab_pinewood", "stairs:slab_pine_wood")


-- Get setting for replace ABM

local replace = minetest.setting_getbool("enable_stairs_replace_abm")


-- Register stairs.
-- Node will be called stairs:stair_<subname>

function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description,
		drawtype = "mesh",
		mesh = "stairs_stair.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y - 1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- for replace ABM
	if replace then
		minetest.register_node(":stairs:stair_" .. subname .. "upside_down", {
			replace_name = "stairs:stair_" .. subname,
			groups = {slabs_replace = 1},
		})
	end

	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 6',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- Flipped recipe for the silly minecrafters
	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 6',
		recipe = {
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end


-- Register slabs.
-- Node will be called stairs:slab_<subname>

function stairs.register_slab(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			-- If it's being placed on an another similar one, replace it with
			-- a full block
			local slabpos = nil
			local slabnode = nil
			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local n0 = minetest.get_node(p0)
			local n1 = minetest.get_node(p1)
			local param2 = 0

			local n0_is_upside_down = (n0.name == "stairs:slab_" .. subname and
					n0.param2 >= 20)

			if n0.name == "stairs:slab_" .. subname and not n0_is_upside_down and
					p0.y + 1 == p1.y then
				slabpos = p0
				slabnode = n0
			elseif n1.name == "stairs:slab_" .. subname then
				slabpos = p1
				slabnode = n1
			end
			if slabpos then
				-- Remove the slab at slabpos
				minetest.remove_node(slabpos)
				-- Make a fake stack of a single item and try to place it
				local fakestack = ItemStack(recipeitem)
				fakestack:set_count(itemstack:get_count())

				pointed_thing.above = slabpos
				local success
				fakestack, success = minetest.item_place(fakestack, placer,
					pointed_thing)
				-- If the item was taken from the fake stack, decrement original
				if success then
					itemstack:set_count(fakestack:get_count())
				-- Else put old node back
				else
					minetest.set_node(slabpos, slabnode)
				end
				return itemstack
			end
			
			-- Upside down slabs
			if p0.y - 1 == p1.y then
				-- Turn into full block if pointing at a existing slab
				if n0_is_upside_down  then
					-- Remove the slab at the position of the slab
					minetest.remove_node(p0)
					-- Make a fake stack of a single item and try to place it
					local fakestack = ItemStack(recipeitem)
					fakestack:set_count(itemstack:get_count())

					pointed_thing.above = p0
					local success
					fakestack, success = minetest.item_place(fakestack, placer,
						pointed_thing)
					-- If the item was taken from the fake stack, decrement original
					if success then
						itemstack:set_count(fakestack:get_count())
					-- Else put old node back
					else
						minetest.set_node(p0, n0)
					end
					return itemstack
				end

				-- Place upside down slab
				param2 = 20
			end

			-- If pointing at the side of a upside down slab
			if n0_is_upside_down and p0.y + 1 ~= p1.y then
				param2 = 20
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- for replace ABM
	if replace then
		minetest.register_node(":stairs:slab_" .. subname .. "upside_down", {
			replace_name = "stairs:slab_".. subname,
			groups = {slabs_replace = 1},
		})
	end

	minetest.register_craft({
		output = 'stairs:slab_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
		},
	})
end


-- Optionally replace old "upside_down" nodes with new param2 versions.
-- Disabled by default.

if replace then
	minetest.register_abm({
		nodenames = {"group:slabs_replace"},
		interval = 8,
		chance = 1,
		action = function(pos, node)
			node.name = minetest.registered_nodes[node.name].replace_name
			node.param2 = node.param2 + 20
			if node.param2 == 21 then
				node.param2 = 23
			elseif node.param2 == 23 then
				node.param2 = 21
			end
			minetest.set_node(pos, node)
		end,
	})
end


-- Stair/slab registration function.
-- Nodes will be called stairs:{stair,slab}_<subname>

function stairs.register_stair_and_slab(subname, recipeitem, groups, images,
		desc_stair, desc_slab, sounds)
	groups["not_in_creative_inventory"] = 1
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
end


-- Register default stairs and slabs

stairs.register_stair_and_slab("wood", "tree:apple_tree_wood",
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		{"tree_apple_tree_wood.png"},
		"Apple Wood Stair",
		"Apple Wood Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("junglewood", "tree:junglewood",
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		{"tree_junglewood.png"},
		"Junglewood Stair",
		"Junglewood Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("pine_wood", "tree:pine_wood",
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		{"tree_fir_wood.png"},
		"Fir Wood Stair",
		"Fir Wood Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("acacia_wood", "tree:acacia_wood",
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		{"tree_acacia_wood.png"},
		"Acacia Wood Stair",
		"Acacia Wood Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("stone", "default:stone",
		{cracky = 3},
		{"default_stone.png"},
		"Stone Stair",
		"Stone Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("cobble", "default:cobble",
		{cracky = 3},
		{"default_cobble.png"},
		"Cobblestone Stair",
		"Cobblestone Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("desert_stone", "default:desert_stone",
		{cracky = 3},
		{"default_desert_stone.png"},
		"Desertstone Stair",
		"Desertstone Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("desert_cobble", "default:desert_cobble",
		{cracky = 3},
		{"default_desert_cobble.png"},
		"Desert Cobblestone Stair",
		"Desert Cobblestone Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("desert_stone_brick", "material:desert_stone_brick",
		{cracky = 3},
		{"material_desert_stone_brick.png"},
		"Desert Stone Brick Stair",
		"Desert Stone Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick", "material:brick",
		{cracky=3},
		{"material_brick.png"},
		"Brick Stair",
		"Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("sandstone", "default:sandstone",
		{crumbly = 2, cracky = 2},
		{"default_sandstone.png"},
		"Sandstone Stair",
		"Sandstone Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("sandstone_brick", "material:sandstone_brick",
		{crumbly = 2, cracky = 2},
		{"material_sandstone_brick.png"},
		"Sandstone Brick Stair",
		"Sandstone Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("obsidian", "mineral:obsidian",
		{cracky = 1, level = 2},
		{"mineral_obsidian.png"},
		"Obsidian Stair",
		"Obsidian Slab",
		default.node_sound_glass_defaults())
stairs.register_stair_and_slab("stone_brick", "material:stone_brick",
		{cracky=2},
		{"material_stone_brick.png"},
		"Stone Brick Stair",
		"Stone Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("steelblock", "mineral:steel_block",
		{cracky = 1, level = 2},
		{"mineral_steel_block.png"},
		"Steel Block Stair",
		"Steel Block Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("copperblock", "mineral:copper_block",
		{cracky = 1, level = 2},
		{"mineral_copper_block.png"},
		"Copper Block Stair",
		"Copper Block Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bronzeblock", "mineral:bronze_block",
		{cracky = 1, level = 2},
		{"mineral_bronze_block.png"},
		"Bronze Block Stair",
		"Bronze Block Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("goldblock", "mineral:gold_block",
		{cracky = 1},
		{"mineral_gold_block.png"},
		"Gold Block Stair",
		"Gold Block Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("basalt_brick", "material:basalt_brick",
		{cracky=1},
		{"material_basalt_brick.png"},
		"Basalt Brick Stair",
		"Basalt Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bluestone_brick", "material:bluestone_brick",
		{cracky=2},
		{"material_bluestone_brick.png"},
		"Bluestone Brick Stair",
		"Bluestone Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("greenstone_brick", "material:greenstone_brick",
		{cracky=1},
		{"material_greenstone_brick.png"},
		"Greenstone Brick Stair",
		"Greenstone Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("whitestone_brick", "material:whitestone_brick",
		{cracky=2},
		{"material_whitestone_brick.png"},
		"White Stone Brick Stair",
		"White Stone Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("basalt", "mineral:basalt",
		{cracky=2},
		{"mineral_basalt.png"},
		"Basalt Stair",
		"Basalt Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bluestone", "mineral:bluestone",
		{cracky=3},
		{"mineral_bluestone.png"},
		"Bluestone Stair",
		"Bluestone Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bluestone_cobble", "mineral:bluestone_cobble",
		{cracky=3},
		{"mineral_bluestone_cobble.png"},
		"Bluestone Cobble Stair",
		"Bluestone Cobble Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("greenstone", "mineral:greenstone",
		{cracky=2},
		{"mineral_greenstone.png"},
		"Greenstone Stair",
		"Greenstone Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("white_stone", "mineral:white_stone",
		{cracky=3},
		{"mineral_white_stone.png"},
		"White Stone Stair",
		"White Stone Slab",
		default.node_sound_stone_defaults())

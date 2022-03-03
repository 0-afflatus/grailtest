-- Nucleus 0.1 --
-- mods/tree/nodes.lua --

-- Load translation support.
local S = minetest.get_translator("tree")

--
-- Trees
--
-- name, desc, has_fruit*, offset, delay, burntime --
-- * not used --
tree.defs = {
    {"acacia", S("Acacia"), 0, 4, 7, 8},
    {"apple", S("Apple"), 1, 2, 4, 6},
    {"ash", S("Ash"), 0, 3, 12, 9},
    {"banana", S("Banana"), 1, 3, 5, 5},
    {"birch", S("Birch"), 0, 2, 5, 6},
    {"beech", S("Beech"), 0, 4, 8, 8},
    {"jungle", S("Jungle"), 0, 3, 10, 9},
    {"oak", S("Oak"), 1, 6, 23, 12},
    {"palm", S("Palm"), 1, 4, 5, 6},
    {"pine", S("Pine"), 1, 2, 7, 6},
    {"willow", S("Willow"), 0, 6, 15, 10},
}

-- name = [1] desc, [2] has_fruit*, [3] offset, [4] delay, [5] burntime --
tree.lookup = {}
for i,v in ipairs(tree.defs) do
    tree.lookup[v[1]] = {v[2],v[3],v[4],v[5],v[6]}
end

for _, row in ipairs(tree.defs) do
    local name = row[1]
    local desc = row[2]
    local offset = row[4]
    local delay = row[5] * 30
    local energy = row[6]
    tree.register_tree(name, desc, offset, delay, energy)
end

-- Fruit nodes --

minetest.register_node("tree:oak_flowers", {
    description = S("Oak flowers"),
    drawtype = "allfaces_optional",
    waving = 1,
    visual_scale = 1.3,
    tiles = { "tree_oak_leaves.png" },
    paramtype = "light",
	is_ground_content = false,
	walkable = false,
	groups = { snappy = 3, leafdecay = 3, flammable = 2, flower = 1 },
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"tree:acorn"},
				rarity = 37,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"tree:oak_leaves"},
			}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
    on_timer = tree.grow_fruit,
	after_place_node = tree.after_place_leaves,
})

minetest.register_node("tree:acorn", {
	description = S("Acorn"),
	drawtype = "plantlike",
	tiles = { "tree_acorn.png" },
	inventory_image = "tree_acorn.png^[transformR180",
	wield_image = "tree_acorn.png^[transformR180",
	visual_scale = 0.5,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
		},
	groups = { choppy = 3, dig_immediate = 3, flammable = 2, leafdecay_drop = 1, attached_node = 1, nut = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("tree:pine_flowers", {
    description = S("Pine flowers"),
    drawtype = "allfaces_optional",
    waving = 1,
    visual_scale = 1.3,
    tiles = { "tree_pine_leaves.png" },
    paramtype = "light",
	is_ground_content = false,
	walkable = false,
	groups = { snappy = 3, leafdecay = 3, flammable = 2, flower = 1 },
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"tree:pine_cone"},
				rarity = 29,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"tree:pine_leaves"},
			}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
    on_timer = tree.grow_fruit,
	after_place_node = tree.after_place_leaves,
})

minetest.register_node("tree:pine_cone", {
	description = S("Pine cone"),
	drawtype = "plantlike",
	tiles = { "tree_pine_cone.png" },
	inventory_image = "tree_pine_cone.png^[transformR180",
	wield_image = "tree_pine_cone.png^[transformR180",
	visual_scale = 0.65,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
		},
	groups = {choppy = 3, dig_immediate = 3, flammable = 2, leafdecay_drop = 1, attached_node = 1, cone = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_craftitem("tree:pine_nuts", {
	description = S("Roasted Pine Nuts"),
	inventory_image = "tree_pine_nuts.png",
	on_use = minetest.item_eat(1),
})


-- Grailtest 5 --
-- mods/flora_pack/tree/nodes.lua --

minetest.register_craft({
	type = "cooking",
	output = "tree:pine_nuts 4",
	recipe = "tree:pine_cone",
})

minetest.register_node("tree:apple_flowers", {
    description = S("Apple flowers"),
    drawtype = "allfaces_optional",
    waving = 1,
    visual_scale = 1.3,
    tiles = { "tree_apple_leaves.png^tree_blossom.png" },
    paramtype = "light",
	is_ground_content = false,
	walkable = false,
	groups = { snappy = 3, leafdecay = 3, flammable = 2, flower = 1 },
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"tree:apple"},
				rarity = 23,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"tree:apple_leaves"},
			}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
    on_timer = tree.grow_fruit,
	after_place_node = tree.after_place_leaves,
})

minetest.register_node("tree:apple", {
	description = S("Apple"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"tree_apple.png"},
	inventory_image = "tree_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = { fleshy = 3, dig_immediate = 3, flammable = 2, leafdecay_drop = 1, attached_node = 1, fruit = 1 },
	on_use = minetest.item_eat(2),
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, { name="tree:apple", param2 = 1 })
		end
	end,
})

minetest.register_node("tree:banana_flowers", {
    description = S("Banana flowers"),
    drawtype = "allfaces_optional",
    waving = 1,
    visual_scale = 1.3,
    tiles = { "tree_banana_leaves.png" },
    paramtype = "light",
	is_ground_content = false,
	walkable = false,
	groups = { snappy = 3, leafdecay = 3, flammable = 2, flower = 1 },
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"tree:banana"},
				rarity = 29,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"tree:banana_leaves"},
			}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
    on_timer = tree.grow_fruit,
	after_place_node = tree.after_place_leaves,
})

minetest.register_node("tree:banana", {
	description = S("Banana"),
	drawtype = "torchlike",
	visual_scale = 1.0,
	tiles = {"tree_banana.png"},
	inventory_image = "tree_banana.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = { fleshy = 3, dig_immediate = 3, flammable = 2, leafdecay_drop = 1, attached_node = 1, fruit = 1 },
	on_use = minetest.item_eat(3),
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="tree:banana", param2=1})
		end
	end,
})

minetest.register_node("tree:palm_flowers", {
    description = S("Palm flowers"),
    drawtype = "allfaces_optional",
    waving = 1,
    visual_scale = 1.3,
    tiles = { "tree_palm_leaves.png" },
    paramtype = "light",
	is_ground_content = false,
	walkable = false,
	groups = { snappy = 3, leafdecay = 3, flammable = 2, flower = 1 },
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"tree:coconut"},
				rarity = 37,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"tree:palm_leaves"},
			}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
    on_timer = tree.grow_fruit,
	after_place_node = tree.after_place_leaves,
})

minetest.register_node("tree:coconut", {
	description = S("Coconut"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"tree_coconut.png"},
	inventory_image = "tree_coconut.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = { choppy = 3, dig_immediate = 3, flammable = 2, leafdecay_drop = 1, attached_node = 1, fruit = 1 },
	sounds = base.node_sound_wood_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="tree:coconut", param2 = 1})
		end
	end,
})


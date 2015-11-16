-- Apple

minetest.register_craft({
	type = "shapeless",
	output = "tree:apple_tree_wood 4",
	recipe = {
		"tree:apple_tree_trunk"
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "tree:apple_tree_sapling",
	burntime = 10,
})

-- Jungle

minetest.register_craft({
	type = "shapeless",
	output = "tree:junglewood 4",
	recipe = {
		"tree:jungletree"
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "tree:junglesapling",
	burntime = 10,
})

-- Pine

minetest.register_craft({
	type = "shapeless",
	output = "tree:pine_wood 4",
	recipe = {
		"tree:pine_tree"
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "tree:pine_sapling",
	burntime = 7,
})

-- Acacia

minetest.register_craft({
	type = "shapeless",
	output = "tree:acacia_wood 4",
	recipe = {
		"tree:acacia_tree"
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "tree:acacia_sapling",
	burntime = 10,
})

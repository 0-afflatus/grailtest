--
-- Additional dye recipes for things that are not flowers
--

minetest.register_craft({
	type = "shapeless",
	output = "dye:pink 4",
	recipe = {"plant:cactus"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:green 4",
	recipe = {"tree:oak_trunk","mineral:copper_lump"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:green 2",
	recipe = {"dye:yellow","mineral:copper_lump"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:green 2",
	recipe = {"dye:yellow","mineral:iron_lump"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:brown 4",
	recipe = {"tree:oak_trunk","mineral:iron_lump"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:black 4",
	recipe = {"tree:acorn","mineral:iron_lump"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:grey 4",
	recipe = {"tree:acorn"},
})

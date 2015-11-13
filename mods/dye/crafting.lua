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
	recipe = {"moretrees:oak_trunk","mineral:copper_lump"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:green 2",
	recipe = {"dye:yellow","mineral:copper_lump"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:dark_green 2",
	recipe = {"dye:yellow","mineral:iron_lump"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:brown 4",
	recipe = {"moretrees:oak_trunk","mineral:iron_lump"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:black 4",
	recipe = {"moretrees:acorn","mineral:iron_lump"},
})

minetest.register_craft({
	type = "shapeless",
	output = "dye:dark_grey 4",
	recipe = {"moretrees:acorn"},
})

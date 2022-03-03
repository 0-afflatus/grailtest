-- Grailtest 5 --
-- mods/element/crafting.lua

-- Default crafts --

minetest.register_craft({
	output = 'element:sandstone',
	recipe = {
		{'group:sand', 'group:sand'},
		{'group:sand', 'group:sand'},
	}
})

minetest.register_craft({
	output = 'element:sand 4',
	recipe = {
		{'element:sandstone'},
	}
})

minetest.register_craft({
	output = 'element:snowblock',
	recipe = {
		{'element:snow', 'element:snow', 'element:snow'},
		{'element:snow', 'element:snow', 'element:snow'},
		{'element:snow', 'element:snow', 'element:snow'},
	}
})

minetest.register_craft({
	output = 'element:snow 9',
	recipe = {
		{'element:snowblock'},
	}
})

--
-- Crafting (tool repair)
--
minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})

--
-- Cooking recipes
--

minetest.register_craft({
	type = "cooking",
	output = "element:stone",
	recipe = "element:cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "element:desert_stone",
	recipe = "element:desert_cobble",
})

--
-- Fuels
--

minetest.register_craft({
	type = "fuel",
	recipe = "group:tree",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:leaves",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "element:lava_source",
	burntime = 60,
})

-- Craft items

minetest.register_craftitem("equipment:book", {
	description = "Book",
	inventory_image = "equipment_book.png",
})

-- Recipes
minetest.register_craft({
	output = 'equipment:book',
	recipe = {
		{'material:paper'},
		{'material:paper'},
		{'material:paper'},
	}
})

minetest.register_craft({
	output = 'equipment:bookshelf',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'equipment:book', 'equipment:book', 'equipment:book'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'equipment:chest',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', '', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'equipment:chest_locked',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'mineral:steel_ingot', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'equipment:fence_wood 2',
	recipe = {
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'equipment:furnace',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'group:stone', '', 'group:stone'},
		{'group:stone', 'group:stone', 'group:stone'},
	}
})

minetest.register_craft({
	output = 'equipment:cauldron',
	recipe = {
		{'group:metal', '', 'group:metal'},
		{'group:metal', '', 'group:metal'},
		{'group:metal', 'group:metal', 'group:metal'},
	}
})

minetest.register_craft({
	output = 'equipment:ladder 3',
	recipe = {
		{'group:stick', '', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', '', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'equipment:sign_wall 4',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'equipment:torch 4',
	recipe = {
		{'mineral:coal_lump'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = "equipment:lantern 6",
	recipe = {
		{"material:glass","material:glass","material:glass"},
		{"material:glass","equipment:torch","material:glass"},
		{"material:glass","material:glass","material:glass"},
	}
})

minetest.register_craft({
	output = 'equipment:panel_wood 16',
	recipe = {
		{'group:wood', 'group:wood', },
		{'group:wood', 'group:wood', },
	}
})

-- Fuels

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:bookshelf",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:fence_wood",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:ladder",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:torch",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:sign_wall",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:chest",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:chest_locked",
	burntime = 30,
})

-- Default nodes for Itemshelf mod
-- By Zorman2000

local default_shelf = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
		{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.4375}, -- NodeBox2
		{-0.4375, -0.5, -0.5, 0.4375, -0.4375, 0.4375}, -- NodeBox3
		{0.4375, -0.5, -0.5, 0.5, 0.5, 0.4375}, -- NodeBox4
		{-0.4375, 0.4375, -0.5, 0.4375, 0.5, 0.4375}, -- NodeBox5
		{-0.4375, -0.0625, -0.5, 0.4375, 0.0625, 0.4375}, -- NodeBox6
	}
}

local default_half_shelf = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
		{-0.5, -0.5, -0.125, -0.4375, 0.5, 0.5}, -- NodeBox2
		{0.4375, -0.5, -0.125, 0.5, 0.5, 0.5}, -- NodeBox3
		{-0.5, -0.0625, -0.125, 0.5, 0.0625, 0.5}, -- NodeBox4
		{-0.5, 0.4375, -0.125, 0.5, 0.5, 0.5}, -- NodeBox5
		{-0.5, -0.5, -0.125, 0.5, -0.4375, 0.5}, -- NodeBox6
	}
}

local default_half_shelf_open = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.125, -0.4375, 0.5, 0.5}, -- NodeBox2
		{0.4375, -0.5, -0.125, 0.5, 0.5, 0.5}, -- NodeBox3
		{-0.5, -0.0625, -0.125, 0.5, 0.0625, 0.5}, -- NodeBox4
		{-0.5, 0.4375, -0.125, 0.5, 0.5, 0.5}, -- NodeBox5
		{-0.5, -0.5, -0.125, 0.5, -0.4375, 0.5}, -- NodeBox6
	}
}

itemshelf.register_shelf("shelf", {
	description = "Shelf (4)",
	textures = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	nodebox = default_shelf,
	capacity = 4,
	shown_items = 4
})

itemshelf.register_shelf("glass_shelf", {
	description = "Glass display case (4)",
	textures = {
		"material_glass.png",
		"material_glass.png",
		"material_glass.png",
		"material_glass.png",
		"material_glass.png",
		"material_glass.png"
	},
	nodebox = {0.5,0.5,0.5,-0.6,-0.5,-0.5},
	capacity = 4,
	shown_items = 4
})

--[[
itemshelf.register_shelf("large_shelf", {
	description = "Shelf (6)",
	textures = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	nodebox = default_shelf,
	capacity = 6,
	shown_items = 6
})
]]
itemshelf.register_shelf("half_shelf", {
	description = "Half Shelf (4)",
	textures = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	nodebox = default_half_shelf,
	capacity = 4,
	shown_items = 4,
	half_depth = true,
})
--[[
itemshelf.register_shelf("half_depth_shelf_large", {
	description = "Half Shelf (6)",
	textures = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	nodebox = default_half_shelf,
	capacity = 6,
	shown_items = 6,
	half_depth = true,
})
]]
itemshelf.register_shelf("open_half_shelf", {
	description = "Half Open-Back Shelf (4)",
	textures = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	nodebox = default_half_shelf_open,
	capacity = 4,
	shown_items = 4,
	half_depth = true,
})
--[[
itemshelf.register_shelf("half_depth_open_shelf", {
	description = "Half Open-Back Shelf (6)",
	textures = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	nodebox = default_half_shelf_open,
	capacity = 6,
	shown_items = 6,
	half_depth = true,
})
]]

minetest.register_craft({
	output = "itemshelf:shelf",
	recipe = {
		{ "group:stick", "group:wood", "group:stick", },
		{ "group:stick", "group:wood", "group:stick", },
		{ "group:stick", "group:wood", "group:stick" }
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "itemshelf:shelf",
	burntime = 30,
})

minetest.register_craft({
	output = "itemshelf:half_shelf",
	recipe = {
		{ "group:stick", "group:wood", "group:stick", },
		{ "group:stick", "", "group:stick", },
		{ "group:stick", "group:wood", "group:stick" }
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "itemshelf:half_shelf",
	burntime = 15,
})

minetest.register_craft({
	output = "itemshelf:open_half_shelf",
	recipe = {
		{ "group:stick", "group:wood" },
		{ "group:stick", "" },
		{ "group:stick", "group:wood" }
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "itemshelf:open_half_shelf",
	burntime = 15,
})

minetest.register_craft({
	output = "itemshelf:glass_shelf",
	recipe = {
		{ "group:stick", "group:glass", "group:stick", },
		{ "group:stick", "group:glass", "group:stick", },
		{ "group:stick", "group:glass", "group:stick" }
	}
})


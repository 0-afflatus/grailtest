-- Grailtest 5 --
-- mods/materials_pack/carpet/init.lua

local wool = {}
-- This uses a trick: you can first define the recipes using all of the base
-- colors, and then some recipes using more specific colors for a few non-base
-- colors available. When crafting, the last recipes will be checked first.
wool.dyes = {
	{"white",      "White",      nil},
	{"grey",       "Grey",       "basecolor_grey"},
	{"black",      "Black",      "basecolor_black"},
	{"red",        "Red",        "basecolor_red"},
	{"yellow",     "Yellow",     "basecolor_yellow"},
	{"green",      "Green",      "basecolor_green"},
	{"cyan",       "Cyan",       "basecolor_cyan"},
	{"blue",       "Blue",       "basecolor_blue"},
	{"magenta",    "Magenta",    "basecolor_magenta"},
	{"orange",     "Orange",     "excolor_orange"},
	{"violet",     "Violet",     "excolor_violet"},
	{"brown",      "Brown",      "unicolor_dark_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
	{"dark_grey",  "Dark Grey",  "unicolor_darkgrey"},
	{"dark_green", "Dark Green", "unicolor_dark_green"},
}

for _, row in ipairs(wool.dyes) do
	local name = row[1]
	local desc = row[2]
	--local craft_color_group = row[3]

	-- Node Definition
	minetest.register_node("carpet:"..name, {
		description = desc.." Carpet",
		tiles = {"wool_"..name..".png"},
		inventory_image = "wool_"..name..".png",
		wield_image = "wool_"..name..".png",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5,  0.5, -0.5+2/32, 0.5},
			},
		},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		walkable = false,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
		sounds = base.node_sound_defaults(),
	})

	-- Crafting
	minetest.register_craft({
		type = "shapeless",
		output = "carpet:"..name.." 8",
		recipe = {"wool:"..name},
	})
end

minetest.register_node("carpet:rug1", {
	description = "Rug",
	tiles = {"carpet_rug1.png"},
	inventory_image = "carpet_rug1.png",
	wield_image = "carpet_rug1.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/32, 0.5},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	sounds = base.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "carpet:rug1 4",
	recipe = {"wool:red", "wool:blue"},
})

minetest.register_node("carpet:rug2", {
	description = "Rug",
	tiles = {"carpet_rug2.png"},
	inventory_image = "carpet_rug2.png",
	wield_image = "carpet_rug2.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/32, 0.5},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	sounds = base.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "carpet:rug2 4",
	recipe = {"wool:white", "wool:orange"},
})

minetest.register_node("carpet:rug3", {
	description = "Rug",
	tiles = {"carpet_rug3.png"},
	inventory_image = "carpet_rug3.png",
	wield_image = "carpet_rug3.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/32, 0.5},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	sounds = base.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "carpet:rug3 4",
	recipe = {"wool:red", "wool:yellow"},
})

minetest.register_node("carpet:rug4", {
	description = "Rug",
	tiles = {"carpet_rug4.png"},
	inventory_image = "carpet_rug4.png",
	wield_image = "carpet_rug4.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/32, 0.5},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	sounds = base.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "carpet:rug4 4",
	recipe = {"wool:brown", "wool:white"},
})

minetest.register_node("carpet:rug5", {
	description = "Rug",
	tiles = {"carpet_rug5.png"},
	inventory_image = "carpet_rug5.png",
	wield_image = "carpet_rug5.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/32, 0.5},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	sounds = base.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "carpet:rug5 4",
	recipe = {"wool:yellow", "wool:blue"},
})

minetest.register_node("carpet:rug6", {
	description = "Rug",
	tiles = {"carpet_rug6.png"},
	inventory_image = "carpet_rug6.png",
	wield_image = "carpet_rug6.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/32, 0.5},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	sounds = base.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "carpet:rug6 4",
	recipe = {"wool:white", "wool:blue"},
})

minetest.register_node("carpet:rug7", {
	description = "Rug",
	tiles = {"carpet_rug7.png"},
	inventory_image = "carpet_rug7.png",
	wield_image = "carpet_rug7.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/32, 0.5},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	sounds = base.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "carpet:rug7 4",
	recipe = {"wool:brown", "wool:green"},
})

minetest.register_node("carpet:rug8", {
	description = "Rug",
	tiles = {"carpet_rug8.png"},
	inventory_image = "carpet_rug8.png",
	wield_image = "carpet_rug8.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/32, 0.5},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	sounds = base.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "carpet:rug8 4",
	recipe = {"wool:cyan", "wool:yellow"},
})

minetest.register_node("carpet:rug9", {
	description = "Rug",
	tiles = {"carpet_rug9.png"},
	inventory_image = "carpet_rug9.png",
	wield_image = "carpet_rug9.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/32, 0.5},
		},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	sounds = base.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "carpet:rug9 4",
	recipe = {"wool:red", "wool:white"},
})

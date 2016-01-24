--
-- Node definitions
--

-- Wooden planks
-- are in trees and moretrees
--[[

minetest.register_node("material:wood", {
	description = "Wooden Planks",
	tiles = {"material_wood.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("material:junglewood", {
	description = "Junglewood Planks",
	tiles = {"material_junglewood.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
]]

-- Brick

minetest.register_node("material:brick", {
	description = "Brick",
	tiles = {"material_brick.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:stone_brick", {
	description = "Stone Brick",
	tiles = {"material_stone_brick.png"},
	paramtype2 = "facedir",
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:desert_stone_brick", {
	description = "Desert Stone Brick",
	tiles = {"material_desert_stone_brick.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:sandstone_brick", {
	description = "Sandstone Brick",
	tiles = {"material_sandstone_brick.png"},
	is_ground_content = true,
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:adobe_brick", {
	description = "Adobe Brick",
	tiles = {"material_adobe.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:basalt_brick", {
	description = "Basalt Brick",
	tiles = {"material_basalt_brick.png"},
	paramtype2 = "facedir",
	groups = {cracky=1, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:bluestone_brick", {
	description = "Bluestone Brick",
	tiles = {"material_bluestone_brick.png"},
	paramtype2 = "facedir",
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:greenstone_brick", {
	description = "Greenstone Brick",
	tiles = {"material_greenstone_brick.png"},
	paramtype2 = "facedir",
	groups = {cracky=1, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:whitestone_brick", {
	description = "Whitestone Brick",
	tiles = {"material_whitestone_brick.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

-- Shingles

minetest.register_node("material:shingles_clay", {
	description = "Roof Tiles",
	tiles = {"material_clay_tiles.png"},
	paramtype2 = "facedir",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:shingles_wood", {
	description = "Wooden Shingles",
	tiles = {"material_shingles_wood.png"},
	paramtype2 = "facedir",
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:shingles_slate", {
	description = "Roof Slates",
	tiles = {"material_slate.png"},
	paramtype2 = "facedir",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

-- Tiles

minetest.register_node("material:wood_tile", {
	description = "Wood Tile",
	tiles = {"material_wood_tile.png"},
	groups = {choppy = 1, wood = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("material:stone_tile", {
	description = "Stone Tile",
	tiles = {"material_stone_tile.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:stone_tile_split", {
	description = "Split Stone Tile",
	tiles = {"material_stone_tile_split_top.png",
		"material_stone_tile_split.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:stone_chequer", {
	description = "Stone Chequer",
	tiles = {"material_stone_chequer.png"},
	paramtype2 = "facedir",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:white_stone_tile", {
	description = "White Stone Tile",
	tiles = {"material_white_stone_tile.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:white_stone_tile_split", {
	description = "Split White Stone Tile",
	tiles = {"material_white_stone_tile_split_top.png",
		"material_stone_tile_split.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:green_stone_tile", {
	description = "Greenstone Tile",
	tiles = {"material_green_stone_tile.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:green_stone_tile_split", {
	description = "Split Greenstone Tile",
	tiles = {"material_green_stone_tile_split_top.png",
		"material_green_stone_tile_split.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:green_stone_chequer", {
	description = "Greenstone Chequer",
	tiles = {"material_green_stone_chequer.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:blue_stone_tile", {
	description = "Bluestone Tile",
	tiles = {"material_blue_stone_tile.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:blue_stone_tile_split", {
	description = "Split Bluestone Tile",
	tiles = {"material_blue_stone_tile_split_top.png",
		"material_blue_stone_tile_split.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:blue_stone_chequer", {
	description = "Bluestone Chequer",
	tiles = {"material_blue_stone_chequer.png"},
	paramtype2 = "facedir",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:basalt_tile", {
	description = "Basalt Tile",
	tiles = {"material_basalt_tile.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:basalt_tile_split", {
	description = "Split Basalt Tile",
	tiles = {"material_basalt_tile_split_top.png",
		"material_basalt_tile_split.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:basalt_chequer", {
	description = "Basalt Chequer",
	tiles = {"material_basalt_chequer.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:red_stone_tile", {
	description = "Red stone Tile",
	tiles = {"material_red_stone_tile.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:red_stone_tile_split", {
	description = "Split red stone Tile",
	tiles = {"material_red_stone_tile_split_top.png",
		"material_red_stone_tile_split.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:red_stone_chequer", {
	description = "Red stone Chequer",
	tiles = {"material_red_stone_chequer.png"},
	paramtype2 = "facedir",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("material:stone_rune", {
	description = "Stone Rune",
	tiles = {"material_stone_rune.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})


-- Glass

minetest.register_node("material:glass", {
	description = "Glass",
	drawtype = "glasslike",
	tiles = {"material_glass.png"},
	inventory_image = minetest.inventorycube("material_glass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("material:glass_obsidian", {
	description = "Obsidian Glass",
	drawtype = "glasslike",
	tiles = {"material_glass_obsidian.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})

minetest.register_node("material:glass_white", {
	description = "White Stained Glass",
	drawtype = "glasslike",
	tiles = {"material_glass_white.png"},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = 2,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("material:glass_blue", {
	description = "Blue Stained Glass",
	drawtype = "glasslike",
	tiles = {"material_glass_blue.png"},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = 2,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("material:glass_cyan", {
	description = "Cyan Stained Glass",
	drawtype = "glasslike",
	tiles = {"material_glass_cyan.png"},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = 2,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("material:glass_green", {
	description = "Green Stained Glass",
	drawtype = "glasslike",
	tiles = {"material_glass_green.png"},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = 2,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("material:glass_yellow", {
	description = "Yellow Stained Glass",
	drawtype = "glasslike",
	tiles = {"material_glass_yellow.png"},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = 2,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("material:glass_red", {
	description = "Red Stained Glass",
	drawtype = "glasslike",
	tiles = {"material_glass_red.png"},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = 2,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

-- Straw (Cob actually)

minetest.register_node("material:cob", {
    description = "Cob Block",
    tiles = {"material_cob.png"},
	walkable = true,
	groups = {crumbly=2},
	sounds = default.node_sound_dirt_defaults()     
})

-- Fabric

material = {}

-- This uses a trick: you can first define the recipes using all of the base
-- colors, and then some recipes using more specific colors for a few non-base
-- colors available. When crafting, the last recipes will be checked first.
material.dyes = {
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

dofile(minetest.get_modpath("material").."/reed.lua")
dofile(minetest.get_modpath("material").."/bones.lua")
dofile(minetest.get_modpath("material").."/stairs.lua")
dofile(minetest.get_modpath("material").."/xwall.lua")
dofile(minetest.get_modpath("material").."/crafting.lua")
dofile(minetest.get_modpath("material").."/aliases.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

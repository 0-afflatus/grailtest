-- Grailtest 5 --
-- mods/element/mapgen.lua --

--
-- Register biomes
--

function element.register_biomes()

	minetest.register_biome({
		name = "polar",
		node_dust = "element:snow",
		node_top = "element:snowblock",
		depth_top = 1,
		node_filler = "",
		depth_filler = 1,
		node_water_top = "element:ice",
		depth_water_top = 1,
		node_river_water = "element:ice",
		node_riverbed = "element:gravel",
		depth_riverbed = 2,
		node_dungeon = "element:ice",
		y_min = 1,
		y_max = 31000,
		heat_point = -5,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "polar_ocean",
		node_dust = "element:snow",
		node_top = "element:sand",
		depth_top = 1,
		node_filler = "element:gravel",
		depth_filler = 1,
		node_water_top = "element:ice",
		depth_water_top = 10,
		node_cave_liquid = "element:water_source",
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 1,
		y_min = -255,
		y_max = 0,
		heat_point = -6,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "ice_caves",
		node_cave_liquid = {"element:water_source"},
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 3,
		humidity_point = 48,
	})

	minetest.register_biome({
		name = "tundra",
		node_top = "element:dirt_with_ice",
		depth_top = 1,
		node_filler = "element:permafrost",
		depth_filler = 2,
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 3,
		y_min = 2,
		y_max = 85,
		heat_point = 7,
		humidity_point = 13,
	})

	minetest.register_biome({
		name = "tundra_ocean",
		node_top = "element:gravel",
		depth_top = 1,
		node_riverbed = "element:gravel",
		depth_riverbed = 2,
		node_cave_liquid = "element:water_source",
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 1,
		y_min = -255,
		y_max = 1,
		heat_point = 7,
		humidity_point = 10,
	})

	minetest.register_biome({
		name = "crystal_caves",
		node_cave_liquid = {"element:water_source"},
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 20,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "taiga",
		node_dust = "element:snow",
		node_top = "element:dirt_with_snow",
		depth_top = 1,
		node_filler = "element:dirt_yellow",
		depth_filler = 3,
		node_water_top = "element:ice",
		depth_water_top = 5,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 3,
		y_min = 2,
		y_max = 85,
		heat_point = 7,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "taiga_ocean",
		node_dust = "element:snow",
		node_top = "element:sand",
		depth_top = 2,
		node_filler = "element:gravel",
		depth_filler = 1,
		node_water_top = "element:ice",
		depth_water_top = 4,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_cave_liquid = "element:water_source",
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 2,
		y_min = -255,
		y_max = 1,
		heat_point = 7,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "moss_caves",
		node_cave_liquid = {"element:water_source"},
		node_dungeon = "element:mossycobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 20,
		humidity_point = 80,
	})

	minetest.register_biome({
		name = "grassland",
		node_top = "element:dirt_with_grass",
		depth_top = 1,
		node_filler = "element:dirt",
		depth_filler = 2,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 5,
		y_min = 2,
		y_max = 75,
		heat_point = 37,
		humidity_point = 32,
	})

	minetest.register_biome({
		name = "grassland_ocean",
		node_top = "element:sand",
		depth_top = 2,
		node_filler = "element:gravel",
		depth_filler = 1,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_cave_liquid = "element:water_source",
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 2,
		y_min = -255,
		y_max = 1,
		heat_point = 37,
		humidity_point = 32,
	})

	minetest.register_biome({
		name = "cool_caves",
		node_cave_liquid = {"element:lava_source"},
		node_dungeon = "element:cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 36,
		humidity_point = 32,
	})

	minetest.register_biome({
		name = "woodland",
		node_top = "element:dirt_with_grass",
		depth_top = 1,
		node_filler = "element:dirt",
		depth_filler = 3,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 5,
		y_min = 2,
		y_max = 95,
		heat_point = 45,
		humidity_point = 60,
	})

	minetest.register_biome({
		name = "woodland_swamp",
		node_top = "element:sand",
		depth_top = 2,
		node_filler = "element:dirt",
		depth_filler = 2,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 1,
		y_min = -3,
		y_max = 1,
		heat_point = 45,
		humidity_point = 60,
	})

	minetest.register_biome({
		name = "woodland_ocean",
		node_top = "element:sand",
		depth_top = 1,
		node_filler = "element:gravel",
		depth_filler = 1,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_cave_liquid = "element:water_source",
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 2,
		y_min = -112,
		y_max = -4,
		heat_point = 45,
		humidity_point = 60,
	})

    minetest.register_biome({
		name = "forest_caves",
		node_cave_liquid = {"element:water_source", "element:lava_source"},
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 52,
		humidity_point = 64,
	})

	minetest.register_biome({
		name = "mediterranean",
		node_top = "element:dirt_with_grass_light",
		depth_top = 1,
		node_filler = "element:dirt_light",
		depth_filler = 2,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 3,
		y_min = 3,
		y_max = 60,
		heat_point = 55,
		humidity_point = 23,
	})

	minetest.register_biome({
		name = "mediterranean_ocean",
		node_top = "element:sand",
		depth_top = 2,
		node_filler = "element:gravel",
		depth_filler = 1,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_cave_liquid = "element:water_source",
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 1,
		y_min = -112,
		y_max = 2,
		heat_point = 55,
		humidity_point = 23,
	})

    minetest.register_biome({
		name = "mushroom_caves",
		node_cave_liquid = {"element:water_source", "element:lava_source"},
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 68,
		humidity_point = 96,
	})

	minetest.register_biome({
		name = "chapparal",
		node_top = "element:dirt_with_grass_light",
		depth_top = 1,
		node_filler = "element:dirt_light",
		depth_filler = 3,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 3,
		y_min = 2,
		y_max = 70,
		heat_point = 65,
		humidity_point = 55,
	})

	minetest.register_biome({
		name = "steppe",
		node_top = "element:dirt_with_dry_grass",
		depth_top = 1,
		node_filler = "element:dirt_red",
		depth_filler = 1,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 5,
		y_min = 3,
		y_max = 70,
		heat_point = 80,
		humidity_point = 10,
	})

	minetest.register_biome({
		name = "steppe_ocean",
		node_top = "element:sand",
		depth_top = 2,
		node_filler = "element:gravel",
		depth_filler = 1,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_cave_liquid = "element:water_source",
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 1,
		y_min = -112,
		y_max = 1,
		heat_point = 80,
		humidity_point = 10,
	})

	minetest.register_biome({
		name = "warm_caves",
		node_cave_liquid = {"element:water_source", "element:lava_source"},
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 68,
		humidity_point = 16,
	})

	minetest.register_biome({
		name = "savanna",
		node_top = "element:dirt_with_dry_grass",
		depth_top = 1,
		node_filler = "element:dirt_red",
		depth_filler = 2,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 3,
		y_min = 2,
		y_max = 65,
		heat_point = 90,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "savanna_swamp",
		node_top = "element:mud",
		depth_top = 1,
		node_filler = "element:dirt_red",
		depth_filler = 2,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 1,
		y_min = 0,
		y_max = 2,
		heat_point = 90,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "savanna_ocean",
		node_top = "element:sand",
		depth_top = 1,
		node_filler = "element:sand",
		depth_filler = 2,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_cave_liquid = "element:water_source",
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 2,
		y_min = -112,
		y_max = -1,
		heat_point = 90,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "fossil_caves",
		node_cave_liquid = {"element:water_source", "element:lava_source"},
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 84,
		humidity_point = 48,
	})

	minetest.register_biome({
		name = "desert",
		node_top = "element:desert_sand",
		depth_top = 1,
		node_filler = "element:dirt_baked",
		depth_filler = 1,
		node_stone = "element:desert_stone",
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:desert_stone",
		node_dungeon_alt = "element:sandstone",
		vertical_blend = 5,
		y_min = 3,
		y_max = 65,
		heat_point = 100,
		humidity_point = 1,
	})

	minetest.register_biome({
		name = "desert_ocean",
		node_top = "element:sand",
		depth_top = 1,
		node_filler = "element:sand",
		depth_filler = 2,
		node_stone = "element:desert_stone",
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_cave_liquid = "element:water_source",
		node_dungeon = "element:desert_stone",
		node_dungeon_alt = "element:sandstone",
		vertical_blend = 2,
		y_min = -112,
		y_max = 1,
		heat_point = 100,
		humidity_point = 1,
	})

	minetest.register_biome({
		name = "fire_caves",
		node_cave_liquid = {"element:lava_source"},
		node_dungeon = "element:desert_stone",
		node_dungeon_alt = "element:sandstone",
		y_max = -256,
		y_min = -31000,
		heat_point = 100,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "rainforest",
		node_top = "element:dirt_with_grass_jungle",
		depth_top = 1,
		node_filler = "element:dirt_jungle",
		depth_filler = 3,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 5,
		y_min = 1,
		y_max = 50,
		heat_point = 99,
		humidity_point = 80,
	})

	minetest.register_biome({
		name = "rainforest_swamp",
		node_top = "element:dirt_jungle",
		depth_top = 1,
		node_filler = "element:dirt_jungle",
		depth_filler = 2,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_dungeon = "element:mossycobble",
		vertical_blend = 1,
		y_min = -1,
		y_max = 1,
		heat_point = 99,
		humidity_point = 85,
	})

	minetest.register_biome({
		name = "tropical_ocean",
		node_top = "element:sand",
		depth_top = 2,
		node_filler = "element:sand",
		depth_filler = 1,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		node_cave_liquid = "element:water_source",
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		vertical_blend = 1,
		y_min = -112,
		y_max = 2,
		heat_point = 65,
		humidity_point = 85,
	})

	minetest.register_biome({
		name = "jungle_caves",
		node_cave_liquid = {"element:water_source", "element:lava_source"},
		node_dungeon = "element:cobble",
		node_dungeon_alt = "element:mossycobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 100,
		humidity_point = 80,
	})

	minetest.register_biome({
		name           = "alpine",
		node_top       = "element:dirt_with_snow",
		depth_top      = 1,
		node_filler    = "element:dirt_yellow",
		depth_filler   = 2,
		node_water_top = "element:water_source",
		depth_water_top = 5,
		node_riverbed = "element:sand",
		depth_riverbed = 1,
		vertical_blend = 5,
		y_min     = 70,
		y_max     = 127,
		heat_point     = 23.0,
		humidity_point = 77.0,
	})

	minetest.register_biome({
		name           = "mountain",
		node_dust = "element:snow",
		node_top       = "",
		depth_top      = 1,
		node_filler    = "",
		depth_filler   = 2,
		node_water_top = "element:ice",
		depth_water_top = 1,
		node_river_water = "element:ice",
		node_riverbed = "element:gravel",
		depth_riverbed = 1,
		y_min     = 100,
		y_max     = 31000,
		heat_point     = 50.0,
		humidity_point = 50.0,
	})

	minetest.register_biome({
		name = "sandy_shore",
		node_top = "element:sand",
		depth_top = 1,
		node_filler = "element:sand",
		depth_filler = 2,
		node_riverbed = "element:sand",
		depth_riverbed = 2,
		vertical_blend = 2,
		y_min = -5,
		y_max = 2,
		heat_point = 65,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "rocky_shore",
		node_top = "element:gravel",
		depth_top = 1,
		node_filler = "",
		depth_filler = 2,
		node_riverbed = "element:gravel",
		depth_riverbed = 2,
		vertical_blend = 2,
		y_min = -3,
		y_max = 1,
		heat_point = 13,
		humidity_point = 75,
	})

end

minetest.clear_registered_biomes()
minetest.clear_registered_decorations()
element.register_biomes()


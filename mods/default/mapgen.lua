--
-- Register biomes
--

mapgen = {}

function mapgen.register_biomes()

	minetest.register_biome({
		name = "polar",
		node_dust = "default:snow",
		node_top = "default:ice",
		depth_top = 1,
		node_filler = "",
		depth_filler = 1,
		--node_stone = "",
		node_water_top = "default:ice",
		depth_water_top = 1,
		--node_water = "",
		y_min = 1,
		y_max = 31000,
		heat_point = -5,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "polar_ocean",
		node_dust = "default:snow",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = 2,
		--node_water = "",
		y_min = -112,
		y_max = 0,
		heat_point = -5,
		humidity_point = 45,
	})
	
	minetest.register_biome({
		name = "tundra",
		--node_dust = "",
		node_top = "default:dirt_with_ice",
		depth_top = 1,
		node_filler = "default:permafrost",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "default:ice",
		--depth_water_top = 3,
		--node_water = "",
		y_min = 2,
		y_max = 77,
		heat_point = 12,
		humidity_point = 23,
	})

	minetest.register_biome({
		name = "tundra_ocean",
		--node_dust = "",
		node_top = "default:gravel",
		depth_top = 1,
		--node_filler = "",
		--depth_filler = 1,
		--node_stone = "",
		--node_water_top = "default:ice",
		--depth_water_top = 2,
		--node_water = "",
		y_min = -112,
		y_max = 1,
		heat_point = 10,
		humidity_point = 20,
	})
	
	minetest.register_biome({
		name = "taiga",
		node_dust = "default:snow",
		node_top = "default:dirt_with_snow",
		depth_top = 1,
		node_filler = "default:dirt_yellow",
		depth_filler = 3,
		--node_stone = "",
		node_water_top = "default:ice",
		depth_water_top = 5,
		--node_water = "",
		y_min = 2,
		y_max = 87,
		heat_point = 10,
		humidity_point = 80,
	})

	minetest.register_biome({
		name = "taiga_ocean",
		node_dust = "default:snow",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 1,
		--node_stone = "",
		node_water_top = "default:ice",
		depth_water_top = 4,
		--node_water = "",
		y_min = -112,
		y_max = 1,
		heat_point = 10,
		humidity_point = 80,
	})
	
	minetest.register_biome({
		name = "steppe",
		--node_dust = "",
		node_top = "default:dirt_with_dry_grass",
		depth_top = 1,
		node_filler = "default:dirt_red",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = 3,
		y_max = 77,
		heat_point = 65,
		humidity_point = 1,
	})

	minetest.register_biome({
		name = "steppe_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -112,
		y_max = 1,
		heat_point = 65,
		humidity_point = 1,
	})
	
	minetest.register_biome({
		name = "grassland",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = 2,
		y_max = 85,
		heat_point = 55,
		humidity_point = 37,
	})

	minetest.register_biome({
		name = "grassland_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -112,
		y_max = 1,
		heat_point = 55,
		humidity_point = 37,
	})
	
	minetest.register_biome({
		name = "woodland",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = 2,
		y_max = 95,
		heat_point = 55,
		humidity_point = 79,
	})
	
	minetest.register_biome({
		name = "woodland_swamp",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3,
		y_max = 1,
		heat_point = 60,
		humidity_point = 85,
	})

	minetest.register_biome({
		name = "woodland_ocean",
		--node_dust = "",
		node_top = "default:gravel",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -112,
		y_max = -4,
		heat_point = 55,
		humidity_point = 85,
	})
	
	minetest.register_biome({
		name = "desert",
		--node_dust = "",
		node_top = "default:desert_sand",
		depth_top = 1,
		node_filler = "default:desert_sand",
		depth_filler = 1,
		node_stone = "default:desert_stone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = 3,
		y_max = 55,
		heat_point = 101,
		humidity_point = 1,
	})

	minetest.register_biome({
		name = "desert_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -112,
		y_max = 1,
		heat_point = 101,
		humidity_point = 1,
	})
	
	minetest.register_biome({
		name = "savanna",
		--node_dust = "",
		node_top = "default:dirt_with_dry_grass",
		depth_top = 1,
		node_filler = "default:dirt_red",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = 2,
		y_max = 65,
		heat_point = 95,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "savanna_swamp",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3,
		y_max = 1,
		heat_point = 95,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "savanna_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -112,
		y_max = -4,
		heat_point = 95,
		humidity_point = 45,
	})
	
	minetest.register_biome({
		name = "rainforest",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = 2,
		y_max = 75,
		heat_point = 101,
		humidity_point = 85,
	})

	minetest.register_biome({
		name = "rainforest_swamp",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -1,
		y_max = 1,
		heat_point = 101,
		humidity_point = 90,
	})

	minetest.register_biome({
		name = "tropical_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -112,
		y_max = -2,
		heat_point = 100,
		humidity_point = 85,
	})
	
	minetest.register_biome({
		name           = "alpine",
		node_top       = "default:dirt_with_snow",	
		depth_top      = 1,
		node_filler    = "default:dirt_yellow",			
		depth_filler   = 2,
		y_min     = 60,						
		y_max     = 127,
		heat_point     = 23.0,						
		humidity_point = 77.0,
	})

	minetest.register_biome({
		name           = "mountain",
		node_dust = "default:snow",
		node_top       = "",	
		depth_top      = 1,
		node_filler    = "",			
		depth_filler   = 2,
		y_min     = 65,						
		y_max     = 31000,
		heat_point     = 77.0,						
		humidity_point = 23.0,
	})
	
	minetest.register_biome({
		name = "sandy_shore",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5,
		y_max = 2,
		heat_point = 65,
		humidity_point = 25,
	})
	
	-- Underground

	minetest.register_biome({
		name = "underground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "",
		--depth_filler = ,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -31000,
		y_max = -113,
		heat_point = 50,
		humidity_point = 50,
	})

end

function default.register_mgv6_decorations()
	minetest.clear_registered_decorations()

	-- Papyrus

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 8,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		y_min = 1,
		y_max = 1,
		decoration = "default:papyrus",
		height = 2,
		height_max = 4,
		spawn_by = "default:water_source",
		num_spawn_by = 1,
	})

	-- Cacti

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.012,
			scale = 0.024,
			spread = {x = 100, y = 100, z = 100},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "default:cactus",
		height = 3,
	        height_max = 4,
	})

	-- Long grasses

	for length = 1, 5 do
		minetest.register_decoration({
			deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = 0,
				scale = 0.007,
				spread = {x = 100, y = 100, z = 100},
				seed = 329,
				octaves = 3,
				persist = 0.6
			},
			y_min = 1,
			y_max = 30,
			decoration = "default:grass_"..length,
		})
	end

	-- Dry shrubs

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:desert_sand", "default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.035,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "default:dry_shrub",
	})
end


local mg_params = minetest.get_mapgen_params()

if mg_params.mgname == "v6" then
	default.register_mgv6_decorations()
else
	minetest.clear_registered_biomes()
	minetest.clear_registered_decorations()
	mapgen.register_biomes()
end

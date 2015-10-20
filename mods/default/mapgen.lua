--
-- Register biomes
--

mapgen = {}

function mapgen.register_biomes()

	minetest.register_biome({
		name = "mapgen:polar",
		--node_dust = "",
		node_top = "",
		depth_top = 1,
		node_filler = "",
		depth_filler = 1,
		--node_stone = "",
		node_water_top = "default:ice",
		depth_water_top = 1,
		--node_water = "",
		y_min = 3,
		y_max = 31000,
		heat_point = 1,
		humidity_point = 1,
	})

	minetest.register_biome({
		name = "mapgen:polar_ocean",
		--node_dust = "",
		--node_top = "default:sand",
		--depth_top = 1,
		--node_filler = "default:gravel",
		--depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = 2,
		--node_water = "",
		y_min = -31000,
		y_max = 1,
		heat_point = 1,
		humidity_point = 1,
	})
	
	minetest.register_biome({
		name = "mapgen:tundra",
		--node_dust = "",
		node_top = "default:dirt_with_ice",
		depth_top = 1,
		node_filler = "default:permafrost",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "default:ice",
		--depth_water_top = 3,
		--node_water = "",
		y_min = 3,
		y_max = 77,
		heat_point = 1,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "mapgen:tundra_ocean",
		--node_dust = "",
		node_top = "default:gravel",
		depth_top = 1,
		--node_filler = "",
		--depth_filler = 1,
		--node_stone = "",
		--node_water_top = "default:ice",
		--depth_water_top = 2,
		--node_water = "",
		y_min = -31000,
		y_max = 1,
		heat_point = 1,
		humidity_point = 45,
	})
	
	minetest.register_biome({
		name = "mapgen:taiga",
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
		heat_point = 1,
		humidity_point = 89,
	})

	minetest.register_biome({
		name = "mapgen:taiga_ocean",
		node_dust = "default:snow",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 1,
		--node_stone = "",
		node_water_top = "default:ice",
		depth_water_top = 4,
		--node_water = "",
		y_min = -31000,
		y_max = 1,
		heat_point = 1,
		humidity_point = 89,
	})
	
	minetest.register_biome({
		name = "mapgen:steppe",
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
		name = "mapgen:steppe_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -31000,
		y_max = 1,
		heat_point = 65,
		humidity_point = 1,
	})
	
	minetest.register_biome({
		name = "mapgen:grassland",
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
		y_max = 82,
		heat_point = 55,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "mapgen:grassland_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -31000,
		y_max = 1,
		heat_point = 55,
		humidity_point = 45,
	})
	
	minetest.register_biome({
		name = "mapgen:woodland",
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
		y_max = 82,
		heat_point = 55,
		humidity_point = 91,
	})

	minetest.register_biome({
		name = "mapgen:woodland_ocean",
		--node_dust = "",
		node_top = "default:gravel",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -31000,
		y_max = 1,
		heat_point = 55,
		humidity_point = 91,
	})
	
	minetest.register_biome({
		name = "mapgen:desert",
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
		y_max = 87,
		heat_point = 105,
		humidity_point = 1,
	})

	minetest.register_biome({
		name = "mapgen:desert_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -31000,
		y_max = 1,
		heat_point = 105,
		humidity_point = 1,
	})
	
	minetest.register_biome({
		name = "mapgen:savanna",
		--node_dust = "",
		node_top = "default:dirt_with_dry_grass",
		depth_top = 1,
		node_filler = "default:dirt_red",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = 3,
		y_max = 87,
		heat_point = 105,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "mapgen:savanna_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -31000,
		y_max = 1,
		heat_point = 105,
		humidity_point = 45,
	})
	
	minetest.register_biome({
		name = "mapgen:rainforest",
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
		y_max = 82,
		heat_point = 105,
		humidity_point = 93,
	})

	minetest.register_biome({
		name = "mapgen:tropical_ocean",
		--node_dust = "",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		y_min = -31000,
		y_max = 1,
		heat_point = 105,
		humidity_point = 93,
	})
	
	minetest.register_biome({
		name           = "mapgen:alpine",
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
		name           = "mapgen:mountain",
		node_top       = "",	
		depth_top      = 1,
		node_filler    = "",			
		depth_filler   = 2,
		y_min     = 65,						
		y_max     = 31000,
		heat_point     = 77.0,						
		humidity_point = 23.0,
	})

end

local mg_params = minetest.get_mapgen_params()

if mg_params.mgname == "v5" then
	minetest.clear_registered_biomes()
	mapgen.register_biomes()
elseif mg_params.mgname == "v7" then
	minetest.clear_registered_biomes()
	mapgen.register_biomes()
else
	minetest.log("action", "Mapgen does not support biomes")
end

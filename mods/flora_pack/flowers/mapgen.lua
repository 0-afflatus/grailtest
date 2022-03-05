-- Grailtest 5 --
-- mods/flora_pack/flowers/mapgen.lua

--
-- Mapgen registrations
--

local function register_flower(seed, flower_name, dirt_types, biome_types)
	minetest.register_decoration({
		name = "flowers:"..flower_name,
		deco_type = "simple",
		place_on = dirt_types,
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.0275,
			spread = {x = 200, y = 200, z = 200},
			seed = seed,
			octaves = 3,
			persist = 0.6
		},
		biomes = biome_types,
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:"..flower_name,
	})
end

local function register_mushroom(mushroom_name)
	minetest.register_decoration({
		name = "flowers:"..mushroom_name,
		deco_type = "simple",
		place_on = {"element:dirt_with_grass", "element:dirt_with_coniferous_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.005,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {
			"woodland",
			"taiga",
			"moss_caves",
			"woodland_swamp",
			"forest_caves",
			"mushroom_caves",
			"rainforest_swamp",
			"jungle_caves"
		},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:"..mushroom_name,
	})
end

local function register_waterlily()
	minetest.register_decoration({
		name = "default:waterlily",
		deco_type = "simple",
		place_on = {"element:dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.12,
			scale = 0.3,
			spread = {x = 200, y = 200, z = 200},
			seed = 33,
			octaves = 3,
			persist = 0.7
		},
		biomes = {
			"rainforest_swamp",
			"savanna_swamp",
			"woodland_swamp",
			"sandy_shore",
			"woodland_ocean",
			"mediterranean_ocean"
		},
		y_max = 0,
		y_min = 0,
		decoration = "flowers:waterlily_waving",
		param2 = 0,
		param2_max = 3,
		place_offset_y = 1,
	})
end

function flowers.register_decorations()
	register_flower(436, 
		"rose",
		{"element:dirt_with_grass_light", "element:dirt_with_dry_grass"},
		{"grassland", "steppe", "woodland", "mediterranean"}
	)
	register_flower(19822,		
		"tulip",
		{"element:dirt_with_grass_light"},
		{"mediterranean", "chapparal"}
	)
	register_flower(1220999, "dandelion_yellow",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(36662, "geranium",
		{"element:dirt_with_grass_light"},
		{"grassland", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(1133, "viola",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"steppe", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(73133, "dandelion_white",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(32635, "achillea_white",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "steppe"}
	)
	register_flower(34357, "alpinebellflower",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"woodland", "alpine"}
	)
	register_flower(959, "arcticgentian",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"alpine", "woodland"}
	)
	register_flower(95246, "aven",
		{"element:stone", "element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"woodland", "alpine"}
	)
	register_flower(953, "beardedbellflower",
		{"element:stone", "element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(2527, "bistort",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"woodland", "alpine"}
	)
	register_flower(68775, "bluebells",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"woodland", "alpine", "chapparal"}
	)
	register_flower(67468, "bugle",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"woodland_swamp", "grassland", "woodland", "mediterranean", "chapparal"}
	)
	register_flower(96, "carnation_pink",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"woodland_swamp", "mediterranean"}
	)
	register_flower(245, "cowparsnip",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "steppe", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(362, "daffodil",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"alpine", "mediterranean", "chapparal"}
	)
	register_flower(46, "daisy_white",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(46957, "deadnettle",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland", "mediterranean", "chapparal"}
	)
	register_flower(35735, "dwarfelder",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland", "mediterranean", "chapparal"}
	)
	register_flower(688, "foxglove",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"alpine", "woodland"}
	)
	register_flower(3572, "greatyellowgentian",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"alpine"}
	)
	register_flower(35748, "hawkweed_orange",
		{"element:stone", "element:dirt_with_grass_light"},
		{"alpine"}
	)
	register_flower(847, "lavender",
		{"element:stone", "element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(7383, "lazarusbell",
		{"element:dirt_with_grass"},
		{"grassland", "woodland"}
	)
	register_flower(46841, "meadowsweet1",
		{"element:dirt_with_grass"},
		{"grassland"}
	)
	register_flower(4683, "mint",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "steppe", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(8467, "northernbedstraw",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland", "alpine"}
	)
	register_flower(823, "pasqueflower",
		{"element:dirt_with_grass", "element:dirt_with_grass_light", "element:dirt_with_ice"},
		{"tundra", "grassland", "woodland", "mediterranean"}
	)
	register_flower(275, "prideofmadeira",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"mediterranean", "chapparal"}
	)
	register_flower(9441, "rosecampion",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"woodland_swamp", "grassland", "woodland", "alpine", "mediterranean"}
	)
	register_flower(1379, "sage",
		{"element:dirt_with_grass_light", "element:dirt_with_dry_grass"},
		{"mediterranean", "chapparal"}
	)
	register_flower(135179, "sealavender",
		{"element:dirt_with_grass", "element:dirt_with_grass_light", "element:mud"},
		{"woodland_swamp"}
	)
	register_flower(7573, "sealymegrass",
		{"element:sand", "element:mud"},
		{"woodland_swamp", "mediterranean_ocean", "tropical_ocean"}
	)
	register_flower(468, "seasandwort",
		{"element:sand", "element:mud"},
		{"woodland_swamp"}
	)
	register_flower(468, "sedge",
		{"element:dirt_with_grass", "dirt_with_ice", "element:mud", "element:sand"},
		{"woodland_swamp", "alpine", "tundra", "mediterranean_ocean", "steppe_ocean", "savanna_ocean", "tropical_ocean"}
	)
	register_flower(7843, "stingingnettle",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "steppe", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(3735, "whiteasphodel",
		{"element:dirt_with_grass_light"},
		{"grassland", "mediterranean", "alpine"}
	)
	register_flower(7468, "wildcarrot",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"mediterranean", "chapparal"}
	)
	register_flower(648, "yellowflag",
		{"element:dirt_with_grass", "element:mud"},
		{"woodland_swamp"}
	)
	register_flower(7357, "yellowtoadflax",
		{"element:stone", "element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland"}
	)
    register_flower(83456,		
		"tulip_black",
		{"element:dirt_with_grass_light"},
		{"mediterranean", "chapparal"}
	)
    register_flower(9854,		
		"lilyofthevalley",
		{"element:dirt_with_grass"},
		{"grassland", "woodland"}
	)
    register_flower(83475,		
		"allium",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"mediterranean", "chapparal"}
	)
    register_flower(3846,		
		"cornflower",
		{"element:dirt_with_grass"},
		{"grassland", "woodland"}
	)
    register_flower(84562,		
		"poppy",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "steppe", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(34563,      
	    "calla", 
	    {"element:dirt_with_grass", "element:dirt_with_snow"}, 
	    {"grassland", "woodland_swamp", "alpine", "taiga"}
	)
	register_flower(126,      
	    "gerbera_daisy", 
	    {"element:dirt_with_dry_grass", "element:dirt_with_grass_jungle"}, 
	    {"rainforest", "savanna"}
	)
	register_flower(548,      
	    "calendula", 
	    {"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "steppe", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(578, "rosemary",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(8679, "hyssop",
		{"element:dirt_with_grass", "element:dirt_with_grass_light"},
		{"grassland", "woodland", "alpine", "mediterranean", "chapparal"}
	)
	register_flower(98346, 
		"sunflower",
		{"element:dirt_with_grass_light", "element:dirt_with_dry_grass"},
		{"steppe", "mediterranean", "chapparal"}
	)
	register_flower(7458,		
		"hollyhock",
		{"element:dirt_with_grass"},
		{"grassland", "woodland"}
	)
    
	register_mushroom("mushroom_brown")
	register_mushroom("mushroom_blue")
	register_mushroom("mushroom_red")

	register_waterlily()
end

flowers.register_decorations()


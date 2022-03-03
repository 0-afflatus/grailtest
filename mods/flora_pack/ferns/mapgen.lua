minetest.register_decoration({
	deco_type = "simple",
	place_on = {
			"element:dirt_with_grass",
			"element:dirt_with_grass_light",
			"element:dirt_with_grass_jungle",
			"element:mossycobble",
			"group:falling_node",
			"element:sand",
			"tree:jungle_trunk",
			"mineral:coal_stone",
			"mineral:iron_stone",
			"mineral:tin_stone",
			"mineral:silver_stone",
		},
	spawn_by = "group:soil",
	num_spawn_by = 2,
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.04,
		spread = {x = 200, y = 200, z = 200},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"woodland", "woodland_swamp", "chapparal"},
	y_min = 1,
	y_max = 30000,
	decoration = {"ferns:fern_01", "ferns:fern_02", "ferns:fern_03"},
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {
			"element:dirt_with_grass",
			"element:dirt_with_grass_jungle",
			"element:sand",
			"element:desert_sand",
			"element:mud"
		},
	sidelen = 80,
	noise_params = {
		offset = 0,
		scale = 0.05,
		spread = {x = 200, y = 200, z = 200},
		seed = 765,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"rainforest", "rainforest_swamp"},
	y_min = 1,
	y_max = 30000,
	schematic = {
            size = {x=1, y=5, z=1},
            data = {
                {name="ferns:fern_trunk", prob=255},
                {name="ferns:fern_trunk", prob=255},
                {name="ferns:fern_trunk", prob=255},
				{name="ferns:fern_trunk", prob=255},
				{name="ferns:tree_fern_leaves", prob=255},
            },
            yslice_prob = {
                {ypos=0, prob=100},
                {ypos=1, prob=150},
                {ypos=2, prob=200},
				{ypos=3, prob=250},
				{ypos=4, prob=254},
            },
        },
	flags = "place_center_y",
	rotation = "random",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
			"element:dirt",
			"element:mossycobble",
			"element:gravel"
		},
	spawn_by = "element:water_source",
	sidelen = 16,
	noise_params = {
		offset = -0.5,
		scale = 1,
		spread = {x = 200, y = 200, z = 200},
		seed = 937,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"rainforest", "rainforest_swamp", "woodland", "woodland_swamp", "chapparal"},
	y_min = 1,
	y_max = 30000,
	decoration = {"ferns:horsetail_01", "ferns:horsetail_02", "ferns:horsetail_03", "ferns:horsetail_04"},
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {
			"element:dirt_with_grass_jungle",
			"element:dirt_with_grass",
			"element:sand",
			"element:desert_sand",
			"element:mud"
		},
	sidelen = 80,
	noise_params = {
		offset = 0,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 268,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"rainforest", "rainforest_swamp"},
	y_min = 1,
	y_max = 30000,
	schematic = {
            size = {x=1, y=5, z=1},
            data = {
                {name="ferns:fern_trunk", prob=255},
                {name="ferns:fern_trunk", prob=255},
                {name="ferns:fern_trunk", prob=255},
				{name="ferns:fern_trunk", prob=255},
				{name="ferns:tree_fern_leaves_02", prob=255},
            },
            yslice_prob = {
                {ypos=0, prob=100},
                {ypos=1, prob=150},
                {ypos=2, prob=200},
				{ypos=3, prob=250},
				{ypos=4, prob=254},
            },
        },
	flags = "place_center_y",
	rotation = "random",
})


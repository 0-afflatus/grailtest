-- Grailtest 5 --
-- mods/mineral/mapgen.lua --

--
-- Register ores
--

-- Blob ore first to avoid other ores inside blobs

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:basalt",
	wherein        = "element:stone",
	column_height_min = 31,
	column_midpoint_factor = 0.75,
	column_height_max      = 47,
	y_min          = -7200,
	y_max          = 48,
	noise_threshold = 0.4,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 511, y = 511, z = 511},
		seed = 2342,
		octaves = 2,
		persist = 0.23
	}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:greenstone",
	wherein        = "element:stone",
	column_height_min = 47,
	column_midpoint_factor = 0.25,
	column_height_max      = 63,
	y_min          = -31000,
	y_max          = -868,
	noise_threshold = 0.6,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 511, y = 511, z = 511},
		seed = 992221,
		octaves = 2,
		persist = 0.23
	}
})

minetest.register_ore({
	ore_type         = "blob",
	ore              = "mineral:clay",
	wherein          = {"element:sand"},
	clust_scarcity   = 24*24*24,
	clust_size       = 7,
	y_min            = -15,
	y_max            = -1,
	noise_threshold = 0.23,
	noise_params     = {
		offset=0.35,
		scale=0.2,
		spread={x=5, y=5, z=5},
		seed=-316,
		octaves=1,
		persist=0.5
	},
})

minetest.register_ore({
	ore_type         = "blob",
	ore              = "element:sand",
	wherein          = {"element:stone", "element:gravel", "element:sandstone", "element:desert_stone"},
	clust_scarcity   = 25*25*25,
	clust_size       = 5,
	y_min            = -63,
	y_max            = 4,
	noise_threshold = 0.5,
	noise_params     = {
		offset=0.35,
		scale=0.2,
		spread={x=5, y=5, z=5},
		seed=2316,
		octaves=1,
		persist=0.5
	},
})

minetest.register_ore({
	ore_type         = "blob",
	ore              = "element:dirt",
	wherein          = {"element:stone", "element:sandstone"},
	clust_scarcity   = 25*25*25,
	clust_size       = 7,
	y_min            = -63,
	y_max            = 31000,
	noise_threshold = 0.5,
	noise_params     = {
		offset=0.35,
		scale=0.2,
		spread={x=5, y=5, z=5},
		seed=17676,
		octaves=1,
		persist=0.5
	},
})

minetest.register_ore({
	ore_type         = "blob",
	ore              = "element:gravel",
	wherein          = {"element:stone", "element:dirt_with_ice"},
	clust_scarcity   = 25*25*25,
	clust_size       = 6,
	y_min            = -30000,
	y_max            = 31000,
	noise_threshold = 0.5,
	noise_params     = {
		offset=0.35,
		scale=0.2,
		spread={x=5, y=5, z=5},
		seed=766,
		octaves=1,
		persist=0.5
	},
})

minetest.register_ore({
	ore_type         = "blob",
	ore              = "mineral:clay",
	wherein          = {"element:sand"},
	clust_scarcity   = 24*24*24,
	clust_size       = 7,
	y_min            = -15,
	y_max            = -1,
	noise_threshold = 0,
	noise_params     = {
		offset=0.35,
		scale=0.2,
		spread={x=5, y=5, z=5},
		seed=-316,
		octaves=1,
		persist=0.5
	},
})

-- New style sheets

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:bluestone",
	wherein        = "element:stone",
	column_height_min = 32,
	column_midpoint_factor = 0.3,
	column_height_max = 47,
	y_min          = -1023,
	y_max          = 127,
	noise_threshold = 0.5,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 511, y = 255, z = 511},
		seed = 5258,
		octaves = 2,
		persist = 0.50
	}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:white_stone",
	wherein        = "element:stone",
	column_height_min = 27,
	column_midpoint_factor = 0.4,
	column_height_max = 31,
	y_min     		= -255,
	y_max     		= 31000,
	noise_threshold = 0.5,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 255, y = 255, z = 255},
		seed = 6895,
		octaves = 2,
		persist = 0.5
	}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "element:desert_stone",
	wherein        = "element:stone",
	column_height_min = 12,
	column_midpoint_factor = 0.7,
	column_height_max = 15,
	y_min     = -127,
	y_max     = 31000,
	noise_threshold = 0.5,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 255, y = 127, z = 255},
		seed = 4625,
		octaves = 2,
		persist = 0.33
	}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "element:sandstone",
	wherein        = "element:stone",
	column_height_min = 12,
	column_midpoint_factor = 0.6,
	column_height_max = 15,
	y_min     = -127,
	y_max     = 31000,
	noise_threshold = 0.5,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 255, y = 127, z = 255},
		seed = 58048,
		octaves = 2,
		persist = 0.33
	}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:coal_stone",
	wherein        = "element:stone",
	column_height_min = 2,
	column_midpoint_factor = 0.5,
	column_height_max = 5,
	y_min          = -1535,
	y_max          = -1023,
	noise_threshold = 0.77,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 127, y = 127, z = 127},
		seed = 37,
		octaves = 2,
		persist = 0.50
	}
})

-- Puff type

minetest.register_ore({
	ore_type       = "puff",
	ore            = "mineral:bluestone",
	wherein        = "element:stone",
	np_puff_top = 32,
	np_puff_bottom = 63,
	y_min          = -1023,
	y_max          = 127,
	noise_threshold = 0.5,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 511, y = 511, z = 511},
		seed = 9923,
		octaves = 2,
		persist = 0.50
	}
})

minetest.register_ore({
	ore_type       = "puff",
	ore            = "mineral:white_stone",
	wherein        = "element:stone",
	np_puff_top = 16,
	np_puff_bottom = 31,
	y_min     		= -255,
	y_max     		= 31000,
	noise_threshold = 0.5,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 255, y = 255, z = 255},
		seed = 4684,
		octaves = 2,
		persist = 0.50
	}
})

minetest.register_ore({
	ore_type       = "puff",
	ore            = "element:desert_stone",
	wherein        = "element:stone",
	np_puff_top = 8,
	np_puff_bottom = 15,
	y_min     = -127,
	y_max     = 31000,
	noise_threshold = 0.5,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 255, y = 31, z = 255},
		seed = 9261,
		octaves = 2,
		persist = 0.50
	}
})

minetest.register_ore({
	ore_type       = "puff",
	ore            = "element:sandstone",
	wherein        = "element:stone",
	np_puff_top = 8,
	np_puff_bottom = 15,
	y_min     = -127,
	y_max     = 31000,
	noise_threshold = 0.5,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 255, y = 31, z = 255},
		seed = 24679,
		octaves = 2,
		persist = 0.50
	}
})

minetest.register_ore({
	ore_type       = "puff",
	ore            = "mineral:coal_stone",
	wherein        = "element:stone",
	np_puff_top = 2,
	np_puff_bottom = 6,
	y_min          = -511,
	y_max          = -32,
	noise_threshold = 0.5,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 127, y = 127, z = 127},
		seed = 37,
		octaves = 2,
		persist = 0.50
	}
})

minetest.register_ore({
	ore_type       = "puff",
	ore            = "element:stone",
	wherein        = { "mineral:bluestone", "mineral:white_stone", "element:desert_stone", "element:sandstone"},
	np_puff_top = 32,
	np_puff_bottom = 63,
	y_min          = -2045,
	y_max          = -1,
	noise_threshold = 0.5,
	noise_params   = {
		offset = 0,
		scale = 1,
		spread = {x = 511, y = 511, z = 511},
		seed = 4874,
		octaves = 2,
		persist = 0.50
	}
})

-- Scatter types

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:coal_stone",
	wherein        = "element:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 7,
	clust_size     = 3,
	y_min          = -512,
	y_max          = 64,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:coal_stone",
	wherein        = "element:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 23,
	clust_size     = 6,
	y_min          = -1444,
	y_max          = -1,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:iron_stone",
	wherein        = "element:stone",
	clust_scarcity = 11*11*11,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -63,
	y_max          = 2,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:iron_stone",
	wherein        = "element:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -128,
	y_max          = -32,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:iron_stone",
	wherein        = "element:stone",
	clust_scarcity = 11*11*11,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -3074,
	y_max          = -64,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:iron_stone",
	wherein        = "element:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 17,
	clust_size     = 6,
	y_min          = -25000,
	y_max          = -96,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:iron_stone",
	wherein        = "element:stone",
	clust_scarcity = 23*23*23,
	clust_num_ores = 27,
	clust_size     = 7,
	y_min          = -23000,
	y_max          = -4200,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:tin_stone",
	wherein        = "mineral:bluestone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -127,
	y_max     = 2,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:tin_stone",
	wherein        = "element:stone",
	clust_scarcity = 19 * 19 * 19,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -127,
	y_max     = 2,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:tin_stone",
	wherein        = "element:stone",
	clust_scarcity = 13 * 13 * 13,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -2048,
	y_max     = -128,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:copper_stone",
	wherein        = "element:stone",
	clust_scarcity = 11*11*11,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = -29000,
	y_max          = 123,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:copper_stone",
	wherein        = "mineral:bluestone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = -29000,
	y_max          = 123,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:copper_stone",
	wherein        = "element:stone",
	clust_scarcity = 11*11*11,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = -255,
	y_max          = -16,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:copper_stone",
	wherein        = "mineral:bluestone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 7,
	clust_size     = 4,
	y_min          = -29000,
	y_max          = -63,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:silver_stone",
	wherein        = "element:stone",
	clust_scarcity = 14*14*14,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = -23000,
	y_max          = -123,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:silver_stone",
	wherein        = "mineral:bluestone",
	clust_scarcity = 11*11*11,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = -23000,
	y_max          = -123,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:silver_stone",
	wherein        = "element:stone",
	clust_scarcity = 17 * 17 * 17,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -256,
	y_max     = -127,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:silver_stone",
	wherein        = "element:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 6,
	clust_size     = 3,
	y_min     = -27000,
	y_max     = -128,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:gold_stone",
	wherein        = "element:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = -17000,
	y_max          = 123,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:gold_stone",
	wherein        = "mineral:basalt",
	clust_scarcity = 13*13*13,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = -23000,
	y_max          = 123,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:gold_stone",
	wherein        = "element:stone",
	clust_scarcity = 21*21*21,
	clust_num_ores = 1,
	clust_size     = 2,
	y_min     = -127,
	y_max     = 8,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:gold_stone",
	wherein        = "element:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min     = -511,
	y_max     = -128,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:gold_stone",
	wherein        = "mineral:basalt",
	clust_scarcity = 15*15*15,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min     = -23000,
	y_max     = -512,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:gold_stone",
	wherein        = "element:stone",
	clust_scarcity = 23*23*23,
	clust_num_ores = 17,
	clust_size     = 6,
	y_min     = -10000,
	y_max     = -5000,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:mithril_stone",
	wherein        = "element:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -750,
	y_max     = -128,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:mithril_stone",
	wherein        = "mineral:greenstone",
	clust_scarcity = 13*13*13,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -28000,
	y_max     = -376,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:mithril_stone",
	wherein        = "mineral:greenstone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 13,
	clust_size     = 6,
	y_min     = -29000,
	y_max     = -1048,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:mithril_stone",
	wherein        = "mineral:greenstone",
	clust_scarcity = 23*23*23,
	clust_num_ores = 23,
	clust_size     = 7,
	y_min     = -20000,
	y_max     = -10000,
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:topaz_stone",
	wherein        = "element:stone",
	clust_scarcity = 27*27*27,
	clust_num_ores = 3,
	clust_size     = 4,
	y_min     = -375,
	y_max     = -128,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:topaz_stone",
	wherein        = "element:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 5,
	clust_size     = 7,
	y_min     = -30000,
	y_max     = -376,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:amethyst_stone",
	wherein        = "element:sandstone",
	clust_scarcity = 32*32*32,
	clust_num_ores = 3,
	clust_size     = 4,
	y_min     = -1267,
	y_max     = -756,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:amethyst_stone",
	wherein        = "element:stone",
	clust_scarcity = 19*19*19,
	clust_num_ores = 5,
	clust_size     = 6,
	y_min     = -20000,
	y_max     = -768,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:saphire_stone",
	wherein        = "element:stone",
	clust_scarcity = 37*37*37,
	clust_num_ores = 3,
	clust_size     = 4,
	y_min     = -447,
	y_max     = -336,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:saphire_stone",
	wherein        = "mineral:greenstone",
	clust_scarcity = 23*23*23,
	clust_num_ores = 4,
	clust_size     = 8,
	y_min     = -672,
	y_max     = -448,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type    = "scatter",
	ore         = "mineral:saphire_stone",
	wherein     = "mineral:greenstone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 5,
	clust_size     = 7,
	y_min     = -16000,
	y_max     = -1672,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:emerald_stone",
	wherein        = "element:stone",
	clust_scarcity = 23*23*23,
	clust_num_ores = 3,
	clust_size     = 4,
	y_min     = -475,
	y_max     = -200,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:emerald_stone",
	wherein        = "element:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 5,
	clust_size     = 7,
	y_min     = -954,
	y_max     = -476,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type    = "scatter",
	ore         = "mineral:emerald_stone",
	wherein     = "element:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 7,
	clust_size     = 9,
	y_min     = -23000,
	y_max     = -1954,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:diamond_stone",
	wherein        = "mineral:basalt",
	clust_scarcity = 19*19*19,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min     = -2047,
	y_max     = -959,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:diamond_stone",
	wherein        = "mineral:basalt",
	clust_scarcity = 37*37*37,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -1548,
	y_max     = -512,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type    = "scatter",
	ore         = "mineral:diamond_stone",
	wherein     = "mineral:basalt",
	clust_scarcity = 15*15*15,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -21000,
	y_max     = -2045,
})

minetest.register_ore({
	ore_type    = "scatter",
	ore         = "mineral:diamond_stone",
	wherein     = "mineral:basalt",
	clust_scarcity = 13*13*13,
	clust_num_ores = 8,
	clust_size     = 5,
	y_min     = -22000,
	y_max     = -2048,
})

minetest.register_ore({
	ore_type    = "scatter",
	ore         = "mineral:diamond_stone",
	wherein     = "mineral:basalt",
	clust_scarcity = 23*23*23,
	clust_num_ores = 23,
	clust_size     = 6,
	y_min     = -23000,
	y_max     = -10000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:ruby_stone",
	wherein        = "mineral:greenstone",
	clust_scarcity = 27*27*27,
	clust_num_ores = 3,
	clust_size     = 5,
	y_min     = -3047,
	y_max     = -1967,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:ruby_stone",
	wherein        = "mineral:greenstone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 4,
	clust_size     = 6,
	y_min     = -4071,
	y_max     = -3548,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type    = "scatter",
	ore         = "mineral:ruby_stone",
	wherein     = "mineral:greenstone",
	clust_scarcity = 23*23*23,
	clust_num_ores = 6,
	clust_size     = 7,
	y_min     = -26000,
	y_max     = -4072,
})

minetest.register_ore({
	ore_type    = "scatter",
	ore         = "mineral:ruby_stone",
	wherein     = "mineral:greenstone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 6,
	clust_size     = 7,
	y_min     = -25000,
	y_max     = -5120,
})

minetest.register_ore({
	ore_type    = "scatter",
	ore         = "mineral:ruby_stone",
	wherein     = "mineral:greenstone",
	clust_scarcity = 23*23*23,
	clust_num_ores = 42,
	clust_size     = 9,
	y_min     = -23000,
	y_max     = -15000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:clay",
	wherein        = "element:sand",
	clust_scarcity = 15*15*15,
	clust_num_ores = 64,
	clust_size     = 5,
	y_min     = -10,
	y_max     = -1,
})

--
-- Veins
--

minetest.register_ore({
	ore_type    = "vein",
	ore         = "mineral:diamond_stone",
	wherein     = "mineral:basalt",
	noise_params = {
		offset   = 0,
		scale    = 3,
		spread   = {x=64, y=256, z=64},
		seed     = 4242,
		octaves  = 4,
		persist  = 0.5,
		flags    = "eased",
	},
	noise_threshold = 1.98,
	random_factor = 1,
	y_min     = -23000,
	y_max     = -3045,
})

minetest.register_ore({
	ore_type    = "vein",
	ore         = "mineral:saphire_stone",
	wherein     = "mineral:greenstone",
	noise_params = {
		offset   = 0,
		scale    = 3,
		spread   = {x=64, y=256, z=64},
		seed     = 5390,
		octaves  = 4,
		persist  = 0.5,
		flags    = "eased",
	},
	noise_threshold = 1.96,
	random_factor = 1,
	y_min     = -16000,
	y_max     = -672,
})

minetest.register_ore({
	ore_type    = "vein",
	ore         = "mineral:emerald_stone",
	wherein     = "element:stone",
	noise_params = {
		offset   = 0,
		scale    = 3,
		spread   = {x=64, y=256, z=64},
		seed     = 7777,
		octaves  = 4,
		persist  = 0.5,
		flags    = "eased",
	},
	noise_threshold = 1.97,
	random_factor = 1,
	y_min     = -20000,
	y_max     = -2500,
})

minetest.register_ore({
	ore_type    = "vein",
	ore         = "mineral:ruby_stone",
	wherein     = "mineral:greenstone",
	noise_params = {
		offset   = 0,
		scale    = 3,
		spread   = {x=64, y=256, z=64},
		seed     = 1230,
		octaves  = 4,
		persist  = 0.5,
		flags    = "eased",
	},
	noise_threshold = 1.99,
	random_factor = 1,
	y_min     = -13000,
	y_max     = -6120,
})

-- Methane
minetest.register_ore({
	ore_type         = "blob",
	ore              = "element:methane",
	wherein          = {"mineral:coal_stone", "mineral:basalt"},
	clust_scarcity   = 24*24*24,
	clust_size       = 5,
	y_min            = -30000,
	y_max            = -512,
	noise_threshold = 0.75,
	noise_params     = {
		offset=0.35,
		scale=0.2,
		spread={x=5, y=5, z=5},
		seed=-316,
		octaves=1,
		persist=0.5
	},
})

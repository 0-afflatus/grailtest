--
-- Register ores
--

-- Blob ore first to avoid other ores inside blobs

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:greenstone",
	wherein        = "default:stone",
	clust_size     = 63,
	y_min          = -31000,
	y_max          = -511,
	noise_threshhold = 0.5,
	noise_params   = 0, 0, {511, 511, 511}, -992221, 2, 0.50,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:basalt",
	wherein        = "default:stone",
	clust_size     = 63,
	y_min          = -10000,
	y_max          = 64,
	noise_threshhold = 0.5,
	noise_params   = 0, 0, {511, 511, 511}, -992221, 2, 0.50,
})

minetest.register_ore({ 
	ore_type         = "blob",
	ore              = "mineral:clay",
	wherein          = {"default:sand"},
	clust_scarcity   = 24*24*24,
	clust_size       = 7,
	y_min            = -15,
	y_max            = 0,
	noise_threshhold = 0,
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
	ore              = "default:sand",
	wherein          = {"default:stone"},
	clust_scarcity   = 25*25*25,
	clust_size       = 5,
	y_min            = -63,
	y_max            = 4,
	noise_threshhold = 0.5,
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
	ore              = "default:dirt",
	wherein          = {"default:stone"},
	clust_scarcity   = 25*25*25,
	clust_size       = 7,
	y_min            = -63,
	y_max            = 31000,
	noise_threshhold = 0.5,
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
	ore              = "default:gravel",
	wherein          = {"default:stone"},
	clust_scarcity   = 25*25*25,
	clust_size       = 6,
	y_min            = -31000,
	y_max            = 31000,
	noise_threshhold = 0.5,
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
	wherein          = {"default:sand"},
	clust_scarcity   = 24*24*24,
	clust_size       = 7,
	y_min            = -15,
	y_max            = 0,
	noise_threshhold = 0,
	noise_params     = {
		offset=0.35,
		scale=0.2,
		spread={x=5, y=5, z=5},
		seed=-316,
		octaves=1,
		persist=0.5
	},
})

-- Scatter types

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:coal_stone",
	wherein        = "default:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = -512,
	y_max          = 64,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:coal_stone",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 27,
	clust_size     = 6,
	y_min          = -1024,
	y_max          = 0,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:iron_stone",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -32,
	y_max          = 2,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:iron_stone",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -128,
	y_max          = -16,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:iron_stone",
	wherein        = "default:stone",
	clust_scarcity = 13*13*13,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -2048,
	y_max          = -64,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:iron_stone",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 23,
	clust_size     = 6,
	y_min          = -31000,
	y_max          = -64,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:tin_stone",
	wherein        = "default:stone",
	clust_scarcity = 13 * 13 * 13,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -127,
	y_max     = 2,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:tin_stone",
	wherein        = "default:stone",
	clust_scarcity = 11 * 11 * 11,
	clust_num_ores = 7,
	clust_size     = 3,
	y_min     = -1024,
	y_max     = -128,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:copper_stone",
	wherein        = "default:stone",
	clust_scarcity = 13*13*13,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = -256,
	y_max          = -16,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:copper_stone",
	wherein        = "default:stone",
	clust_scarcity = 11*11*11,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -128,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:silver_stone",
	wherein        = "default:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -127,
	y_max     = -64,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:silver_stone",
	wherein        = "default:stone",
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -128,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:gold_stone",
	wherein        = "default:stone",
	clust_scarcity = 19*19*19,
	clust_num_ores = 1,
	clust_size     = 2,
	y_min     = -63,
	y_max     = 8,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:gold_stone",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -255,
	y_max     = -64,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:gold_stone",
	wherein        = "default:stone",
	clust_scarcity = 13*13*13,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -256,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:mithril_stone",
	wherein        = "default:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -375,
	y_max     = -128,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:mithril_stone",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -376,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:mithril_stone",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 23,
	clust_size     = 5,
	y_min     = -31000,
	y_max     = -1024,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:topaz_stone",
	wherein        = "default:stone",
	clust_scarcity = 27*27*27,
	clust_num_ores = 7,
	clust_size     = 3,
	y_min     = -375,
	y_max     = -128,
	noise_threshhold = 0.6,
	noise_params   = 0, 1, {10, 50, 10}, 111, 3, 0.70,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:topaz_stone",
	wherein        = "default:stone",
	clust_scarcity = 17*11*17,
	clust_num_ores = 11,
	clust_size     = 8,
	y_min     = -31000,
	y_max     = -376,
	noise_threshhold = 0.6,
	noise_params   = 0, 1, {10, 50, 10}, 111, 3, 0.70,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:amethyst_stone",
	wherein        = "default:stone",
	clust_scarcity = 32*32*32,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -255,
	y_max     = -192,
	noise_threshhold = 0.6,
	noise_params   = 0, 1, {50, 10, 50}, 555, 3, 0.70,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:amethyst_stone",
	wherein        = "default:stone",
	clust_scarcity = 19*17*19,
	clust_num_ores = 10,
	clust_size     = 6,
	y_min     = -31000,
	y_max     = -256,
	noise_threshhold = 0.6,
	noise_params   = 0, 1, {50, 10, 50}, 555, 3, 0.70,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:saphire_stone",
	wherein        = "default:stone",
	clust_scarcity = 37*37*37,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min     = -447,
	y_max     = -224,
	noise_threshhold = 0.6,
	noise_params   = 0, 1, {10, 1000, 10}, 333, 3, 0.70,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:saphire_stone",
	wherein        = "default:stone",
	clust_scarcity = 23*17*23,
	clust_num_ores = 9,
	clust_size     = 5,
	y_min     = -671,
	y_max     = -448,
	noise_threshhold = 0.6,
	noise_params   = 0, 1, {10, 1000, 10}, 333, 3, 0.70,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type    = "vein",
	ore         = "mineral:saphire_stone",
	wherein     = "default:stone",
	noise_params = {
		offset   = 0,
		scale    = 3,
		spread   = {x=32, y=256, z=32},
		seed     = 5390,
		octaves  = 4,
		persist  = 0.5,
		flags    = "eased",
	},
	noise_threshhold = 0.85,
	random_factor = 0.23,
	y_min     = -16000,
	y_max     = -672,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:emerald_stone",
	wherein        = "default:stone",
	clust_scarcity = 23*23*23,
	clust_num_ores = 6,
	clust_size     = 3,
	y_min     = -375,
	y_max     = -160,
	noise_threshhold = 0.6,
	noise_params   = 0, 1, {10, 10, 10}, 444, 3, 0.70,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:emerald_stone",
	wherein        = "default:stone",
	clust_scarcity = 17*13*17,
	clust_num_ores = 12,
	clust_size     = 7,
	y_min     = -639,
	y_max     = -376,
	noise_threshhold = 0.55,
	noise_params   = 0, 1, {10, 10, 10}, 444, 3, 0.70,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type    = "vein",
	ore         = "mineral:emerald_stone",
	wherein     = "default:stone",
	noise_params = {
		offset   = 0,
		scale    = 3,
		spread   = {x=32, y=256, z=32},
		seed     = 7777,
		octaves  = 4,
		persist  = 0.5,
		flags    = "eased",
	},
	noise_threshhold = 0.85,
	random_factor = 0.2,
	y_min     = -30000,
	y_max     = -640,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:diamond_stone",
	wherein        = "default:stone",
	clust_scarcity = 19*19*19,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min     = -383,
	y_max     = -192,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:diamond_stone",
	wherein        = "default:stone",
	clust_scarcity = 42*23*42,
	clust_num_ores = 6,
	clust_size     = 3,
	y_min     = -511,
	y_max     = -384,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type    = "vein",
	ore         = "mineral:diamond_stone",
	wherein     = "default:stone",
	noise_params = {
		offset   = 0,
		scale    = 3,
		spread   = {x=32, y=512, z=32},
		seed     = 4242,
		octaves  = 4,
		persist  = 0.5,
		flags    = "eased",
	},
	noise_threshhold = 0.9,
	random_factor = 0.15,
	y_min     = -30000,
	y_max     = -512,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:ruby_stone",
	wherein        = "default:stone",
	clust_scarcity = 37*37*37,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min     = -511,
	y_max     = -256,
	noise_threshhold = 0.5,
	noise_params   = 0, 1, {100, 10, 100}, 222, 3, 0.70,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:ruby_stone",
	wherein        = "default:stone",
	clust_scarcity = 23*12*23,
	clust_num_ores = 9,
	clust_size     = 4,
	y_min     = -767,
	y_max     = -512,
	noise_threshhold = 0.5,
	noise_params   = 0, 1, {100, 10, 100}, 222, 3, 0.70,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type    = "vein",
	ore         = "mineral:ruby_stone",
	wherein     = "default:stone",
	noise_params = {
		offset   = 0,
		scale    = 3,
		spread   = {x=16, y=512, z=16},
		seed     = 1230,
		octaves  = 4,
		persist  = 0.5,
		flags    = "eased",
	},
	noise_threshhold = 0.95,
	random_factor = 0.1,
	y_min     = -30000,
	y_max     = -768,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mineral:clay",
	wherein        = "default:sand",
	clust_scarcity = 15*15*15,
	clust_num_ores = 64,
	clust_size     = 5,
	y_max     = 0,
	y_min     = -10,
})

-- Sheet types

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:bluestone",
	wherein        = "default:stone",
	clust_size     = 63,
	y_min          = -1023,
	y_max          = 127,
	noise_threshhold = 0.6,
	noise_params   = 0, 1, {1023, 63, 1023}, -992221, 3, 0.66,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:white_stone",
	wherein        = "default:stone",
	clust_size     = 31,
	y_min     		= -255,
	y_max     		= 31000,
	noise_threshhold = 0.5,
	noise_params   = 0, 1, {255, 31, 255}, -992221, 3, 0.60,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:desert_stone",
	wherein        = "default:stone",
	clust_size     = 15,
	y_min     = -127,
	y_max     = 31000,
	noise_threshhold = 0.4,
	noise_params   = 0, 1, {512, 15, 512}, -992221, 3, 0.40,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:sandstone",
	wherein        = "default:stone",
	clust_size     = 15,
	y_min     = -127,
	y_max     = 31000,
	noise_threshhold = 0.3,
	noise_params   = 0, 1, {512, 15, 512}, -992221, 3, 0.33,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:coal_stone",
	wherein        = "default:stone",
	clust_size     = 6,
	y_min          = -511,
	y_max          = -32,
	noise_threshhold = 0.7,
	noise_params   = 0, 1, {127, 127, 127}, 37, 3, 0.50,
})

--[[ New style sheets

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:bluestone",
	wherein        = "default:stone",
	column_height_min = 32,
	column_midpoint_factor = 0.5,
	column_height_max = 63,
	y_min          = -1023,
	y_max          = 127,
	noise_threshhold = 0.5,
	noise_params   = 0, 0, {511, 511, 511}, -992221, 2, 0.50,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:white_stone",
	wherein        = "default:stone",
	column_height_min = 16,
	column_midpoint_factor = 0.5,
	column_height_max = 31,
	y_min     		= -255,
	y_max     		= 31000,
	noise_threshhold = 0.5,
	noise_params   = 0, 0, {255, 255, 255}, -992221, 2, 0.50,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:desert_stone",
	wherein        = "default:stone",
	column_height_min = 8,
	column_midpoint_factor = 0.5,
	column_height_max = 15,
	y_min     = -127,
	y_max     = 31000,
	noise_threshhold = 0.5,
	noise_params   = 0, 0, {255, 31, 255}, -992221, 2, 0.50,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:sandstone",
	wherein        = "default:stone",
	column_height_min = 8,
	column_midpoint_factor = 0.5,
	column_height_max = 15,
	y_min     = -127,
	y_max     = 31000,
	noise_threshhold = 0.5,
	noise_params   = 0, 0, {255, 31, 255}, -992221, 2, 0.50,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "mineral:coal_stone",
	wherein        = "default:stone",
	column_height_min = 2,
	column_midpoint_factor = 0.5,
	column_height_max = 6,
	y_min          = -511,
	y_max          = -32,
	noise_threshhold = 0.5,
	noise_params   = 0, 1, {127, 127, 127}, 37, 2, 0.50,
})

-- Puff type

minetest.register_ore({
	ore_type       = "puff",
	ore            = "mineral:bluestone",
	wherein        = "default:stone",
	np_puff_bottom = 32,
	np_puff_bottom = 63,
	y_min          = -1023,
	y_max          = 127,
	noise_threshhold = 0.5,
	noise_params   = 0, 0, {511, 511, 511}, -992221, 2, 0.50,
})

minetest.register_ore({
	ore_type       = "puff",
	ore            = "mineral:white_stone",
	wherein        = "default:stone",
	np_puff_bottom = 16,
	np_puff_bottom = 31,
	y_min     		= -255,
	y_max     		= 31000,
	noise_threshhold = 0.5,
	noise_params   = 0, 0, {255, 255, 255}, -992221, 2, 0.50,
})

minetest.register_ore({
	ore_type       = "puff",
	ore            = "default:desert_stone",
	wherein        = "default:stone",
	np_puff_bottom = 8,
	np_puff_bottom = 15,
	y_min     = -127,
	y_max     = 31000,
	noise_threshhold = 0.5,
	noise_params   = 0, 0, {255, 31, 255}, -992221, 2, 0.50,
})

minetest.register_ore({
	ore_type       = "puff",
	ore            = "default:sandstone",
	wherein        = "default:stone",
	np_puff_bottom = 8,
	np_puff_bottom = 15,
	y_min     = -127,
	y_max     = 31000,
	noise_threshhold = 0.5,
	noise_params   = 0, 0, {255, 31, 255}, -992221, 2, 0.50,
})

minetest.register_ore({
	ore_type       = "puff",
	ore            = "mineral:coal_stone",
	wherein        = "default:stone",
	np_puff_bottom = 2,
	np_puff_bottom = 6,
	y_min          = -511,
	y_max          = -32,
	noise_threshhold = 0.5,
	noise_params   = 0, 1, {127, 127, 127}, 37, 2, 0.50,
})
]]

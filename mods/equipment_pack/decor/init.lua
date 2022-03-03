decor = {}

-- Load files
dofile(minetest.get_modpath("decor").."/handlers/nodeboxes.lua")
dofile(minetest.get_modpath("decor").."/handlers/registration.lua")
dofile(minetest.get_modpath("decor").."/bench.lua")
dofile(minetest.get_modpath("decor").."/cabinet.lua")
dofile(minetest.get_modpath("decor").."/candle.lua")
dofile(minetest.get_modpath("decor").."/chair.lua")
dofile(minetest.get_modpath("decor").."/rope.lua")
dofile(minetest.get_modpath("decor").."/table.lua")
dofile(minetest.get_modpath("decor").."/aliases.lua")

dungeon_loot.register({
	{name = "decor:rope", chance = 0.1, y = {-32768, 512}},
	{name = "decor:candle", chance = 0.1, count = {1, 4}, y = {-32768, 512}},
})

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

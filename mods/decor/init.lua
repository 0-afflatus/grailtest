-- Load files
dofile(minetest.get_modpath("decor").."/handlers/nodeboxes.lua")
dofile(minetest.get_modpath("decor").."/handlers/registration.lua")
dofile(minetest.get_modpath("decor").."/bench.lua")
dofile(minetest.get_modpath("decor").."/cabinet.lua")
dofile(minetest.get_modpath("decor").."/candle.lua")
dofile(minetest.get_modpath("decor").."/chair.lua")
dofile(minetest.get_modpath("decor").."/rope.lua")
dofile(minetest.get_modpath("decor").."/shelf.lua")
dofile(minetest.get_modpath("decor").."/table.lua")
dofile(minetest.get_modpath("decor").."/xwall.lua")
dofile(minetest.get_modpath("decor").."/aliases.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

-- Grailtest 5 --
-- mods/element/ --

-- See README for licensing and other information.

-- Definitions made by this mod that other mods can use too
element = {}

-- Load files
dofile(minetest.get_modpath("element").."/nodes.lua")
dofile(minetest.get_modpath("element").."/shapes.lua")
dofile(minetest.get_modpath("element").."/fire.lua")
dofile(minetest.get_modpath("element").."/functions.lua")
dofile(minetest.get_modpath("element").."/actions.lua")
dofile(minetest.get_modpath("element").."/crafting.lua")
dofile(minetest.get_modpath("element").."/aliases.lua")
dofile(minetest.get_modpath("element").."/mapgen.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

-- Grailtest 5 --
-- mods/ui_pack/command/init.lua

-- Definitions made by this mod that other mods can use too
command = {}

-- Load files
dofile(minetest.get_modpath("command").."/functions.lua")
dofile(minetest.get_modpath("command").."/disciplinary.lua")
dofile(minetest.get_modpath("command").."/notice.lua")
dofile(minetest.get_modpath("command").."/spawn.lua")
dofile(minetest.get_modpath("command").."/tpr.lua")
dofile(minetest.get_modpath("command").."/misc.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

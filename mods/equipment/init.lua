-- Definitions made by this mod that other mods can use too
equipment = {}

-- Load files
--dofile(minetest.get_modpath("equipment").."/handlers/nodeboxes.lua")
--dofile(minetest.get_modpath("equipment").."/handlers/registration.lua")
--dofile(minetest.get_modpath("equipment").."/bench.lua")
dofile(minetest.get_modpath("equipment").."/books.lua")
--dofile(minetest.get_modpath("equipment").."/cabinet.lua")
dofile(minetest.get_modpath("equipment").."/cauldron.lua")
--dofile(minetest.get_modpath("equipment").."/chair.lua")
dofile(minetest.get_modpath("equipment").."/chest.lua")
dofile(minetest.get_modpath("equipment").."/fence.lua")
dofile(minetest.get_modpath("equipment").."/furnace.lua")
dofile(minetest.get_modpath("equipment").."/ladder.lua")
dofile(minetest.get_modpath("equipment").."/panel.lua")
--dofile(minetest.get_modpath("equipment").."/rope.lua")
--dofile(minetest.get_modpath("equipment").."/shelf.lua")
--dofile(minetest.get_modpath("equipment").."/table.lua")
dofile(minetest.get_modpath("equipment").."/torch.lua")
dofile(minetest.get_modpath("equipment").."/aliases.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

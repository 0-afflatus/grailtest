-- Grailtest 5 --
-- mods/equipment/ --

-- Definitions made by this mod that other mods can use too
equipment = {}

-- Load files
dofile(minetest.get_modpath("equipment").."/books.lua")
dofile(minetest.get_modpath("equipment").."/cauldron.lua")
dofile(minetest.get_modpath("equipment").."/chest.lua")
dofile(minetest.get_modpath("equipment").."/fence.lua")
dofile(minetest.get_modpath("equipment").."/furnace.lua")
dofile(minetest.get_modpath("equipment").."/ladder.lua")
dofile(minetest.get_modpath("equipment").."/torch.lua")
dofile(minetest.get_modpath("equipment").."/bonfire.lua")
dofile(minetest.get_modpath("equipment").."/aliases.lua")

dungeon_loot.register({
	{name = "equipment:ladder", chance = 0.1, count = {1, 12}, y = {-2047, 512}},
	{name = "equipment:ladder_steel", chance = 0.1, count = {1, 5}, y = {-32768, -512}},
	{name = "equipment:torch", chance = 0.3, count = {1, 12}, y = {-32768, -512}},
})

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

-- Minetest 0.4 mod: plant

-- Definitions made by this mod that other mods can use too
plant = {}
plant.registered_plants = {}

-- Load files

dofile(minetest.get_modpath("plant").."/grasses.lua")
dofile(minetest.get_modpath("plant").."/cacti.lua")
dofile(minetest.get_modpath("plant").."/shrubs.lua")
dofile(minetest.get_modpath("plant").."/vegetables.lua")
dofile(minetest.get_modpath("plant").."/sealife.lua")
dofile(minetest.get_modpath("plant").."/aliases.lua")
dofile(minetest.get_modpath("plant").."/crafts.lua")

-- Log message
minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

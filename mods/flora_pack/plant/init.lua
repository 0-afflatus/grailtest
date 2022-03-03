-- Grailtest 5 --
-- mods/flora_pack/plant/init.lua

-- Definitions made by this mod that other mods can use too
plant = {}
plant.registered_plants = {}

plant.sel = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.3, 0.3, -0.1, 0.2}
	}

plant.sel0 = {
		type = "fixed",
		fixed = {-0.4, -0.5, -0.4, 0.4, -0.3, 0.4}
	}

plant.sel1 = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, -0.2, 0.3}
	}

plant.sel2 = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	}

plant.sel3 = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	}

-- Load files

dofile(minetest.get_modpath("plant").."/api.lua")
dofile(minetest.get_modpath("plant").."/grasses.lua")
dofile(minetest.get_modpath("plant").."/cacti.lua")
dofile(minetest.get_modpath("plant").."/jungle.lua")
dofile(minetest.get_modpath("plant").."/reedmace.lua")
dofile(minetest.get_modpath("plant").."/shrubs.lua")
dofile(minetest.get_modpath("plant").."/vegetables.lua")
dofile(minetest.get_modpath("plant").."/sealife.lua")
dofile(minetest.get_modpath("plant").."/compost.lua")
dofile(minetest.get_modpath("plant").."/aliases.lua")
dofile(minetest.get_modpath("plant").."/crafts.lua")

-- Log message
minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

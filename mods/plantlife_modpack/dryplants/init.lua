-----------------------------------------------------------------------------------------------
local title		= "Grasses" -- former "Dry plants"
local version 	= "0.1.5"
local mname		= "dryplants"
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- textures & ideas partly by Neuromancer

-- License (everything): 	WTFPL
-- Contains code from: 		default, farming 
-- Looked at code from:		darkage, sickle, stairs
-- Dependencies: 			default, farming, biome_lib
-- Supports:				
-----------------------------------------------------------------------------------------------
abstract_dryplants = {}

dofile(minetest.get_modpath("dryplants").."/settings.txt")
if abstract_dryplants.REEDMACE_GENERATES == true then
dofile(minetest.get_modpath("dryplants").."/reedmace.lua")
end
if abstract_dryplants.SMALL_JUNCUS_GENERATES == true then
dofile(minetest.get_modpath("dryplants").."/juncus.lua")
end
if abstract_dryplants.EXTRA_TALL_GRASS_GENERATES == true then
dofile(minetest.get_modpath("dryplants").."/moregrass.lua")
end

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------

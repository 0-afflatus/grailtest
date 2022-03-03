-- Nucleus ----
-- default mod --
-- version 0.1 --
-- See README for licensing and other information.

-- Global namespace

default = {}

default.LIGHT_MAX = 14

-- Files

dofile(minetest.get_modpath("default").."/player.lua")
dofile(minetest.get_modpath("default").."/functions.lua")
--dofile(minetest.get_modpath("default").."/legacy_nodes.lua")

minetest.log("info", "<==={**^**}===>")
minetest.log("info", " n u c l e u s ")
minetest.log("info", " --MTG Legacy--")
minetest.log("info", "<==={**v**}===>")
minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

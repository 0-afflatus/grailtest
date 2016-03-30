simplyslopes = {}
simplyslopes.mod = "original"

	
--= Load functions that creates the differents nodes.
dofile(minetest.get_modpath("simplyslopes").."/functions.lua")

--= Grail Test nodes
dofile(minetest.get_modpath("simplyslopes").."/grailtest.lua")

--[[
--= Default Minetest
dofile(minetest.get_modpath("simplyslopes").."/default_mod.lua")

--= Lapis Mod
if minetest.get_modpath("lapis") then
	dofile(minetest.get_modpath("simplyslopes").."/lapis_mod.lua")
end

--= Wool mod
if minetest.get_modpath("wool") then
	dofile(minetest.get_modpath("simplyslopes").."/wool_mod.lua")
end
]]

print ("[MOD] SimplySlopes loaded")

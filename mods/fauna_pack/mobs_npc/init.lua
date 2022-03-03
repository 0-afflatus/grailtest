
-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

local S = minetest.get_translator and minetest.get_translator("mobs_npc") or
		dofile(path .. "intllib.lua")

mobs.intllib = S


-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_npc = true
	input:close()
	input = nil
end


-- NPCs
dofile(path .. "npc.lua") -- TenPlus1
dofile(path .. "trader.lua")
dofile(path .. "igor.lua")


-- Load custom spawning
if mobs.custom_spawn_npc then
	dofile(path .. "spawn.lua")
end


-- Lucky Blocks
dofile(path .. "/lucky_block.lua")


print (S("[MOD] Mobs Redo NPCs loaded"))

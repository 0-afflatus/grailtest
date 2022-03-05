-- Itemshelf mod by Zorman2000

local modpath = minetest.get_modpath("itemshelf")

-- Load files
dofile(modpath .. "/api.lua")
dofile(modpath .. "/nodes.lua")

dungeon_loot.register({
    {name = "itemshelf:shelf", chance = 0.1, y = {-1023, 512}},
    {name = "itemshelf:half_shelf", chance = 0.1, y = {-1023, 512}},
    {name = "itemshelf:open_half_shelf", chance = 0.1, y = {-1023, 512}},
    {name = "itemshelf:glass_shelf", chance = 0.1, y = {-1023, 512}},
})


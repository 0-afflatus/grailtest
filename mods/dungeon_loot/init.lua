dungeon_loot = {}

dungeon_loot.CHESTS_MIN = 0 -- not necessarily in a single dungeon
dungeon_loot.CHESTS_MAX = 3
dungeon_loot.STACKS_PER_CHEST_MAX = 11

dofile(minetest.get_modpath("dungeon_loot") .. "/loot.lua")
dofile(minetest.get_modpath("dungeon_loot") .. "/mapgen.lua")

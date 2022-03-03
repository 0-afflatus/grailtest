-- spawn.lua rewritten, using this latest function frim mobs_redo :
--
--mobs:spawn({
--            name = "dmobs:dragon",
--            nodes = {"air"},
--            neighbor = {"default:stone"},
--            min_light = 10,
--            max_light = 15,
--            interval = 300,
--            chance = 15000,
--            active_object_count = 2,
--            min_height = -100,
--            max_height = 11000,
--})
--
-- The fonction creates a rule defining how a mob will spawn.
-- Call it several times to create several rules.


-- mobs:spawn() seems to ignore unloaded nodes. So no need checking for loaded mods ?
--local eth = minetest.get_modpath("ethereal")
--local cr = minetest.get_modpath("caverealms")
--local nodes, neighbor = {}, {}

if dmobs.regulars then
	-- friendlies
--	nodes = {"darkage:marble"}
--	neighbor = {"darkage:slate"}
	mobs:spawn({name = "dmobs:hedgehog", nodes = {"group:flora", "element:dirt_with_grass"},
		neighbor = {}, min_light = 0, max_light = 8, interval = 300, chance = 8000, active_object_count = 3, min_height = 0, max_height = 2000})
	mobs:spawn({name = "dmobs:whale", nodes = {"element:water_source"}, neighbor = {"group:sand"},
		min_light = 0, max_light = 15, interval = 300, chance = 16000, active_object_count = 2, min_height = -100, max_height = 0})
	mobs:spawn({name = "dmobs:owl", nodes = {"group:tree"}, neighbor = {},
		min_light = 0, max_light = 7, interval = 300, chance = 16000, active_object_count = 2, min_height = 0, max_height = 2000})
	mobs:spawn({name = "dmobs:gnorm", nodes = {"element:dirt_with_grass"}, neighbor = {},
		min_light = 10, max_light = 15, interval = 300, chance = 32000, active_object_count = 2, min_height = -100, max_height = 0})
	mobs:spawn({name = "dmobs:tortoise", nodes = {"element:water_source", "group:sand"}, neighbor = {},
		min_light = 5, max_light = 10, interval = 300, chance = 8000, active_object_count = 2, min_height = -100, max_height = 500})
	mobs:spawn({name = "dmobs:elephant", nodes = {"element:dirt_with_dry_grass"}, neighbor = {},
		min_light = 10, max_light = 15, interval = 300, chance = 16000, active_object_count = 2, min_height = 0, max_height = 2000})


	-- baddies

	mobs:spawn({name = "dmobs:golem", nodes = {"group:stone"}, neighbor = {}, min_light = 0,
		max_light = 7, interval = 300, chance = 16000, active_object_count = 2, min_height = -32000, max_height = 100})
	mobs:spawn({name = "dmobs:pig_evil", nodes = {"group:leave"}, neighbor = {},
		min_light = 10, max_light = 15, interval = 300, chance = 64000, active_object_count = 2, min_height = 0, max_height = 2000})
	mobs:spawn({name = "dmobs:fox", nodes = {"group:leaves"}, neighbor = {},
		min_light = 0, max_light = 10, interval = 300, chance = 32000, active_object_count = 2, min_height = 0, max_height = 2000})
	mobs:spawn({name = "dmobs:rat", nodes = {"group:stone", "group:sand"}, neighbor = {},
		min_light = 0, max_light = 10, interval = 300, chance = 32000, active_object_count = 2, min_height = -30000, max_height = 100})
	mobs:spawn({name = "dmobs:treeman", nodes = {"group:leaves"}, neighbor = {},
		min_light = 7, max_light = 15, interval = 300, chance = 16000, active_object_count = 2, min_height = 0, max_height = 2000})
	mobs:spawn({name = "dmobs:skeleton", nodes = {"group:stone", "element:desert_sand"}, neighbor = {},
		min_light = 0, max_light = 10, interval = 300, chance = 16000, active_object_count = 2, min_height = -31000, max_height = -1000})

-- Orcs and ogres spawn more often when dragons are disabled
	if not dmobs.dragons then
		mobs:spawn({name = "dmobs:orc",
			nodes = {"element:snowblock", "element:permafrost", "element:dirt_with_ice", "element:dirt_with_snow"},
			neighbor = {}, min_light = 0, max_light = 10, interval = 300, chance = 6000,
			active_object_count = 2, min_height = 0, max_height = 2000})
		mobs:spawn({name = "dmobs:ogre",
			nodes = {"element:snowblock", "element:permafrost", "element:dirt_with_ice", "element:dirt_with_snow"},
			neighbor = {}, min_light = 0, max_light = 10, interval = 300, chance = 16000,
			active_object_count = 2, min_height = 0, max_height = 2000})
	else
		mobs:spawn({name = "dmobs:orc",
			nodes = {"element:snowblock", "element:permafrost", "element:dirt_with_ice", "element:dirt_with_snow"},
			neighbor = {}, min_light = 0, max_light = 10, interval = 300, chance = 8000,
			active_object_count = 2, min_height = 0, max_height = 2000})
		mobs:spawn({name = "dmobs:ogre",
			nodes = {"element:snowblock", "element:permafrost", "element:dirt_with_ice", "element:dirt_with_snow"},
			neighbor = {}, min_light = 0, max_light = 10, interval = 300, chance = 32000,
			active_object_count = 2, min_height = 0, max_height = 2000})
	end
end


-------------
-- dragons --
-------------

-- Generic dragon always spawn, the others only if enabled
mobs:spawn({name = "dmobs:dragon", nodes = {"group:leaves"}, neighbor = {},
	min_light = 5, max_light = 15, interval = 300, chance = 16000, active_object_count = 2, min_height = 0, max_height = 30000})

if dmobs.dragons then
	mobs:spawn({name = "dmobs:dragon1", nodes = {"element:desert_sand", "element:desert_stone"}, neighbor = {},
		min_light = 5, max_light = 15, interval = 300, chance = 24000, active_object_count = 2, min_height = 0, max_height = 30000})
	mobs:spawn({name = "dmobs:dragon2", nodes = {"element:dirt_with_dry_grass"}, neighbor = {},
		min_light = 5, max_light = 15, interval = 300, chance = 24000, active_object_count = 2, min_height = 0, max_height = 30000})
	mobs:spawn({name = "dmobs:dragon3", nodes = {"element:dirt_with_grass_jungle"}, neighbor = {},
		min_light = 0, max_light = 10, interval = 300, chance = 24000, active_object_count = 2, min_height = 0, max_height = 30000})
	mobs:spawn({name = "dmobs:dragon4",
		nodes = {"element:snowblock", "element:permafrost", "element:dirt_with_ice", "element:dirt_with_snow"}, neighbor = {},
		min_light = 5, max_light = 15, interval = 300, chance = 24000, active_object_count = 2, min_height = 0, max_height = 30000})
	mobs:spawn({name = "dmobs:waterdragon", nodes = {"element:water_source"}, neighbor = {"air"},
		min_light = 0, max_light = 15, interval = 300, chance = 32000, active_object_count = 2, min_height = -10, max_height = 100})
	mobs:spawn({name = "dmobs:wyvern", nodes = {"group:leaves"}, neighbor = {},
		min_light = 0, max_light = 10, interval = 300, chance = 32000, active_object_count = 2, min_height = 0, max_height = 30000})
	mobs:spawn({name = "dmobs:dragon_great",
		nodes = {"element:dirt_with_grass_jungle", "element:lava_source"}, neighbor = {},
		min_light = 0, max_light = 15, interval = 300, chance = 32000, active_object_count = 2, min_height = -30000, max_height = 30000})
end

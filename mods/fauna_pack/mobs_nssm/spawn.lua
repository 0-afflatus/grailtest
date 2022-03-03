
-- Spawning parameters

-- ANTS
mobs:spawn_specific("nssm:ant_soldier", {"nssm:ant_dirt"}, {"air"},
	0, 20, 7, 30, 4, -31000, 31000)
mobs:spawn_specific("nssm:ant_worker", {"nssm:ant_dirt"}, {"air"},
	0, 20, 5, 10, 5, -31000, 31000)

-- SPIDERS
mobs:spawn_specific("nssm:tarantula", {"element:dirt_with_grass_jungle", "tree:jungle_trunk", "nssm:web" }, {"air"},
	0, 14, 120, 1000, 3, -31000, 31000)
mobs:spawn_specific("nssm:uloboros", {"element:dirt_with_grass_jungle", "tree:jungle_trunk", "nssm:web" }, {"air"},
	0, 20, 20, 1000, 3, -31000, 31000)

-- SEA
mobs:spawn_specific("nssm:crocodile", {"element:sand","element:water_source"}, {"air"},
	0, 20, 60, 7000, 2, -48, 2)
mobs:spawn_specific("nssm:octopus", {"element:water_source"}, {"element:water_source"},
	0, 20, 60, 40000, 2, -256, 0)

-- DESERT
mobs:spawn_specific("nssm:sandworm", {"element:desert_sand", "element:desert_stone"}, {"air"},
	0, 20, 20, 9000, 2, -31000, 31000)

-- MOUNTAINS
mobs:spawn_specific("nssm:werewolf", {"element:dirt_with_ice"}, {"element:dirt_with_ice"},
	0, 10, 30, 9000, 2, 20, 31000)

-- ICE
mobs:spawn_specific("nssm:white_werewolf", {"element:dirt_with_snow","element:snow"}, {"air"},
	0, 20, 60, 9000, 2, -31000, 31000)

-- SKY
mobs:spawn_specific("nssm:moonheron", {"air"}, {"air"},
	0, 10, 240, 160000, 1, 55, 100)

--mobs:spawn_specfic(name, nodes, neighbors, min_light, max_light, interval, chance,
--	active_object_count, min_height, max_height, day_toggle)

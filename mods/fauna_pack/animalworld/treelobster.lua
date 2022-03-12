mobs:register_mob("animalworld:treelobster", {
	stepheight = 2,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	reach = 2,
	damage = 1,
	hp_min = 20,
	hp_max = 35,
	armor = 100,
	collisionbox = {-0.3, -0.01, -0.2, 0.3, 0.3, 0.2},
	visual = "mesh",
	mesh = "Treelobster.b3d",
	textures = {
		{"texturetreelobster.png"},
	},
	makes_footstep_sound = true,
	sounds = {
	},
	walk_velocity = 0.5,
	run_velocity = 1,
        walk_chance = 20,
	runaway = false,
	jump = false,
	jump_height = 3,
	pushable = true,
	follow = {"plant:junglegrass", "tree:jungle_leaves", "plant:blueberry_bush_leaves", "plant:blueberry_bush_leaves_with_berries"},
	view_range = 10,
	drops = {
		{name = "animalworld:raw_athropod", chance = 1, min = 0, max = 2},
	},
	floats = 0,
	water_damage = 2,
	lava_damage = 5,
        air_damage = 0,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 100,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 250,
		punch_end = 350,

		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:treelobster",
	nodes = {"element:dirt_with_grass_jungle"},
	neighbors = {"plant:junglegrass"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	active_object_count = 4,
	min_height = 5,
	max_height = 40,
	day_toggle = false,
})
end

mobs:register_egg("animalworld:treelobster", ("Tree Lobster"), "atreelobster.png")


mobs:alias_mob("animalworld:treelobster", "animalworld:treelobster") -- compatibility

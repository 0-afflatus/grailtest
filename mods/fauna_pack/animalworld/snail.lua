mobs:register_mob("animalworld:snail", {
	stepheight = 3,
	type = "animal",
	passive = true,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 0,
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.3, 0.2},
	visual = "mesh",
	mesh = "Snail.b3d",
	textures = {
		{"texturesnail.png"},
	},
	makes_footstep_sound = true,
	sounds = {
	},
	walk_velocity = 0.2,
	run_velocity = 0.4,
	runaway = false,

	jump = false,
	jump_height = 3,
	pushable = true,
	follow = {"tree:apple", "element:dirt_with_dry_grass", "plant:seed_wheat", "plant:junglegrass", "plant:seed_oat", "default:kelp", "plant:seaweed", "xocean:kelp",
		"plant:grass", "plant:cucumber", "plant:cabbage", "xocean:seagrass", "plant:lettuce", "plant:junglegrass"},
	view_range = 5,
	drops = {
		{name = "animalworld:snail", chance = 3, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 25,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,


		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 30, 50, 80, false, nil) then return end
	end,
})


if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:snail",
	nodes = {"element:dirt_with_grass", "element:soil_wet"},
	neighbors = {"plant:cucumber", "plant:cabbage_6", "plant:lettuce_5", "plant:beetroot_5", "flowers:dandelion_yellow"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	active_object_count = 3,
	min_height = 6,
	max_height = 40,
})
end

mobs:register_egg("animalworld:snail", ("Snail"), "asnail.png")


mobs:alias_mob("animalworld:snail", "animalworld:snail") -- compatibility

minetest.register_craftitem(":animalworld:escargots", {
	description = ("Escargots"),
	inventory_image = "animalworld_escargots.png",
	on_use = minetest.item_eat(2),
	groups = {food_meat_raw = 1, flammable = 2},
})


minetest.register_craft({
	output = "animalworld:escargots",
	type = "shapeless",
	recipe = 
		{"animalworld:snail", "plant:garlic_clove", "animalworld:butter", "plant:bread"}
})


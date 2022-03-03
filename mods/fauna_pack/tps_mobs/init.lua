-- Based on dmobs by D00Med

minetest.register_privilege("dragontamer", {
	description = "Place, and dig dragon_cave spawn blocks.",
	give_to_singleplayer = false
})

mobs:register_mob("tps_mobs:orc", {
	type = "monster",
	passive = false,
	reach = 2,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 12,
	hp_max = 22,
	armor = 130,
	collisionbox = {-0.4, -1.3, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "orc.b3d",
	textures = {
		{"dmobs_orc.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 2,
		walk_end = 18,
		stand_start = 30,
		stand_end = 40,
		run_start = 2,
		run_end = 18,
		punch_start = 20,
		punch_end = 30,

	},
})

mobs:register_spawn("tps_mobs:orc", {"element:snow","element:snow_block", "element:desert_sand"}, 20, 10, 15000, 1, 31000)

mobs:register_egg("tps_mobs:orc", "Orc", "default_desert_sand.png", 1)

mobs:register_mob("tps_mobs:dragon_cave", {
	type = "monster",
	passive = false,
	attacks_monsters = true,
	damage = 8,
	reach = 2,
	attack_type = "shoot",
	shoot_interval = 2.5,
	arrow = "tps_mobs:fire",
	shoot_offset = 1,
	hp_min = 30,
	hp_max = 45,
	armor = 80,
	collisionbox = {-0.6, -0.9, -0.6, 0.6, 0.6, 0.6},
	visual = "mesh",
	mesh = "dragon2.b3d",
	textures = {
		{"dmobs_dragon.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		shoot_attack = "mobs_fireball",
	},
	walk_velocity = 3,
	run_velocity = 5,
	jump = true,
	fly = true,
	rotate = 180,
	drops = {
		{name = "mobs:lava_orb", chance = 1, min = 1, max = 1},
	},
	fall_speed = 0,
	stepheight = 10,
	water_damage = 2,
	lava_damage = 0,
	light_damage = 0,
	view_range = 10,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 11,
		walk_end = 21,
		stand_start = 11,
		stand_end = 21,
		run_start = 11,
		run_end = 21,
		punch_start = 21,
		punch_end = 31,
	},
})

mobs:register_mob("tps_mobs:dragon", {
	type = "monster",
	passive = false,
	attacks_monsters = true,
	damage = 8,
	reach = 2,
	attack_type = "shoot",
	shoot_interval = 2.5,
	arrow = "tps_mobs:fire",
	shoot_offset = 1,
	hp_min = 30,
	hp_max = 45,
	armor = 80,
	collisionbox = {-0.6, -0.9, -0.6, 0.6, 0.6, 0.6},
	visual = "mesh",
	mesh = "dragon2.b3d",
	textures = {
		{"dmobs_dragon.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		shoot_attack = "mobs_fireball",
	},
	walk_velocity = 3,
	run_velocity = 5,
	jump = true,
	fly = true,
	rotate = 180,
	drops = {
		{name = "mobs:lava_orb", chance = 1, min = 1, max = 1},
	},
	fall_speed = 0,
	stepheight = 10,
	water_damage = 2,
	lava_damage = 0,
	light_damage = 15,
	view_range = 60,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 11,
		walk_end = 21,
		stand_start = 11,
		stand_end = 21,
		run_start = 11,
		run_end = 21,
		punch_start = 21,
		punch_end = 31,
	},
})
--mobs:register_spawn(name, nodes, max_light, min_light, chance, active_object_count, max_height, day_toggle)
mobs:register_spawn("tps_mobs:dragon", {"element:stone"}, 20, 5, 10023, 1, 31000, false)

mobs:register_egg("tps_mobs:dragon", "Dragon", "default_apple.png", 1)
mobs:register_egg("tps_mobs:dragon_cave", "Cave Dragon", "default_apple.png", 1)

mobs:register_arrow("tps_mobs:fire", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"dmobs_fire.png"},
	velocity = 8,
	tail = 1,
	tail_texture = "dmobs_fire.png",

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_node = function(self, pos, node)
--		mobs:explosion(pos, 2, 1, 1)
	end,
})

minetest.register_node("tps_mobs:dragon_spawner", {
	description = "Spawns Cave Dragon",
	drawtype = "normal",
	tiles = {"element_stone.png"},
	paramtype = "light",
	groups = {cracky=3},
	after_place_node = function(pos, placer)
		if minetest.check_player_privs(placer:get_player_name(), {dragontamer = true}) then
		else
			minetest.remove_node(pos)
			minetest.chat_send_player(placer:get_player_name(), "Sorry you need to be a dragon tamer to place this block.")
			return true
		end
	end,

	can_dig = function(pos, player)
		if minetest.check_player_privs(player:get_player_name(), {dragontamer = true}) then
			return true
		else
			minetest.chat_send_player(player:get_player_name(), "Sorry you need to be a dragon tamer to dig this block.")
			return false
		end
	end,
})

minetest.register_abm({
	nodenames = {"tps_mobs:dragon_spawner"},
	interval = 60,
	chance = 1,
	action = function(pos, node)
	local ti = minetest.get_timeofday()
	local t = ti * 24000
	if t > 6000 and t < 22000 then
		local all_objects = minetest.get_objects_inside_radius(pos, 10)
		local count = 0
		for _,obj in ipairs(all_objects) do
		local o = obj:get_entity_name(minetest.registered_entities["name"])
			if obj and o == 'tps_mobs:dragon_cave' then
				count = count + 1
			end
		end
			if count == 0 then
				local pos2 = {x=pos.x, y=pos.y-3, z=pos.z}
				minetest.add_entity(pos2, 'tps_mobs:dragon_cave')
			end
	else
		local all_objects = minetest.get_objects_inside_radius(pos, 10)
		for _,obj in ipairs(all_objects) do
		local o = obj:get_entity_name(minetest.registered_entities["name"])
			if obj and o == "tps_mobs:dragon_cave" then
			obj:remove()
			end
		end
	end
end
})

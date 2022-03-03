
local S = mobs.intllib

-- Npc by TenPlus1

mobs.npc_drops = {
	{"default:pick_steel", 2}, "mobs:meat", {"default:sword_steel", 2},
	{"default:shovel_steel", 2}, "farming:bread", "bucket:bucket_water",
	"default:sapling", "default:tree", "mobs:leather", "default:coral_orange",
	{"default:mese_crystal_fragment", 3}, "default:clay", {"default:sign_wall", 2},
	"default:ladder", "default:copper_lump", "default:blueberries",
	"default:aspen_sapling", "default:permafrost_with_moss"
}

mobs:register_mob("mobs_npc:npc", {
	type = "npc",
	passive = false,
	damage = 3,
	attack_type = "dogfight",
	attacks_monsters = true,
	attack_npcs = false,
	owner_loyal = true,
	pathfinding = true,
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "mobs_character.b3d",
	drawtype = "front",
	textures = {
		{"mobs_npc.png"},
		{"mobs_npc2.png"}, -- female by nuttmeg20
		{"mobs_npc3.png"}, -- male by swagman181818
		{"mobs_npc4.png"} -- female by Sapphire16
	},
	child_texture = {
		{"mobs_npc_baby.png"} -- derpy baby by AmirDerAssassine
	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "default:wood", chance = 1, min = 1, max = 3},
		{name = "default:apple", chance = 2, min = 1, max = 2},
		{name = "default:axe_stone", chance = 5, min = 1, max = 1}
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	follow = {"farming:bread", "mobs:meat", "default:diamond"},
	view_range = 15,
	owner = "",
	order = "follow",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219
	},

	on_rightclick = function(self, clicker)

		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, true, true) then return end

		-- capture npc with net or lasso
		if mobs:capture_mob(self, clicker, nil, 5, 80, false, nil) then return end

		-- protect npc with mobs:protector
		if mobs:protect(self, clicker) then return end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- right clicking with gold lump drops random item from mobs.npc_drops
		if item:get_name() == "default:gold_lump" then

			if not mobs.is_creative(name) then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			local pos = self.object:get_pos()
			local drops = self.npc_drops or mobs.npc_drops
			local drop = drops[math.random(#drops)]
			local chance = 1

			if type(drop) == "table" then
				chance = drop[2]
				drop = drop[1]
			end

			if not minetest.registered_items[drop]
			or math.random(chance) > 1 then
				drop = "default:clay_lump"
			end

			local obj = minetest.add_item(pos, {name = drop})
			local dir = clicker:get_look_dir()

			obj:set_velocity({x = -dir.x, y = 1.5, z = -dir.z})

			--minetest.chat_send_player(name, S("NPC dropped you an item for gold!"))

			return
		end

		-- by right-clicking owner can switch npc between follow, wander and stand
		if self.owner and self.owner == name then

			if self.order == "follow" then

				self.order = "wander"

				minetest.chat_send_player(name, S("NPC will wander."))

			elseif self.order == "wander" then

				self.order = "stand"
				self.state = "stand"
				self.attack = nil

				self:set_animation("stand")
				self:set_velocity(0)

				minetest.chat_send_player(name, S("NPC stands still."))

			elseif self.order == "stand" then

				self.order = "follow"

				minetest.chat_send_player(name, S("NPC will follow you."))
			end
		end
	end
})

if not mobs.custom_spawn_npc then
mobs:spawn({
	name = "mobs_npc:npc",
	nodes = {"default:brick"},
	neighbors = {"default:grass_3"},
	min_light = 10,
	chance = 10000,
	active_object_count = 1,
	min_height = 0,
	day_toggle = true
})
end

mobs:register_egg("mobs_npc:npc", S("Npc"), "default_brick.png", 1)

-- compatibility
mobs:alias_mob("mobs:npc", "mobs_npc:npc")

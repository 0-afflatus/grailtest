--Basic Bow Mod [basic_bow] rev002
--All Code is from Stu's Shooter mod (crossbow)
--License Source Code: 2013 Stuart Jones - LGPL v2.1

basic_bow = {}

minetest.register_alias("bow", "basic_bow:wood_bow")
minetest.register_alias("arrow", "basicbow:arrow")

BASIC_BOW_USES = 300
BASIC_BOW_ARROW_TOOL_CAPS = {damage_groups={fleshy=4}}
BASIC_BOW_ARROW_LIFETIME = 60-- 1  minute
BASIC_BOW_ENABLE_PARTICLE_FX = true
BASIC_BOW_ENABLE_PROTECTION = false
BASIC_BOW_EXPLOSION_TEXTURE = "basic_bow_hit.png"
BASIC_BOW_ALLOW_NODES = true
BASIC_BOW_ALLOW_ENTITIES = true
BASIC_BOW_ALLOW_PLAYERS = true
BASIC_BOW_PLAYER_OFFSET = {x=0, y=1, z=0}
BASIC_BOW_ENTITY_OFFSET = {x=0, y=0, z=0}
BASIC_BOW_ENTITIES = {
"creatures:sheep",
"creatures:zombie",
"creeper:creeper",
"kpgmobs:cow",
"kpgmobs:deer",
"kpgmobs:horse",
"kpgmobs:horse2",
"kpgmobs:horse3",
"kpgmobs:horsearah1",
"kpgmobs:horseh1",
"kpgmobs:horsepegh1",
"kpgmobs:jeraf",
"kpgmobs:medved",
"kpgmobs:pumba",
"kpgmobs:rat",
"kpgmobs:sheep",
"kpgmobs:wolf",
"mobs:chicken",
"mobs:cow",
"mobs:dirt_monster",
"mobs:dungeon_master",
"mobs:goat",
"mobs:kitten",
"mobs:mese_monster",
"mobs:npc",
"mobs:oerkki",
"mobs:pig",
"mobs:pumba",
"mobs:rat",
"mobs:rhino",
"mobs:sand_monster",
"mobs:sheep",
"mobs:spider",
"mobs:stone_monster",
"mobs:tree_monster",
"mobs_goblins:goblin",
"mobs_goblins:goblin_cobble",
"mobs_goblins:goblin_coal",
"mobs_goblins:goblin_iron",
"mobs_goblins:goblin_gold",
"mobs_goblins:goblin_diamond",
"mobs_goblins:goblin_king",
"ninja:ninja",
"pmobs:archer",
"pmobs:dog",
"pmobs:guard",
"pmobs:ninja",
"pmobs:npc",
"pmobs:npc_nurse",
"pmobs:npc_women",
"pmobs:wolf",
"pmobs:yeti",
"pyramids:mummy",
"zombie:zombie",
}

if minetest.is_singleplayer() == true then
	BASIC_BOW_ALLOW_ENTITIES = true
	BASIC_BOW_ALLOW_PLAYERS = true
end

local allowed_entities = {}
for _,v in ipairs(BASIC_BOW_ENTITIES) do
	allowed_entities[v] = 1
end

local function get_dot_product(v1, v2)
	return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
end

local function get_particle_pos(p, v, d)
	return vector.add(p, vector.multiply(v, {x=d, y=d, z=d}))
end

function basic_bow:spawn_particles(pos, texture)
	if BASIC_BOW_ENABLE_PARTICLE_FX == true then
		if type(texture) ~= "string" then
			texture = BASIC_BOW_EXPLOSION_TEXTURE
		end
		local spread = {x=0.1, y=0.1, z=0.1}
		minetest.add_particlespawner(15, 0.3,
			vector.subtract(pos, spread), vector.add(pos, spread),
			{x=-1, y=1, z=-1}, {x=1, y=2, z=1},
			{x=-2, y=-2, z=-2}, {x=2, y=-2, z=2},
			0.1, 0.75, 1, 2, false, texture
		)
	end
end

function basic_bow:punch_node(pos, def)
	local node = minetest.get_node(pos)
	if not node then
		return
	end
	local item = minetest.registered_items[node.name]
	if not item then
		return
	end
	if BASIC_BOW_ENABLE_PROTECTION then
		if minetest.is_protected(pos, def.name) then
			return
		end
	end
	if item.groups then
		for k, v in pairs(def.groups) do
			local level = item.groups[k] or 0
			if level >= v then
				minetest.remove_node(pos)
				--basic_bow:play_node_sound(node, pos)
				if item.tiles then
					if item.tiles[1] then
						basic_bow:spawn_particles(pos, item.tiles[1])
					end
				end
				break
			end
		end
	end
end

function basic_bow:is_valid_object(object)
	if object then
		if object:is_player() == true then
			return BASIC_BOW_ALLOW_PLAYERS
		end
		if BASIC_BOW_ALLOW_ENTITIES == true then
			local luaentity = object:get_luaentity()
			if luaentity then
				if luaentity.name then
					if allowed_entities[luaentity.name] then
						return true
					end
				end
			end
		end
	end
end

function basic_bow:get_intersect_pos(ray, plane, collisionbox)
	local v = vector.subtract(ray.pos, plane.pos)
	local r1 = get_dot_product(v, plane.normal)
	local r2 = get_dot_product(ray.dir, plane.normal)
	if r2 ~= 0 then
		local t = -(r1 / r2)
		local td = vector.multiply(ray.dir, {x=t, y=t, z=t})
		local pt = vector.add(ray.pos, td)
		local pd = vector.subtract(pt, plane.pos)
		if math.abs(pd.x) < collisionbox[4] and
				math.abs(pd.y) < collisionbox[5] and
				math.abs(pd.z) < collisionbox[6] then
			return pt
		end
	end
end

function basic_bow:process_round(round)
	local target = {object=nil, distance=10000}
	local p1 = round.pos
	local v1 = round.ray
	for _,ref in ipairs(shooter.objects) do
		local p2 = vector.add(ref.pos, ref.offset)
		if p1 and p2 and ref.name ~= round.name then
			local d = vector.distance(p1, p2)
			if d < round.def.step and d < target.distance then
				local ray = {pos=p1, dir=v1}
				local plane = {pos=p2, normal={x=-1, y=0, z=-1}}
				local pos = basic_bow:get_intersect_pos(ray, plane, ref.collisionbox)
				if pos then
					target.object = ref.object
					target.pos = pos
					target.distance = d
				end
			end
		end
	end
	if target.object and target.pos then
		local success, pos = minetest.line_of_sight(p1, target.pos, 1)
		if success then
			local user = minetest.get_player_by_name(round.name)
			if user then
				target.object:punch(user, nil, round.def.tool_caps, v1)
				basic_bow:spawn_particles(target.pos, BASIC_BOW_EXPLOSION_TEXTURE)
			end
			return 1
		elseif pos and BASIC_BOW_ALLOW_NODES == true then
			basic_bow:punch_node(pos, round.def)
			return 1
		end
	elseif BASIC_BOW_ALLOW_NODES == true then
		local d = round.def.step
		local p2 = vector.add(p1, vector.multiply(v1, {x=d, y=d, z=d}))
		local success, pos = minetest.line_of_sight(p1, p2, 1)
		if pos then
			basic_bow:punch_node(pos, round.def)
			return 1
		end
	end
end

local function get_animation_frame(dir)
	local angle = math.atan(dir.y)
	local frame = 90 - math.floor(angle * 360 / math.pi)
	if frame < 1 then
		frame = 1
	elseif frame > 180 then
		frame = 180
	end
	return frame
end

local function get_target_pos(p1, p2, dir, offset)
	local d = vector.distance(p1, p2) - offset
	local td = vector.multiply(dir, {x=d, y=d, z=d})
	return vector.add(p1, td)
end

local function punch_object(puncher, object)
	if puncher and basic_bow:is_valid_object(object) then
		if puncher ~= object then
			local dir = puncher:get_look_dir()
			local p1 = puncher:getpos()
			local p2 = object:getpos()
			local tpos = get_target_pos(p1, p2, dir, 0)
			basic_bow:spawn_particles(tpos, BASIC_BOW_EXPLOSION_TEXTURE)
			object:punch(puncher, nil, BASIC_BOW_ARROW_TOOL_CAPS, dir)
		end
	end
end

local function stop_arrow(object, pos, stuck)
	local acceleration = {x=0, y=-10, z=0}
	if stuck == true then
		pos = pos or object:getpos()
		acceleration = {x=0, y=0, z=0}
		object:moveto(pos)
	end
	object:set_properties({
		physical = true,
		collisionbox = {-1/8,-1/8,-1/8, 1/8,1/8,1/8},
	})
	object:setvelocity({x=0, y=0, z=0})
	object:setacceleration(acceleration)
end

minetest.register_craftitem("basic_bow:arrow", {
	description = "Arrow",
	inventory_image = "basic_bow_arrow_inv.png",
})

minetest.register_entity("basic_bow:arrow_entity", {
	physical = false,
	visual = "mesh",
mesh = "basic_bow_arrow.b3d",
	visual_size = {x=1.0, y=1.0},
	textures = {
		"basic_bow_arrow_uv.png",
	},
	timer = 0,
	lifetime = BASIC_BOW_ARROW_LIFETIME,
	player = nil,
	state = "init",
	node_pos = nil,
	collisionbox = {0,0,0, 0,0,0},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
		if staticdata == "expired" then
			self.object:remove()
		end
	end,
	on_punch = function(self, puncher)
		if puncher then
			if puncher:is_player() then
				local stack = "basic_bow:arrow"
				local inv = puncher:get_inventory()
				if inv:room_for_item("main", stack) then
					inv:add_item("main", stack)
					self.object:remove()
				end
			end
		end
	end,
	on_step = function(self, dtime)
		if self.state == "init" then
			return
		end
		self.timer = self.timer + dtime
		self.lifetime = self.lifetime - dtime
		if self.lifetime < 0 then
			self.object:remove()
			return
		elseif self.state == "dropped" then
			return
		elseif self.state == "stuck" then
			if self.timer > 1 then
				if self.node_pos then
					local node = minetest.get_node(self.node_pos)
					if node.name then
						local item = minetest.registered_items[node.name]
						if item then
							if not item.walkable then
								self.state = "dropped"
								stop_arrow(self.object)
								return
							end
						end
					end
				end
				self.timer = 0
			end
			return
		end
		if self.timer > 0.2 then
			local pos = self.object:getpos()
			local dir = vector.normalize(self.object:getvelocity())
			local frame = get_animation_frame(dir)
			self.object:set_animation({x=frame, y=frame}, 0)
			local objects = minetest.get_objects_inside_radius(pos, 5)
			for _,obj in ipairs(objects) do
				if basic_bow:is_valid_object(obj) then
					local collisionbox = {-0.25,-1.0,-0.25, 0.25,0.8,0.25}
					local offset = BASIC_BOW_PLAYER_OFFSET
					if not obj:is_player() then
						offset = BASIC_BOW_ENTITY_OFFSET
						local ent = obj:get_luaentity()
						if ent then
							local def = minetest.registered_entities[ent.name]
							collisionbox = def.collisionbox or collisionbox
						end
					end
					local opos = vector.add(obj:getpos(), offset)
					local ray = {pos=pos, dir=dir}
					local plane = {pos=opos, normal={x=-1, y=0, z=-1}}
					local ipos = basic_bow:get_intersect_pos(ray, plane, collisionbox)
					if ipos then
						punch_object(self.player, obj)
					end
				end
			end
			local p = vector.add(pos, vector.multiply(dir, {x=5, y=5, z=5}))
			local _, npos = minetest.line_of_sight(pos, p, 1)
			if npos then
				local node = minetest.get_node(npos)
				local tpos = get_target_pos(pos, npos, dir, 0.66)
				self.node_pos = npos
				self.state = "stuck"
				stop_arrow(self.object, tpos, true)
				minetest.sound_play("basic_bow_arrow", {pos = self.lastpos, gain = 0.7, max_hear_distance = 40})
			end
			self.timer = 0
		end
	end,
	get_staticdata = function(self)
		return "expired"
	end,
})

minetest.register_tool("basic_bow:wood_bow", {
	description = "Wood Bow",
	inventory_image = "basic_bow_inv.png",
	wield_image = "basic_bow_loaded.png",


	on_use = function(itemstack, user, pointed_thing)
			local inv = user:get_inventory()
	if user:get_inventory():get_stack("main", user:get_wield_index()+1): get_name()=="basic_bow:arrow" then
	if not minetest.setting_getbool("creative_mode") then
	user:get_inventory():remove_item("main", "basic_bow:arrow 1")
	end
		if not minetest.setting_getbool("creative_mode") then
			itemstack:add_wear(65535/BASIC_BOW_USES)
		end
		itemstack = "basic_bow:wood_bow 1 "..itemstack:get_wear()
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.5
			local obj = minetest.add_entity(pos, "basic_bow:arrow_entity")
			local ent = nil
			if obj then
				ent = obj:get_luaentity()
			end
			if ent then
				minetest.sound_play("basic_bow_throw", {object=obj})
				local frame = get_animation_frame(dir)
				obj:setyaw(yaw + math.pi)
				obj:set_animation({x=frame, y=frame}, 0)
				obj:setvelocity({x=dir.x * 14, y=dir.y * 14, z=dir.z * 14})
				if pointed_thing.type ~= "nothing" then
					local ppos = minetest.get_pointed_thing_position(pointed_thing, false)
					local _, npos = minetest.line_of_sight(pos, ppos, 1)
					if npos then
						ppos = npos
						pointed_thing.type = "node"
					end
					if pointed_thing.type == "object" then
						punch_object(user, pointed_thing.ref)
					elseif pointed_thing.type == "node" then
						local node = minetest.get_node(ppos)
						local tpos = get_target_pos(pos, ppos, dir, 0.66)
						minetest.after(0.2, function(object, pos, npos)
							ent.node_pos = npos
							ent.state = "stuck"
							stop_arrow(object, pos, true)
							--basic_bow:play_node_sound(node)
							minetest.sound_play("basic_bow_arrow", {gain = 0.0009, max_hear_distance = 24, pos = pos})
						end, obj, tpos, ppos)
						return itemstack
					end
				end
				obj:setacceleration({x=dir.x * -3, y=-5, z=dir.z * -3})
				ent.player = ent.player or user
				ent.state = "flight"
			end
		end
	end
	return itemstack
end,
})

--[[
--Target node
minetest.register_node("basic_bow:target",{
	description = "Training Target",
	drawtype = 'mesh',
	mesh ='trainingtarget.obj',
	tiles = {"default_pinewood.png"},
	inventory_image = "basic_bow_target.png",
	wield_image = "basic_bow_target.png",
	visual_scale = 0.53,
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=3, oddly_breakable_by_hand=2, dig_immediate=1},
	--walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.48, -0.48, -0.48, 0.48, 0.48, 0.48}
	},
	drop = "basic_bow:target",
})

minetest.register_craft( {
	output = 'basic_bow:target',
	recipe = {
		{'', '', ''},
		{'', 'default:pine_wood', ''},
		{'default:stick', '', 'default:stick'},
	}
})

--]]

minetest.register_craft({
	output = "basic_bow:wood_bow",
	recipe = {
	 	{"material:string", "group:wood", ""},
		{"material:string", "", "group:wood"},
		{"material:string", "group:wood", ""},
	}
})

minetest.register_craft({
	output = "basic_bow:arrow 16",
	recipe = {
		{"group:stick", "group:stick", "group:stone"},
	}
})

minetest.register_craft({
	output = "basic_bow:arrow 16",
	recipe = {
		{"group:stone", "group:stick", "group:stick"},
	}
})

minetest.register_craft({
	output = "basic_bow:arrow 32",
	recipe = {
		{"group:stick", "group:stick", "mineral:steel_ingot"},
	}
})

minetest.register_craft({
	output = "basic_bow:arrow 32",
	recipe = {
		{"mineral:steel_ingot", "group:stick", "group:stick"},
	}
})

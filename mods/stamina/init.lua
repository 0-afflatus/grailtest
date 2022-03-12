
stamina = {players = {}, mod = "redo"}

STAMINA_TICK = tonumber(minetest.settings:get("stamina_tick")) or 1200
							-- time in seconds after that 1 stamina point is taken
STAMINA_TICK_MIN = 4		-- stamina ticks won't reduce stamina below this level
STAMINA_HEALTH_TICK = 4		-- time in seconds after player gets healed/damaged
STAMINA_MOVE_TICK = 0.5		-- time in seconds after the movement is checked
STAMINA_POISON_TICK = 1.25	-- time in seconds after player is poisoned

STAMINA_EXHAUST_DIG = 3		-- exhaustion increased this value after digged node
STAMINA_EXHAUST_PLACE = 1	-- .. after digging node
STAMINA_EXHAUST_MOVE = 1.5	-- .. if player movement detected
STAMINA_EXHAUST_JUMP = 5	-- .. if jumping
STAMINA_EXHAUST_CRAFT = 2	-- .. if player crafts
STAMINA_EXHAUST_PUNCH = 40	-- .. if player punches another player
STAMINA_EXHAUST_LVL = 160	-- at what exhaustion player saturation gets lowered

STAMINA_HEAL = 1			-- number of HP player gets healed after STAMINA_HEALTH_TICK
STAMINA_HEAL_LVL = 5		-- lower level of saturation needed to get healed
STAMINA_STARVE = 1			-- number of HP player gets damaged by stamina after
							-- STAMINA_HEALTH_TICK
STAMINA_STARVE_LVL = 3		-- level of staturation that causes starving

STAMINA_VISUAL_MAX = 20		-- hud bar extends only to 20

SPRINT_SPEED = 0.3			-- how much faster player can run if satiated
SPRINT_JUMP = 0.1			-- how much higher player can jump if satiated
SPRINT_DRAIN = 0.35			-- how fast to drain satation while sprinting (0-1)


local function get_int_attribute(player)

	-- pipeworks fake player check
	if not player or not player.get_attribute then
		return nil
	end

	local meta = player:get_meta()
	local level = meta and meta:get_string("stamina:level")

	if level then
		return tonumber(level)
	end

	return nil
end


local stamina_enabled = minetest.settings:get_bool("enable_stamina") ~= false

local function stamina_update_level(player, level)

	-- pipeworks fake player check
	if not player.get_attribute or not stamina_enabled then
		return nil
	end

	local old = get_int_attribute(player)

	if level == old then -- To suppress HUD update
		return
	end

	-- players without interact priv cannot eat
	if not minetest.check_player_privs(player, {interact = true}) then
		return
	end

	local meta = player and player:get_meta() ; if not meta then return end

	meta:set_string("stamina:level", level)

	player:hud_change(
		stamina.players[player:get_player_name()].hud_id,
		"number",
		math.min(STAMINA_VISUAL_MAX, level)
	)
end


-- global function for mods to amend stamina level
stamina.change = function(player, change)

	local name = player:get_player_name()

	if not name or not change or change == 0 then
		return false
	end

	local level = get_int_attribute(player) + change

	if level < 0 then level = 0 end

	if level > STAMINA_VISUAL_MAX then level = STAMINA_VISUAL_MAX end

	stamina_update_level(player, level)

	return true
end


local function exhaust_player(player, v)

	if not player
	or not player.is_player
	or not player:is_player()
	or not player.set_attribute then
		return
	end

	local name = player:get_player_name()

	if not name then
		return
	end

	local exhaustion = stamina.players[name].exhaustion + v

	if exhaustion > STAMINA_EXHAUST_LVL then

		exhaustion = 0

		local h = get_int_attribute(player)

		if h > 0 then
			stamina_update_level(player, h - 1)
		end
	end

	stamina.players[name].exhaustion = exhaustion
end


-- Sprint settings and function
local enable_sprint = minetest.settings:get_bool("sprint") ~= false
local enable_sprint_particles = minetest.settings:get_bool("sprint_particles") ~= false
local monoids = minetest.get_modpath("player_monoids")
local pova_mod = minetest.get_modpath("pova")


local function set_sprinting(name, sprinting)

	local player = minetest.get_player_by_name(name) ; if not player then return end

	-- get player physics
	local def = player:get_physics_override()

--print ("---", def.speed, def.jump)

	if sprinting == true and not stamina.players[name].sprint then

		if monoids then

			stamina.players[name].sprint = player_monoids.speed:add_change(
					player, def.speed + SPRINT_SPEED)

			stamina.players[name].jump = player_monoids.jump:add_change(
					player, def.jump + SPRINT_JUMP)

		elseif pova_mod then

			pova.add_override(name, "sprint",
					{speed = SPRINT_SPEED, jump = SPRINT_JUMP})

			pova.do_override(player)

			stamina.players[name].sprint = true
		else
			player:set_physics_override({
				speed = def.speed + SPRINT_SPEED,
				jump = def.jump + SPRINT_JUMP,
			})

			stamina.players[name].sprint = true
		end

	elseif sprinting == false
	and stamina.players[name]
	and stamina.players[name].sprint then

		if monoids then

			player_monoids.speed:del_change(player, stamina.players[name].sprint)
			player_monoids.jump:del_change(player, stamina.players[name].jump)

			stamina.players[name].sprint = nil
			stamina.players[name].jump = nil

		elseif pova_mod then

			pova.del_override(name, "sprint")
			pova.do_override(player)

			stamina.players[name].sprint = nil
		else
			player:set_physics_override({
				speed = def.speed - SPRINT_SPEED,
				jump = def.jump - SPRINT_JUMP,
			})

			stamina.players[name].sprint = nil
		end
	end
end


local function head_particle(player, texture)

	if not player then return end

	local prop = player:get_properties()
	local pos = player:get_pos() ; pos.y = pos.y + (prop.eye_height or 1.23) -- mouth level
	local dir = player:get_look_dir()


	minetest.add_particlespawner({
		amount = 5,
		time = 0.1,
		minpos = pos,
		maxpos = pos,
		minvel = {x = dir.x - 1, y = dir.y, z = dir.z - 1},
		maxvel = {x = dir.x + 1, y = dir.y, z = dir.z + 1},
		minacc = {x = 0, y = -5, z = 0},
		maxacc = {x = 0, y = -9, z = 0},
		minexptime = 1,
		maxexptime = 1,
		minsize = 1,
		maxsize = 2,
		texture = texture
	})
end

local function drunk_tick()

	for _,player in ipairs(minetest.get_connected_players()) do

		local name = player:get_player_name()

		if name
		and stamina.players[name]
		and stamina.players[name].drunk then

			-- play burp sound every 20 seconds when drunk
			local num = stamina.players[name].drunk

			if num and num > 0 and math.floor(num / 20) == num / 20 then

				head_particle(player, "bubble.png")

				minetest.sound_play("stamina_burp",
						{to_player = name, gain = 0.7}, true)
			end

			stamina.players[name].drunk = stamina.players[name].drunk - 1

			if stamina.players[name].drunk < 1 then

				stamina.players[name].drunk = nil
				stamina.players[name].units = 0

				if not stamina.players[name].poisoned then

					player:hud_change(stamina.players[name].hud_id,
							"text", "stamina_hud_fg.png")
				end
			end

			-- effect only works when not riding boat/cart/horse etc.
			if not player:get_attach() then

				local yaw = player:get_look_horizontal() + math.random(-0.5, 0.5)

				player:set_look_horizontal(yaw)
			end
		end
	end
end


local function health_tick()

	for _,player in ipairs(minetest.get_connected_players()) do

		local name = player:get_player_name()

		if name then

			local air = player:get_breath() or 0
			local hp = player:get_hp()
			local h = get_int_attribute(player)

			-- damage player by 1 hp if saturation is < 2
			if h and h < STAMINA_STARVE_LVL
			and hp > 0 then
				player:set_hp(hp - STAMINA_STARVE, {hunger = true})
			end

			-- don't heal if drowning or dead or poisoned
			if h and h >= STAMINA_HEAL_LVL
			and h >= hp
			and hp > 0
			and air > 0
			and not stamina.players[name].poisoned then

				player:set_hp(hp + STAMINA_HEAL)

				stamina_update_level(player, h - 1)
			end
		end
	end
end


local function action_tick()

	for _,player in ipairs(minetest.get_connected_players()) do

		local controls = player and player:get_player_control()

		-- Determine if the player is walking or jumping
		if controls then

			if controls.jump then
				exhaust_player(player, STAMINA_EXHAUST_JUMP)

			elseif controls.up
			or controls.down
			or controls.left
			or controls.right then
				exhaust_player(player, STAMINA_EXHAUST_MOVE)
			end
		end

		--- START sprint
		if enable_sprint then

			local name = player and player:get_player_name()

			-- check if player can sprint (stamina must be over 6 points)
			if name
			and stamina.players[name]
			and not stamina.players[name].poisoned
			and not stamina.players[name].drunk
			and controls and controls.aux1 and controls.up
			and not minetest.check_player_privs(player, {fast = true})
			and get_int_attribute(player) > 6 then

				set_sprinting(name, true)

				-- create particles behind player when sprinting
				if enable_sprint_particles then

					local pos = player:get_pos()
					local node = minetest.get_node({
						x = pos.x,
						y = pos.y - 1,
						z = pos.z
					})

					if node.name ~= "air" then

						minetest.add_particlespawner({
							amount = 5,
							time = 0.01,
							minpos = {x = pos.x - 0.25, y = pos.y + 0.1, z = pos.z - 0.25},
							maxpos = {x = pos.x + 0.25, y = pos.y + 0.1, z = pos.z + 0.25},
							minvel = {x = -0.5, y = 1, z = -0.5},
							maxvel = {x = 0.5, y = 2, z = 0.5},
							minacc = {x = 0, y = -5, z = 0},
							maxacc = {x = 0, y = -12, z = 0},
							minexptime = 0.25,
							maxexptime = 0.5,
							minsize = 0.5,
							maxsize = 1.0,
							vertical = false,
							collisiondetection = false,
							texture = "default_dirt.png"
						})

					end
				end

				-- Lower the player's stamina when sprinting
				local level = get_int_attribute(player)

				stamina_update_level(player,
						level - (SPRINT_DRAIN * STAMINA_MOVE_TICK))

			elseif name then
				set_sprinting(name, false)
			end
		end
		-- END sprint
	end
end


local function poison_tick()

	for _,player in ipairs(minetest.get_connected_players()) do

		local name = player and player:get_player_name()

		if name
		and stamina.players[name]
		and stamina.players[name].poisoned
		and stamina.players[name].poisoned > 0 then

			stamina.players[name].poisoned =
				stamina.players[name].poisoned - 1

			local hp = player:get_hp() - 1

			head_particle(player, "stamina_poison_particle.png")

			if hp > 0 then
				player:set_hp(hp, {poison = true})
			end

		elseif name
		and stamina.players[name]
		and stamina.players[name].poisoned then

			if not stamina.players[name].drunk then

				player:hud_change(stamina.players[name].hud_id,
						"text", "stamina_hud_fg.png")
			end

			stamina.players[name].poisoned = nil
		end
	end
end


local function stamina_tick()

	for _,player in ipairs(minetest.get_connected_players()) do

		local h = player and get_int_attribute(player)

		if h and h > STAMINA_TICK_MIN then
			stamina_update_level(player, h - 1)
		end
	end
end


-- Time based stamina functions
local stamina_timer, health_timer, action_timer, poison_timer, drunk_timer = 0,0,0,0,0

local function stamina_globaltimer(dtime)

	stamina_timer = stamina_timer + dtime
	health_timer = health_timer + dtime
	action_timer = action_timer + dtime
	poison_timer = poison_timer + dtime
	drunk_timer = drunk_timer + dtime

	-- simulate drunk walking (thanks LumberJ)
	if drunk_timer > 1.0 then
		drunk_tick() ; drunk_timer = 0
	end

	-- hurt player when poisoned
	if poison_timer > STAMINA_POISON_TICK then
		poison_tick() ; poison_timer = 0
	end

		-- sprint control and particle animation
	if action_timer > STAMINA_MOVE_TICK then
		action_tick() ; action_timer = 0
	end

	-- lower saturation by 1 point after STAMINA_TICK
	if stamina_timer > STAMINA_TICK then
		stamina_tick() ; stamina_timer = 0
	end

	-- heal or damage player, depending on saturation
	if health_timer > STAMINA_HEALTH_TICK then
		health_tick() ; health_timer = 0
	end
end


-- override core.do_item_eat() so we can redirect hp_change to stamina
core.do_item_eat = function(hp_change, replace_with_item, itemstack, user, pointed_thing)

	if user.is_fake_player then
		return -- abort if called by fake player (eg. pipeworks-wielder)
	end

	local old_itemstack = itemstack

	itemstack = stamina.eat(
			hp_change, replace_with_item, itemstack, user, pointed_thing)

	for _, callback in pairs(core.registered_on_item_eats) do

		local result = callback(hp_change, replace_with_item, itemstack, user,
				pointed_thing, old_itemstack)

		if result then
			return result
		end
	end

	return itemstack
end


-- not local since it's called from within core context
function stamina.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)

	if not itemstack or not user then
		return itemstack
	end

	local level = get_int_attribute(user) or 0

	if level >= STAMINA_VISUAL_MAX then
		return itemstack
	end

	local name = user:get_player_name()

	if hp_change > 0 then

		stamina_update_level(user, level + hp_change)

	elseif hp_change < 0 then

		-- assume hp_change < 0
		user:hud_change(stamina.players[name].hud_id, "text", "stamina_hud_poison.png")

		stamina.players[name].poisoned = -hp_change
	end

	-- if {drink=1} group set then use sip sound instead of default eat
	local snd = "stamina_eat"
	local itemname = itemstack:get_name()
	local def = minetest.registered_items[itemname]

	if def and def.groups and def.groups.drink then
		snd = "stamina_sip"
	end

	minetest.sound_play(snd, {to_player = name, gain = 0.7}, true)

	-- particle effect when eating
	local texture  = minetest.registered_items[itemname].inventory_image

	head_particle(user, texture)

	-- if player drinks milk then stop poison and being drunk
	local item_name = itemstack:get_name() or ""
	if item_name == "mobs:bucket_milk"
	or item_name == "mobs:glass_milk"
	or item_name == "farming:soy_milk" then

		stamina.players[name].poisoned = 0
		stamina.players[name].drunk = 0
	end

	itemstack:take_item()

	if replace_with_item then

		if itemstack:is_empty() then
			itemstack:add_item(replace_with_item)
		else
			local inv = user:get_inventory()

			if inv:room_for_item("main", {name = replace_with_item}) then
				inv:add_item("main", replace_with_item)
			else
				local pos = user:get_pos()

				if pos then core.add_item(pos, replace_with_item) end
			end
		end
	end

	-- check for alcohol
	local units = minetest.registered_items[itemname].groups
			and minetest.registered_items[itemname].groups.alcohol or 0

	if units > 0 then

		stamina.players[name].units = (stamina.players[name].units or 0) + 1

		if stamina.players[name].units > 3 then

			stamina.players[name].drunk = 60
			stamina.players[name].units = 0

			user:hud_change(stamina.players[name].hud_id, "text",
					"stamina_hud_poison.png")

			minetest.chat_send_player(name,
					minetest.get_color_escape_sequence("#1eff00")
					.. "You suddenly feel tipsy!")
		end
	end

	return itemstack
end


-- stamina is disabled if damage is disabled
if minetest.settings:get_bool("enable_damage")
and minetest.settings:get_bool("enable_stamina") ~= false then

	minetest.register_on_joinplayer(function(player)

		if not player then return end

		local level = STAMINA_VISUAL_MAX -- TODO

		if get_int_attribute(player) then

			level = math.min(get_int_attribute(player), STAMINA_VISUAL_MAX)
		else
			local meta = player:get_meta()

			meta:set_string("stamina:level", level)
		end

		local name = player:get_player_name()

		local id = player:hud_add({
			name = "stamina",
			hud_elem_type = "statbar",
			position = {x = 0.5, y = 1},
			size = {x = 24, y = 24},
			text = "stamina_hud_fg.png",
			number = level,
			alignment = {x = -1, y = -1},
			offset = {x = -266, y = -110},
			max = 0
		})

		stamina.players[name] = {
			hud_id = id,
			exhaustion = 0,
			poisoned = nil,
			drunk = nil,
			sprint = nil
		}
	end)

	minetest.register_on_respawnplayer(function(player)

		local name = player:get_player_name() ; if not name then return end

		if stamina.players[name].poisoned
		or stamina.players[name].drunk then
			player:hud_change(stamina.players[name].hud_id, "text", "stamina_hud_fg.png")
		end

		stamina.players[name].exhaustion = 0
		stamina.players[name].poisoned = nil
		stamina.players[name].drunk = nil
		stamina.players[name].sprint = nil

		stamina_update_level(player, STAMINA_VISUAL_MAX)
	end)

	minetest.register_globalstep(stamina_globaltimer)

	minetest.register_on_placenode(function(pos, oldnode, player, ext)
		exhaust_player(player, STAMINA_EXHAUST_PLACE)
	end)

	minetest.register_on_dignode(function(pos, oldnode, player, ext)
		exhaust_player(player, STAMINA_EXHAUST_DIG)
	end)

	minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
		exhaust_player(player, STAMINA_EXHAUST_CRAFT)
	end)

	minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch,
			tool_capabilities, dir, damage)
		exhaust_player(hitter, STAMINA_EXHAUST_PUNCH)
	end)

else

	-- create player table on join
	minetest.register_on_joinplayer(function(player)
		if player then
			stamina.players[player:get_player_name()] = {
				poisoned = nil, sprint = nil, drunk = nil, exhaustion = 0}
		end
	end)
end

-- clear when player leaves
minetest.register_on_leaveplayer(function(player)
	if player then
		stamina.players[player:get_player_name()] = nil
	end
end)


--lucky blocks (if damage and stamina active)
if minetest.get_modpath("lucky_block")
and minetest.settings:get_bool("enable_damage")
and minetest.settings:get_bool("enable_stamina") ~= false then

	local effect_me = function(pos, player, def)

		local green = minetest.get_color_escape_sequence("#bada55")
		local name = player:get_player_name() ; if not name then return end

		if def.poison or def.drunk then

			player:hud_change(stamina.players[name].hud_id,
					"text", "stamina_hud_poison.png")
		end

		if def.poison and def.poison > 0 then

			stamina.players[name].poisoned = def.poison

			minetest.chat_send_player(name,
					green .. "Seems you have been poisoned!")

		elseif def.drunk and def.drunk > 0 then

			stamina.players[name].drunk = def.drunk

			minetest.chat_send_player(name,
					green .. "You seem a little tipsy!")
		end
	end

	lucky_block:add_blocks({
		{"cus", effect_me, {poison = 5} },
		{"cus", effect_me, {poison = 10} },
		{"cus", effect_me, {drunk = 30} }
	})
end

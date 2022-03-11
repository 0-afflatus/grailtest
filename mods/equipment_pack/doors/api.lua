--------------------------------------------------------
-- Minetest :: Doors Redux Mod (doors)
--
-- See README.txt for licensing and other information.
-- Copyright (c) 2016-2020, Leslie E. Krause
--
-- ./games/minetest_game/mods/doors/api.lua
--------------------------------------------------------

doors = { }

local config = minetest.load_config( )

doors.LOCKING_MODE_UNDEFINED = 0
doors.LOCKING_MODE_UNLOCKED = 1
doors.LOCKING_MODE_LOCKED = 2
doors.LOCKING_MODE_SHARED = 3
doors.CLOSING_MODE_UNDEFINED = 0
doors.CLOSING_MODE_MANUAL = 1
doors.CLOSING_MODE_AUTOCLOSE = 2
doors.CLOSING_MODE_HOLDOPEN = 3
doors.ADJUST_LOCKING = 1
doors.ADJUST_CLOSING = 2

minetest.register_node( "doors:hidden", {
	description = "Hidden Door Segment",
	drawtype = "nodebox",  -- cannot use air-like, since falling nodes would be stuck
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	pointable = false,
	diggable = false,
	buildable_to = false,
	floodable = false,
	drop = "",

	groups = { not_in_creative_inventory = 1 },
	on_blast = function( ) end,

	tiles = { "blank.png" },
	-- 1px transparent block inside door hinge near node top.
	nodebox = {
		type = "fixed",
		fixed = { -15/32, 13/32, -15/32, -13/32, 1/2, -13/32 },
	},
	-- collision_box needed otherise selection box would be full node size
	collision_box = {
		type = "fixed",
		fixed = { -15/32, 13/32, -15/32, -13/32, 1/2, -13/32 },
	},
} )

-- table used to aid door opening/closing
-- tier 1 = hand, tier 2 = face, and tier 3 = is_open

local offset_transform = {
	left = {
		{ [false] = { suffix = "_a", param2 = 3 }, [true] = { suffix = "_b", param2 = 1 } },
		{ [false] = { suffix = "_a", param2 = 0 }, [true] = { suffix = "_b", param2 = 2 } },
		{ [false] = { suffix = "_a", param2 = 1 }, [true] = { suffix = "_b", param2 = 3 } },
		{ [false] = { suffix = "_a", param2 = 2 }, [true] = { suffix = "_b", param2 = 0 } },
	},
	right = {
		{ [false] = { suffix = "_b", param2 = 1 }, [true] = { suffix = "_a", param2 = 3 } },
		{ [false] = { suffix = "_b", param2 = 2 }, [true] = { suffix = "_a", param2 = 0 } },
		{ [false] = { suffix = "_b", param2 = 3 }, [true] = { suffix = "_a", param2 = 1 } },
		{ [false] = { suffix = "_b", param2 = 0 }, [true] = { suffix = "_a", param2 = 2 } },
	},
}

local center_transform = {
	left = {
		{ [false] = { suffix = "_c", param2 = 2 }, [true] = { suffix = "_d", param2 = 2 } },
		{ [false] = { suffix = "_c", param2 = 3 }, [true] = { suffix = "_d", param2 = 3 } },
		{ [false] = { suffix = "_c", param2 = 0 }, [true] = { suffix = "_d", param2 = 0 } },
		{ [false] = { suffix = "_c", param2 = 1 }, [true] = { suffix = "_d", param2 = 1 } },
	},
	right = {
		{ [false] = { suffix = "_c", param2 = 0 }, [true] = { suffix = "_e", param2 = 0 } },
		{ [false] = { suffix = "_c", param2 = 1 }, [true] = { suffix = "_e", param2 = 1 } },
		{ [false] = { suffix = "_c", param2 = 2 }, [true] = { suffix = "_e", param2 = 2 } },
		{ [false] = { suffix = "_c", param2 = 3 }, [true] = { suffix = "_e", param2 = 3 } },
	},
}

---------------------------------
-- get_door_properties( )
---------------------------------

local function get_door_properties( state, param2 )
	local is_open = state % 2 == 1
	local type = state < 4 and "offset" or "center"
	local hand = math.floor( state / 2 ) % 2 == 0 and "left" or "right"
	local face = param2 + 1

	return is_open, type, hand, face
end

---------------------------------
-- get_door_transform( )
---------------------------------

local function get_door_transform( state, param2, toggle_open, switch_type, switch_hand, rotate_face )
	local is_open, type, hand, face = get_door_properties( state, param2 )

	-- NB: lots of nightmarish state calculations in order to maintain
	-- backwards compatibility, so venture forward at your own risk :)

	if toggle_open then
		state = is_open and state - 1 or state + 1		-- add 1 for open, subtract 1 for close
		is_open = not is_open
	end
	if switch_type then
		state = type == "offset" and state + 4 or state - 4	-- add 4 for center, substract 4 for offset
		type = type == "offset" and "center" or "offset"

		-- need to rotate for seamless switch (also avoid face index overflow)
		local face_translation = {
			center = { [false] = 1, [true] = 2 },
			offset = { [false] = 0, [true] = 1 },
		}
		face = ( face + face_translation[ type ][ is_open ] ) % 4 + 1
	end

	if switch_hand then
		state = hand == "left" and state + 2 or state - 2	-- add 2 for left, subtract 2 for right
		hand = hand == "left" and "right" or "left"

		-- need to rotate for seamless switch (also avoid face index overflow)
		local face_translation = {
			center = { left = 3, right = 1 },
			offset = { left = 0, right = 2 },
		}
		if is_open and type == "center" then			-- hack to correct open center doors :P
			face = face + 2
		end
		face = ( face + face_translation[ type ][ hand ] ) % 4 + 1
	end
	if rotate_face then
		face = face % 4 + 1
	end

	return is_open, state, type == "offset" and
		offset_transform[ hand ][ face ][ is_open ] or
		center_transform[ hand ][ face ][ is_open ]
end

---------------------------------
-- is_door_protected( )
---------------------------------

local function is_door_protected( pos, ndef, player_name )
	local owner = minetest.get_meta( pos ):get_string( "doors_owner" )

	if minetest.get_player_privs( player_name ).protection_bypass then return false end

	return ndef.protected and player_name ~= owner
end

---------------------------------
-- is_door_locked( )
---------------------------------

local function is_door_locked( pos, ndef, player_name )
	local meta = minetest.get_meta( pos )
	local locking_mode = meta:get_int( "locking_mode" )
	local owner = meta:get_string( "doors_owner" )

	if minetest.get_player_privs( player_name ).protection_bypass then return false end

	if locking_mode == doors.LOCKING_MODE_UNDEFINED then
		if ndef.protected and player_name ~= owner then
			return true
		end
	elseif locking_mode == doors.LOCKING_MODE_LOCKED then
		if ndef.protected and player_name ~= owner or not ndef.protected then
			return true
		end
	elseif locking_mode == doors.LOCKING_MODE_SHARED then
		if minetest.is_protected( pos, player_name ) then
			return true
		end
	end

	return false
end

local is_trapdoor_locked = is_door_locked

---------------------------------
-- update_door_hardware( )
---------------------------------

--[[
local function update_door_hardware( pos, state, param2 )
	local node = minetest.get_node_above( pos )

	if node.name ~= "doors:hidden" then
		local ndef = minetest.registered_nodes[ node.name ]
		local is_open, type, hand, face = get_door_properties( state, param2 )

		-- update door hardware
		local translate = {
			center = {
				left = { [false] = "e", [false] = "f" },
				right = { [false] = "c", [false] = "d" },
			},
			offset = {
				left = { [false] = "a", [false] = "b" },
				right = { [false] = "a", [false] = "b" },
			}
		}

		minetest.swap_node( pos, {
			name = ndef.base_name .. translate[ type ][ face ][ is_open ],
			param2 = param2
		} )
	end
end]]

---------------------------------
-- toggle_door( )
---------------------------------

local function toggle_door( pos, node, player )
	local meta = minetest.get_meta( pos )
	local ndef = minetest.registered_nodes[ node.name ]
	local closing_mode = meta:get_int( "closing_mode" )

	if player and is_door_locked( pos, ndef, player:get_player_name( ) ) then
		minetest.sound_play( ndef.sound_locked, { pos = pos, gain = 0.3, max_hear_distance = 10 } )
		return false
	end

	local state = meta:get_int( "state" )
	local is_open, state, transform = get_door_transform( state, node.param2, true, false, false )
	local new_name = ndef.base_name .. transform.suffix
	local new_param2 = transform.param2

	if not is_open and closing_mode == doors.CLOSING_MODE_HOLDOPEN then
		return false   -- abort since this door does not close

	elseif is_open and closing_mode == doors.CLOSING_MODE_AUTOCLOSE then
		minetest.after( config.autoclose_timeout, function ( )
			local check_node = minetest.get_node( pos )
			local check_state = minetest.get_meta( pos ):get_int( "state" )
		
			if check_node.name ~= new_name or check_node.param2 ~= new_param2 or check_state ~= state then
				return   -- apparently something changed, so abort
			end

			toggle_door( pos, check_node )   -- pass nil player, since security doesn't matter
		end )
	end

	if is_open then
		-- if opened, play open sound
		minetest.sound_play( ndef.sound_open, {
			pos = pos, gain = 0.3, max_hear_distance = 10
		} )
	else
		-- if closed, play close sound
		minetest.sound_play( ndef.sound_close, {
			pos = pos, gain = 0.3, max_hear_distance = 10
		} )
	end

	minetest.swap_node( pos, { name = new_name, param2 = new_param2 } )
	meta:set_int( "state", state )

--	update_door_hardware( vector.offset_y( pos ), state, param2 )
end

---------------------------------
-- toggle_trapdoor( )
---------------------------------

function toggle_trapdoor( pos, node, player )
	local meta = minetest.get_meta( pos )
	local ndef = minetest.registered_nodes[ node.name ]
	local closing_mode = meta:get_int( "closing_mode" )

	if player and is_trapdoor_locked( pos, ndef, player:get_player_name( ) ) then
		minetest.sound_play( ndef.sound_locked, { pos = pos, gain = 0.3, max_hear_distance = 10 } )
		return false
	end

	if node.name == ndef.base_name then
		local new_name = ndef.base_name .. "_open"

		if closing_mode == doors.CLOSING_MODE_AUTOCLOSE then
			minetest.after( config.autoclose_timeout, function ( )
				local check_node = minetest.get_node( pos )
		
				if check_node.name ~= new_name or check_node.param2 ~= node.param2 then
					return   -- apparently something changed, so abort
				end

				toggle_trapdoor( pos, check_node )   -- pass nil player, since security doesn't matter
			end )
		end

		minetest.sound_play( ndef.sound_open, { pos = pos, gain = 0.3, max_hear_distance = 10 } )
		minetest.swap_node( pos, { name = new_name, param1 = node.param1, param2 = node.param2 } )
	else
		local new_name = ndef.base_name

		if closing_mode == doors.CLOSING_MODE_HOLDOPEN then
			return false   -- abort since this trapdoor does not close
		end

		minetest.sound_play( ndef.sound_close, { pos = pos, gain = 0.3, max_hear_distance = 10 } )
		minetest.swap_node( pos, { name = ndef.base_name, param1 = node.param1, param2 = node.param2 } )
	end
end

---------------------------------
-- on_adjust_door( )
---------------------------------

local function on_adjust_door( pos, node, player, mode )
	local meta = minetest.get_meta( pos )
	local ndef = minetest.registered_nodes[ node.name ]
	local locking_mode = meta:get_int( "locking_mode" )
	local closing_mode = meta:get_int( "closing_mode" )
	local player_name = player:get_player_name( )

	if is_door_protected( pos, ndef, player_name ) then return false end

	if mode == doors.ADJUST_LOCKING and ndef.is_lockable and locking_mode > 0 then
		local mode_defs = { "unlocked", "locked", "shared" }

		locking_mode = locking_mode % 3 + 1
		minetest.chat_send_player( player_name, "Door locking is set to " .. mode_defs[ locking_mode ] .. "." )
		meta:set_int( "locking_mode", locking_mode )

		return true

	elseif mode == doors.ADJUST_CLOSING and ndef.is_closable and closing_mode > 0 then
		local mode_defs = { "manual", "auto-close", "hold-open" }

		closing_mode = closing_mode % 3 + 1
		minetest.chat_send_player( player_name, "Door closing is set to " .. mode_defs[ closing_mode ] .. "." )
		meta:set_int( "closing_mode", closing_mode )

		return true
	end

	minetest.chat_send_player( player_name, "This door does not provide locking and/or closing adjustments." )
	return false
end

local on_adjust_trapdoor = on_adjust_door

---------------------------------
-- on_rotate_door( )
---------------------------------

local function on_rotate_door( pos, node, player, mode )
	local ndef = minetest.registered_nodes[ node.name ]
	local meta = minetest.get_meta( pos )
	local state = meta:get_int( "state" )

	if is_door_protected( pos, ndef, player:get_player_name( ) ) then return false end

	if mode == screwdriver.ROTATE_FACE then
		-- alternate hand between left <-> right
		local is_open, state, transform = get_door_transform( state, node.param2, false, false, true, false )

		minetest.swap_node( pos, { name = ndef.base_name .. transform.suffix, param2 = transform.param2 } )
		meta:set_int( "state", state )

		return true

	elseif mode == screwdriver.ROTATE_AXIS and ndef.can_center and ndef.can_offset then
		-- alternate type between center <-> offset
		local is_open, state, transform = get_door_transform( state, node.param2, false, true, false, false )

		minetest.swap_node( pos, { name = ndef.base_name .. transform.suffix, param2 = transform.param2 } )
		meta:set_int( "state", state )

		return true
	end

	return false
end

local on_rotate_trapdoor = function ( ) end

---------------------------------
-- doors.get_door_or_nil( )
---------------------------------

doors.get_door_or_nil = function ( pos )
       	local node = minetest.get_node( pos )
	local meta = minetest.get_meta( pos )
	local ndef = minetest.registered_nodes[ node.name ]
	local self = { }

	if ndef.groups.trapdoor then
		return doors.get_trapdoor_or_nil( pos )
	elseif not ndef.groups.door then
		return nil
	end

	self.get_properties = function ( )
	       	local state = meta:get_int( "state" )
		local is_open, type, hand, face = get_door_properties( state, node.param2 )

		return { is_open = is_open, type = type, hand = hand, face = face }
	end
	self.close = function ( )
		local state = meta:get_int( "state" )
		local is_open, state, transform = get_door_transform( state, node.param2, true, false, false )
		local new_name = ndef.base_name .. transform.suffix
		local new_param2 = transform.param2

		if not is_open then
			minetest.sound_play( ndef.sound_close, { pos = pos, gain = 0.3, max_hear_distance = 10 } )
			minetest.swap_node( pos, { name = new_name, param2 = new_param2 } )
			meta:set_int( "state", state )
		end
	end
	self.open = function ( )
		local state = meta:get_int( "state" )
		local is_open, state, transform = get_door_transform( state, node.param2, true, false, false )
		local new_name = ndef.base_name .. transform.suffix
		local new_param2 = transform.param2

		if is_open then
			minetest.sound_play( ndef.sound_open, { pos = pos, gain = 0.3, max_hear_distance = 10 } )
			minetest.swap_node( pos, { name = new_name, param2 = new_param2 } )
			meta:set_int( "state", state )
		end
	end
	self.state = function ( )  -- for backwards compatibility
		return self.get_properties( ).is_open
	end

	return self
end

doors.get = doors.get_door_or_nil  -- for backwards compatibility

---------------------------------
-- doors.get_trapdoor_or_nil( )
---------------------------------

doors.get_trapdoor_or_nil = function ( pos )
       	local node = minetest.get_node( pos )
	local meta = minetest.get_meta( pos )
	local ndef = minetest.registered_nodes[ node.name ]
	local self = { }

	if not ndef.groups.trapdoor then return end

	self.get_properties = function ( )
		return { is_open = node.name == ndef.base_name .. "_open", face = node.param2 + 1 }
	end
	self.close = function ( )
		if node.name == ndef.base_name .. "_open" then
			local new_name = ndef.base_name

			minetest.sound_play( ndef.sound_close, { pos = pos, gain = 0.3, max_hear_distance = 10 } )
			minetest.swap_node( pos, { name = new_name, param2 = node.param2 } )
		end
	end
	self.open = function ( )
		if node.name == ndef.base_name then
			local new_name = ndef.base_name .. "_open"

			minetest.sound_play( ndef.sound_open, { pos = pos, gain = 0.3, max_hear_distance = 10 } )
			minetest.swap_node( pos, { name = new_name, param2 = node.param2 } )
		end
	end

	return self
end

----------------------------------
-- notify_on_placenode( )
----------------------------------

local function notify_on_placenode( pos, new_node, player, old_node, itemstack, pointed_thing )

	for _, on_placenode in ipairs( minetest.registered_on_placenodes) do
		-- clone tables since callback can modify them
		local clone = {
			pos = vector.new( pos ),
			new_node = { name = new_node.name, param1 = new_node.param1, param2 = new_node.param2 },
			old_node = { name = old_node.name, param1 = old_node.param1, param2 = old_node.param2 },
			pointed_thing = {
				type  = pointed_thing.type,
				above = vector.new( pointed_thing.above ),
				under = vector.new( pointed_thing.under ),
				ref   = pointed_thing.ref,
			}
		}

		on_placenode( clone.pos, clone.new_node, player, clone.old_node, itemstack, clone.pointed_thing )
	end
end

---------------------------------
-- register_door_craftitem( )
---------------------------------

local function register_door_craftitem( name, def )

	minetest.register_craftitem( ":" .. name, {
		description = def.description,
		inventory_image = def.inventory_image,

		on_place = function( itemstack, player, pointed_thing )
			local pos

			if not pointed_thing.type == "node" then
				return itemstack
			end

			local node = minetest.get_node( pointed_thing.under )
			local ndef = minetest.registered_nodes[ node.name ]

			if ndef and ndef.buildable_to then
				pos = pointed_thing.under
			else
				pos = pointed_thing.above
				node = minetest.get_node( pos )
				ndef = minetest.registered_nodes[ node.name ]
				if not ndef or not ndef.buildable_to then
					return itemstack
				end
			end

			local top_pos = vector.offset_y( pos )
			local top_node = minetest.get_node_or_nil( top_pos )
			local top_ndef = top_node and minetest.registered_nodes[ top_node.name ]

			if not top_ndef or not top_ndef.buildable_to then
				return itemstack
			end

			local player_name = player:get_player_name( )
			if minetest.is_protected( pos, player_name ) or minetest.is_protected( top_pos, player_name ) then
				return itemstack
			end

			local facedir = minetest.dir_to_facedir( player:get_look_dir( ) )
			local facedir_to_pos = {
				[0] = { x = -1, y = 0, z = 0 },
				[1] = { x = 0, y = 0, z = 1 },
				[2] = { x = 1, y = 0, z = 0 },
				[3] = { x = 0, y = 0, z = -1 },
			}
			local look_pos = vector.add( pos, facedir_to_pos[ facedir ] )
			local state = 0

			-- NB: state stores door hand (left vs right) and door type (offset vs center)
			-- and door is_open (true or false), while param2 stores door face (1-4).

			if minetest.get_item_group( minetest.get_node( look_pos ).name, "door" ) == 1 then
				state = state + 2	-- rotate 180
				minetest.set_node( pos, { name = name .. "_b", param2 = facedir } )
				minetest.set_node( top_pos, { name = "doors:hidden", param2 = ( facedir + 3 ) % 4 } )
			else
				minetest.set_node( pos, { name = name .. "_a", param2 = facedir } )
				minetest.set_node( top_pos, { name = "doors:hidden", param2 = facedir } )
			end

			local meta = minetest.get_meta( pos )
			meta:set_int( "state", state )

			if def.protected then
				meta:set_int( "oldtime", os.time( ) )
				meta:set_int( "newtime", os.time( ) )
				meta:set_string( "doors_owner", player_name )
				meta:set_string( "infotext", "Owned by " .. player_name )
			end
			if def.is_lockable then
				meta:set_string( "locking_mode", def.protected and doors.LOCKING_MODE_LOCKED or doors.LOCKING_MODE_UNLOCKED )
			end
			if def.is_closable then
				meta:set_string( "closing_mode", doors.CLOSING_MODE_MANUAL )
			end

			if not minetest.setting_getbool( "creative_mode" ) then
				itemstack:take_item( )
			end

			minetest.sound_play( def.sounds.place, { pos = pos } )

			notify_on_placenode( pos, minetest.get_node( pos ), player, node, itemstack, pointed_thing )

			return itemstack
		end
	} )
end

---------------------------------
-- doors.register_door( )
---------------------------------

function doors.register_door( name, def )

	register_door_craftitem( name, def )

	-- define the basic properties

	def.base_name = name

	def.drawtype = "mesh"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.sunlight_propagates = true
	def.walkable = true
	def.is_ground_content = false
	def.buildable_to = false
	def.inventory_image = nil
	def.drop = name
	def.groups.not_in_creative_inventory = 1
	def.groups.door = 1

	-- define the crafting recipe

	if def.recipe then
		minetest.register_craft( { output = name, recipe = def.recipe } )
	end
	def.recipe = nil

	-- define the opening/closing sounds

	if not def.sounds then
		def.sounds = base.node_sound_wood_defaults( )
	end
	if not def.sound_open then
		def.sound_open = "doors_door_open"
	end
	if not def.sound_close then
		def.sound_close = "doors_door_close"
	end
	if not def.sound_locked then
		def.sound_locked = "doors_door_locked"
	end

	-- define the placement types

	if def.can_offset == nil or not def.can_center then
		def.can_offset = true
	end
	if def.can_center == nil then
		def.can_center = false
	end

	if def.is_lockable == nil then
		def.is_lockable = false
	end
	if def.is_closable == nil then
		def.is_closable = false
	end

	-- define the essential callbacks

	def.on_adjust = on_adjust_door
	def.on_rotate = on_rotate_door

	def.on_rightclick = function ( pos, node, player, itemstack, pointed_thing )
		toggle_door( pos, node, player )
		return itemstack
	end
	def.on_destruct = function( pos )
		minetest.remove_node( vector.offset_y( pos ) )		-- hidden node
		minetest.check_for_falling( vector.offset_y( pos ) )
	end

	if def.protected then
		def.can_dig = function ( pos, player )
			local player_name = player:get_player_name( )
			if is_door_protected( pos, def, player_name ) then
				minetest.record_protection_violation( pos, player_name )
				return false
			else
				return true
			end
		end
		def.on_blast = function( ) end
	else
		def.on_blast = function( pos, intensity )
			minetest.remove_node( pos )			-- door node
			minetest.remove_node( vector.offset_y( pos ) )	-- hidden node
			return { name }
		end
	end

	-- register offset door nodes

	if def.can_offset then
		def.selection_box = { type = "fixed", fixed = { -1/2, -1/2, -8/16, 1/2, 3/2, -6/16 } }
		def.collision_box = { type = "fixed", fixed = { -1/2, -1/2, -8/16, 1/2, 3/2, -6/16 } }

		def.mesh = "door_a.obj"
		minetest.register_node( ":" .. name .. "_a", def )
		def.mesh = "door_b.obj"
		minetest.register_node( ":" .. name .. "_b", def )
	end

	-- register center door nodes

	if def.can_center then
		def.selection_box = { type = "fixed", fixed = { -1/2, -1/2, -1/16, 1/2, 3/2, 1/16 } }
		def.collision_box = { type = "fixed", fixed = { -1/2, -1/2, -1/16, 1/2, 3/2, 1/16 } }

		def.mesh = "door_c.obj"	-- shut
		minetest.register_node( ":" .. name .. "_c", def )

		def.selection_box = { type = "fixed", fixed = { 6/16, -1/2, -1, 8/16, 3/2, 0 } }
		def.collision_box = { type = "fixed", fixed = { 6/16, -1/2, -1, 8/16, 3/2, 0 } }

		def.mesh = "door_d.obj"	-- open left-hand
		minetest.register_node( ":" .. name .. "_d", def )

		def.selection_box = { type = "fixed", fixed = { -8/16, -1/2, -1, -6/16, 3/2, 0 } }
		def.collision_box = { type = "fixed", fixed = { -8/16, -1/2, -1, -6/16, 3/2, 0 } }

		def.mesh = "door_e.obj"	-- open right-hand
		minetest.register_node( ":" .. name .. "_e", def )
	end
end

doors.register = doors.register_door		-- for backward compatibility

---------------------------------
-- doors.register_trapdoor( )
---------------------------------

function doors.register_trapdoor( name, def )
	
	-- define the basic properties

	def.base_name = name

	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.drop = name
	def.groups.not_in_creative_inventory = 1
	def.groups.trapdoor = 1

	-- define the opening/closing sounds

	if not def.sounds then
		def.sounds = base.node_sound_wood_defaults( )
	end
	if not def.sound_open then
		def.sound_open = "doors_door_open"
	end
	if not def.sound_close then
		def.sound_close = "doors_door_close"
	end
	if not def.sound_locked then
		def.sound_locked = "doors_door_locked"
	end

	-- define the placement types

	if def.is_lockable == nil then
		def.is_lockable = false
	end
	if def.is_closable == nil then
		def.is_closable = false
	end

	-- define the essential callbacks

	def.on_adjust = on_adjust_trapdoor

	def.on_rightclick = function ( pos, node, player, itemstack, pointed_thing )
		toggle_trapdoor( pos, node, player )
		return itemstack
	end

	if def.protected then
		def.can_dig = function ( pos, player )
			local player_name = player:get_player_name( )
			if is_door_protected( pos, def, player_name ) then
				minetest.record_protection_violation( pos, player_name )
				return false
			else
				return true
			end
		end
		def.after_place_node = function ( pos, player, itemstack, pointed_thing )
			local player_name = player:get_player_name( )
			local meta = minetest.get_meta( pos )

			meta:set_int( "oldtime", os.time( ) )
			meta:set_int( "newtime", os.time( ) )
			meta:set_string( "doors_owner", player_name )
			meta:set_string( "infotext", "Owned by " .. player_name )

			if def.is_lockable then
				meta:set_string( "locking_mode", def.protected and doors.LOCKING_MODE_LOCKED or doors.LOCKING_MODE_UNLOCKED )
			end
			if def.is_closable then
				meta:set_string( "closing_mode", doors.CLOSING_MODE_MANUAL )
			end

			return minetest.setting_getbool( "creative_mode" )
		end
		def.on_blast = function ( ) end
	else
		def.after_place_node = function ( pos, player, itemstack, pointed_thing )
			local player_name = player:get_player_name( )
			local meta = minetest.get_meta( pos )

			if def.is_lockable then
				meta:set_string( "locking_mode", def.protected and doors.LOCKING_MODE_LOCKED or doors.LOCKING_MODE_UNLOCKED )
			end
			if def.is_closable then
				meta:set_string( "closing_mode", doors.CLOSING_MODE_MANUAL )
			end

			return minetest.setting_getbool( "creative_mode" )
		end
		def.on_blast = function ( pos, intensity )
			minetest.remove_node( pos )
			return { name }
		end
	end

	-- register trapdoor nodes

--	local def_closed = setmetatable( { }, __index = def )
	def.node_box = { type = "fixed", fixed = { -0.5, -0.5, -0.5, 0.5, -6/16, 0.5 } }
	def.selection_box = { type = "fixed", fixed = { -0.5, -0.5, -0.5, 0.5, -6/16, 0.5 } }
	def.tiles = { def.tile_front, def.tile_front .. '^[transformFY', def.tile_side, def.tile_side, def.tile_side, def.tile_side }

	minetest.register_node( ":" .. name, def )  -- closed

	def.node_box = { type = "fixed", fixed = { -0.5, -0.5, 6/16, 0.5, 0.5, 0.5 } }
	def.selection_box = { type = "fixed", fixed = {-0.5, -0.5, 6/16, 0.5, 0.5, 0.5 } }
	def.tiles = { def.tile_side, def.tile_side, def.tile_side .. '^[transform3', def.tile_side .. '^[transform1', def.tile_front .. '^[transform46', def.tile_front .. '^[transform6' }

	minetest.register_node( ":" .. name .. "_open", def )  -- opened
end

---------------------------------
-- doors.register_fencegate( )
---------------------------------

function doors.register_fencegate( name, def )
	local fence = {
		description = def.description,
		drawtype = "mesh",
		tiles = {def.texture},
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		drop = name .. "_closed",
		connect_sides = {"left", "right"},
		groups = def.groups,
		sounds = def.sounds,
		on_rightclick = function(pos, node, player, itemstack, pointed_thing)
			local node_def = minetest.registered_nodes[node.name]
			minetest.swap_node(pos, {name = node_def.gate, param2 = node.param2})
			minetest.sound_play(node_def.sound, {pos = pos, gain = 0.3,
				max_hear_distance = 8})
			return itemstack
		end,
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/4, 1/2, 1/2, 1/4},
		},
	}

	if not fence.sounds then
		fence.sounds = base.node_sound_wood_defaults()
	end

	fence.groups.fence = 1

	local fence_closed = table.copy(fence)
	fence_closed.mesh = "doors_fencegate_closed.obj"
	fence_closed.gate = name .. "_open"
	fence_closed.sound = "doors_fencegate_open"
	fence_closed.collision_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/4, 1/2, 1/2, 1/4},
	}

	local fence_open = table.copy(fence)
	fence_open.mesh = "doors_fencegate_open.obj"
	fence_open.gate = name .. "_closed"
	fence_open.sound = "doors_fencegate_close"
	fence_open.groups.not_in_creative_inventory = 1
	fence_open.collision_box = {
		type = "fixed",
		fixed = {{-1/2, -1/2, -1/4, -3/8, 1/2, 1/4},
			{-1/2, -3/8, -1/2, -3/8, 3/8, 0}},
	}

	minetest.register_node(":" .. name .. "_closed", fence_closed)
	minetest.register_node(":" .. name .. "_open", fence_open)

	minetest.register_craft({
		output = name .. "_closed",
		recipe = {
			{"material:stick", def.material, "material:stick"},
			{"material:stick", def.material, "material:stick"}
		}
	})
end

---------------------------------
-- handle_wrench( )
---------------------------------

local function handle_wrench( itemstack, player, pointed_thing, mode, uses )
	if pointed_thing.type ~= "node" then return end

	local pos = pointed_thing.under
	local player_name = player:get_player_name( )
	local node = minetest.get_node( pos )
	local ndef = minetest.registered_nodes[ node.name ]

	if minetest.is_protected( pos, player_name ) then
		minetest.record_protection_violation( pos, player_name )
		return
	end

	if ndef.on_adjust then
		local has_wear = ndef.on_adjust( vector.new( pos ), { name = node.name, param1 = node.param1, param2 = node.param2 }, player, mode )

		if not minetest.setting_getbool( "creative_mode" ) and has_wear then
			itemstack:add_wear( 65535 / config.wrench_usage_limit - 1 )
		end
	end
end

--------------------

minetest.register_tool( "doors:wrench", {
	description = "Wrench (left-click adjusts door locking, right-click adjusts door closing)",
	inventory_image = "doors_wrench.png",
	on_use = function( itemstack, player, pointed_thing )
		handle_wrench( itemstack, player, pointed_thing, doors.ADJUST_LOCKING )
		return itemstack
	end,
	on_place = function( itemstack, player, pointed_thing)
		handle_wrench( itemstack, player, pointed_thing, doors.ADJUST_CLOSING )
		return itemstack
	end,
} )

minetest.register_craft( {
	output = "doors:wrench",
	recipe = {
		{ "mineral:steel_ingot", "material:steel_rod" },
	}
} )

minetest.register_craftitem( ":material:steel_rod", {
	description = "Steel Rod",
	inventory_image = "material_steel_bar.png",
} )

minetest.register_craft( {
	output = "material:steel_rod 4",
	recipe = {
		{ "mineral:steel_ingot" },
	}
} )

-- compatibility for Minetest S3 engine

if not vector.offset_y or not minetest.get_node_above then
        dofile( minetest.get_modpath( "doors" ) .. "/compatibility.lua" )
end

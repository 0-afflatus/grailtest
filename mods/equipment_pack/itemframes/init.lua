
screwdriver = screwdriver or {}

local tmp = {}
local max_objs = tonumber(minetest.settings:get("max_objects_per_block")) or 64

minetest.register_entity("itemframes:item",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x=.33,y=.33},
	collisionbox = {0,0,0,0,0,0},
	physical=false,
	textures={"air"},
	on_activate = function(self, staticdata)
		if tmp.nodename ~= nil and tmp.texture ~= nil then
			self.nodename = tmp.nodename
			tmp.nodename = nil
			self.texture = tmp.texture
			tmp.texture = nil
		else
			if staticdata ~= nil and staticdata ~= "" then
				local data = staticdata:split(';')
				if data and data[1] and data[2] then
					self.nodename = data[1]
					self.texture = data[2]
				end
			end
		end
		if self.texture ~= nil then
			self.object:set_properties({textures={self.texture}})
		end
		if self.nodename == "itemframes:pedestal" then
			self.object:set_properties({automatic_rotate=1})
		end
	end,
	get_staticdata = function(self)
		if self.nodename ~= nil and self.texture ~= nil then
			return self.nodename .. ';' .. self.texture
		end
		return ""
	end,
})

-- helper table

local facedir = {
	[0] = {x = 0, y = 0, z = 1},
	[12] = {x = 0, y = 0, z = 1},
	[16] = {x = 0, y = 0, z = 1},
	[20] = {x = 0, y = 0, z = 1},

	[1] = {x = 1, y = 0, z = 0},
	[5] = {x = 1, y = 0, z = 0},
	[9] = {x = 1, y = 0, z = 0},
	[23] = {x = 1, y = 0, z = 0},

	[2] = {x = 0, y = 0, z = -1},
	[14] = {x = 0, y = 0, z = -1},
	[18] = {x = 0, y = 0, z = -1},
	[22] = {x = 0, y = 0, z = -1},

	[3] = {x = -1, y = 0, z = 0},
	[7] = {x = -1, y = 0, z = 0},
	[11] = {x = -1, y = 0, z = 0},
	[21] = {x = -1, y = 0, z = 0},

	[4] = -0.4, -- flat frames
	[10] = -0.4,
	[13] = -0.4,
	[19] = -0.4,

	[8] = 0.4, -- upside down flat frames
	[6] = 0.4,
	[15] = 0.4,
	[17] = 0.4
}

local remove_item = function(pos, node)
	local objs = nil
	if node.name == "itemframes:frame" then
		objs = minetest.env:get_objects_inside_radius(pos, .5)
	elseif node.name == "itemframes:pedestal" then
		objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y+1,z=pos.z}, .5)
	end
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() and obj:get_luaentity().name == "itemframes:item" then
				obj:remove()
			end
		end
	end
end

local update_item = function(pos, node)
	remove_item(pos, node)
	local meta = minetest:get_meta(pos)
	if meta:get_string("item") ~= "" then
		if node.name == "itemframes:frame" then
			local posad = facedir[node.param2]
			if not posad then return end
			pos.x = pos.x + posad.x*6.5/16
			pos.y = pos.y + posad.y*6.5/16
			pos.z = pos.z + posad.z*6.5/16
		elseif node.name == "itemframes:pedestal" then
			pos.y = pos.y + 12/16+.33
		end
		tmp.nodename = node.name
		tmp.texture = ItemStack(meta:get_string("item")):get_name()
		local e = minetest.env:add_entity(pos,"itemframes:item")
		if node.name == "itemframes:frame" then
			local yaw = math.pi*2 - node.param2 * math.pi/2
			e:setyaw(yaw)
		end
	end
end

local drop_item = function(pos, node)
	local meta = minetest.env:get_meta(pos)
	if meta:get_string("item") ~= "" then
		if node.name == "itemframes:frame" then
			minetest.env:add_item(pos, meta:get_string("item"))
		elseif node.name == "itemframes:pedestal" then
			minetest.env:add_item({x=pos.x,y=pos.y+1,z=pos.z}, meta:get_string("item"))
		end
		meta:set_string("item","")
	end
	remove_item(pos, node)
end

-- on_place helper function

local frame_place = function(itemstack, placer, pointed_thing)

	if pointed_thing.type ~= "node" then return end

	local above = pointed_thing.above
	local under = pointed_thing.under
	local dir = {
		x = under.x - above.x,
		y = under.y - above.y,
		z = under.z - above.z
	}

	local wdir = minetest.dir_to_wallmounted(dir)
	local placer_pos = placer:get_pos()

	if placer_pos then
		dir = {
			x = above.x - placer_pos.x,
			y = above.y - placer_pos.y,
			z = above.z - placer_pos.z
		}
	end

	local fdir = minetest.dir_to_facedir(dir)
	local p2 = fdir

	if wdir == 0 then
		p2 = 8
	elseif wdir == 1 then
		p2 = 4
	end

	return minetest.item_place(itemstack, placer, pointed_thing, p2)
end

minetest.register_node("itemframes:frame",{
	description = "Item frame",
	drawtype = "nodebox",
	node_box = { type = "fixed", fixed = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5} },
	selection_box = { type = "fixed", fixed = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5} },
	tiles = {"itemframes_frame.png"},
	inventory_image = "itemframes_frame.png",
	wield_image = "itemframes_frame.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = { choppy=2,dig_immediate=2 },
	legacy_wallmounted = true,
	sounds = base.node_sound_defaults(),
	after_place_node = function(pos, placer, itemstack)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",placer:get_player_name())
		meta:set_string("infotext","Item frame (owned by "..placer:get_player_name()..")")
	end,
	on_rightclick = function(pos, node, clicker, itemstack)
		if not itemstack then return end
		local meta = minetest.env:get_meta(pos)
		if clicker:get_player_name() == meta:get_string("owner") then
			drop_item(pos,node)
			local s = itemstack:take_item()
			meta:set_string("item",s:to_string())
			update_item(pos,node)
		end
		return itemstack
	end,
	on_punch = function(pos,node,puncher)
		local meta = minetest.env:get_meta(pos)
		if puncher:get_player_name() == meta:get_string("owner") then
			drop_item(pos, node)
		end
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos)
		return player:get_player_name() == meta:get_string("owner")
	end,
})

-- automatically restore entities lost from frames/pedestals
-- due to /clearobjects or similar

minetest.register_abm({
	nodenames = { "itemframes:frame", "itemframes:pedestal" },
	interval = 15,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if #minetest.get_objects_inside_radius(pos, 0.5) > 0 then return end
		update_item(pos, node)
	end
})

-- crafts

minetest.register_craft({
	output = 'itemframes:frame',
	recipe = {
		{'material:stick', 'material:stick', 'material:stick'},
		{'material:stick', 'material:paper', 'material:stick'},
		{'material:stick', 'material:stick', 'material:stick'},
	}
})

-- invisible itemframe node and recipe

minetest.register_node("itemframes:frame_invis",{
	description = "Invisible Item frame",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5}
	},
	tiles = {"itemframes_clear.png"},
	inventory_image = "itemframes_frame_invis.png",
	wield_image = "itemframes_frame_invis.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	groups = {choppy = 2, dig_immediate = 2, flammable = 2},
	sounds = base.node_sound_defaults(),

	on_place = frame_place,

	after_place_node = function(pos, placer, itemstack)

		local meta = minetest.get_meta(pos)

		meta:set_string("infotext","Item frame (right-click to add or remove item)")
	end,

	on_rightclick = function(pos, node, clicker, itemstack)

		if not itemstack
		or minetest.is_protected(pos, clicker:get_player_name()) then
			return
		end

		local meta = minetest.get_meta(pos)

		if not meta then return end

		if meta:get_string("item") ~= "" then

			drop_item(pos, node.name, meta)
		else
			local s = itemstack:take_item()

			meta:set_string("item", s:to_string())

			update_item(pos, node)

			return itemstack
		end
	end,

	on_destruct = function(pos)
		drop_item(pos, "itemframes:frame_invis")
	end,

	on_punch = function(pos, node, puncher)
		update_item(pos, node)
	end,

	on_blast = function(pos, intensity)

		drop_item(pos, "itemframes:frame_invis")

		minetest.add_item(pos, {name = "itemframes:frame"})

		minetest.remove_node(pos)
	end,

	on_burn = function(pos)

		drop_item(pos, "itemframes:frame_invis")

		minetest.remove_node(pos)
	end
})

minetest.register_craft({
	output = "itemframes:frame_invis",
	recipe = {
		{"group:glass", "group:glass", "group:glass"},
		{"group:glass", "group:paper", "group:glass"},
		{"group:glass", "group:glass", "group:glass"},
	}
})

dungeon_loot.register({
    {name = "itemframes:frame", chance = 0.1, count = {1,3}, y = {-1023, 512}},
})

-- Grailtest 5 --
-- mods/equipment/torch.lua --

-- Load translation support.
local S = minetest.get_translator("equipment")

local function on_flood(pos, oldnode, newnode)
	minetest.add_item(pos, ItemStack("equipment:torch 1"))
	-- Play flame-extinguish sound if liquid is not an 'igniter'
	local nodedef = minetest.registered_items[newnode.name]
	if not (nodedef and nodedef.groups and
			nodedef.groups.igniter and nodedef.groups.igniter > 0) then
		minetest.sound_play(
			"base_cool_lava",
			{pos = pos, max_hear_distance = 16, gain = 0.07},
			true
		)
	end
	-- Remove the torch node
	return false
end

minetest.register_node("equipment:torch", {
	description = S("Torch"),
	drawtype = "mesh",
	mesh = "torch_floor.obj",
	inventory_image = "equipment_torch_on_floor.png",
	wield_image = "equipment_torch_on_floor.png",
	tiles = {{
		    name = "equipment_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	use_texture_alpha = "clip",
	walkable = false,
	liquids_pointable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1, igniter=1},
	drop = "equipment:torch",
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = base.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("equipment:torch_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("equipment:torch")
		else
			fakestack:set_name("equipment:torch_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("equipment:torch")

		return itemstack
	end,
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

minetest.register_node("equipment:torch_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	tiles = {{
		    name = "equipment_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	use_texture_alpha = "clip",
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1, igniter=1},
	drop = "equipment:torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = base.node_sound_wood_defaults(),
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

minetest.register_node("equipment:torch_ceiling", {
	drawtype = "torchlike",
	tiles = {
		{		
			name="equipment_torch_on_ceiling_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
	},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	use_texture_alpha = "clip",
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1, igniter=1},
	drop = "equipment:torch",
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5 - 0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5 + 0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5 + 0.3, 0.3, 0.1},
	},
	sounds = base.node_sound_wood_defaults(),
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

minetest.register_lbm({
	name = "equipment:3dtorch",
	nodenames = {"equipment:torch", "torches:floor", "torches:wall"},
	action = function(pos, node)
		if node.param2 == 0 then
			minetest.set_node(pos, {name = "equipment:torch_ceiling",
				param2 = node.param2})
		elseif node.param2 == 1 then
			minetest.set_node(pos, {name = "equipment:torch",
				param2 = node.param2})
		else
			minetest.set_node(pos, {name = "equipment:torch_wall",
				param2 = node.param2})
		end
	end
})

minetest.register_node("equipment:lantern", {
	description = S("Lantern"),
	drawtype = "glasslike",
	tiles = {"equipment_lantern.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	light_source = base.LIGHT_MAX - 1,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,dig_immediate=3},
	sounds = base.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = 'equipment:torch 4',
	recipe = {
		{'mineral:coal_lump'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = "equipment:lantern 6",
	recipe = {
		{"material:glass","material:glass","material:glass"},
		{"material:glass","equipment:torch","material:glass"},
		{"material:glass","material:glass","material:glass"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:torch",
	burntime = 4,
})


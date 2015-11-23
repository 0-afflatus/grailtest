minetest.register_node("equipment:torch", {
	description = "Torch (lit)",
	drawtype = "torchlike",
	tiles = {
		{
			name = "equipment_torch_on_floor_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="equipment_torch_on_ceiling_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="equipment_torch_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
	},
	inventory_image = "equipment_torch_on_floor.png",
	wield_image = "equipment_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = default.LIGHT_MAX - 1,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5 - 0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5 + 0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5 + 0.3, 0.3, 0.1},
	},
	groups = {choppy = 2, dig_immediate = 3, flammable = 1, attached_node = 1, hot = 1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	on_use = function(itemstack, user, pointed_thing)
	    fire.strike_fire(user, pointed_thing)
	    itemstack:add_wear(65535/16)
	    return itemstack
	end,
})

minetest.register_node("equipment:torch_unlit", {
	description = "Torch",
	drawtype = "torchlike",
	tiles = {"equipment_torch_on_floor.png", "equipment_torch_on_ceiling.png", "equipment_torch.png"},
	inventory_image = "equipment_torch_on_floor.png",
	wield_image = "equipment_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy = 2, dig_immediate = 3, flammable = 1, attached_node = 1},
	
	-- lighting a placed torch when hit by a burning one
	after_dig_node = function(pos, node, oldmetadata, puncher)
		local wield = puncher:get_wielded_item():get_name()
		if wield == "equipment:torch" then
			node.name = "equipment:torch"
			minetest.set_node(pos, node)
			local inv = puncher:get_inventory()
			inv:remove_item("main", "equipment:torch_unlit")
		end
	end,
	
	-- lighting the torch in hand when hitting a burning one
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			local n = minetest.get_node(pointed_thing.under)
			if minetest.get_item_group(n.name, "igniter") ~= 0 or n.name == "equipment:torch" or n.name == "equipment:furnace_active" then
				local torch_count = user:get_wielded_item():get_count()
				itemstack:replace("equipment:torch "..torch_count.."")
				return itemstack
			else
				minetest.punch_node(pointed_thing.under)
			end
		else
			return
		end
	end,
	
	sounds = default.node_sound_defaults(),
})

minetest.register_node("equipment:lantern", {
	description = "Lantern",
	drawtype = "glasslike",
	tiles = {"equipment_lantern.png"},
	use_texture_alpha = true,
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,dig_immediate=3},
	sounds = default.node_sound_glass_defaults(),
})

-- Crafting

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


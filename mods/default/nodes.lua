-- mods/default/nodes.lua

--
-- Rocks
--

minetest.register_node("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_lichen_1", {
	description = "Lichen covered stone",
	tiles = {"default_stone.png^default_lichen_rust.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_lichen_2", {
	description = "Lichen covered stone",
	tiles = {"default_stone.png^default_lichen_gold.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_lichen_3", {
	description = "Lichen covered stone",
	tiles = {"default_stone.png^default_lichen_green.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:cobble", {
	description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mossycobble", {
	description = "Mossy Cobblestone",
	tiles = {"default_cobble.png^default_moss.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone", {
	description = "Desert Stone",
	tiles = {"default_desert_stone.png"},
	groups = {cracky = 3},
	drop = 'default:desert_cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_cobble", {
	description = "Desert Cobblestone",
	tiles = {"default_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

--
-- Moss growth on cobble near water
--
minetest.register_abm({
	nodenames = {"default:cobble"},
	neighbors = {"group:water"},
	interval = 31,
	chance = 293,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "default:mossycobble"})
	end
})

--
-- Lichen growth on stone near water
--
minetest.register_abm({
	nodenames = {"default:stone"},
	neighbors = {"default:cloud", 
		"default:water_flowing",
		"default:water_source", 
		"default:river_water_source", 
		"default:river_water_flowing",
		"default:dirt_with_grass"},
	interval = 37,
	chance = 499,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "default:stone_with_lichen_3"})
	end
})

--
-- Lichen growth on stone near snow
--
minetest.register_abm({
	nodenames = {"default:stone"},
	neighbors = {
		"default:snowblock",
		"default:dirt_with_snow"},
	interval = 79,
	chance = 733,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "default:stone_with_lichen_2"})
	end
})

--
-- Lichen growth on stone near ice
--
minetest.register_abm({
	nodenames = {"default:stone"},
	neighbors = {"default:freshice", 
		"default:ice",
		"default:dirt_with_ice"},
	interval = 127,
	chance = 937,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "default:stone_with_lichen_1"})
	end
})

--
-- Dirt
--

minetest.register_node("default:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	soil = {
		base = "default:dirt_with_grass",
		dry = "default:soil",
		wet = "default:soil_wet"
	},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_grass_footsteps", {
	description = "Dirt with Grass and Footsteps",
	tiles = {"default_grass.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_abm({
	nodenames = {"default:dirt_with_grass"},
	interval = 23,
	chance = 23,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "default:dirt"})
		end
	end
})


minetest.register_node("default:dirt_with_dry_grass", {
	description = "Dirt with Dry Grass",
	tiles = {"default_dry_grass.png",
		"default_dirt_red.png",
		{name = "default_dirt_red.png^default_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	soil = {
		base = "default:dirt_with_dry_grass",
		dry = "default:soil",
		wet = "default:soil_wet"
	},
	drop = "default:dirt_red",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_abm({
	nodenames = {"default:dirt_with_dry_grass"},
	interval = 37,
	chance = 37,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y+1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef
				and not ((nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "default:dirt_red"})
		end
	end
})

minetest.register_node("default:permafrost", {
	description = "Permafrost",
	tiles = {"default_permafrost.png"},
	groups = {crumbly = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:dirt_with_ice", {
	description = "Dirt with Ice",
	tiles = {"default_icydirt.png", 
		"default_permafrost.png",
		{name = "default_permafrost.png^default_icydirt_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 1},
	drop = "default:permafrost",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.45},
	}),
})

minetest.register_abm({
	nodenames = {"default:dirt_with_ice"},
	interval = 43,
	chance = 43,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y+1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef
				and not ((nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "default:permafrost"})
		end
	end
})

minetest.register_abm({
	nodenames = {"default:permafrost"},
	interval = 47,
	chance = 239,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y+1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none"
				and (minetest.get_node_light(above) or 0) >= 13 then
			if name == "default:snow" or name == "default:snowblock" then
				minetest.set_node(pos, {name = "default:dirt_with_snow"})
			else
				minetest.set_node(pos, {name = "default:dirt_with_ice"})
			end
		end
	end
})

minetest.register_node("default:dirt_with_snow", {
	description = "Dirt with Snow",
	tiles = {"default_snow.png", "default_dirt_yellow.png",
		{name = "default_dirt_yellow.png^default_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1},
	soil = {
		base = "default:dirt_with_snow",
		dry = "default:soil",
		wet = "default:soil_wet"
	},
	drop = 'default:dirt_yellow',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3,soil = 1},
	soil = {
		base = "default:dirt",
		dry = "default:soil",
		wet = "default:soil_wet"
	},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	interval = 23,
	chance = 239,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light") and
				nodedef.liquidtype == "none" and
				(minetest.get_node_light(above) or 0) >= 13 then
			if name == "default:snow" or name == "default:snowblock" then
				minetest.set_node(pos, {name = "default:dirt_with_snow"})
			else
				minetest.set_node(pos, {name = "default:dirt_with_grass"})
			end
		end
	end
})


--
-- Grass and dry grass removed in darkness
--

minetest.register_abm({
	nodenames = {"default:dirt_with_grass", "default:dirt_with_dry_grass", "group:flora"},
	interval = 19,
	chance = 19,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "default:dirt"})
		end
	end
})

minetest.register_node("default:dirt_red", {
	description = "Red Dirt",
	tiles = {"default_dirt_red.png"},
	groups = {crumbly = 2,soil = 1},
	soil = {
		base = "default:dirt_red",
		dry = "default:soil",
		wet = "default:soil_wet"
	},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_abm({
	nodenames = {"default:dirt_red"},
	interval = 37,
	chance = 271,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y+1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none"
				and (minetest.get_node_light(above) or 0) >= 13 then
			if name == "default:snow" or name == "default:snowblock" then
				minetest.set_node(pos, {name = "default:dirt_with_snow"})
			else
				minetest.set_node(pos, {name = "default:dirt_with_dry_grass"})
			end
		end
	end
})

minetest.register_node("default:dirt_yellow", {
	description = "Yellow Dirt",
	tiles = {"default_dirt_yellow.png"},
	is_ground_content = true,
	groups = {crumbly = 1, soil=1},
	soil = {
		base = "default:dirt_yellow",
		dry = "default:soil",
		wet = "default:soil_wet"
	},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_abm({
	nodenames = {"default:dirt_yellow"},
	interval = 59,
	chance = 269,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y+1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none"
				and (minetest.get_node_light(above) or 0) >= 13 then
			if name == "default:snow" or name == "default:snowblock" then
				minetest.set_node(pos, {name = "air"})
			end
		end
	end
})

minetest.register_node("default:soil", {
	description = "Soil",
	tiles = {"default_soil.png", "default_dirt.png"},
	drop = "default:dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 2, grassland = 1, field = 1},
	soil = {
		base = "default:dirt",
		dry = "default:soil",
		wet = "default:soil_wet"
	},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:soil_wet", {
	description = "Wet Soil",
	tiles = {"default_soil_wet.png", "default_soil_wet_side.png"},
	drop = "default:dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 3, wet = 1, grassland = 1, field = 1},
	soil = {
		base = "default:dirt",
		dry = "default:soil",
		wet = "default:soil_wet"
	},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_abm({
	nodenames = {"group:field"},
	interval = 17,
	chance = 5,
	catch_up = false,
	action = function(pos, node)
		local n_def = minetest.registered_nodes[node.name] or nil
		local wet = n_def.soil.wet or nil
		local base = n_def.soil.base or nil
		local dry = n_def.soil.dry or nil
		if not n_def or not n_def.soil or not wet or not base or not dry then
			return
		end

		pos.y = pos.y + 1
		local nn = minetest.get_node_or_nil(pos)
		if not nn or not nn.name then
			return
		end
		local nn_def = minetest.registered_nodes[nn.name] or nil
		pos.y = pos.y - 1
		
		if nn_def and nn_def.walkable and minetest.get_item_group(nn.name, "plant") == 0 then
			minetest.set_node(pos, {name = base})
			return
		end
		-- check if there is water nearby
		local wet_lvl = minetest.get_item_group(node.name, "wet")
		if minetest.find_node_near(pos, 3, {"group:water"}) then
			-- if it is dry soil and not base node, turn it into wet soil
			if wet_lvl == 0 then
				minetest.set_node(pos, {name = wet})
			end
		else
			-- only turn back if there are no unloaded blocks (and therefore
			-- possible water sources) nearby
			if not minetest.find_node_near(pos, 3, {"ignore"}) then
				-- turn it back into base if it is already dry
				if wet_lvl == 0 then
					-- only turn it back if there is no plant/seed on top of it
					if minetest.get_item_group(nn.name, "plant") == 0 and minetest.get_item_group(nn.name, "seed") == 0 then
						minetest.set_node(pos, {name = base})
					end
					
				-- if its wet turn it back into dry soil
				elseif wet_lvl == 1 then
					minetest.set_node(pos, {name = dry})
				end
			end
		end
	end,
})

minetest.register_node("default:sand", {
	description = "Sand",
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:desert_sand", {
	description = "Desert Sand",
	tiles = {"default_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:sandstone", {
	description = "Sandstone",
	tiles = {"default_sandstone.png"},
	groups = {crumbly = 2,cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:gravel", {
	description = "Gravel",
	tiles = {"default_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.5},
		dug = {name = "default_gravel_footstep", gain = 1.0},
	}),
})


--
-- Weather
--

minetest.register_node("default:cloud", {
	description = "Cloud",
	drawtype = "glasslike",
	tiles = {"default_cloud.png"},
	sounds = default.node_sound_defaults(),
	groups = {not_in_creative_inventory = 1},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	post_effect_color = {a = 23, r = 241, g = 248, b = 255},
})

--
-- Water
--

minetest.register_node("default:water_flowing", {
	description = "Flowing Water",
	inventory_image = minetest.inventorycube("default_salt_water.png"),
	drawtype = "flowingliquid",
	tiles = {"default_salt_water.png"},
	special_tiles = {
		{
			name = "default_salt_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type     = "vertical_frames", 
				aspect_w = 16, 
				aspect_h = 16, 
				length   = 0.8,
			}
		},
		{
			name = "default_salt_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type     = "vertical_frames", 
				aspect_w = 16, 
				aspect_h = 16, 
				length   = 0.8,
			}
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 1,
	freezemelt = "default:snow",
	post_effect_color = {a = 108, r = 30, g = 35, b = 40},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("default:water_source", {
	description = "Water Source",
	inventory_image = minetest.inventorycube("default_salt_water.png"),
	drawtype = "liquid",
	tiles = {
		{
			name = "default_salt_water_source_animated.png", 
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "default_salt_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 1,
	freezemelt = "default:ice",
	post_effect_color = {a = 108, r = 30, g = 35, b = 40},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, freezes = 1, melt_around = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("default:river_water_source", {
	description = "River Water Source",
	inventory_image = minetest.inventorycube("default_water.png^[noalpha"),
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		{
			name = "default_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:river_water_flowing",
	liquid_alternative_source = "default:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 108, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

minetest.register_node("default:river_water_flowing", {
	description = "Flowing River Water",
	inventory_image = minetest.inventorycube("default_water.png"),
	drawtype = "flowingliquid",
	tiles = {"default_water.png"},
	special_tiles = {
		{
			name = "default_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "default_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:river_water_flowing",
	liquid_alternative_source = "default:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 108, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1},
})

minetest.register_node("default:freshice", {
	description = "Fresh ice",
	tiles = {"default_ice.png"},
	use_texture_alpha = true,
	is_ground_content = false,
	paramtype = "light",
	freezemelt = "default:river_water_source",
	groups = {cracky = 3, melts = 1, water = 1, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:ice", {
	description = "Ice",
	tiles = {"default_ice.png"},
	use_texture_alpha = true,
	is_ground_content = false,
	paramtype = "light",
	freezemelt = "default:water_source",
	groups = {cracky = 3, melts = 1, water = 1, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:snow", {
	description = "Snow",
	tiles = {"default_snow.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	buildable_to = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/16, 0.5},
		},
	},
	groups = {crumbly = 3,falling_node = 1, puts_out_fire = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.25},
		dug = {name = "default_snow_footstep", gain = 0.75},
	}),
	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_ice" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
})

-- Snow melting in the sun
-- Needs to work in conjunction with snow settling (snowdrift)
minetest.register_abm({
	nodenames = {"default:snow"},
	neighbors = {"air"},
	interval = 113,
	chance = 601,
	catch_up = false,
	action = function(pos, node)
		local pos0 = {x = pos.x-1,y = pos.y-1,z = pos.z-1}
		local pos1 = {x = pos.x+1,y = pos.y+1,z = pos.z+1}
		local freezing = #minetest.find_nodes_in_area(pos0, pos1, "group:melts")

		if (minetest.get_node_light(pos) or 0) > 13 and freezing < math.random(1,7) then
			minetest.set_node(pos, {name = "air"})
		end
	end
})


minetest.register_node("default:snowblock", {
	description = "Snow Block",
	tiles = {"default_snow.png"},
	is_ground_content = true,
	groups = {crumbly = 3, puts_out_fire = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.25},
		dug = {name = "default_snow_footstep", gain = 0.75},
	}),
})

-- If Snow near Water, change Water to Ice
minetest.register_abm({
	nodenames = {"default:dirt_with_ice", "default:snow", "default:snowblock", "default:dirt_with_snow"},
	neighbors = {"default:water_source"},
	interval = 157,
	chance = 313,
	catch_up = false,
	action = function(pos, node)
		local pos0 = {x = pos.x-1,y = pos.y-1,z = pos.z-1}
		local pos1 = {x = pos.x+1,y = pos.y+1,z = pos.z+1}

		local water = minetest.find_nodes_in_area(pos0, pos1, "default:water_source")
		if water then
			minetest.set_node(water[1], {name = "default:ice"})
		end
	end,
})

-- If Heat Source near Ice or Snow then melt
minetest.register_abm({
	nodenames = {"default:ice", "default:snowblock", "default:snow", "default:dirt_with_snow"},
	neighbors = {"fire:basic_fire", "fire:bonfire", "default:lava_source", "default:lava_flowing", "default:furnace_active", "default:torch", "group:sapling"},
	interval = 11,
	chance = 11,
	catch_up = false,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if node.name == "default:ice" or node.name == "default:snowblock" then
			minetest.add_node(pos,{name = "default:water_source"})
		elseif node.name == "default:snow" then
			minetest.add_node(pos,{name = "air"})
		elseif node.name == "default:snowblock" then -- or string.split(node.name, ":")[1]then
			minetest.add_node(pos,{name = "default:water_flowing"})
		elseif node.name == "default:dirt_with_snow" then
			minetest.add_node(pos,{name = "default:dirt_with_ice"})
		end
		
		-- wtf is this
		--nodeupdate(pos)
	end,
})

-- If Water Source near Dry Dirt, change to normal Dirt
minetest.register_abm({
	nodenames = {"default:dirt_with_dry_grass","default:dirt_red"},
	neighbors = {"group:water"},
	interval = 149,
	chance = 2,
	catch_up = false,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if node.name == "default:dirt_with_dry_grass" then	
			minetest.add_node(pos,{name = "default:dirt_with_grass"})
		elseif node.name == "default:dirt_red" then	
			minetest.add_node(pos,{name = "default:dirt"})
		end
	end,
})

--
-- Lava
--

minetest.register_node("default:lava_flowing", {
	description = "Flowing Lava",
	inventory_image = minetest.inventorycube("default_lava.png"),
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {
		{
			image = "default_lava_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames", 
				aspect_w = 16, 
				aspect_h = 16, 
				length = 3.3,
			}
		},
		{
			image = "default_lava_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames", 
				aspect_w = 16, 
				aspect_h = 16, 
				length = 3.3,
			}
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4*2,
	post_effect_color = {a = 192, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, hot = 3, not_in_creative_inventory = 1},
})

minetest.register_node("default:lava_source", {
	description = "Lava Source",
	inventory_image = minetest.inventorycube("default_lava.png"),
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	liquid_range = 3,
	damage_per_second = 4*2,
	post_effect_color = {a = 192, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, hot = 3},
})

--
-- Lavacooling
--

default.cool_lava_source = function(pos)
	minetest.set_node(pos, {name = "mineral:obsidian"})
	minetest.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

default.cool_lava_flowing = function(pos)
	minetest.set_node(pos, {name = "mineral:basalt"})
	minetest.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

minetest.register_abm({
	nodenames = {"default:lava_flowing"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 2,
	catch_up = false,
	action = function(...)
		default.cool_lava_flowing(...)
	end,
})

minetest.register_abm({
	nodenames = {"default:lava_source"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 2,
	catch_up = false,
	action = function(...)
		default.cool_lava_source(...)
	end,
})

-- default wood for u_i compatibility
minetest.register_node("default:wood", {
	description = "Wood",
	tiles = {"default_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})


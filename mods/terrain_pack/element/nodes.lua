-- Grailtest 5 --
-- mods/element/nodes.lua

-- translation support.
local S = minetest.get_translator("element")

-- Light

minetest.register_node("element:light", {
	description = S("Light source"),
	drawtype = "airlike",
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
	},
	walkable = false,
	pointable = true,
	buildable_to = true,
	floodable = true,
	drop = "",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 11,
	groups = { light = 1, choppy=2, dig_immediate=3, },
	sounds = base.node_sound_defaults({
		footstep = 	{name = "base_hard_footstep", gain = 0.1},
		dug = 		{name = "base_dug_node", gain = 0.5},
		dig = 		{name = "base_dig_dig_immediate", gain = 0.5},
		place = 	{name = "base_place_node_hard", gain = 0.1}
	}),
})

--
-- Weather
--

minetest.register_node("element:cloud", {
	description = S("Cloud"),
	drawtype = "glasslike",
	tiles = {"element_cloud.png"},
	sounds = base.node_sound_defaults(),
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

minetest.register_node("element:water_flowing", {
	description = S("Flowing Water"),
	inventory_image = minetest.inventorycube("element_water.png"),
	drawtype = "flowingliquid",
	tiles = {"element_water.png"},
	special_tiles = {
		{
			name = "element_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type     = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length   = 0.8,
			}
		},
		{
			name = "element_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type     = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length   = 0.8,
			}
		},
	},
	use_texture_alpha = "opaque",
	--alpha = 185,
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
	liquid_alternative_flowing = "element:water_flowing",
	liquid_alternative_source = "element:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 160, r = 30, g = 35, b = 40},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, not_in_creative_inventory = 1},
	sounds = base.node_sound_water_defaults(),
})

minetest.register_node("element:water_source", {
	description = S("Water Source"),
	inventory_image = minetest.inventorycube("element_water.png^[noalpha"),
	drawtype = "liquid",
	tiles = {
		{
			name = "element_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material
		{
			name = "element_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	use_texture_alpha = "opaque",
	--alpha = 185,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "element:water_flowing",
	liquid_alternative_source = "element:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 160, r = 30, g = 35, b = 40},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, freezes = 1, melt_around = 1},
	sounds = base.node_sound_water_defaults(),
})

minetest.register_node("element:river_water_source", {
	description = S("River Water Source"),
	inventory_image = minetest.inventorycube("element_water.png^[noalpha"),
	drawtype = "liquid",
	tiles = {
		{
			name = "element_water_source_animated.png",
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
			name = "element_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	use_texture_alpha = "opaque",
	--alpha = 185,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "element:river_water_flowing",
	liquid_alternative_source = "element:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 123, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
	sounds = base.node_sound_water_defaults(),
})

minetest.register_node("element:river_water_flowing", {
	description = S("Flowing River Water"),
	inventory_image = minetest.inventorycube("element_water.png"),
	drawtype = "flowingliquid",
	tiles = {"element_water.png"},
	special_tiles = {
		{
			name = "element_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "element_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	use_texture_alpha = "opaque",
	--alpha = 185,
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
	liquid_alternative_flowing = "element:river_water_flowing",
	liquid_alternative_source = "element:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 123, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1},
	sounds = base.node_sound_water_defaults(),
})

minetest.register_node("element:freshice", {
	description = S("Fresh ice"),
	tiles = {"element_ice.png"},
	use_texture_alpha = "opaque",
	is_ground_content = false,
	paramtype = "light",
	freezemelt = "element:river_water_source",
	groups = {cracky = 3, melts = 1, water = 1, puts_out_fire = 1},
	sounds = base.node_sound_ice_defaults(),
})

minetest.register_node("element:ice", {
	description = S("Ice"),
	tiles = {"element_ice.png"},
	use_texture_alpha = "opaque",
	is_ground_content = false,
	paramtype = "light",
	freezemelt = "element:water_source",
	groups = {cracky = 3, melts = 1, water = 1, puts_out_fire = 1},
	sounds = base.node_sound_ice_defaults(),
})

minetest.register_node("element:snow", {
	description = S("Snow"),
	tiles = {"element_snow.png"},
	inventory_image = "element_snowball.png",
	wield_image = "element_snowball.png",
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
	sounds = base.node_sound_snow_defaults(),
	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "element:dirt_with_ice" then
			minetest.set_node(pos, {name = "element:dirt_with_snow"})
		end
	end,
})

minetest.register_node("element:snowblock", {
	description = S("Snow Block"),
	tiles = {"element_snow.png"},
	is_ground_content = true,
	groups = {crumbly = 3, puts_out_fire = 1},
	sounds = base.node_sound_snow_defaults(),
})

minetest.register_node("element:steam", {
	description = S("Steam"),
	inventory_image = "unknown_node.png",
	wield_image = "unknown_node.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	floodable = true,
	air_equivalent = true,
	drop = "",
	groups = {water = 3, vapour = 3, not_in_creative_inventory = 1},
})

---------
--Methane
---------

methane_blast = {
    radius = 3,
    damage_radius = 2,
    explode_center = false,
    ignore_protection = false,
    sound = "element_explode",
    ignore_on_blast = false,
}

function element.methane_ignite(pos)
    local above = {x = pos.x, y = pos.y + 1, z = pos.z}
    local anode = minetest.get_node(above)
    if anode.name == "air" then
        minetest.swap_node(above, {name = "element:methane_burning"})
        minetest.registered_nodes["element:methane_burning"].on_construct(pos)
    else
        minetest.chat_send_all("no air above")
    end
end

minetest.register_node("element:methane", {
	description = S("Methane"),
	inventory_image = minetest.inventorycube("element_methane.png"),
	wield_image = "element_methane.png",
	drawtype = "liquid",
	tiles = {"element_methane.png"},
	use_texture_alpha = "blend",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	floodable = false,
	air_equivalent = true,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "element:methane_flowing",
	liquid_alternative_source = "element:methane",
	liquid_viscosity = 0,
	liquid_renewable = true,
	liquid_range = 6,
	post_effect_color = {a = 23, r = 60, g = 0, b = 75},
	drop = "",
	groups = {gas = 1, flammable = 1, falling_node = 1, not_in_creative_inventory=1},
	on_punch = function(pos, node, puncher)
		if puncher:get_wielded_item():get_name() == "equipment:torch" then
			element.methane_ignite(pos)
			minetest.log("action", puncher:get_player_name() ..
				" ignites " .. node.name .. " at " ..
				minetest.pos_to_string(pos))
		end
	end,
	after_destruct = function(pos)
	    local name = nodename or minetest.get_node(pos).name
	    local nodedef = minetest.registered_nodes[name]
	    if (nodedef and nodedef.groups and
			nodedef.groups.igniter and nodedef.groups.igniter > 0) then
	        element.methane_ignite(pos)
	        minetest.chat_send_all(name .. " ignites methane!")
	    end
	end,
	on_burn = function(pos)
		element.methane_ignite(pos)
	    minetest.remove_node(pos)
	end,
	on_ignite = function(pos, igniter)
		element.methane_ignite(pos)
	    minetest.remove_node(pos)
	end,
	on_blast = function(pos, intensity)
	    minetest.remove_node(pos)
	end,
})

minetest.register_node("element:methane_flowing", {
	description = S("Methane"),
	inventory_image = minetest.inventorycube("element_methane.png"),
	wield_image = "element_methane.png",
	drawtype = "flowingliquid",
	tiles = {"element_methane.png"},
	special_tiles = {
		{
			name = "element_methane.png",
			backface_culling = false,
		},
		{
			name = "element_methane.png",
			backface_culling = true,
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	floodable = false,
	air_equivalent = true,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "element:methane_flowing",
	liquid_alternative_source = "element:methane",
	liquid_viscosity = 0,
	liquid_renewable = true,
	liquid_range = 6,
	post_effect_color = {a = 23, r = 60, g = 0, b = 75},
	drop = "",
	groups = {gas = 1, flammable = 1, falling_node = 1, not_in_creative_inventory=1},
	on_punch = function(pos, node, puncher)
		if puncher:get_wielded_item():get_name() == "equipment:torch" then
			element.methane_ignite(pos)
			minetest.log("action", puncher:get_player_name() ..
				" ignites " .. node.name .. " at " ..
				minetest.pos_to_string(pos))
		end
	end,
	after_destruct = function(pos)
	    local name = nodename or minetest.get_node(pos).name
	    local nodedef = minetest.registered_nodes[name]
	    if (nodedef and nodedef.groups and
			nodedef.groups.igniter and nodedef.groups.igniter > 0) then
	        element.methane_ignite(pos)
	        minetest.chat_send_all(name .. " ignites methane!")
	    end
	end,
	on_burn = function(pos)
		element.methane_ignite(pos)
	    minetest.remove_node(pos)
	end,
	on_ignite = function(pos, igniter)
		element.methane_ignite(pos)
	    minetest.remove_node(pos)
	end,
	on_blast = function(pos, intensity)
	    minetest.remove_node(pos)
	end,
})

minetest.register_node("element:methane_burning", {
	description = S("Burning Methane"),
	inventory_image = minetest.inventorycube("element_gas_flame.png"),
	wield_image = "element_gas_flame.png",
	drawtype = "firelike",
	tiles = {{
		name = "element_gas_flame_animated.png",
		animation = {
			type = "vertical_frames",
			aspect_w = 16,
			aspect_h = 16,
			length = 1
		}}
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	light_source = 8,
    sunlight_propagates = true,
	walkable = false,
	pointable = true,
	diggable = false,
	buildable_to = false,
	floodable = false,
	post_effect_color = {a = 23, r = 60, g = 0, b = 75},
	drop = "",
	groups = {gas = 1, flammable = 1, falling_node = 1, not_in_creative_inventory=1, igniter=2},
	on_construct = function(pos)
	    delay = minetest.get_node_timer(pos)
	    delay:start(math.random(5,15))
	end,
	on_timer = function(pos, elapsed)
		element.boom(pos, methane_blast)
	end,
	-- unaffected by explosions
	on_blast = minetest.remove_node(pos),
})
--
-- Rocks
--

minetest.register_node("element:stone", {
	description = S("Stone"),
	tiles = {"element_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'element:cobble',
	legacy_mineral = true,
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("element:cobble", {
	description = S("Cobblestone"),
	tiles = {"element_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("element:mossycobble", {
	description = S("Mossy Cobblestone"),
	tiles = {"element_cobble.png^element_moss.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("element:desert_stone", {
	description = S("Desert Stone"),
	tiles = {"element_desert_stone.png"},
	groups = {cracky = 3},
	drop = 'element:desert_cobble',
	legacy_mineral = true,
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("element:desert_cobble", {
	description = S("Desert Cobblestone"),
	tiles = {"element_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("element:sandstone", {
	description = S("Sandstone"),
	tiles = {"element_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})

--
-- Lava
--

minetest.register_node("element:lava_flowing", {
	description = S("Flowing Lava"),
	inventory_image = minetest.inventorycube("element_lava.png"),
	drawtype = "flowingliquid",
	tiles = {"element_lava.png"},
	special_tiles = {
		{
			image = "element_lava_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			}
		},
		{
			image = "element_lava_flowing_animated.png",
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
	light_source = base.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "element:lava_flowing",
	liquid_alternative_source = "element:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4*2,
	post_effect_color = {a = 192, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, hot = 3, not_in_creative_inventory = 1},
})

minetest.register_node("element:lava_source", {
	description = S("Lava Source"),
	inventory_image = minetest.inventorycube("element_lava.png"),
	drawtype = "liquid",
	tiles = {"element_lava.png"},
	special_tiles = {
		{
			name = "element_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
		{
			name = "element_lava_source_animated.png",
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
	light_source = base.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "element:lava_flowing",
	liquid_alternative_source = "element:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	liquid_range = 3,
	damage_per_second = 4*2,
	post_effect_color = {a = 192, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, hot = 3},
})

--
-- Dirt
--

-- Temperate

minetest.register_node("element:dirt", {
	description = S("Dirt"),
	tiles = {"element_dirt.png"},
	groups = {crumbly = 3, soil = 2},
	soil = {
		base = "element:dirt",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("element:dirt_with_grass", {
	description = S("Dirt with Grass"),
	tiles = {"element_grass.png", "element_dirt.png",
		{name = "element_dirt.png^element_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, mutable = 1},
	soil = {
		base = "element:dirt",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	drop = 'element:dirt',
	sounds = base.node_sound_dirt_defaults(),
})

-- Mediterranean

minetest.register_node("element:dirt_light", {
	description = S("Dirt"),
	tiles = {"element_dirt_light.png"},
	groups = {crumbly = 3, soil = 1},
	soil = {
		base = "element:dirt",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("element:dirt_with_grass_light", {
	description = S("Dirt with Grass"),
	tiles = {"element_grass_light.png", "element_dirt_light.png",
		{name = "element_dirt_light.png^element_grass_light_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, mutable = 1},
	soil = {
		base = "element:dirt",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	drop = 'element:dirt',
	sounds = base.node_sound_dirt_defaults(),
})

-- Savannah

minetest.register_node("element:dirt_red", {
	description = S("Red Dirt"),
	tiles = {"element_dirt_red.png"},
	groups = {crumbly = 2, soil = 1},
	soil = {
		base = "element:dirt",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("element:dirt_with_dry_grass", {
	description = S("Dirt with Dry Grass"),
	tiles = {"element_dry_grass.png",
		"element_dirt_red.png",
		{name = "element_dirt_red.png^element_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, mutable = 1},
	soil = {
		base = "element:dirt",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	drop = "element:dirt_red",
	sounds = base.node_sound_dirt_defaults(),
})

-- Jungle

minetest.register_node("element:dirt_jungle", {
	description = S("Jungle Dirt"),
	tiles = {"element_dirt_red.png"},
	groups = {crumbly = 2, soil = 1},
	soil = {
		base = "element:dirt",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("element:dirt_with_grass_jungle", {
	description = S("Dirt with Grass"),
	tiles = {"element_grass_jungle.png", "element_dirt_red.png",
		{name = "element_dirt_red.png^element_grass_jungle_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, mutable = 1},
	soil = {
		base = "element:dirt",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	drop = 'element:dirt',
	sounds = base.node_sound_dirt_defaults(),
})

-- Desert

minetest.register_node("element:dirt_baked", {
	description = S("Baked Dirt"),
	tiles = {"element_dirt_baked.png"},
	groups = {crumbly = 1},
	sounds = base.node_sound_defaults(),
})

minetest.register_node("element:desert_sand", {
	description = S("Desert Sand"),
	tiles = {"element_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = base.node_sound_sand_defaults(),
})

-- Tundra

minetest.register_node("element:permafrost", {
	description = S("Permafrost"),
	tiles = {"element_permafrost.png"},
	groups = {crumbly = 1},
	drop = "element:permafrost",
	sounds = base.node_sound_dirt_defaults({
		footstep = {name = "base_grass_footstep", gain = 0.6},
	}),
})

minetest.register_node("element:dirt_with_ice", {
	description = S("Dirt with Ice"),
	tiles = {"element_icydirt.png",
		"element_permafrost.png",
		{name = "element_permafrost.png^element_icydirt_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 1, mutable = 1},
	drop = "element:permafrost",
	sounds = base.node_sound_dirt_defaults(),
})

-- Taiga

minetest.register_node("element:dirt_yellow", {
	description = S("Yellow Dirt"),
	tiles = {"element_dirt_yellow.png"},
	is_ground_content = true,
	groups = {crumbly = 1, soil=1},
	soil = {
		base = "element:dirt_yellow",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("element:dirt_with_snow", {
	description = S("Dirt with Snow"),
	tiles = {"element_snow.png", "element_dirt_yellow.png",
		{name = "element_dirt_yellow.png^element_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 1, soil = 1, mutable = 1},
	soil = {
		base = "element:dirt_yellow",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	drop = 'element:dirt_yellow',
	sounds = base.node_sound_snow_defaults(),
})

--
-- Soil
--

minetest.register_node("element:soil", {
	description = S("Soil"),
	tiles = {"element_soil.png", "element_dirt.png"},
	drop = "element:dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 2, field = 1},
	soil = {
		base = "element:dirt",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("element:soil_wet", {
	description = S("Wet Soil"),
	tiles = {"element_soil_wet.png", "element_soil_wet_side.png"},
	drop = "element:dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 3, wet = 1, field = 1},
	soil = {
		base = "element:dirt",
		dry = "element:soil",
		wet = "element:soil_wet"
	},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("element:sand", {
	description = S("Sand"),
	tiles = {"element_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = base.node_sound_sand_defaults(),
})

minetest.register_node("element:gravel", {
	description = S("Gravel"),
	tiles = {"element_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = base.node_sound_gravel_defaults(),
})

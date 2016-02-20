--
-- Dry Shrub
--

minetest.register_node("plant:dry_shrub", {
	description = "Dry Shrub",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"plant_dry_shrub.png"},
	inventory_image = "plant_dry_shrub.png",
	wield_image = "plant_dry_shrub.png",
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = true,
	buildable_to = true,
	groups = {snappy=3,flammable=3,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:dirt_with_snow", "default:dirt_with_ice", "default:dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert", "steppe", "tundra"},
	y_min = 2,
	y_max = 120,
	decoration = "plant:dry_shrub",
})

--
-- Grass
--

minetest.register_node("plant:grass_1", {
	description = "Grass",
	drawtype = "plantlike",
	tiles = {"plant_grass_1.png"},
	inventory_image = "plant_grass_3.png",
	wield_image = "plant_grass_3.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:grass_1'}},
		}
	},
	groups = {snappy=3,flammable=3,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("plant:grass_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("plant:grass_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

for i=2,5 do
	minetest.register_node("plant:grass_"..i, {
		description = "Grass",
		drawtype = "plantlike",
		tiles = {"plant_grass_"..i..".png"},
		inventory_image = "plant_grass_"..i..".png",
		wield_image = "plant_grass_"..i..".png",
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		drop = {
			max_items = 1,
			items = {
				{items = {'plant:barley_seed'},rarity = 9},
				{items = {'plant:oats_seed'},rarity = 9},
				{items = {'plant:grass_1'},rarity = 2},
				{items = {'plant:hay'},rarity = 2},
			}
		},
		groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
end

minetest.register_craft({
	type = "fuel",
	recipe = "plant:grass_1",
	burntime = 2,
})

local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland", "woodland", "alpine", "savanna_swamp", "woodland_swamp"},
		y_min = 1,
		y_max = 100,
		decoration = "plant:grass_"..length,
	})
end

register_grass_decoration(-0.03,  0.09,  5)
register_grass_decoration(-0.015, 0.075, 4)
register_grass_decoration(0,      0.06,  3)
register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

--
-- Golden Grass
--

minetest.register_node("plant:golden_grass_1", {
	description = "Golden Grass",
	drawtype = "plantlike",
	tiles = {"plant_golden_grass_1.png"},
	-- use a bigger inventory image
	inventory_image = "plant_golden_grass_3.png",
	wield_image = "plant_golden_grass_3.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:golden_grass_1'}},
		}
	},
	groups = {snappy=3,flammable=3,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random golden_grass node
		local stack = ItemStack("plant:golden_grass_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("plant:golden_grass_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

for i=2,5 do
	minetest.register_node("plant:golden_grass_"..i, {
		description = "Golden Grass",
		drawtype = "plantlike",
		tiles = {"plant_golden_grass_"..i..".png"},
		inventory_image = "plant_golden_grass_"..i..".png",
		wield_image = "plant_golden_grass_"..i..".png",
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		drop = {
			max_items = 1,
			items = {
				{items = {'plant:wheat_seed'},rarity = 10},
				{items = {'plant:wheat_seed'},rarity = 10},
				{items = {'plant:golden_grass_1'},rarity = 2},
				{items = {'plant:hay'},rarity = 2},
			}
		},
		groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
end

minetest.register_craft({
	type = "fuel",
	recipe = "plant:golden_grass_1",
	burntime = 2,
})

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"savanna", "steppe"},
		y_min = 2,
		y_max = 100,
		decoration = "plant:golden_grass_"..length,
	})
end

register_dry_grass_decoration(0.01, 0.05,  5)
register_dry_grass_decoration(0.03, 0.03,  4)
register_dry_grass_decoration(0.05, 0.01,  3)
register_dry_grass_decoration(0.07, -0.01, 2)
register_dry_grass_decoration(0.09, -0.03, 1)

--
-- Junglegrass
--

minetest.register_node("plant:junglegrass", {
	description = "Jungle Grass",
	drawtype = "plantlike",
	--visual_scale = 1.3,
	tiles = {"plant_junglegrass.png"},
	inventory_image = "plant_junglegrass.png",
	wield_image = "plant_junglegrass.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:maize_seed'},rarity = 8},
			{items = {'plant:junglegrass'}},
		}
	},
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

if minetest.get_mapgen_params().mgname ~= "v6" then
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"rainforest", "rainforest_swamp"},
		y_min = 1,
		y_max = 70,
		decoration = "plant:junglegrass",
	})
end
--
-- wheat
--

for i=1,8 do
	local drop = {
		items = {
			{items = {'plant:straw'},rarity=9-i},
			{items = {'plant:straw'},rarity=9-i},
			{items = {'plant:straw'},rarity=9-i},
			{items = {'plant:wheat_seed'},rarity=17-i*2},
			{items = {'plant:wheat_seed'},rarity=18-i*2},
		}
	}
	minetest.register_node("plant:wheat_"..i, {
		drawtype = "plantlike",
		tiles = {"plant_wheat_"..i..".png"},
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		drop = drop,
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		groups = {snappy=3,flammable=2,plant=1,wheat=i,not_in_creative_inventory=1,attached_node=1},
		sounds = default.node_sound_leaves_defaults(),
	})
end

minetest.register_abm({
	nodenames = {"group:wheat"},
	neighbors = {"group:soil"},
	interval = 90,
	chance = 2,
	action = function(pos, node)
		-- return if already full grown
		if minetest.get_item_group(node.name, "wheat") == 8 then
			return
		end
		
		-- check if on wet soil
		pos.y = pos.y-1
		local n = minetest.get_node(pos)
		if minetest.get_item_group(n.name, "soil") < 3 then
			return
		end
		pos.y = pos.y+1
		
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 13 then
			return
		end
		
		-- grow
		local height = minetest.get_item_group(node.name, "wheat") + 1
		minetest.set_node(pos, {name="plant:wheat_"..height})
	end
})


-- oats

for i=1,8 do
	local drop = {
		items = {
			{items = {'plant:straw'},rarity=10-i},
			{items = {'plant:straw'},rarity=10-i},
			{items = {'plant:straw'},rarity=10-i},
			{items = {'plant:oats_seed'},rarity=16-i*2},
			{items = {'plant:oats_seed'},rarity=17-i*2},
		}
	}
	minetest.register_node("plant:oats_"..i, {
		drawtype = "plantlike",
		tiles = {"plant_oats_"..i..".png"},
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		drop = drop,
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		groups = {snappy=3,flammable=2,plant=1,oatslike=i,not_in_creative_inventory=1,attached_node=1},
		sounds = default.node_sound_leaves_defaults(),
	})
end

minetest.register_abm({
	nodenames = {"group:oatslike"},
	neighbors = {"group:soil"},
	interval = 90,
	chance = 2,
	action = function(pos, node)
		-- return if already full grown
		if minetest.get_item_group(node.name, "oatslike") == 8 then
			return
		end
		
		-- check if on wet soil
		pos.y = pos.y-1
		local n = minetest.get_node(pos)
		if minetest.get_item_group(n.name, "soil") < 3 then
			return
		end
		pos.y = pos.y+1
		
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 11 then
			return
		end
		
		-- grow
		local height = minetest.get_item_group(node.name, "oatslike") + 1
		minetest.set_node(pos, {name="plant:oats_"..height})
	end
})

-- barley

for i=1,8 do
	local drop = {
		items = {
			{items = {'plant:straw'},rarity=9-i},
			{items = {'plant:straw'},rarity=9-i},
			{items = {'plant:straw'},rarity=9-i},
			{items = {'plant:barley_seed'},rarity=17-i*2},
			{items = {'plant:barley_seed'},rarity=18-i*2},
		}
	}
	minetest.register_node("plant:barley_"..i, {
		drawtype = "plantlike",
		tiles = {"plant_barley_"..i..".png"},
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		drop = drop,
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		groups = {snappy=3,flammable=2,plant=1,barleylike=i,not_in_creative_inventory=1,attached_node=1},
		sounds = default.node_sound_leaves_defaults(),
	})
end

minetest.register_abm({
	nodenames = {"group:barleylike"},
	neighbors = {"group:soil"},
	interval = 90,
	chance = 2,
	action = function(pos, node)
		-- return if already full grown
		if minetest.get_item_group(node.name, "barleylike") == 8 then
			return
		end
		
		-- check if on wet soil
		pos.y = pos.y-1
		local n = minetest.get_node(pos)
		if minetest.get_item_group(n.name, "soil") < 3 then
			return
		end
		pos.y = pos.y+1
		
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 12 then
			return
		end
		
		-- grow
		local height = minetest.get_item_group(node.name, "barleylike") + 1
		minetest.set_node(pos, {name="plant:barley_"..height})
	end
})

-- maize

for i=1,8 do
	local drop = {
		items = {
			{items = {'plant:maize_seed'},rarity=9-i},
			{items = {'plant:maize_seed'},rarity=17-i*2},
		}
	}
	minetest.register_node("plant:maize_"..i, {
		drawtype = "plantlike",
		tiles = {"plant_maize_"..i..".png"},
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		drop = drop,
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		groups = {snappy=3,flammable=2,plant=1,maizelike=i,not_in_creative_inventory=1,attached_node=1},
		sounds = default.node_sound_leaves_defaults(),
	})
end

minetest.register_abm({
	nodenames = {"group:maizelike"},
	neighbors = {"group:soil"},
	interval = 90,
	chance = 2,
	action = function(pos, node)
		-- return if already full grown
		if minetest.get_item_group(node.name, "maizelike") == 8 then
			return
		end
		
		-- check if on wet soil
		pos.y = pos.y-1
		local n = minetest.get_node(pos)
		if minetest.get_item_group(n.name, "soil") < 3 then
			return
		end
		pos.y = pos.y+1
		
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 12 then
			return
		end
		
		-- grow
		local height = minetest.get_item_group(node.name, "maizelike") + 1
                --print("maize indigestion! "..height)
		minetest.set_node(pos, {name="plant:maize_"..height})
	end
})

-- papyrus

minetest.register_node("plant:papyrus", {
	description = "Papyrus Reed",
	drawtype = "plantlike",
	tiles = {"plant_papyrus.png"},
	inventory_image = "plant_papyrus.png",
	wield_image = "plant_papyrus.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {snappy=3,flammable=2},
	sounds = default.node_sound_leaves_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

function default.grow_papyrus(pos, node)
	pos.y = pos.y - 1
	--local name = minetest.get_node(pos).name
	if not minetest.find_node_near(pos, 3, {"group:water"}) then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "plant:papyrus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	minetest.set_node(pos, {name = "plant:papyrus"})
	return true
end

minetest.register_craft({
	type = "fuel",
	recipe = "plant:papyrus",
	burntime = 1,
})

minetest.register_abm({
	nodenames = {"plant:papyrus"},
	neighbors = {"default:dirt", "default:dirt_with_grass", "default:sand"},
	interval = 50,
	chance = 20,
	action = function(...)
		default.grow_papyrus(...)
	end
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt"},
	sidelen = 16,
	noise_params = {
		offset = -0.3,
		scale = 0.7,
		spread = {x = 200, y = 200, z = 200},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"savanna_swamp"},
	y_min = 0,
	y_max = 1,
	schematic = minetest.get_modpath("plant").."/schematics/papyrus.mts",
})

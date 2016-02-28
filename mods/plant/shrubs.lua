--
-- Orange
--

minetest.register_node("plant:orange_sapling", {
	description = "Orange Tree Sapling",
	drawtype = "plantlike",
	tiles = {"plant_orange_sapling.png"},
	inventory_image = "plant_orange_sapling.png",
	wield_image = "plant_orange_sapling.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {dig_immediate=3,flammable=2,sapling=1,attached_node=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("plant:orange_sapling_ongen", {
	description = "Orange Tree Sapling",
	drawtype = "plantlike",
	tiles = {"plant_orange_sapling.png"},
	inventory_image = "plant_orange_sapling.png",
	paramtype = "light",
	paramtype2 = "waving",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,not_in_creative_inventory=1,sapling=1},
	sounds = default.node_sound_defaults(),
	drop = "plant:orange_sapling"
})

minetest.register_node("plant:orange_tree_trunk", {
	description = "Orange Tree Trunk",
	drawtype = "nodebox",
	tiles = {"plant_orange_trunk_top.png", "plant_orange_trunk_top.png", "plant_orange_trunk.png"},
	node_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree=1, choppy=2, oddly_breakable_by_hand=1, flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("plant:orange_tree_leaves", {
	drawtype = "allfaces_optional",
	tiles = {"plant_orange_leaves.png"},
	waving = 1,
	paramtype = "light",
	groups = {snappy=3, leafdecay=3, flammable=2, not_in_creative_inventory=1},
 	drop = {
		max_items = 1,
		items = {
			{
				items = {'plant:orange_sapling'},
				rarity = 20,
			},
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:orange", {
	description = "Orange",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"plant_orange_fruit.png"},
	inventory_image = "plant_orange_fruit.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy=3,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1,fruit=1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="plant:orange", param2=1})
		end
	end,
})

--
-- Heath shrubs
--

--
-- rhodedendron
--

minetest.register_node("plant:rhodedendron", {
	description = "Rhodedendron",
	drawtype = "allfaces_optional",
	tiles = {"plant_rhodedendron.png"},
	waving = 0,
	paramtype = "light",
	drop = "plant:rhodedendron",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, flower=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_abm({
	nodenames = {"plant:rhodedendron"},
	neighbors = {"plant:rhodedendron", "group:soil"},
	interval = 23000,
	chance = 23,
	action = function(pos, node)
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 11 then
			return
		end
		local height = 0
		while minetest.get_node(pos).name == "plant:rhodedendron" and minetest.find_node_near(pos, 2, {"group:soil"}) ~= nil do
			-- randomly choose a direction of growth
			local factor = math.random(-4, 4)
			if factor > 1 then
				local xfactor = factor - 3
				pos.x = pos.x + xfactor
			elseif factor < -1 then
				local zfactor = factor + 3
				pos.z = pos.z  + zfactor
			else
				height = height+1
				pos.y = pos.y+1
			end
		end
		if height < 3 then
			-- check if on soil or shrub
			pos.y = pos.y-1
			local n = minetest.get_node(pos)
			if n.name == "air" then
				pos.y = pos.y-1
			elseif minetest.get_item_group(n.name, "soil") < 1 or n.name ~= "plant:rhodedendron" then
				return
			end
			pos.y = pos.y+1
			if n.name == "air" and minetest.find_node_near(pos, 2, {"group:soil"}) ~= nil then
				minetest.set_node(pos, {name="plant:rhodedendron"})
			end
		end
	end,
})

plant.place_rhodedendron = function(pos)
	for x0 = -1,1 do
		for z0 = -1,1 do
			local here = {x=pos.x+x0, y=pos.y+1, z=pos.z+z0}
			local node_here = minetest.get_node(here)
			if node_here.name == "air" then
				here.y = here.y-1
			elseif minetest.get_item_group(node_here.name, "soil") < 1 or 
					node_here.name ~= "plant:rhodedendron" then
				return
			end
			here.y = here.y+1
			if node_here.name == "air" and 
					minetest.find_node_near(here, 2, {"group:soil"}) ~= nil and
					math.random(1,9) > 5 then
				minetest.set_node(here, {name="plant:rhodedendron"})
			end
		end
	end
end

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 80,
	noise_params = {
		offset = -0.09,
		scale = 0.1,
		spread = {x = 63, y = 63, z = 63}, 
		seed = 556, 
		octaves = 3, 
		persist = 0.5
	},
	biomes = {"woodland", "alpine", "rainforest"},
	--spawn_by = "",
	y_min = 13,
	y_max = 80,
	decoration = {"plant:rhodedendron"},
})

--
-- gorse
--

minetest.register_node("plant:gorse", {
	description = "Gorse Flowers",
	drawtype = "plantlike",
	visual_scale = 1.15,
	tiles = {"plant_heath_gorse.png"},
	inventory_image = "plant_heath_gorse.png",
	waving = 0,
	paramtype = "light",
	drop = "plant:gorse",
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, salad=1, flower=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_abm({
	nodenames = {"plant:gorse"},
	neighbors = {"plant:gorse", "group:soil"},
	interval = 23000,
	chance = 23,
	action = function(pos, node)
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 12 then
			return
		end
		local height = 0
		while minetest.get_node(pos).name == "plant:gorse" and minetest.find_node_near(pos, 4, {"group:soil"}) ~= nil do
			-- randomly choose a direction of growth
			local factor = math.random(-4, 4)
			if factor > 1 then
				local xfactor = factor - 3
				pos.x = pos.x + xfactor
			elseif factor < -1 then
				local zfactor = factor + 3
				pos.z = pos.z  + zfactor
			else
				-- check this, it looks wrong
				height = height+factor
				pos.y = pos.y+factor
			end
		end
		if height < 4 then
			-- check if on soil or gorse
			pos.y = pos.y-1
			local n = minetest.get_node(pos)
			if n.name == "air" then
				pos.y = pos.y-1
			elseif minetest.get_item_group(n.name, "soil") < 1 or n.name ~= "plant:gorse" then
				return
			end
			pos.y = pos.y+1
			if n.name == "air" and minetest.find_node_near(pos, 4, {"group:soil"}) ~= nil then
				minetest.set_node(pos, {name="plant:gorse"})
			end
		end
	end,
})

--plant:add_plant("plant:gorse", {"plant:gorse"}, 60, 20)

plant.place_gorse = function(pos)
	for x0 = -1,1 do
		for z0 = -1,1 do
			local here = {x=pos.x+x0, y=pos.y+1, z=pos.z+z0}
			local node_here = minetest.get_node(here)
			if minetest.registered_nodes[node_here.name].buildable_to then
				here.y = here.y-1
			elseif minetest.get_item_group(node_here.name, "soil") < 1 or 
					node_here.name ~= "plant:gorse" then
				return
			end
			here.y = here.y+1
			if minetest.registered_nodes[node_here.name].buildable_to and 
					minetest.find_node_near(here, 2, {"group:soil"}) ~= nil and
					math.random(1,9) > 6 then
				minetest.set_node(here, {name="plant:gorse"})
			end
		end
	end
end

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 80,
	noise_params = {
		offset = -0.09,
		scale = 0.1,
		spread = {x = 63, y = 63, z = 63}, 
		seed = 611, 
		octaves = 3, 
		persist = 0.5
	},
	biomes = {"grassland", "steppe", "alpine"},
	--spawn_by = "",
	y_min = 13,
	y_max = 80,
	decoration = {"plant:gorse"},
	rotation = "random",
})

--
-- blackberry
--

minetest.register_node("plant:blackberry", {
	description = "Blackberry Leaves",
	drawtype = "allfaces_optional",
	tiles = {"plant_blackberry_leaves.png"},
	waving = 0,
	paramtype = "light",
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:blackberry_fruit'},rarity=8},
			{items = {'plant:blackberry_fruit'},rarity=16},
			{items = {'plant:blackberry'},rarity=2},
			{items = {'plant:blackberry'},rarity=4},
		}
	},
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:blackberry_fruit", {
	description = "Blackberry",
	tiles = {"plant_blackberry_fruit.png"},
	inventory_image = "plant_blackberry_fruit.png",
	wield_image = "plant_blackberry_fruit.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3, dig_immediate=3, flammable=2, leafdecay=3, leafdecay_drop=1, fruit=1},
	sounds = default.node_sound_defaults(),
	on_use = minetest.item_eat(1),
})


minetest.register_abm({
	nodenames = {"plant:blackberry"},
	neighbors = {"plant:blackberry", "group:soil"},
	interval = 23000,
	chance = 75,
	action = function(pos, node)
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 10 then
			return
		end
		local height = 0
		while minetest.get_node(pos).name == "plant:blackberry" and minetest.find_node_near(pos, 1, {"group:soil"}) ~= nil do
			-- randomly choose a direction of growth
			local factor = math.random(-3, 3)
			if factor > 0 then
				local xfactor = factor - 2
				pos.x = pos.x + xfactor
			elseif factor < 0 then
				local zfactor = factor + 2
				pos.z = pos.z  + zfactor
			else
				height = height+factor
				pos.y = pos.y - 1
			end
		end
		if height < 1 then
			-- Check what is below
			pos.y = pos.y - 1
			while minetest.get_node(pos).name == "air" do
				pos.y = pos.y - 1
			end
			pos.y = pos.y + 1
			if minetest.get_node(pos).name == "air" and minetest.find_node_near(pos, 1, {"group:soil"}) ~= nil then
				if math.random(1, 8) == 1 then
					minetest.set_node(pos, {name="plant:blackberry_fruit"})
				else
					minetest.set_node(pos, {name="plant:blackberry"})
				end
			end
		end
	end,
})

--plant:add_plant("plant:blackberry", {"plant:blackberry"}, 35, 27)

plant.place_blackberry = function(pos)
	for x0 = -1,1 do
		for z0 = -1,1 do
			local here = {x=pos.x+x0, y=pos.y+1, z=pos.z+z0}
			local below = {x=pos.x+x0, y=pos.y, z=pos.z+z0}
			local node_here = minetest.get_node(here)
			local node_below = minetest.get_node(below)
			if minetest.registered_nodes[node_here.name].buildable_to and
					minetest.get_node_group(node_below.name, "soil") > 1 and
					math.random(1,9) > 5 then
				minetest.set_node(here, {name="plant:blackberry"})
			end
		end
	end
end

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 80,
	noise_params = {
		offset = -0.09,
		scale = 0.1,
		spread = {x = 63, y = 63, z = 63}, 
		seed = 715, 
		octaves = 3, 
		persist = 0.5
	},
	biomes = {"grassland", "woodland"},
	--spawn_by = "",
	y_min = 5,
	y_max = 50,
	decoration = {"plant:blackberry"},
})

--
-- hawthorn
--

minetest.register_node("plant:hawthorn", {
	description = "Hawthorn Leaves",
	drawtype = "allfaces_optional",
	tiles = {"plant_hawthorn.png^[transformR180", "plant_hawthorn.png"},
	waving = 0,
	paramtype = "light",
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:hawthorn'},rarity=2},
			{items = {'plant:hawthorn'},rarity=4},
			{items = {'plant:hawthorn'},rarity=8},
		}
	},
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, salad=1, flower=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_abm({
	nodenames = {"plant:hawthorn"},
	neighbors = {"plant:hawthorn", "group:soil"},
	interval = 23000,
	chance = 23,
	action = function(pos, node)
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 10 then
			return
		end
		local height = 0
		while minetest.get_node(pos).name == "plant:hawthorn" and minetest.find_node_near(pos, 3, {"group:soil"}) do
			-- randomly choose a direction of growth
			local factor = math.random(-4, 4)
			if factor > 1 then
				local xfactor = factor - 3
				pos.x = pos.x + xfactor
			elseif factor < -1 then
				local zfactor = factor + 3
				pos.z = pos.z  + zfactor
			else
				height = height + factor
				pos.y = pos.y + factor
			end
		end
		if height < 3 then
			
			-- check if on soil or hawthorn
			pos.y = pos.y-1
			local n = minetest.get_node(pos)
			if n.name == "air" then
				pos.y = pos.y-1
			elseif minetest.get_item_group(n.name, "soil") < 1 or n.name ~= "plant:hawthorn" then
				return
			end
			pos.y = pos.y+1
			if n.name == "air" and minetest.find_node_near(pos, 3, {"group:soil"}) then
				minetest.set_node(pos, {name="plant:hawthorn"})
			end
		end
	end,
})

--plant:add_plant("plant:hawthorn", {"plant:hawthorn"}, 25, 16)

plant.place_hawthorn = function(pos)
	for x0 = -1,1 do
		for z0 = -1,1 do
			local here = {x=pos.x+x0, y=pos.y+1, z=pos.z+z0}
			--local below = {x=pos.x+x0, y=pos.y, z=pos.z+z0}
			local node_here = minetest.get_node(here)
			--local node_below = minetest.get_node(below)
			if minetest.registered_nodes[node_here.name].buildable_to and
					math.random(1,9) > 6 then
				minetest.set_node(here, {name="plant:hawthorn"})
			end
		end
	end
end

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt_with_ice"},
	sidelen = 80,
	noise_params = {
		offset = -0.09,
		scale = 0.1,
		spread = {x = 63, y = 63, z = 63}, 
		seed = 555, 
		octaves = 3, 
		persist = 0.5
	},
	biomes = {"woodland", "alpine"},
	y_min = 5,
	y_max = 40,
	decoration = {"plant:hawthorn"},
	rotation = "180",
})

--
-- Strawberry
--

minetest.register_node("plant:strawberry", {
	description = "Strawberry Leaves",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
	},
	tiles = {"plant_strawberry_leaves.png"},
	waving = 0,
	paramtype = "light",
	drop = {
		max_items = 1,
		items = {
			{items = {'plant:strawberry_fruit'},rarity=8},
			{items = {'plant:strawberry_fruit'},rarity=16},
			{items = {'plant:strawberry'},rarity=2},
			{items = {'plant:strawberry'},rarity=4},
		}
	},
	groups = {snappy=3, flammable=2, plant=1, attached_node=1, leaves=1, flower=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:strawberry_fruit", {
	description = "Strawberry",
	tiles = {"plant_strawberry_fruit.png"},
	inventory_image = "plant_strawberry_fruit.png",
	wield_image = "plant_strawberry_fruit.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1,fruit=1},
	sounds = default.node_sound_defaults(),
	on_use = minetest.item_eat(1),
})


minetest.register_abm({
	nodenames = {"plant:strawberry"},
	neighbors = {"plant:strawberry", "group:soil"},
	interval = 23000,
	chance = 75,
	action = function(pos, node)
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 10 then
			return
		end
		local height = 0
		while minetest.get_node(pos).name == "plant:strawberry" and minetest.find_node_near(pos, 1, {"group:soil"}) ~= nil do
			-- randomly choose a direction of growth
			local factor = math.random(-3, 3)
			if factor > 0 then
				local xfactor = factor - 2
				pos.x = pos.x + xfactor
			elseif factor < 0 then
				local zfactor = factor + 2
				pos.z = pos.z  + zfactor
			end
		end
		if height < 1 then
			-- Check what is below
			local below = {x=pos.x, y=pos.y-1, z=pos.z}
			local node_below = minetest.get_node(below)
			
			while minetest.registered_nodes[node_below.name].walkable ~= "true" do
				below = {x=below.x, y=below.y-1, z=below.z}
			end
			pos = {x=below.x, y=below.y+1, z=below.z}
			local node_here = minetest.get_node(pos)
			node_below = minetest.get_node(below)
			if minetest.get_node_group(node_below.name, "soil") 
					and node_here.name == "air" then
				if math.random(1, 8) == 1 then
					minetest.set_node(pos, {name="plant:strawberry_fruit"})
				else
					minetest.set_node(pos, {name="plant:strawberry"})
				end
			end
		end
	end,
})

--plant:add_plant("plant:strawberry", {"plant:strawberry"}, 35, 27)

plant.place_strawberry = function(pos)
	for x0 = -1,1 do
		for z0 = -1,1 do
			local here = {x=pos.x+x0, y=pos.y+1, z=pos.z+z0}
			local below = {x=pos.x+x0, y=pos.y, z=pos.z+z0}
			--local node_here = minetest.get_node(here)
			local node_below = minetest.get_node(below)
			if minetest.registered_nodes[node_below.name].walkable and
					minetest.get_node_group(node_below.name, "soil") > 1 and
					math.random(1,9) > 6 then
				minetest.set_node(here, {name="plant:strawberry"})
			end
		end
	end
end

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt_with_ice"},
	sidelen = 80,
	noise_params = {
		offset = -0.85,
		scale = 1,
		spread = {x = 63, y = 63, z = 63}, 
		seed = 233, 
		octaves = 3, 
		persist = 0.32
	},
	biomes = {"woodland", "alpine"},
	--spawn_by = "",
	y_min = 5,
	y_max = 60,
	decoration = {"plant:strawberry"},
})

--
-- Heath
--
local rock_surfaces = {
	"default:stone",
	"mineral:bluestone",
	"default:stone_with_lichen_1",
	"default:stone_with_lichen_2",
	"default:stone_with_lichen_3",
	"default:mossycobble",
	"mineral:coal_stone",
	"mineral:iron_stone",
	"mineral:tin_stone",
	"mineral:silver_stone",	
}

local rockplant_biomes = {"tundra", "tundra_ocean", "steppe", "steppe_ocean", "grassland", "grassland_ocean", "woodland", "woodland_swamp", "alpine", "mountain"}

local heath_surfaces = {
	"default:dirt_with_ice",
	"default:stone_with_lichen_1",
	"default:stone_with_lichen_2",
	"default:stone_with_lichen_3",
	"mineral:coal_stone",
	"mineral:iron_stone",
	"mineral:tin_stone",
	"mineral:silver_stone",	
}

local heath_biomes_cool = {"tundra", "tundra_ocean", "taiga_ocean", "steppe", "steppe_ocean", "grassland", "grassland_ocean", "alpine", "mountain"}

local heath_biomes_warm = {"grassland", "grassland_ocean", "woodland", "woodland_swamp", "savanna", "savanna_swamp", "rainforest_swamp", "sandy_shore"}

minetest.register_node("plant:heath_sandwort", {
	description = "Sandwort",
	drawtype = "plantlike",
	visual_scale = 1.23,
	paramtype = "light",
	tiles = {"plant_heath_sandwort.png"},
	inventory_image = "plant_heath_sandwort.png",
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1, flower=1
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
	drop = "plant:heath_sandwort",
})

minetest.register_node("plant:heath_saxifrage_purple", {
	description = "Saxifrage",
	drawtype = "plantlike",
	visual_scale = 1.23,
	paramtype = "light",
	tiles = {"plant_heath_saxifrage_purple.png"},
	inventory_image = "plant_heath_saxifrage_purple.png",
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1, flower=1
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
	drop = "plant:heath_saxifrage_purple",
})

minetest.register_node("plant:heath_purple", {
	description = "Heather",
	drawtype = "plantlike",
	visual_scale = 1.23,
	paramtype = "light",
	tiles = {"plant_heath_purple.png"},
	inventory_image = "plant_heath_purple.png",
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1, flower=1
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
	drop = "plant:heath_purple",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = rock_surfaces,
	sidelen = 80,
	noise_params = {
		offset = -0.65,
		scale = 1,
		spread = {x = 63, y = 63, z = 63}, 
		seed = 391, 
		octaves = 4, 
		persist = 0.25
	},
	y_min = 1,
	y_max = 83,
	biomes = rockplant_biomes,
	decoration = {"plant:heath_purple", "plant:heath_saxifrage_purple", "plant:heath_sandwort", },
	rotation = "random",
})


minetest.register_node("plant:heath_green", {
	description = "Heath",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 0.5},
	},
	paramtype = "light",
	tiles = {"plant_heath_green_top.png"},
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1
	},
	sounds = default.node_sound_leaves_defaults(),
	drop = "plant:heath_green",
})

plant.place_heath_green = function(pos)
	for x0 = -1,1 do
		for z0 = -1,1 do
			local here = {x=pos.x+x0, y=pos.y+1, z=pos.z+z0}
			--local below = {x=pos.x+x0, y=pos.y, z=pos.z+z0}
			local node_here = minetest.get_node(here)
			--local node_below = minetest.get_node(below)
			if minetest.registered_nodes[node_here.name].buildable_to and
					math.random(1,9) > 6 then
				minetest.set_node(here, {name="plant:heath_green"})
			end
		end
	end
end

minetest.register_node("plant:heath_gold", {
	description = "Heath",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 0.5},
	},
	paramtype = "light",
	tiles = {"plant_heath_gold_top.png"},
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1
	},
	sounds = default.node_sound_leaves_defaults(),
	drop = "plant:heath_gold",
})

plant.place_heath_gold = function(pos)
	for x0 = -1,1 do
		for z0 = -1,1 do
			local here = {x=pos.x+x0, y=pos.y+1, z=pos.z+z0}
			--local below = {x=pos.x+x0, y=pos.y, z=pos.z+z0}
			local node_here = minetest.get_node(here)
			--local node_below = minetest.get_node(below)
			if minetest.registered_nodes[node_here.name].buildable_to and
					math.random(1,9) > 6 then
				minetest.set_node(here, {name="plant:heath_gold"})
			end
		end
	end
end

minetest.register_node("plant:heath_red", {
	description = "Heath",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 0.5},
	},
	paramtype = "light",
	tiles = {"plant_heath_red_top.png"},
	walkable = false,
	buildable_to = true,
	groups = {
		snappy=3,
		attached_node=1,
		not_in_creative_inventory=1
	},
	sounds = default.node_sound_leaves_defaults(),
	drop = "plant:heath_red",
})

plant.place_heath_red = function(pos)
	for x0 = -1,1 do
		for z0 = -1,1 do
			local here = {x=pos.x+x0, y=pos.y+1, z=pos.z+z0}
			--local below = {x=pos.x+x0, y=pos.y, z=pos.z+z0}
			local node_here = minetest.get_node(here)
			--local node_below = minetest.get_node(below)
			if minetest.registered_nodes[node_here.name].buildable_to and
					math.random(1,9) > 6 then
				minetest.set_node(here, {name="plant:heath_red"})
			end
		end
	end
end

minetest.register_decoration({
	deco_type = "simple",
	place_on = heath_surfaces,
	sidelen = 80,
	noise_params = {
			offset = -0.85,
			scale = 1,
			spread = {x = 63, y = 63, z = 63},
			seed = 474,
			octaves = 3,
			persist = 0.32,
		},
	y_min = 1,
	y_max = 87,
	biomes = heath_biomes_cool,
	decoration = {"plant:heath_gold", "plant:heath_red", },
	rotation = "random",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = heath_surfaces,
	sidelen = 80,
	noise_params = {
			offset = -0.85,
			scale = 1,
			spread = {x = 96, y = 96, z = 96},
			seed = 537,
			octaves = 3,
			persist = 0.32,
		},
	y_min = 1,
	y_max = 87,
	biomes = heath_biomes_warm,
	decoration = {"plant:heath_green"},
	rotation = "random",
})

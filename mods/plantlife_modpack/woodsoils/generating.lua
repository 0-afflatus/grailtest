-- generating of forest soils

local RaDiuS = {
--	WE1 NS1	   WE2 NS2     WE3 NS3
	{-1,-2,		-2,-2,		-2,-3},
	{ 0,-2,		-3,-1,		-3,-2},
	{ 1,-2,		-3, 0,		-4,-1},
	{-2,-1,		-3, 1,		-4, 0},
	{-1,-1,		-2, 2,		-4, 1},
	{ 0,-1,		-1, 3,		-3, 2},
	{ 1,-1,		 0, 3,		-2, 3},
	{ 2,-1,		 1, 3,		-1, 4},
	{-2, 0,		 2, 2,		 0, 4},
	{-1, 0,		 3, 1,		 1, 4},
	{ 0, 0,		 3, 0,		 2, 3},
	{ 1, 0,		 3,-1,		 3, 2},
	{ 2, 0,		 2,-2,		 4, 1},
	{-2, 1,		 1,-3,		 4, 0},
	{-1, 1,		 0,-3,		 4,-1},
	{ 0, 1,		-1,-3,		 3,-2},
	{ 1, 1,		 0, 0,		 2,-3},
	{ 2, 1,		 0, 0,		 1,-4},
	{-1, 2,		 0, 0,		 0,-4},
	{ 0, 2,		 0, 0,		-1,-4},
	{ 1, 2,		 0, 0,		 0, 0},
}
--  e = + , n = +

local is_in = function(context, search_term)

	for k, value in ipairs(context) do 
		if value == search_term then
			return k
		end
	end
	return false
end

abstract_woodsoils.fall = function(pos, radius)
	
	if pos == nil then
		return
	end
	
	local nodule = minetest.get_node(pos)
	local leafy_node_name = "air"
	local soil_type = 5
	
	if nodule.name == "ignore" then
		return
	end
	
	local woodland = {
		"woodsoils:dirt_with_leaves_2",
		"woodsoils:dirt_with_leaves_1",
		"woodsoils:grass_with_leaves_2",
		"woodsoils:grass_with_leaves_1",
		"default:dirt_with_grass"
	}
	
	local savanna = {
		"woodsoils:dirt_red_with_leaves_2", 
		"woodsoils:dirt_red_with_leaves_1", 
		"woodsoils:drygrass_with_leaves_2", 
		"woodsoils:drygrass_with_leaves_1", 
		"default:dirt_with_dry_grass"
	}
	
	local tundra = {
		"woodsoils:permafrost_with_leaves_2", 
		"woodsoils:permafrost_with_leaves_1", 
		"woodsoils:icydirt_with_leaves_2", 
		"woodsoils:icydirt_with_leaves_1", 
		"default:dirt_with_ice"
	}
	
	local taiga = {
		"woodsoils:dirt_yellow_with_leaves_2", 
		"woodsoils:dirt_yellow_with_leaves_1", 
		"woodsoils:dirt_with_snowy_leaves_2", 
		"woodsoils:dirt_with_snowy_leaves_1", 
		"default:dirt_with_snow"
	}
	
	if is_in(woodland, nodule.name) then
		soil_type = math.min(is_in(woodland, nodule.name), radius + 1)
		leafy_node_name = woodland[soil_type]
	elseif is_in(savanna, nodule.name) then
		soil_type = math.min(is_in(savanna, nodule.name), radius + 1)
		leafy_node_name = savanna[soil_type]
	elseif is_in(tundra, nodule.name) then
		soil_type = math.min(is_in(tundra, nodule.name), radius + 1)
		leafy_node_name = tundra[soil_type]
	elseif is_in(taiga, nodule.name) then
		soil_type = math.min(is_in(taiga, nodule.name), radius + 1)
		leafy_node_name = taiga[soil_type]
	end
	
	if leafy_node_name ~= "air" then
		minetest.set_node(pos, {name=leafy_node_name})
	elseif (minetest.get_item_group(nodule.name, "flora") > 0 or
	nodule.name == "default:snow") and radius < 2 then
		minetest.remove_node(pos)
	end
end

abstract_woodsoils.place_soil = function(pos)
	
	local here = {x=pos.x,y=pos.y-1,z=pos.z}
	local hereb = {x=pos.x,y=pos.y-2,z=pos.z}
	if minetest.get_item_group(minetest.get_node(here).name, "soil") > 0
	or minetest.get_item_group(minetest.get_node(hereb).name, "soil") > 0 
	or minetest.get_node(here).name == "default:dirt_with_ice" then
		for i in pairs(RaDiuS) do
			local WE1 = RaDiuS[i][1]
			local NS1 = RaDiuS[i][2]
			local WE2 = RaDiuS[i][3]
			local NS2 = RaDiuS[i][4]
			local WE3 = RaDiuS[i][5]
			local NS3 = RaDiuS[i][6]
			local radius_1a = {x=pos.x+WE1,y=pos.y-1,z=pos.z+NS1}
			local radius_1b = {x=pos.x+WE1,y=pos.y-2,z=pos.z+NS1}
			local radius_2a = {x=pos.x+WE2,y=pos.y-1,z=pos.z+NS2}
			local radius_2b = {x=pos.x+WE2,y=pos.y-2,z=pos.z+NS2}
			local radius_3a = {x=pos.x+WE3,y=pos.y-1,z=pos.z+NS3}
			local radius_3b = {x=pos.x+WE3,y=pos.y-2,z=pos.z+NS3}
			--local node_1a = minetest.get_node(radius_1a)
			--local node_1b = minetest.get_node(radius_1b)
			--local node_2a = minetest.get_node(radius_2a)
			--local node_2b = minetest.get_node(radius_2b)
			--local node_3a = minetest.get_node(radius_3a)
			--local node_3b = minetest.get_node(radius_3b)
			--Dirt with Leaves 2
			abstract_woodsoils.fall(here, 0)
			abstract_woodsoils.fall(hereb, 0)
			-- Dirt with Leaves 1
			abstract_woodsoils.fall(radius_1a, 1)
			abstract_woodsoils.fall(radius_1b, 1)
			-- Grass with Leaves 2
			abstract_woodsoils.fall(radius_2a, 2)
			abstract_woodsoils.fall(radius_2b, 2)
			-- Grass with Leaves 1
			abstract_woodsoils.fall(radius_3a, 3)
			abstract_woodsoils.fall(radius_3b, 3)
		end
	end
end

biome_lib:register_generate_plant({
	surface = {
		"default:tree",
		"tree:apple_tree_trunk",
		"default:jungletree",
		"tree:jungletree",
		"default:pine_tree",
		"tree:pine_tree",
		"default:acacia_tree",
		"tree:acacia_tree",
		"moretrees:beech_trunk",
		"moretrees:fir_trunk",
		"moretrees:jungletree_trunk",
		"moretrees:oak_trunk",
		"moretrees:pine_trunk",
		"moretrees:spruce_trunk",
		"moretrees:willow_trunk",
		"ferns:fern_03",
		"ferns:fern_02",
		"ferns:fern_01",
		"plant:rhodedendron",
	},
	max_count = 1000,
	rarity = 1,
	min_elevation = 1,
	max_elevation = 100,
	near_nodes = {"group:tree","ferns:fern_03","ferns:fern_02","ferns:fern_01","plant:rhodedendron"},
	near_nodes_size = 5,
	near_nodes_vertical = 1,
	near_nodes_count = 4,
	plantlife_limit = -1,
	check_air = false,
	},
	abstract_woodsoils.place_soil
)

biome_lib:register_generate_plant({
	surface = {
		"moretrees:beech_sapling_ongen",
		"moretrees:fir_sapling_ongen",
		"moretrees:jungletree_sapling_ongen",
		"moretrees:oak_sapling_ongen",
		"moretrees:pine_sapling_ongen",
		"moretrees:spruce_sapling_ongen",
		"moretrees:willow_sapling_ongen",
		"tree:acacia_sapling",
		"tree:pine_sapling",
		"tree:junglesapling",
		"tree:apple_tree_sapling"
	},
	max_count = 1000,
	rarity = 2,
	min_elevation = 1,
	max_elevation = 100,
	plantlife_limit = -0.9,
	check_air = false,
	},
	abstract_woodsoils.place_soil
)

minetest.register_abm({
	nodenames = {"plant:papyrus"},
	neighbors = {
		"woodsoils:dirt_with_leaves_1",
		"woodsoils:dirt_with_leaves_2",
		"woodsoils:grass_with_leaves_1",
		"woodsoils:grass_with_leaves_2"
	},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if string.find(name, "_with_leaves_") then
			if minetest.find_node_near(pos, 3, {"group:water"}) == nil then
				return
			end
			pos.y = pos.y+1
			local height = 0
			while minetest.get_node(pos).name == "plant:papyrus" and height < 4 do
				height = height+1
				pos.y = pos.y+1
			end
			if height < 4 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="plant:papyrus"})
				end
			end
		end
	end,
})

minetest.register_abm({
	nodenames = {"default:tree",
		"tree:apple_tree_trunk",
		"default:jungletree",
		"tree:jungletree",
		"default:pine_tree",
		"tree:pine_tree",
		"default:acacia_tree",
		"tree:acacia_tree",
		"moretrees:beech_trunk",
		"moretrees:fir_trunk",
		"moretrees:jungletree_trunk",
		"moretrees:oak_trunk",
		"moretrees:pine_trunk",
		"moretrees:spruce_trunk",
		"moretrees:willow_trunk",
		"ferns:fern_03",
		"ferns:fern_02",
		"ferns:fern_01",
		"plant:rhodedendron",},
	interval = 60,
	chance = 200,
	action = abstract_woodsoils.place_soil,
})


--ore generation

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:cobble",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		y_min     = -1,
		y_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:mossycobble",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		y_min     = -1000,
		y_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:sandstonebrick",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		y_min     = -1000,
		y_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "stairs:stair_sandstonebrick",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		y_min     = -1000,
		y_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "stairs:stair_cobble",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		y_min     = -1000,
		y_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:web",
		wherein        = "default:junglegrass",
		clust_scarcity = 2*2*2,
		clust_num_ores = 2,
		clust_size     = 2,
		y_min     = -20,
		y_max     = 200,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:web",
		wherein        = "default:jungleleaves",
		clust_scarcity = 4*4*4,
		clust_num_ores = 5,
		clust_size     = 5,
		y_min     = -20,
		y_max     = 200,
			}
)

--nodes

minetest.register_node("nssm:ant_dirt", {
	description = "Ant Dirt",
	tiles = {"ant_dirt.png"},
	groups = {crumbly=3},
})

minetest.register_node("nssm:web", {
	description = "Web",
	inventory_image = "web.png",
	tiles = {"web.png"} ,
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = false,
	drop = "farming:cotton",
	drowning = 0,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_range = 0,
	liquid_alternative_flowing = "nssm:web",
	liquid_alternative_source = "nssm:web",
	liquid_viscosity = 20,
	groups = {flammable = 2, snappy = 1},
})

--tools

minetest.register_tool('nssm:sun_sword', {
	description = 'Sun Sword',
	inventory_image = 'sun_sword.png',
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.80, [2]=0.40, [3]=0.20}, uses=70, maxlevel=1},
			fleshy={times={[2]=0.6, [3]=0.2}, uses=70, maxlevel=1}
		},
		damage_groups = {fleshy=10},
	},
	minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
		if puncher:get_wielded_item():get_name() == 'nssm:sun_sword' then
			if node.name ~= "air" then
				minetest.add_node(pointed_thing.above, {name = "fire:basic_flame"})
			end
		end
	end)
})

minetest.register_tool("nssm:masticone_fang_sword", {
	description = "Masticone Fang Sword",
	inventory_image = "masticone_fang_sword.png",
	tool_capabilities = {
		full_punch_interval =0.7 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=200, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=200, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	},
})

minetest.register_tool("nssm:night_sword", {
	description = "Night Sword",
	inventory_image = "night_sword.png",
	tool_capabilities = {
		full_punch_interval =0.4 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.4, [2]=0.3, [3]=0.2}, uses=300, maxlevel=1},
			fleshy={times={[2]=0.7, [3]=0.3}, uses=300, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
})

minetest.register_tool("nssm:crab_light_mace", {
	description = "Light Crab Mace",
	inventory_image = "crab_light_mace.png",
	tool_capabilities = {
		full_punch_interval =2 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.4, [3]=1}, uses=120, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	},
})

minetest.register_tool("nssm:crab_heavy_mace", {
	description = "Heavy Crab Mace",
	inventory_image = "crab_heavy_mace.png",
	tool_capabilities = {
		full_punch_interval =4 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=2, [3]=1.4}, uses=120, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
})

minetest.register_node("nssm:rope", {
	description = "Rope",
	paramtype = "light",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	drawtype = "plantlike",
	tiles = { "rope.png" },
	groups = {snappy=1},
})

minetest.register_tool("nssm:stoneater_pick", {
	description = "Stoneater Pickaxe",
	inventory_image = "stoneater_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=0.0}, uses=200, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	},
})

minetest.register_tool("nssm:mantis_sword", {
	description = "Mantis Sword",
	inventory_image = "mantis_sword.png",
	tool_capabilities = {
		full_punch_interval =0.7 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.0, [3]=0.4}, uses=50, maxlevel=1},
			snappy={times={[2]=0.80, [3]=0.3}, uses=100, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("nssm:ant_sword", {
	description = "Ant Sword",
	inventory_image = "ant_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.30, [2]=0.90, [3]=0.40}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
})

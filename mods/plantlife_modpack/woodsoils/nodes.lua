-- nodes

minetest.register_node("woodsoils:dirt_with_leaves_1", {
	description = "Forest Soil 1",
	tiles = {
		"default_dirt.png^woodsoils_ground_cover.png", 
		"default_dirt.png", 
		"default_dirt.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		--soil=1,
		--not_in_creative_inventory=1
	},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:dirt_with_leaves_2", {
	description = "Forest Soil 2",
	tiles = {
		"woodsoils_ground.png", 
		"default_dirt.png", 
		"default_dirt.png^woodsoils_ground_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		--soil=1,
		--not_in_creative_inventory=1
	},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:grass_with_leaves_1", {
	description = "Forest Soil 3",
	tiles = {
		"default_grass.png^woodsoils_ground_cover2.png", 
		"default_dirt.png", 
		"default_dirt.png^default_grass_side.png^woodsoils_ground_cover_side2.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1,
		--not_in_creative_inventory=1
	},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:grass_with_leaves_2", {
	description = "Forest Soil 4",
	tiles = {
		"default_grass.png^woodsoils_ground_cover.png", 
		"default_dirt.png", 
		"default_dirt.png^default_grass_side.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1,
		--not_in_creative_inventory=1
	},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

-- Die-off ABM

minetest.register_abm({
	nodenames = {"default:dirt", 
		"woodsoils:dirt_with_leaves_1", 
		"woodsoils:dirt_with_leaves_2", 
		"woodsoils:grass_with_leaves_1", 
		"woodsoils:grass_with_leaves_2",
	},
	interval = 17,
	chance = 101,
	action = function(pos, node)
		local above = vector.add(pos, {x=0, y=1, z=0})
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none" then
			if (minetest.get_node_light(above, 0.5) or 0) > 13 then
				if minetest.find_node_near(above, 3, {
					"group:tree",
					"group:sapling",
					"group:leaves", 
					"ferns:fern_04", 
					"ferns:fern_03", 
					"ferns:fern_02", 
					"ferns:fern_01"
				}) then
					return false
				else
					if node.name == "woodsoils:grass_with_leaves_1" then
						minetest.set_node(pos, {name = "default:dirt_with_grass"})
					elseif node.name == "woodsoils:grass_with_leaves_2" then
						minetest.set_node(pos, {name = "woodsoils:grass_with_leaves_1"})
					elseif node.name == "woodsoils:dirt_with_leaves_1" then
						minetest.set_node(pos, {name = "woodsoils:grass_with_leaves_2"})
					elseif node.name == "woodsoils:dirt_with_leaves_2" then
						minetest.set_node(pos, {name = "woodsoils:dirt_with_leaves_1"})
					else
						minetest.set_node(pos, {name = "default:dirt_with_grass"})
					end
				end
			end
		end
	end
})

-- For compatibility with older stuff
minetest.register_alias("forestsoils:dirt_with_leaves_1",	"woodsoils:dirt_with_leaves_1")
minetest.register_alias("forestsoils:dirt_with_leaves_2",	"woodsoils:dirt_with_leaves_2")
minetest.register_alias("forestsoils:grass_with_leaves_1",	"woodsoils:grass_with_leaves_1")
minetest.register_alias("forestsoils:grass_with_leaves_2",	"woodsoils:grass_with_leaves_2")

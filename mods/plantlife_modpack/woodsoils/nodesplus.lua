-- nodes

minetest.register_node("woodsoils:dirt_red_with_leaves_1", {
	description = "Savanna Soil 1",
	tiles = {
		"default_dirt_red.png^woodsoils_ground_cover.png", 
		"default_dirt_red.png", 
		"default_dirt_red.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		--soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:dirt_red",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:dirt_red_with_leaves_2", {
	description = "Savanna Soil 2",
	tiles = {
		"woodsoils_ground.png", 
		"default_dirt_red.png", 
		"default_dirt_red.png^woodsoils_ground_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		--soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:dirt_red",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:drygrass_with_leaves_1", {
	description = "Savanna Soil 3",
	tiles = {
		"default_dry_grass.png^woodsoils_ground_cover2.png", 
		"default_dirt_red.png", 
		"default_dirt_red.png^default_dry_grass_side.png^woodsoils_ground_cover_side2.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:dirt_red",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:drygrass_with_leaves_2", {
	description = "Savanna Soil 4",
	tiles = {
		"default_dry_grass.png^woodsoils_ground_cover.png", 
		"default_dirt_red.png", 
		"default_dirt_red.png^default_dry_grass_side.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:dirt_red",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

-- Die-off ABM

minetest.register_abm({
	nodenames = {
		"woodsoils:dirt_red_with_leaves_1", 
		"woodsoils:dirt_red_with_leaves_2", 
		"woodsoils:drygrass_with_leaves_1", 
		"woodsoils:drygrass_with_leaves_2",
	},
	interval = 19,
	chance = 137,
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
					if node.name == "woodsoils:drygrass_with_leaves_1" then
						minetest.set_node(pos, {name = "default:dirt_with_dry_grass"})
					elseif node.name == "woodsoils:drygrass_with_leaves_2" then
						minetest.set_node(pos, {name = "woodsoils:drygrass_with_leaves_1"})
					elseif node.name == "woodsoils:dirt_red_with_leaves_1" then
						minetest.set_node(pos, {name = "woodsoils:drygrass_with_leaves_2"})
					elseif node.name == "woodsoils:dirt_red_with_leaves_2" then
						minetest.set_node(pos, {name = "woodsoils:dirt_red_with_leaves_1"})
					else
						minetest.set_node(pos, {name = "default:dirt_red_with_drygrass"})
					end
				end
			end
		end
	end
})

-- tundra nodes

minetest.register_node("woodsoils:permafrost_with_leaves_1", {
	description = "Tundra Soil 1",
	tiles = {
		"default_permafrost.png^woodsoils_ground_cover.png", 
		"default_permafrost.png", 
		"default_permafrost.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		--soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:permafrost",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:permafrost_with_leaves_2", {
	description = "Tundra Soil 2",
	tiles = {
		"woodsoils_ground.png", 
		"default_permafrost.png", 
		"default_permafrost.png^woodsoils_ground_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		--soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:permafrost",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:icydirt_with_leaves_1", {
	description = "Tundra Soil 3",
	tiles = {
		"default_icydirt.png^woodsoils_ground_cover2.png", 
		"default_permafrost.png", 
		"default_permafrost.png^default_icydirt_side.png^woodsoils_ground_cover_side2.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:permafrost",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:icydirt_with_leaves_2", {
	description = "Tundra Soil 4",
	tiles = {
		"default_icydirt.png^woodsoils_ground_cover.png", 
		"default_permafrost.png", 
		"default_permafrost.png^default_icydirt_side.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:permafrost",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

-- Die-off ABM

minetest.register_abm({
	nodenames = {
		"woodsoils:permafrost_with_leaves_1", 
		"woodsoils:permafrost_with_leaves_2", 
		"woodsoils:icydirt_with_leaves_1", 
		"woodsoils:icydirt_with_leaves_2",
	},
	interval = 23,
	chance = 137,
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
					if node.name == "woodsoils:icydirt_with_leaves_1" then 
						minetest.set_node(pos, {name = "default:dirt_with_ice"})
					elseif node.name == "woodsoils:icydirt_with_leaves_2" 
						then minetest.set_node(pos, {name = "woodsoils:icydirt_with_leaves_1"})
					elseif node.name == "woodsoils:permafrost_with_leaves_1" 
						then minetest.set_node(pos, {name = "woodsoils:icydirt_with_leaves_2"})
					elseif node.name == "woodsoils:permafrost_with_leaves_2" 
						then minetest.set_node(pos, {name = "woodsoils:permafrost_with_leaves_1"})
					else
						minetest.set_node(pos, {name = "default:dirt_with_ice"})
					end
				end
			end
		end
	end
})

-- taiga nodes

minetest.register_node("woodsoils:dirt_yellow_with_leaves_1", {
	description = "Taiga Soil 1",
	tiles = {
		"default_dirt_yellow.png^woodsoils_ground_cover.png", 
		"default_dirt_yellow.png", 
		"default_dirt_yellow.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		--soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:dirt_yellow",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:dirt_yellow_with_leaves_2", {
	description = "Taiga Soil 2",
	tiles = {
		"woodsoils_ground.png", 
		"default_dirt_yellow.png", 
		"default_dirt_yellow.png^woodsoils_ground_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		--soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:dirt_yellow",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:dirt_with_snowy_leaves_1", {
	description = "Taiga Soil 3",
	tiles = {
		"default_snow.png^woodsoils_ground_cover2.png", 
		"default_dirt_yellow.png", 
		"default_dirt_yellow.png^default_snow_side.png^woodsoils_ground_cover_side2.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:dirt_yellow",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:dirt_with_snowy_leaves_2", {
	description = "Taiga Soil 4",
	tiles = {
		"default_snow.png^woodsoils_ground_cover.png", 
		"default_dirt_yellow.png", 
		"default_dirt_yellow.png^default_snow_side.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1,
		--not_in_creative_inventory=1
	},
	drop = "default:dirt_yellow",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

-- No Die-off ABM for taiga, we rely on snowfall instead.

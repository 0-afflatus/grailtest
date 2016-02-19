-- temporary hack

function plant:grow_veg(full_grown, names, interval, chance)
	minetest.register_abm({
		nodenames = names,
		interval = interval,
		chance = chance,
		action = function(pos, node)
			pos.y = pos.y-1
			if minetest.get_node(pos).name ~= "default:soil_wet" then
				return
			end
			pos.y = pos.y+1
			if not minetest.get_node_light(pos) then
				return
			end
			if minetest.get_node_light(pos) < 8 then
				return
			end
			local step = nil
			for i,name in ipairs(names) do
				if name == node.name then
					step = i
					break
				end
			end
			if step == nil then
				return
			end
			local new_node = {name=names[step+1]}
			if new_node.name == nil then
				new_node.name = full_grown
			end
			minetest.set_node(pos, new_node)
		end
	})
end

--
-- carrot
--

minetest.register_craftitem("plant:carrot_seed", {
	description = "Carrot Seeds",
	inventory_image = "plant_carrot_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		local above = minetest.get_node(pointed_thing.above)
		if above.name == "air" then
			above.name = "plant:carrot_1"
			minetest.set_node(pointed_thing.above, above)
			itemstack:take_item(1)
			return itemstack
		end
	end
})

minetest.register_node("plant:carrot_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"plant_carrot_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+3/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:carrot_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"plant_carrot_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:carrot_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"plant_carrot_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+12/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:carrot", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"plant_carrot_4.png"},
	drop = {
		max_items = 6,
		items = {
			{ items = {'plant:carrot_seed'} },
			{ items = {'plant:carrot_seed'}, rarity = 2},
			{ items = {'plant:carrot_seed'}, rarity = 5},
			{ items = {'plant:carrot_item'} },
			{ items = {'plant:carrot_item'}, rarity = 2 },
			{ items = {'plant:carrot_item'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flower = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("plant:carrot_item", {
	description = "Carrot",
	inventory_image = "plant_carrot.png",
	groups = {vegetable = 1, salad = 1},
	on_use = minetest.item_eat(3),
})

plant:grow_veg("plant:carrot", {"plant:carrot_1", "plant:carrot_2", "plant:carrot_3"}, 60, 25)

--
-- Beet
--

minetest.register_craftitem("plant:beet_seed", {
	description = "Beet Seeds",
	inventory_image = "plant_beet_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		local above = minetest.get_node(pointed_thing.above)
		if above.name == "air" then
			above.name = "plant:beet_1"
			minetest.set_node(pointed_thing.above, above)
			itemstack:take_item(1)
			return itemstack
		end
	end
})

minetest.register_node("plant:beet_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"plant_beet_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+3/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:beet_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "plant:beet_leaves",
	tiles = {"plant_beet_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:beet_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "plant:beet_leaves",
	tiles = {"plant_beet_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+12/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:beet", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"plant_beet_4.png"},
	drop = {
		max_items = 6,
		items = {
			{ items = {'plant:beet_leaves'} },
			{ items = {'plant:beet_leaves'}, rarity = 2},
			{ items = {'plant:beet_leaves'}, rarity = 5},
			{ items = {'plant:beet_seed'} },
			{ items = {'plant:beet_seed'}, rarity = 2},
			{ items = {'plant:beet_seed'}, rarity = 5},
			{ items = {'plant:beetroot'} },
			{ items = {'plant:beetroot'}, rarity = 2 },
			{ items = {'plant:beetroot'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flower = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("plant:beetroot", {
	description = "Beetroot",
	inventory_image = "plant_beetroot.png",
	groups = {vegetable = 1, salad = 1},
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("plant:beet_leaves", {
	description = "Beet Greens",
	inventory_image = "plant_beet_leaves.png",
	groups = {vegetable = 1, salad = 1},
	on_use = minetest.item_eat(2),
})

plant:grow_veg("plant:beet", {"plant:beet_1", "plant:beet_2", "plant:beet_3"}, 60, 25)

-- Mediterranean veg
-- Nettles

--
-- Onion
--

-- Wild Onion Plant
minetest.register_craftitem("plant:wild_onion_plant", {
	description = "Wild Onion",
	groups = {vegetable = 1},
	inventory_image = "plant_wild_onion.png",
	on_use = minetest.item_eat(2),
	on_place = function(itemstack, placer, pointed_thing)
		-- undefined mod farming - internalise this
		return farming.place_seed(itemstack, placer, pointed_thing, "plant:wild_onion_1")
	end
})
minetest.register_alias("plant:wild_onion_craftingitem", "plant:wild_onion_plant")

-- Define Onion growth stages
minetest.register_node("plant:onion_1", {
	drawtype = "plantlike",
	tiles = {"plant_wild_onion_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"plant:wild_onion_plant 1"},rarity = 1},
			}
	},
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},},
	groups = {snappy=3,flammable=2,plant = 1,attached_node = 1,onion = 1,growing = 1,not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_alias("plant:wild_onion_1", "plant:onion_1")

minetest.register_node("plant:onion_2", {
	drawtype = "plantlike",
	tiles = {"plant_wild_onion_2.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"plant:wild_onion_plant 1"},rarity = 1},
		}
	},
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},},
	groups = {snappy=3,flammable=2,plant = 1,attached_node = 1,onion=2,growing = 1,not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_alias("plant:wild_onion_2", "plant:onion_2")

minetest.register_node("plant:onion_3", {
	drawtype = "plantlike",
	tiles = {"plant_wild_onion_3.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = {
		items = {
			{items = {"plant:wild_onion_plant 1"},rarity = 1},
			{items = {"plant:wild_onion_plant 2"},rarity=3},
			}
	},
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},},
	groups = {snappy=3,flammable=2,plant = 1,attached_node = 1,onion=3,growing = 1,not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_alias("plant:wild_onion_3", "plant:onion_3")

minetest.register_node("plant:onion_4", {
	drawtype = "plantlike",
	tiles = {"plant_wild_onion_4.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"plant:wild_onion_plant 1"},rarity = 1},
			{items = {"plant:wild_onion_plant 3"},rarity=3},
			}
	},
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},},
	groups = {snappy=3,flammable=2,plant = 1,attached_node = 1,onion=4,growing = 1,not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_alias("plant:wild_onion_4", "plant:onion_4")

minetest.register_node("plant:onion_5", {
	drawtype = "plantlike",
	tiles = {"plant_wild_onion_5.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"plant:wild_onion_plant 2"},rarity = 1},
			{items = {"plant:wild_onion_plant 3"},rarity=2},
			}
	},
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},},
	groups = {snappy=3,flammable=2,plant = 1,attached_node = 1,onion=5,not_in_creative_inventory = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_alias("plant:wild_onion_5", "plant:onion_5")

-- Abm for growing Wild Onion
minetest.register_abm({
	nodenames = {"group:onion"},
	neighbors = {"default:soil_wet"},
	interval = 50,
	chance = 3,
	action = function(pos, node)
		-- return if already full grown
		if minetest.get_item_group(node.name, "onion") == 5 then
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
		local height = minetest.get_item_group(node.name, "onion") + 1
		minetest.set_node(pos, {name="plant:onion_"..height})
	end
})

plant:grow_veg("plant:wild_onion_5", {"plant:onion_1", "plant:onion_2", "plant:onion_3", "plant:onion_4"}, 70, 30)

--
-- beans
--

minetest.register_craftitem("plant:beans_seed", {
	description = "Beans",
	groups = {vegetable = 1, salad = 1, pulse = 1},
	inventory_image = "plant_beans_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		local above = minetest.get_node(pointed_thing.above)
		if above.name == "air" then
			above.name = "plant:beans_1"
			minetest.set_node(pointed_thing.above, above)
			itemstack:take_item(1)
			return itemstack
		end
	end,
	on_use = minetest.item_eat(4),
})

minetest.register_node("plant:beans_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"plant_beans_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:beans_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"plant_beans_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+8/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:beans_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"plant_beans_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+13/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:beans", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"plant_beans_4.png"},
	drop = {
		max_items = 6,
		items = {
			{ items = {'plant:beans_seed'} },
			{ items = {'plant:beans_seed'}, rarity = 2},
			{ items = {'plant:beans_seed'}, rarity = 2},
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

plant:grow_veg("plant:beans", {"plant:beans_1", "plant:beans_2", "plant:beans_3"}, 60, 23)

--
-- Fat Hen (Goosefoot)
--

minetest.register_craftitem("plant:fathen_seed", {
	description = "Fat Hen Seeds",
	inventory_image = "plant_fathen_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		local above = minetest.get_node(pointed_thing.above)
		if above.name == "air" then
			above.name = "plant:fathen_1"
			minetest.set_node(pointed_thing.above, above)
			itemstack:take_item(1)
			return itemstack
		end
	end
})

minetest.register_node("plant:fathen_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"plant_fathen_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:fathen_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "plant:fathen_leaves",
	tiles = {"plant_fathen_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+8/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1, plant = 1, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:fathen_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "plant:fathen_leaves",
	tiles = {"plant_fathen_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+13/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("plant:fathen", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"plant_fathen_4.png"},
	drop = {
		max_items = 6,
		items = {
			{ items = {'plant:fathen_seed'} },
			{ items = {'plant:fathen_seed'}, rarity = 2},
			{ items = {'plant:fathen_seed'}, rarity = 5},
			{ items = {'plant:fathen_leaves'} },
			{ items = {'plant:fathen_leaves'}, rarity = 2 },
			{ items = {'plant:fathen_leaves'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory = 1,plant = 1,flora = 1,attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("plant:fathen_leaves", {
	description = "Fat Hen Greens",
	inventory_image = "plant_fathen_leaves.png",
	groups = {vegetable = 1, salad = 1},
	on_use = minetest.item_eat(2),
})

plant:grow_veg("plant:fathen", {"plant:fathen_1", "plant:fathen_2", "plant:fathen_3"}, 60, 23)

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 80,
	noise_params = {
		offset = 0, 
		scale = 0.02, 
		spread = {x = 128, y = 128, z = 128}, 
		seed = 709, 
		octaves = 3, 
		persist = 0.66
	},
	biomes = {"grassland", "woodland"},
	--spawn_by = "",
	y_min = 5,
	y_max = 50,
	decoration = {"plant:fathen", "plant:carrot", "plant:beet", "plant:onion_5", "plant:beans"},
})


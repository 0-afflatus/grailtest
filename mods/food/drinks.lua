-- Register drink
-- drink def {
--	name = "water", -- itemstring name
--	desc = "water",
--	colour = "water", -- texture name
--	colouring = {a = 120, r = 30, g = 76, b = 90}, -- the internal colour of the liquid
--	flavour = "", -- itemstring for main ingredient
--	groups = {}, -- not currently used
-- }
-- hide beakers, glasses and source nodes from creative inv

food.drinks = {
	replacements = {
		{"bucket:bucket_blackberry","bucket:bucket_empty"},
		{"bucket:wooden_blackberry","bucket:wooden_empty"},
		{"bucket:bucket_apple","bucket:bucket_empty"},
		{"bucket:wooden_apple","bucket:wooden_empty"},
		{"bucket:bucket_orange","bucket:bucket_empty"},
		{"bucket:wooden_orange","bucket:wooden_empty"},
	},
}

function food.register_drink(defn)
	local nutrition = 2
	minetest.register_node("food:"..defn.name, {
		description = defn.desc,
		inventory_image = minetest.inventorycube("food_juice_"..defn.colour..".png^[noalpha"),
		drawtype = "liquid",
		tiles = {
			{
				name = "food_juice_"..defn.colour.."_animated.png",
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
				name = "food_juice_"..defn.colour.."_animated.png",
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
		liquid_alternative_flowing = "food:"..defn.name.."_flowing",
		liquid_alternative_source = "food:"..defn.name,
		liquid_viscosity = 2,
		liquid_renewable = false,
		liquid_range = 1,
		post_effect_color = defn.colouring,
		groups = {liquid = 3, puts_out_fire = 1, not_in_creative_inventory = 1},
	})

	minetest.register_node("food:"..defn.name.."_flowing", {
		description = "Flowing "..defn.name,
		inventory_image = minetest.inventorycube("food_juice_"..defn.colour..".png"),
		drawtype = "flowingliquid",
		tiles = {"food_juice_"..defn.colour..".png"},
		special_tiles = {
			{
				name = "food_juice_"..defn.colour.."_flowing_animated.png",
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.8,
				},
			},
			{
				name = "food_juice_"..defn.colour.."_flowing_animated.png",
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
		liquid_alternative_flowing = "food:"..defn.name.."_flowing",
		liquid_alternative_source = "food:"..defn.name,
		liquid_viscosity = 1,
		liquid_renewable = false,
		liquid_range = 2,
		post_effect_color = defn.colouring,
		groups = {liquid = 3, puts_out_fire = 1, not_in_creative_inventory = 1},
	})

	bucket.register_liquid(
		"food:"..defn.name,
		"food:"..defn.name.."_flowing",
		"food:bucket_"..defn.name,
		"bucket_"..defn.colour..".png",
		"Bucket of "..defn.desc
	)
	
	bucket.register_contents(
		"food:"..defn.name,
		"food:"..defn.name.."_flowing",
		"food:bucket_wooden_"..defn.name,
		"bucket_wooden_"..defn.colour..".png",
		"Pail of "..defn.desc
	)
	
	-- crafting recipe for bucket of drink
	
	minetest.register_craft({
		output = "food:bucket_"..defn.name,
		replacements = food.water_replacements,
		recipe = {
			{ defn.flavour, defn.flavour, defn.flavour },
			{ defn.flavour, "bucket:bucket_river_water", defn.flavour },
			{ defn.flavour, defn.flavour, defn.flavour }
		},
	})

	minetest.register_craft({
		output = "food:bucket_wooden_"..defn.name,
		replacements = food.water_replacements,
		recipe = {
			{ defn.flavour, defn.flavour, defn.flavour },
			{ defn.flavour, "bucket:wooden_river_water", defn.flavour },
			{ defn.flavour, defn.flavour, defn.flavour }
		},
	})
	
	minetest.register_node("food:bottle_"..defn.name, {
		description = "Bottle of "..defn.desc,
		drawtype = "plantlike",
		tiles = {"food_bottle_"..defn.colour..".png"},
		inventory_image = "food_bottle_"..defn.colour..".png",
		wield_image = "food_bottle_"..defn.colour..".png",
		paramtype = "light",
		is_ground_content = false,
		walkable = false,
		stack_max = 12,
		selection_box = {
			type = "fixed",
			fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
		},
		groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
		sounds = default.node_sound_glass_defaults(),
		on_use = function(itemstack, user, pointed_thing)
			replace_with_item = "vessels:glass_bottle"
			if pointed_thing.under  then
				target = minetest.get_node(pointed_thing.under)
				if target.name == "vessels:drinking_glass" then
					minetest.set_node(pointed_thing.under, {name="food:glass_"..defn.name})
					if itemstack:take_item() ~= nil then
						if itemstack:is_empty() then
							itemstack:add_item(replace_with_item)
						else
							local inv = user:get_inventory()
							if inv:room_for_item("main", {name=replace_with_item}) then
								inv:add_item("main", replace_with_item)
							else
								local pos = user:getpos()
								pos.y = math.floor(pos.y + 0.5)
								minetest.add_item(pos, replace_with_item)
							end
						end
					end
				else
					minetest.do_item_eat(nutrition, replace_with_item, itemstack, user, pointed_thing)
				end
			else
				minetest.do_item_eat(nutrition, replace_with_item, itemstack, user, pointed_thing)
			end
			return itemstack
		end
	})

	minetest.register_craft( {
		output = "food:bottle_"..defn.name.." 8",
		replacements = food.drinks.replacements,
		recipe = {
			{ "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle" },
			{ "vessels:glass_bottle", "food:bucket_"..defn.name, "vessels:glass_bottle" },
			{ "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle" }
		}
	})

	minetest.register_craft( {
		output = "food:bottle_"..defn.name.." 8",
		replacements = food.drinks.replacements,
		recipe = {
			{ "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle" },
			{ "vessels:glass_bottle", "food:bucket_wooden_"..defn.name, "vessels:glass_bottle" },
			{ "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle" }
		}
	})

	minetest.register_craft( {
		output = "food:bucket_"..defn.name,
		replacements = {
			{"food:bottle_"..defn.name, "vessels:glass_bottle"}
		},
		recipe = {
			{ "food:bottle_"..defn.name, "food:bottle_"..defn.name, "food:bottle_"..defn.name },
			{ "food:bottle_"..defn.name, "bucket:bucket_empty", "food:bottle_"..defn.name },
			{ "food:bottle_"..defn.name, "food:bottle_"..defn.name, "food:bottle_"..defn.name }
		}
	})

	minetest.register_craft( {
		output = "food:bucket_wooden_"..defn.name,
		replacements = {
			{"food:bottle_"..defn.name, "vessels:glass_bottle"}
		},
		recipe = {
			{ "food:bottle_"..defn.name, "food:bottle_"..defn.name, "food:bottle_"..defn.name },
			{ "food:bottle_"..defn.name, "bucket:bucket_wooden_empty", "food:bottle_"..defn.name },
			{ "food:bottle_"..defn.name, "food:bottle_"..defn.name, "food:bottle_"..defn.name }
		}
	})

	minetest.register_node("food:glass_"..defn.name, {
		description = "Glass of "..defn.desc,
		drawtype = "plantlike",
		tiles = {"food_glass_"..defn.colour..".png"},
		inventory_image = "food_glass_"..defn.colour..".png",
		wield_image = "food_glass_"..defn.colour..".png",
		paramtype = "light",
		is_ground_content = false,
		walkable = false,
		stack_max = 1,
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
		},
		groups = {vessel = 1, dig_immediate = 3, attached_node = 1, not_in_creative_inventory = 1},
		sounds = default.node_sound_glass_defaults(),
		on_use = minetest.item_eat(nutrition, "vessels:drinking_glass"),
	})
--[[
	minetest.register_node("food:beaker_"..defn.name, {
		description = "Beaker of "..defn.desc,
		drawtype = "plantlike",
		tiles = {"vessels_beaker.png"},
		inventory_image = "vessels_beaker.png",
		wield_image = "vessels_beaker.png",
		paramtype = "light",
		is_ground_content = false,
		walkable = false,
		stack_max = 1,
		selection_box = {
			type = "fixed",
			fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
		},
		groups = {vessel = 1, dig_immediate = 3, attached_node = 1, not_in_creative_inventory = 1},
		sounds = default.node_sound_defaults(),
	})
]]
	minetest.register_node("food:flask_"..defn.name, {
		description = "Flask of "..defn.desc,
		drawtype = "plantlike",
		tiles = {"vessels_steel_bottle.png"},
		inventory_image = "vessels_steel_bottle_inv.png",
		wield_image = "vessels_steel_bottle.png",
		paramtype = "light",
		is_ground_content = false,
		walkable = false,
		stack_max = 12,
		selection_box = {
			type = "fixed",
			fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
		},
		groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
		sounds = default.node_sound_defaults(),
		on_use = function(itemstack, user, pointed_thing)
			replace_with_item = "vessels:steel_bottle"
			if pointed_thing.under  then
				target = minetest.get_node(pointed_thing.under)
				if target.name == "vessels:drinking_glass" then
					minetest.set_node(pointed_thing.under, {name="food:glass_"..defn.name})
					if itemstack:take_item() ~= nil then
						if itemstack:is_empty() then
							itemstack:add_item(replace_with_item)
						else
							local inv = user:get_inventory()
							if inv:room_for_item("main", {name=replace_with_item}) then
								inv:add_item("main", replace_with_item)
							else
								local pos = user:getpos()
								pos.y = math.floor(pos.y + 0.5)
								minetest.add_item(pos, replace_with_item)
							end
						end
					end
				else
					minetest.do_item_eat(nutrition, replace_with_item, itemstack, user, pointed_thing)
				end
			else
				minetest.do_item_eat(nutrition, replace_with_item, itemstack, user, pointed_thing)
			end
			return itemstack
		end
	})

	minetest.register_craft( {
		output = "food:flask_"..defn.name.." 8",
		replacements = food.drinks.replacements,
		recipe = {
			{ "vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle" },
			{ "vessels:steel_bottle", "food:bucket_"..defn.name, "vessels:steel_bottle" },
			{ "vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle" }
		}
	})

	minetest.register_craft( {
		output = "food:flask_"..defn.name.." 8",
		replacements = food.drinks.replacements,
		recipe = {
			{ "vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle" },
			{ "vessels:steel_bottle", "food:bucket_wooden_"..defn.name, "vessels:steel_bottle" },
			{ "vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle" }
		}
	})
	
	minetest.register_craft( {
		output = "food:bucket_"..defn.name,
		replacements = {
			{"food:flask_"..defn.name, "vessels:steel_bottle"}
		},
		recipe = {
			{ "food:flask_"..defn.name, "food:flask_"..defn.name, "food:flask_"..defn.name },
			{ "food:flask_"..defn.name, "bucket:bucket_empty", "food:flask_"..defn.name },
			{ "food:flask_"..defn.name, "food:flask_"..defn.name, "food:flask_"..defn.name }
		}
	})

	minetest.register_craft( {
		output = "food:bucket_wooden_"..defn.name,
		replacements = {
			{"food:flask_"..defn.name, "vessels:steel_bottle"}
		},
		recipe = {
			{ "food:flask_"..defn.name, "food:flask_"..defn.name, "food:flask_"..defn.name },
			{ "food:flask_"..defn.name, "bucket:bucket_wooden_empty", "food:flask_"..defn.name },
			{ "food:flask_"..defn.name, "food:flask_"..defn.name, "food:flask_"..defn.name }
		}
	})

	
end


food.register_drink({
	name = "blackberry",
	desc = "Blackberry juice",
	colour = "purple",
	colouring = {a = 120, r = 90, g = 30, b = 90},
	flavour = "plant:blackberry_fruit",
	groups = {},
})

food.register_drink({
	name = "blackberry_wine",
	desc = "Blackberry wine",
	colour = "purple",
	colouring = {a = 120, r = 90, g = 30, b = 90},
	flavour = "none",
	groups = {},
})

food.register_drink({
	name = "apple",
	desc = "Apple juice",
	colour = "rose",
	colouring = {a = 120, r = 90, g = 60, b = 60},
	flavour = "tree:apple_fruit",
	groups = {},
})

food.register_drink({
	name = "cider",
	desc = "Cider",
	colour = "rose",
	colouring = {a = 120, r = 90, g = 60, b = 60},
	flavour = "none",
	groups = {},
})

food.register_drink({
	name = "orange",
	desc = "Orange juice",
	colour = "orange",
	colouring = {a = 120, r = 90, g = 75, b = 30},
	flavour = "plant:orange",
	groups = {},
})

food.register_drink({
	name = "barley_water",
	desc = "Barley water",
	colour = "lemon",
	colouring = {a = 120, r = 120, g = 120, b = 60},
	flavour = "group:grain",
	groups = {},
})

food.register_drink({
	name = "beer",
	desc = "Beer",
	colour = "lemon",
	colouring = {a = 120, r = 120, g = 120, b = 60},
	flavour = "none",
	groups = {},
})

food.register_drink({
	name = "beetroot",
	desc = "Beetroot juice",
	colour = "red",
	colouring = {a = 120, r = 90, g = 30, b = 30},
	flavour = "plant:beetroot",
	groups = {},
})

food.register_drink({
	name = "carrot",
	desc = "Carrot juice",
	colour = "orange",
	colouring = {a = 120, r = 90, g = 75, b = 30},
	flavour = "plant:carrot_item",
	groups = {},
})

food.register_drink({
	name = "gorse",
	desc = "Gorse water",
	colour = "lemon",
	colouring = {a = 120, r = 120, g = 120, b = 60},
	flavour = "plant:gorse",
	groups = {},
})

food.register_drink({
	name = "gorse_beer",
	desc = "Gorse beer",
	colour = "lemon",
	colouring = {a = 120, r = 120, g = 120, b = 60},
	flavour = "none",
	groups = {},
})

minetest.register_node("food:bottle_water", {
	description = "Bottle of water",
	drawtype = "plantlike",
	tiles = {"food_bottle_water.png"},
	inventory_image = "food_bottle_water.png",
	wield_image = "food_bottle_water.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	stack_max = 12,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
	on_use = function(itemstack, user, pointed_thing)
		replace_with_item = "vessels:glass_bottle"
		if pointed_thing.under  then
			target = minetest.get_node(pointed_thing.under)
			if target.name == "vessels:drinking_glass" then
				minetest.set_node(pointed_thing.under, {name="food:glass_water"})
				if itemstack:take_item() ~= nil then
					if itemstack:is_empty() then
						itemstack:add_item(replace_with_item)
					else
						local inv = user:get_inventory()
						if inv:room_for_item("main", {name=replace_with_item}) then
							inv:add_item("main", replace_with_item)
						else
							local pos = user:getpos()
							pos.y = math.floor(pos.y + 0.5)
							minetest.add_item(pos, replace_with_item)
						end
					end
				end
			else
				minetest.do_item_eat(1, replace_with_item, itemstack, user, pointed_thing)
			end
		else
			minetest.do_item_eat(1, replace_with_item, itemstack, user, pointed_thing)
		end
		return itemstack
	end
})

for _,water in ipairs(food.water) do
	minetest.register_craft( {
		output = "food:bottle_water 8",
		replacements = food.water_replacements,
		recipe = {
			{ "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle" },
			{ "vessels:glass_bottle", water, "vessels:glass_bottle" },
			{ "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle" }
		}
	})
end

minetest.register_craft( {
	output = "bucket:bucket_water",
	replacements = {
		{"food:bottle_water", "vessels:glass_bottle"}
	},
	recipe = {
		{ "food:bottle_water", "food:bottle_water", "food:bottle_water" },
		{ "food:bottle_water", "bucket:bucket_empty", "food:bottle_water" },
		{ "food:bottle_water", "food:bottle_water", "food:bottle_water" }
	}
})

minetest.register_craft( {
	output = "bucket:bucket_wooden_water",
	replacements = {
		{"food:bottle_water", "vessels:glass_bottle"}
	},
	recipe = {
		{ "food:bottle_water", "food:bottle_water", "food:bottle_water" },
		{ "food:bottle_water", "bucket:bucket_wooden_empty", "food:bottle_water" },
		{ "food:bottle_water", "food:bottle_water", "food:bottle_water" }
	}
})

minetest.register_node("food:glass_water", {
	description = "Glass of water",
	drawtype = "plantlike",
	tiles = {"food_glass_water.png"},
	inventory_image = "food_glass_water.png",
	wield_image = "food_glass_water.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	stack_max = 1,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
	},
	groups = {vessel = 1, dig_immediate = 3,attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_glass_defaults(),
	on_use = minetest.item_eat(1, "vessels:drinking_glass"),
})

--[[
minetest.register_node("food:beaker_water", {
	description = "Beaker of water",
	drawtype = "plantlike",
	tiles = {"vessels_beaker.png"},
	inventory_image = "vessels_beaker.png",
	wield_image = "vessels_beaker.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	stack_max = 1,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3,attached_node = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_defaults(),
	on_use = minetest.item_eat(1, "vessels:beaker"),
})
]]

minetest.register_node("food:flask_water", {
	description = "Flask of water",
	drawtype = "plantlike",
	tiles = {"vessels_steel_bottle.png"},
	inventory_image = "vessels_steel_bottle_inv.png",
	wield_image = "vessels_steel_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	stack_max = 12,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
	on_use = function(itemstack, user, pointed_thing)
		replace_with_item = "vessels:steel_bottle"
		if pointed_thing.under  then
			target = minetest.get_node(pointed_thing.under)
			if target.name == "vessels:drinking_glass" then
				minetest.set_node(pointed_thing.under, {name="food:glass_water"})
				if itemstack:take_item() ~= nil then
					if itemstack:is_empty() then
						itemstack:add_item(replace_with_item)
					else
						local inv = user:get_inventory()
						if inv:room_for_item("main", {name=replace_with_item}) then
							inv:add_item("main", replace_with_item)
						else
							local pos = user:getpos()
							pos.y = math.floor(pos.y + 0.5)
							minetest.add_item(pos, replace_with_item)
						end
					end
				end
			else
				minetest.do_item_eat(1, replace_with_item, itemstack, user, pointed_thing)
			end
		else
			minetest.do_item_eat(1, replace_with_item, itemstack, user, pointed_thing)
		end
		return itemstack
	end

})

for _,water in ipairs(food.water) do
	minetest.register_craft( {
		output = "food:flask_water 8",
		replacements = food.water_replacements,
		recipe = {
			{ "vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle" },
			{ "vessels:steel_bottle", water, "vessels:steel_bottle" },
			{ "vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle" }
		}
	})
end

minetest.register_craft( {
	output = "bucket:bucket_water",
	replacements = {
		{"food:flask_water", "vessels:steel_bottle"}
	},
	recipe = {
		{ "food:flask_water", "food:flask_water", "food:flask_water" },
		{ "food:flask_water", "bucket:bucket_empty", "food:flask_water" },
		{ "food:flask_water", "food:flask_water", "food:flask_water" }
	}
})

minetest.register_craft( {
	output = "bucket:bucket_wooden_water",
	replacements = {
		{"food:flask_water", "vessels:steel_bottle"}
	},
	recipe = {
		{ "food:flask_water", "food:flask_water", "food:flask_water" },
		{ "food:flask_water", "bucket:bucket_wooden_empty", "food:flask_water" },
		{ "food:flask_water", "food:flask_water", "food:flask_water" }
	}
})

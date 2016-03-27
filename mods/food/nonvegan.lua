--
-- Unicorn Soup
--

-- (does not contain real unicorns)

minetest.register_craftitem("food:soup_unicorn", {
	description = "Cold unicorn Soup",
	inventory_image = "food_unicorn_soup.png",

	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,

	on_use = function(itemstack, user, pos)
		minetest.chat_send_player(user:get_player_name(), 
				"Bleugh! Something tastes very wrong. :-(")
	end,
})

minetest.register_node("food:soup_unicorn_cooked", {
	description = "Hot unicorn Soup",
	inventory_image = "food_unicorn_soup_hot.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_unicorn_soup_hot.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.3, 0.2}
	},
	groups = {dig_immediate = 3},

	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,

	on_use = minetest.item_eat(15)
})

for _,water in ipairs(food.water) do
	minetest.register_craft({
		type = "shapeless",
		output = "food:soup_unicorn",
		replacements = food.water_replacements,
		recipe = {"group:vegetable", water, "mineral:obsidian_shard"},
	})
end

minetest.register_craft({
	type = "cooking",
	output = "food:soup_unicorn_cooked",
	recipe = "food:soup_unicorn",
	cooktime = 8,
})

--
-- Chicken Soup
--

minetest.register_craftitem("food:soup_chicken", {
	description = "Cold Chicken Soup",
	inventory_image = "food_chicken_soup.png",

	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,

	on_use = function(itemstack, user, pos)
		minetest.chat_send_player(user:get_player_name(), 
				"Bleugh! Something tastes very wrong. :-(")
	end,
})

minetest.register_node("food:soup_chicken_cooked", {
	description = "Hot chicken Soup",
	inventory_image = "food_chicken_soup_hot.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_chicken_soup_hot.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.3, 0.2}
	},
	groups = {dig_immediate = 3},

	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,

	on_use = minetest.item_eat(13)
})

for _,water in ipairs(food.water) do
	minetest.register_craft({
		type = "shapeless",
		output = "food:soup_chicken",
		replacements = food.water_replacements,
		recipe = {"group:vegetable", water, "mobs:chicken_raw"},
	})
end

minetest.register_craft({
	type = "cooking",
	output = "food:soup_chicken_cooked",
	recipe = "food:soup_chicken",
	cooktime = 8,
})

--
-- Meat Stew
--

minetest.register_craftitem("food:stew_meat", {
	description = "Prepped Meat",
	inventory_image = "food_meat_stew.png",

	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,

	on_use = function(itemstack, user, pos)
		minetest.chat_send_player(user:get_player_name(),
				"Bleugh! Something tastes very wrong. :-(")
	end,
})

minetest.register_node("food:stew_meat_cooked", {
	description = "Hot Meat Stew",
	inventory_image = "food_meat_stew_hot.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_meat_stew_hot.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.3, 0.2}
	},
	groups = {dig_immediate = 3},

	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,

	on_use = minetest.item_eat(12)
})

minetest.register_craft({
	type = "shapeless",
	output = "food:stew_meat",
	recipe = {"group:meat", "group:grain", "group:vegetable"},
})

minetest.register_craft({
	type = "cooking",
	output = "food:stew_meat_cooked",
	recipe = "food:stew_meat",
	cooktime = 10,
})

minetest.register_craft({
	type = "shapeless",
	output = "food:stew_meat",
	recipe = {"group:vegetable", "group:grain", "mobs:meat_raw"},
})

minetest.register_craft({
	type = "shapeless",
	output = "food:stew_meat",
	recipe = {"group:vegetable", "group:grain", "mobs:chicken_raw"},
})

--
-- Cake
--

food.cake_box = {
	type = "fixed",
	fixed = {
		{-0.250000,-0.500000,-0.296880,0.250000,-0.250000,0.312502},
		{-0.309375,-0.500000,-0.250000,0.309375,-0.250000,0.250000},
		{-0.250000,-0.250000,-0.250000,0.250000,-0.200000,0.250000}
	}
}

--[[
minetest.register_node("food:fish", {
	description = "April Fish",
	drawtype = "torchlike",
	tiles = {"food_fish.png"},
	inventory_image = "food_fish.png",
	wield_image = "food_fish.png",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	groups={food=0, dig_immediate=1, oddly_breakable_by_hand=1},
	on_use = function(itemstack, user, pointed_thing)
		minetest.chat_send_player(user:get_player_name(), "Poisson D'Avril!")
		return nil
	end,
})
]]

minetest.register_node("food:cake", {
	description = "Cake",
	on_use = minetest.item_eat(4),
	groups={food=3,crumbly=3},
	tiles = {
		"food_cake_texture.png",
		"food_cake_texture.png",
		"food_cake_texture_side.png",
		"food_cake_texture_side.png",
		"food_cake_texture_side.png",
		"food_cake_texture_side.png"
	},
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	node_box = food.cake_box
})

minetest.register_node("food:fruitcake", {
	description = "Fruit Cake",
	on_use = minetest.item_eat(6),
	groups={food=3,crumbly=3},
	tiles = {
		"food_cake_carrot_texture.png",
		"food_cake_carrot_texture.png",
		"food_cake_carrot_texture_side.png",
		"food_cake_carrot_texture_side.png",
		"food_cake_carrot_texture_side.png",
		"food_cake_carrot_texture_side.png"
	},
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	node_box = food.cake_box
})

minetest.register_craftitem("food:cake_mix", {
	description = "Cake Mix",
	inventory_image = "food_cake_mix.png"
})

minetest.register_craftitem("food:fruitcake_mix", {
	description = "Fruit Cake Mix",
	inventory_image = "food_cake_mix.png"
})

for _,water in ipairs(food.water) do
	minetest.register_craft({
		type = "shapeless",
		output = "food:cake_mix",
		replacements = food.water_replacements,
		recipe = {"food:flour", water, "mobs:egg"}
	})
		minetest.register_craft({
		type = "shapeless",
		output = "food:fruitcake_mix",
		replacements = food.water_replacements,
		recipe = {"food:flour", water, "mobs:egg", "group:fruit"}
	})
end

minetest.register_craft({
	type = "cooking",
	cooktime = 8,
	output = "food:cake",
	recipe = "food:cake_mix"
})

minetest.register_craft({
	type = "cooking",
	cooktime = 12,
	output = "food:fruitcake",
	recipe = "food:fruitcake_mix"
})

--
-- Drinks
--

food.register_drink({
	name = "honey",
	desc = "Honey Juice",
	colour = "mead",
	colouring = {a = 120, r = 90, g = 60, b = 0},
	flavour = "mobs:honey",
	nutrition = 4,
	groups = {},
})

food.register_drink({
	name = "mead",
	desc = "Mead",
	colour = "mead",
	colouring = {a = 120, r = 90, g = 60, b = 0},
	flavour = "none",
	nutrition = 6,
	groups = {},
})

food.milk = {
	"mobs:bucket_milk",
	"mobs:pail_milk",
}

food.milk_replacements = {
	{"mobs:bucket_milk","bucket:bucket_empty"},
	{"mobs:pail_milk","bucket:wooden_empty"},
}

minetest.register_node("food:milk_flowing", {
	description = "Flowing milk",
	inventory_image = minetest.inventorycube("food_milk.png"),
	drawtype = "flowingliquid",
	tiles = {"food_milk.png"},
	special_tiles = {
		{
			name = "food_milk_flowing_animated.png",
			backface_culling = false,
			animation = {
				type     = "vertical_frames", 
				aspect_w = 16, 
				aspect_h = 16, 
				length   = 0.8,
			}
		},
		{
			name = "food_milk_flowing_animated.png",
			backface_culling = true,
			animation = {
				type     = "vertical_frames", 
				aspect_w = 16, 
				aspect_h = 16, 
				length   = 0.8,
			}
		},
	},
	--alpha = 0,
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
	liquid_alternative_flowing = "food:milk_flowing",
	liquid_alternative_source = "food:milk",
	liquid_viscosity = 3,
	post_effect_color = {a = 127, r = 255, g = 255, b = 255},
	groups = {milk = 3, liquid = 3, puts_out_fire = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("food:milk", {
	description = "milk",
	inventory_image = minetest.inventorycube("food_milk.png"),
	drawtype = "liquid",
	tiles = {
		{
			name = "food_milk_animated.png", 
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style milk source material (mostly unused)
		{
			name = "food_milk_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	--alpha = 0,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "food:milk_flowing",
	liquid_alternative_source = "food:milk",
	liquid_viscosity = 3,
	post_effect_color = {a = 127, r = 255, g = 255, b = 255},
	groups = {milk = 3, liquid = 3, puts_out_fire = 1, freezes = 1, melt_around = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("food:bottle_milk", {
	description = "Bottle of milk",
	drawtype = "plantlike",
	tiles = {"food_bottle_milk.png"},
	inventory_image = "food_bottle_milk.png",
	wield_image = "food_bottle_milk.png",
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
		local replace_with_item = "vessels:glass_bottle"
		if pointed_thing.under  then
			local target = minetest.get_node(pointed_thing.under)
			if target.name == "vessels:drinking_glass" then
				minetest.set_node(pointed_thing.under, {name="food:glass_milk"})
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

for _,milk in ipairs(food.milk) do
	minetest.register_craft( {
		output = "food:bottle_milk 8",
		replacements = food.milk_replacements,
		recipe = {
			{ "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle" },
			{ "vessels:glass_bottle", milk, "vessels:glass_bottle" },
			{ "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle" }
		}
	})
end

minetest.register_craft( {
	output = "mobs:bucket_milk",
	replacements = {
		{"food:bottle_milk", "vessels:glass_bottle"}
	},
	recipe = {
		{ "food:bottle_milk", "food:bottle_milk", "food:bottle_milk" },
		{ "food:bottle_milk", "bucket:bucket_empty", "food:bottle_milk" },
		{ "food:bottle_milk", "food:bottle_milk", "food:bottle_milk" }
	}
})

minetest.register_craft( {
	output = "mobs:pail_milk",
	replacements = {
		{"food:bottle_milk", "vessels:glass_bottle"}
	},
	recipe = {
		{ "food:bottle_milk", "food:bottle_milk", "food:bottle_milk" },
		{ "food:bottle_milk", "bucket:wooden_empty", "food:bottle_milk" },
		{ "food:bottle_milk", "food:bottle_milk", "food:bottle_milk" }
	}
})

minetest.register_node("food:glass_milk", {
	description = "Glass of milk",
	drawtype = "plantlike",
	tiles = {"food_glass_milk.png"},
	inventory_image = "food_glass_milk.png",
	wield_image = "food_glass_milk.png",
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
minetest.register_node("food:beaker_milk", {
	description = "Beaker of milk",
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

minetest.register_node("food:flask_milk", {
	description = "Flask of milk",
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
		local replace_with_item = "vessels:steel_bottle"
		if pointed_thing.under  then
			local target = minetest.get_node(pointed_thing.under)
			if target.name == "vessels:drinking_glass" then
				minetest.set_node(pointed_thing.under, {name="food:glass_milk"})
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

for _,milk in ipairs(food.milk) do
	minetest.register_craft( {
		output = "food:flask_milk 8",
		replacements = food.milk_replacements,
		recipe = {
			{ "vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle" },
			{ "vessels:steel_bottle", milk, "vessels:steel_bottle" },
			{ "vessels:steel_bottle", "vessels:steel_bottle", "vessels:steel_bottle" }
		}
	})
end

minetest.register_craft( {
	output = "mobs:bucket_milk",
	replacements = {
		{"food:flask_milk", "vessels:steel_bottle"}
	},
	recipe = {
		{ "food:flask_milk", "food:flask_milk", "food:flask_milk" },
		{ "food:flask_milk", "bucket:bucket_empty", "food:flask_milk" },
		{ "food:flask_milk", "food:flask_milk", "food:flask_milk" }
	}
})

minetest.register_craft( {
	output = "mobs:pail_milk",
	replacements = {
		{"food:flask_milk", "vessels:steel_bottle"}
	},
	recipe = {
		{ "food:flask_milk", "food:flask_milk", "food:flask_milk" },
		{ "food:flask_milk", "bucket:wooden_empty", "food:flask_milk" },
		{ "food:flask_milk", "food:flask_milk", "food:flask_milk" }
	}
})

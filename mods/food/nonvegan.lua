--
-- Unicorn Soup
--

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


-- Grailtest 5 --
-- mods/food/init.lua

--
-- Food Groups
--

food = {}

food.protein = {
	"group:pulse",
	"group:nut",
	"group:edible_mushroom",
}

food.water = {
	"group:water_bucket",
	"group:water",
}

food.water_replacements = {
	{"bucket:bucket_water","bucket:bucket_empty"},
	{"bucket:bucket_river_water","bucket:bucket_empty"},
	{"bucket:wooden_water","bucket:wooden_empty"},
	{"bucket:wooden_river_water","bucket:wooden_empty"},
}

--
-- Flour and Bread
--

minetest.register_craftitem("food:flour", {
	description = "Flour",
	inventory_image = "food_flour.png"
})

minetest.register_craft({
	type = "shapeless",
	output = "food:flour",
	recipe = {"group:grain", "group:grain", "group:grain"}
})

minetest.register_node("food:bread", {
	description = "Bread",
	inventory_image = "food_bread.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_bread.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.3, 0.2}
	},
	groups = {dig_immediate = 3},
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "food:bread",
	recipe = "food:flour"
})

--
-- Salad
--

minetest.register_node("food:salad", {
	description = "Salad",
	inventory_image = "food_salad.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_salad.png"},
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
	
	on_use = minetest.item_eat(6)
})

minetest.register_node("food:salad_fruit", {
	description = "Fruit Salad",
	inventory_image = "food_fruit_salad.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_fruit_salad.png"},
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
	
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	type = "shapeless",
	output = "food:salad",
	recipe = {"group:salad", "group:salad", "group:salad"},
})

minetest.register_craft({
	type = "shapeless",
	output = "food:salad_fruit",
	recipe = {"group:fruit", "group:fruit", "group:fruit"},
})

--
-- Vegetable Stew
--

minetest.register_craftitem("food:stew_vegetable", {
	description = "Prepped Vegetables",
	inventory_image = "food_veg_stew.png",
	
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

minetest.register_node("food:stew_vegetable_cooked", {
	description = "Hot Vegetable Stew",
	inventory_image = "food_veg_stew_hot.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_veg_stew_hot.png"},
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
	
	on_use = minetest.item_eat(9)
})

for _,protein in ipairs(food.protein) do
	minetest.register_craft({
	type = "shapeless",
	output = "food:stew_vegetable",
	recipe = {"group:vegetable", "group:grain", protein},
})
end

minetest.register_craft({
	type = "cooking",
	output = "food:stew_vegetable_cooked",
	recipe = "food:stew_vegetable",
	cooktime = 10,
})

--
-- Porridge
--

minetest.register_craftitem("food:porridge", {
	description = "Cold Porridge",
	inventory_image = "food_porridge.png",
	
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

minetest.register_node("food:porridge_cooked", {
	description = "Hot Porridge",
	inventory_image = "food_porridge_hot.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_porridge_hot.png"},
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
	
	on_use = minetest.item_eat(4)
})

for _,water in ipairs(food.water) do
	minetest.register_craft({
		type = "shapeless",
		output = "food:porridge",
		replacements = food.water_replacements,
		recipe = {"group:grain", water, "group:grain"},
	})
end

minetest.register_craft({
	type = "cooking",
	output = "food:porridge_cooked",
	recipe = "food:porridge",
	cooktime = 5,
})

--
-- Soup
--

minetest.register_craftitem("food:soup_vegetable", {
	description = "Cold Vegetable Soup",
	inventory_image = "food_veg_soup.png",
	
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

minetest.register_node("food:soup_vegetable_cooked", {
	description = "Hot Vegetable Soup",
	inventory_image = "food_veg_soup_hot.png",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"food_veg_soup_hot.png"},
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
	
	on_use = minetest.item_eat(7)
})

for _,water in ipairs(food.water) do
	minetest.register_craft({
		type = "shapeless",
		output = "food:soup_vegetable",
		replacements = food.water_replacements,
		recipe = {"group:vegetable", water, "group:vegetable"},
	})
end

minetest.register_craft({
	type = "cooking",
	output = "food:soup_vegetable_cooked",
	recipe = "food:soup_vegetable",
	cooktime = 10,
})

dofile(minetest.get_modpath("food").."/drinks.lua")

--
-- Animal Produce
--

if minetest.get_modpath("mobs") then
	dofile(minetest.get_modpath("food").."/nonvegan.lua")
end

dofile(minetest.get_modpath("food").."/aliases.lua")

dungeon_loot.register({
    {name = "food:apple", chance = 0.1},
    {name = "food:barley_water", chance = 0.1},
    {name = "food:beer", chance = 0.1},
    {name = "food:beetroot", chance = 0.1},
    {name = "food:blackberry", chance = 0.1},
    {name = "food:blackberry_wine", chance = 0.1},
    {name = "food:bottle_apple", chance = 0.1},
    {name = "food:bottle_barley_water", chance = 0.1},
    {name = "food:bottle_beer", chance = 0.1},
    {name = "food:bottle_beetroot", chance = 0.1},
    {name = "food:bottle_blackberry", chance = 0.1},
    {name = "food:bottle_blackberry_wine", chance = 0.1},
    {name = "food:bottle_carrot", chance = 0.1},
    {name = "food:bottle_cider", chance = 0.1},
    {name = "food:bottle_gorse", chance = 0.1},
    {name = "food:bottle_gorse_beer", chance = 0.1},
    {name = "food:bottle_honey", chance = 0.1},
    {name = "food:bottle_mead", chance = 0.1},
    {name = "food:bottle_milk", chance = 0.1, count = {1, 3}},
    {name = "food:bottle_orange", chance = 0.1, count = {1, 4}},
    {name = "food:bottle_water", chance = 0.1},
    {name = "food:bread", chance = 0.5, count = {1, 49}},
    {name = "food:cake", chance = 0.3, count = {1, 12}},
    {name = "food:carrot", chance = 0.1},
    {name = "food:cider", chance = 0.1},
    {name = "food:flask_apple", chance = 0.1},
    {name = "food:flask_barley_water", chance = 0.1},
    {name = "food:flask_beer", chance = 0.1},
    {name = "food:flask_beetroot", chance = 0.1},
    {name = "food:flask_blackberry", chance = 0.1},
    {name = "food:flask_blackberry_wine", chance = 0.1},
    {name = "food:flask_carrot", chance = 0.1},
    {name = "food:flask_cider", chance = 0.1},
    {name = "food:flask_gorse", chance = 0.1},
    {name = "food:flask_gorse_beer", chance = 0.1},
    {name = "food:flask_honey", chance = 0.1},
    {name = "food:flask_mead", chance = 0.1},
    {name = "food:flask_milk", chance = 0.1, count = {1, 3}},
    {name = "food:flask_orange", chance = 0.1, count = {1, 4}},
    {name = "food:flask_water", chance = 0.1},
    {name = "food:fruitcake", chance = 0.3, count = {1, 12}},
    {name = "food:gorse", chance = 0.1},
    {name = "food:gorse_beer", chance = 0.1},
    {name = "food:honey", chance = 0.1},
    {name = "food:mead", chance = 0.1},
    {name = "food:milk", chance = 0.1},
    {name = "food:orange", chance = 0.1},
    {name = "food:porridge_cooked", chance = 0.5, count = {1, 12}},
    {name = "food:salad", chance = 0.5, count = {1, 36}},
    {name = "food:salad_fruit", chance = 0.3, count = {1, 12}},
    {name = "food:soup_chicken_cooked", chance = 0.3, count = {1, 12}},
    {name = "food:soup_unicorn_cooked", chance = 0.2, count = {1, 12}},
    {name = "food:soup_vegetable_cooked", chance = 0.7, count = {1, 49}},
    {name = "food:stew_meat_cooked", chance = 0.3, count = {1, 12}},
    {name = "food:stew_vegetable_cooked", chance = 0.5, count = {1, 37}}
})

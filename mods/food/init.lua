--
-- Food Groups
--

food = {}

local protein = {
	"group:pulse",
	"group:nut",
	"group:edible_mushroom",
}

local water = {
	"bucket:bucket_water",
	"bucket:wooden_water",
	"bucket:wooden_freshwater",
	"group:water",
}

local water_replacements = {
	{"bucket:bucket_water","bucket:bucket_empty"},
	{"bucket:wooden_water","bucket:wooden_empty"},
	{"bucket:wooden_freshwater","bucket:wooden_empty"},
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
	recipe = {"group:grain","group:grain","group:grain"}
})

minetest.register_craftitem("food:bread", {
	description = "Bread",
	inventory_image = "food_bread.png",
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

minetest.register_craftitem("food:salad", {
	description = "Salad",
	inventory_image = "food_salad.png",
	
	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = minetest.item_eat(6)
})

minetest.register_craftitem("food:salad_fruit", {
	description = "Fruit Salad",
	inventory_image = "food_fruit_salad.png",
	
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

minetest.register_craftitem("food:stew_vegetable_cooked", {
	description = "Hot Vegetable Stew",
	inventory_image = "food_veg_stew_hot.png",
	
	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = minetest.item_eat(9)
})

for _,protein in ipairs(protein) do
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

minetest.register_craftitem("food:porridge_cooked", {
	description = "Hot Porridge",
	inventory_image = "food_porridge_hot.png",
	
	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = minetest.item_eat(4)
})

for _,water in ipairs(water) do
	minetest.register_craft({
		type = "shapeless",
		output = "food:porridge",
		replacements = water_replacements,
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

minetest.register_craftitem("food:soup_vegetable_cooked", {
	description = "Hot Vegetable Soup",
	inventory_image = "food_veg_soup_hot.png",
	
	on_drop = function(itemstack, dropper, pos)
		minetest.chat_send_player(dropper:get_player_name(), 
				"You dropped your dinner.")
		itemstack:take_item()
		return itemstack
	end,
	
	on_use = minetest.item_eat(7)
})

for _,water in ipairs(water) do
	minetest.register_craft({
		type = "shapeless",
		output = "food:soup_vegetable",
		replacements = water_replacements,
		recipe = {"group:vegetable", water, "group:vegetable"},
	})
end

minetest.register_craft({
	type = "cooking",
	output = "food:soup_vegetable_cooked",
	recipe = "food:soup_vegetable",
	cooktime = 10,
})

--
-- Animal Produce
--

if minetest.get_modpath("mobs") then
	dofile(minetest.get_modpath("food").."/nonvegan.lua")
end

dofile(minetest.get_modpath("food").."/aliases.lua")

-- Seaweed
minetest.register_node("plant:seaweed", {
	description = "Seaweed",
	drawtype = "plantlike",
	tiles = {"plant_seaweed.png"},
	inventory_image = "plant_seaweed.png",
	wield_image = "plant_seaweed.png",
	paramtype = "light",
	walkable = false,
	climbable = true,
	drowning = 1,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	groups = {snappy = 3},
	on_use = minetest.item_eat(1),
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft( {
	type = "shapeless",
	output = "dye:dark_green 3",
	recipe = {"plant:seaweed",},
})

-- Blue Coral
minetest.register_node("plant:coral2", {
	description = "Blue Coral",
	drawtype = "plantlike",
	tiles = {"plant_coral2.png"},
	inventory_image = "plant_coral2.png",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	light_source = 3,
	groups = {snappy = 3},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft( {
	type = "shapeless",
	output = "dye:cyan 3",
	recipe = {"plant:coral2",},
})

-- Orange Coral
minetest.register_node("plant:coral3", {
	description = "Orange Coral",
	drawtype = "plantlike",
	tiles = {"plant_coral3.png"},
	inventory_image = "plant_coral3.png",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	light_source = 3,
	groups = {snappy = 3},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft( {
	type = "shapeless",
	output = "dye:orange 3",
	recipe = {"plant:coral3",},
})

-- Pink Coral
minetest.register_node("plant:coral4", {
	description = "Pink Coral",
	drawtype = "plantlike",
	tiles = {"plant_coral4.png"},
	inventory_image = "plant_coral4.png",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	light_source = 3,
	groups = {snappy = 3},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft( {
	type = "shapeless",
	output = "dye:pink 3",
	recipe = {"plant:coral4",},
})

-- Green Coral
minetest.register_node("plant:coral5", {
	description = "Green Coral",
	drawtype = "plantlike",
	tiles = {"plant_coral5.png"},
	inventory_image = "plant_coral5.png",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	light_source = 3,
	groups = {snappy = 3},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft( {
	type = "shapeless",
	output = "dye:green 3",
	recipe = {"plant:coral5",},
})

-- Undersea Sand
minetest.register_node("plant:sandy", {
	description = "Sandy",
	tiles = {"default_sand.png"},
	is_ground_content = true,
	groups = {
		crumbly = 3, falling_node = 1, sand = 1, soil = 1,
		not_in_creative_inventory = 1
	},
	drop = "default:sand",
	sounds = default.node_sound_sand_defaults(),
})

-- Register Undersea Sand
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "plant:sandy",
	wherein        = "default:sand",
	clust_scarcity = 10*10*10,
	clust_num_ores = 24,
	clust_size     = 4,
	y_max     = -14,
	y_min     = -100,
})

-- randomly generate coral or seaweed and have seaweed grow up to 10 high
minetest.register_abm({
	nodenames = {"plant:sandy"},
	neighbors = {"group:water"},
	interval = 15,
	chance = 10,

	action = function(pos, node)

		local sel = math.random(1,5)
		if sel == 1 or node.name == "plant:seaweed" then
			local height = 0

			while (minetest.get_node(pos).name == "plant:seaweed"
			or minetest.get_node(pos).name == "plant:sandy")
			and height < 14 do
				height = height + 1
				pos.y = pos.y + 1
			end

			if height < 14 and pos.y < 0
			and minetest.get_node(pos).name == "default:water_source" then
				minetest.set_node(pos, {name = "plant:seaweed"})
			end

		else
			pos.y = pos.y + 1
			if minetest.get_node(pos).name == "default:water_source" then
				minetest.set_node(pos, {name = "plant:coral"..sel})
			end

		end
	end,
})

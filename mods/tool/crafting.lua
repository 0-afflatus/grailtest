--
-- Crafting
--

minetest.register_craft({
	output = 'tool:axe_mithril',
	recipe = {
		{'mineral:mithril_ingot', 'mineral:mithril_ingot'},
		{'mineral:mithril_ingot', 'default:stick'},
		{'', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:pick_mithril',
	recipe = {
		{'mineral:mithril_ingot', 'mineral:mithril_ingot', 'mineral:mithril_ingot'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'tool:shovel_mithril',
	recipe = {
		{'mineral:mithril_ingot'},
		{'default:stick'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:sword_mithril',
	recipe = {
		{'mineral:mithril_ingot'},
		{'mineral:mithril_ingot'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:axe_silver',
	recipe = {
		{'mineral:silver_ingot', 'mineral:silver_ingot'},
		{'mineral:silver_ingot', 'default:stick'},
		{'', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:pick_silver',
	recipe = {
		{'mineral:silver_ingot', 'mineral:silver_ingot', 'mineral:silver_ingot'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'tool:shovel_silver',
	recipe = {
		{'mineral:silver_ingot'},
		{'default:stick'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:sword_silver',
	recipe = {
		{'mineral:silver_ingot'},
		{'mineral:silver_ingot'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:axe_bronze',
	recipe = {
		{'mineral:bronze_ingot', 'mineral:bronze_ingot'},
		{'mineral:bronze_ingot', 'default:stick'},
		{'', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:pick_bronze',
	recipe = {
		{'mineral:bronze_ingot', 'mineral:bronze_ingot', 'mineral:bronze_ingot'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'tool:shovel_bronze',
	recipe = {
		{'mineral:bronze_ingot'},
		{'default:stick'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:sword_bronze',
	recipe = {
		{'mineral:bronze_ingot'},
		{'mineral:bronze_ingot'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:axe_copper',
	recipe = {
		{'mineral:copper_ingot', 'mineral:copper_ingot'},
		{'mineral:copper_ingot', 'default:stick'},
		{'', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:shovel_copper',
	recipe = {
		{'mineral:copper_ingot'},
		{'default:stick'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:shovel_gold',
	recipe = {
		{'mineral:gold_ingot'},
		{'default:stick'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:axe_steel',
	recipe = {
		{'mineral:steel_ingot', 'mineral:steel_ingot'},
		{'mineral:steel_ingot', 'default:stick'},
		{'', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:pick_steel',
	recipe = {
		{'mineral:steel_ingot', 'mineral:steel_ingot', 'mineral:steel_ingot'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'tool:shovel_steel',
	recipe = {
		{'mineral:steel_ingot'},
		{'default:stick'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:sword_steel',
	recipe = {
		{'mineral:steel_ingot'},
		{'mineral:steel_ingot'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:pick_wood',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tool:pick_stone',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'tool:shovel_wood',
	recipe = {
		{'group:wood'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tool:shovel_stone',
	recipe = {
		{'group:stone'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'tool:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:wood', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'tool:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stone', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = "tool:hoe_wood",
	recipe = {
		{"group:wood", "group:wood"},
		{"", "default:stick"},
		{"", "default:stick"},
	}
})

minetest.register_craft({
	output = "tool:hoe_stone",
	recipe = {
		{"group:stone", "group:stone"},
		{"", "default:stick"},
		{"", "default:stick"},
	}
})

minetest.register_craft({
	output = "tool:hoe_mithril",
	recipe = {
		{"mineral:mithril_ingot", "mineral:mithril_ingot"},
		{"", "default:stick"},
		{"", "default:stick"},
	}
})

minetest.register_craft({
	output = "tool:hoe_silver",
	recipe = {
		{"mineral:silver_ingot", "mineral:silver_ingot"},
		{"", "default:stick"},
		{"", "default:stick"},
	}
})

minetest.register_craft({
	output = "tool:hoe_copper",
	recipe = {
		{"mineral:copper_ingot", "mineral:copper_ingot"},
		{"", "default:stick"},
		{"", "default:stick"},
	}
})

minetest.register_craft({
	output = "tool:hoe_bronze",
	recipe = {
		{"mineral:bronze_ingot", "mineral:bronze_ingot"},
		{"", "default:stick"},
		{"", "default:stick"},
	}
})

minetest.register_craft({
	output = "tool:hoe_gold",
	recipe = {
		{"mineral:gold_ingot", "mineral:gold_ingot"},
		{"", "default:stick"},
		{"", "default:stick"},
	}
})

minetest.register_craft({
	output = "tool:hoe_steel",
	recipe = {
		{"mineral:steel_ingot", "mineral:steel_ingot"},
		{"", "default:stick"},
		{"", "default:stick"},
	}
})

minetest.register_craft({
	output = 'tool:pick_ruby',
	recipe = {
		{'mineral:mithril_ingot', 'mineral:ruby_gem', 'mineral:mithril_ingot'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'tool:axe_ruby',
	recipe = {
		{'mineral:ruby_gem', 'mineral:mithril_ingot'},
		{'mineral:mithril_ingot', 'default:stick'},
		{'', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:sword_ruby',
	recipe = {
		{'mineral:mithril_ingot'},
		{'mineral:mithril_ingot'},
		{'mineral:ruby_gem'},
	}
})

minetest.register_craft({
	output = 'tool:pick_diamond',
	recipe = {
		{'mineral:steel_ingot', 'mineral:diamond_gem', 'mineral:steel_ingot'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'tool:axe_diamond',
	recipe = {
		{'mineral:diamond_gem', 'mineral:steel_ingot'},
		{'mineral:steel_ingot', 'default:stick'},
		{'', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'tool:sword_diamond',
	recipe = {
		{'mineral:steel_ingot'},
		{'mineral:steel_ingot'},
		{'mineral:diamond_gem'},
	}
})

-- Grailtest 5 --
-- mods/mineral/ --

-- translation support.
local S = minetest.get_translator("mineral")

--
-- Node definitions
--

minetest.register_node("mineral:clay", {
	description = S("Clay"),
	tiles = {"mineral_clay.png"},
	is_ground_content = true,
	groups = {crumbly = 3},
	drop = 'mineral:clay_lump 4',
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("mineral:coal_stone", {
	description = S("Coal Ore"),
	tiles = {"element_stone.png^mineral_coal.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	drop = 'mineral:coal_lump',
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("mineral:coal_block", {
	description = S("Coal Block"),
	tiles = {"mineral_coal_block.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("mineral:mithril_stone", {
	description = S("Mithril Ore"),
	tiles ={"mineral_greenstone.png^mineral_mithril.png"},
	is_ground_content = true,
	groups = {cracky = 1},
	drop = 'mineral:mithril_lump',
	sounds = base.node_sound_stone_defaults({
		dug = {name = "base_dug_metal", gain = 0.5}
	}),
})

minetest.register_node("mineral:mithril_block", {
	description = S("Mithril Block"),
	tiles ={"mineral_mithril_block.png"},
	groups = {snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("mineral:diamond_stone", {
	description = S("Diamond Ore"),
	tiles = {"mineral_basalt.png^mineral_diamond.png"},
	is_ground_content = true,
	groups = {cracky = 1},
	drop = "mineral:diamond_gem",
	sounds = base.node_sound_stone_defaults({
		dug = {name = "base_break_glass", gain = 1.0}
	}),
})

minetest.register_node("mineral:tin_stone", {
	description = S("Tin Ore"),
	tiles ={"element_stone.png^mineral_tin.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	drop = 'mineral:tin_lump',
	sounds = base.node_sound_stone_defaults({
		dug = {name = "base_dug_metal", gain = 0.5}
	}),
})

minetest.register_node("mineral:tin_block", {
	description = S("Tin Block"),
	tiles ={"mineral_tin_block.png"},
	groups = {snappy = 3, bendy = 3, cracky = 1, melty = 2, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("mineral:obsidian", {
	description = S("Obsidian"),
	tiles = {"mineral_obsidian.png"},
	is_ground_content = true,
	sounds = base.node_sound_stone_defaults({
		dug = {name = "base_break_glass", gain = 1.0},
		footstep = {name = "base_glass_footstep", gain = 0.5}
	}),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("mineral:silver_stone", {
	description = S("Silver Ore"),
	tiles ={"element_stone.png^mineral_silver.png"},
	is_ground_content = true,
	groups = {cracky = 2},
	drop = 'mineral:silver_lump',
	sounds = base.node_sound_stone_defaults({
		dug = {name = "base_dug_metal", gain = 0.5}
	}),
})

minetest.register_node("mineral:silver_block", {
	description = S("Silver Block"),
	tiles ={"mineral_silver_block.png"},
	groups = {snappy = 3, bendy = 2, cracky = 1, melty = 2, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("mineral:bronze_block", {
	description = S("Bronze Block"),
	tiles ={"mineral_bronze_block.png"},
	groups = {snappy = 1, bendy = 1, cracky = 1, melty = 2, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("mineral:copper_stone", {
	description = S("Copper Ore"),
	tiles ={"mineral_bluestone.png^mineral_copper.png"},
	is_ground_content = true,
	groups = {cracky = 2},
	drop = 'mineral:copper_lump',
	sounds = base.node_sound_stone_defaults({
		dug = {name = "base_dug_metal", gain = 0.5}
	}),
})

minetest.register_node("mineral:copper_block", {
	description = S("Copper Block"),
	tiles ={"mineral_copper_block.png"},
	groups = {snappy = 3, bendy = 2, cracky = 1, melty = 2, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("mineral:gold_stone", {
	description = S("Gold Ore"),
	tiles ={"element_stone.png^mineral_gold.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	drop = 'mineral:gold_lump',
	sounds = base.node_sound_stone_defaults({
		dug = {name = "base_dug_metal", gain = 0.5}
	}),
})

minetest.register_node("mineral:gold_block", {
	description = S("Gold Block"),
	tiles ={"mineral_gold_block.png"},
	groups = {snappy = 3, bendy = 3, cracky = 1, melty = 2, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

minetest.register_node("mineral:iron_stone", {
	description = S("Iron Ore"),
	tiles ={"element_stone.png^mineral_iron.png"},
	is_ground_content = true,
	groups = {cracky = 2},
	drop = 'mineral:iron_lump',
	sounds = base.node_sound_stone_defaults({
		dug = {name = "base_dug_metal", gain = 0.5}
	}),
})

minetest.register_node("mineral:steel_block", {
	description = S("Steel Block"),
	tiles ={"mineral_steel_block.png"},
	groups = {snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2},
	sounds = base.node_sound_metal_defaults(),
})

--white stone
minetest.register_node("mineral:white_stone", {
	description = S("White Stone"),
	tiles = {"mineral_white_stone.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	drop = "mineral:white_cobble",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("mineral:white_cobble", {
	description = S("White Cobble"),
	tiles = {"mineral_white_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})

--green stone
minetest.register_node("mineral:greenstone", {
	description = S("Greenstone"),
	tiles = {"mineral_greenstone.png"},
	is_ground_content = false,
	groups = {cracky = 1, stone = 1},
	drop = "mineral:greenstone",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("mineral:basalt", {
	description = S("Basalt Rock"),
	tiles = {"mineral_basalt.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	drop = "mineral:basalt",
	sounds = base.node_sound_stone_defaults(),
})

--blue stone
minetest.register_node("mineral:bluestone", {
	description = S("Bluestone"),
	tiles = {"mineral_bluestone.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	drop = "mineral:bluestone_cobble",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("mineral:bluestone_cobble", {
	description = S("Blue Cobble"),
	tiles = {"mineral_bluestone_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = base.node_sound_stone_defaults(),
})

-- Gems --

minetest.register_node("mineral:topaz_stone", {
	description = S("Topaz Ore"),
	tiles = {"element_stone.png^mineral_topaz.png"},
	is_ground_content = true,
	groups = {cracky = 2},
	drop = "mineral:topaz_gem",
	sounds = base.node_sound_stone_defaults({
		dug = {name = "default_break_glass", gain = 1.0}
	}),
})

minetest.register_node("mineral:ruby_stone", {
	description = S("Ruby Ore"),
	tiles = {"mineral_greenstone.png^mineral_ruby.png"},
	is_ground_content = true,
	groups = {cracky = 1},
	drop = "mineral:ruby_gem",
	sounds = base.node_sound_stone_defaults({
		dug = {name = "default_break_glass", gain = 1.0}
	}),
})

minetest.register_node("mineral:saphire_stone", {
	description = S("Saphire Ore"),
	tiles = {"mineral_greenstone.png^mineral_saphire.png"},
	is_ground_content = true,
	groups = {cracky = 3},
	drop = "mineral:saphire_gem",
	sounds = base.node_sound_stone_defaults({
		dug = {name = "default_break_glass", gain = 1.0}
	}),
})

minetest.register_node("mineral:emerald_stone", {
	description = S("Emerald Ore"),
	tiles = {"element_stone.png^mineral_emerald.png"},
	is_ground_content = true,
	groups = {cracky = 2},
	drop = "mineral:emerald_gem",
	sounds = base.node_sound_stone_defaults({
		dug = {name = "default_break_glass", gain = 1.0}
	}),
})

minetest.register_node("mineral:amethyst_stone", {
	description = S("Amethyst Ore"),
	tiles = {"element_stone.png^mineral_amethyst.png"},
	is_ground_content = true,
	groups = {cracky = 2},
	drop = "mineral:amethyst_gem",
	sounds = base.node_sound_stone_defaults({
		dug = {name = "default_break_glass", gain = 1.0}
	}),
})

--
-- Crafting items
--

minetest.register_craftitem("mineral:clay_lump", {
	description = S("Clay Lump"),
	inventory_image = "mineral_clay_lump.png",
})

minetest.register_craftitem("mineral:clay_brick", {
	description = S("Clay Brick"),
	inventory_image = "mineral_clay_brick.png",
})

minetest.register_craftitem("mineral:coal_lump", {
	description = S("Coal Lump"),
	inventory_image = "mineral_coal_lump.png",
})

minetest.register_craftitem("mineral:mithril_lump", {
	description = S("Lump of Mithril"),
	inventory_image = "mineral_mithril_lump.png",
})

minetest.register_craftitem("mineral:mithril_ingot", {
	description = S("Mithril Ingot"),
        groups = {snappy = 1, bendy = 2, cracky = 1, melty = 2, metal = 1},
	inventory_image = "mineral_mithril_ingot.png",
})

minetest.register_craftitem("mineral:diamond_gem", {
        description = S("Diamond Gem"),
        inventory_image = "mineral_diamond_gem.png",
})

minetest.register_craftitem("mineral:tin_lump", {
	description = S("Lump of Tin"),
	inventory_image = "mineral_tin_lump.png",
})

minetest.register_craftitem("mineral:tin_ingot", {
	description = S("Tin Ingot"),
        groups = {snappy = 3, bendy = 3, cracky = 1, melty = 2, metal = 3},
	inventory_image = "mineral_tin_ingot.png",
})

minetest.register_craftitem("mineral:obsidian_shard", {
	description = S("Obsidian Shard"),
	inventory_image = "mineral_obsidian_shard.png",
})

minetest.register_craftitem("mineral:silver_lump", {
	description = S("Lump of Silver"),
	inventory_image = "mineral_silver_lump.png",
})

minetest.register_craftitem("mineral:silver_ingot", {
	description = S("Silver Ingot"),
        groups = {snappy = 3, bendy = 2, cracky = 1, melty = 2, metal = 3},
	inventory_image = "mineral_silver_ingot.png",
})

minetest.register_craftitem("mineral:bronze_ingot", {
	description = S("Bronze Ingot"),
        groups = {snappy = 1, bendy = 1, cracky = 1, melty = 2, metal = 2},
	inventory_image = "mineral_bronze_ingot.png",
})

minetest.register_craftitem("mineral:copper_lump", {
	description = S("Lump of Copper"),
	inventory_image = "mineral_copper_lump.png",
})

minetest.register_craftitem("mineral:copper_ingot", {
	description = S("Copper Ingot"),
        groups = {snappy = 3, bendy = 2, cracky = 1, melty = 2, metal = 2},
	inventory_image = "mineral_copper_ingot.png",
})

minetest.register_craftitem("mineral:gold_lump", {
	description = S("Lump of Gold"),
	inventory_image = "mineral_gold_lump.png",
})

minetest.register_craftitem("mineral:gold_ingot", {
	description = S("Gold Ingot"),
        groups = {snappy = 3, bendy = 3, cracky = 1, melty = 2, metal = 3},
	inventory_image = "mineral_gold_ingot.png",
})

minetest.register_craftitem("mineral:iron_lump", {
	description = S("Lump of Iron"),
	inventory_image = "mineral_iron_lump.png",
})

minetest.register_craftitem("mineral:steel_ingot", {
	description = S("Steel Ingot"),
        groups = {snappy = 1, bendy = 2, cracky = 1, melty = 2, metal = 2},
	inventory_image = "mineral_steel_ingot.png",
})

minetest.register_craftitem("mineral:topaz_gem", {
        description = S("Topaz Gem"),
        inventory_image = "mineral_topaz_gem.png",
})

minetest.register_craftitem("mineral:ruby_gem", {
        description = S("Ruby Gem"),
        inventory_image = "mineral_ruby_gem.png",
})

minetest.register_craftitem("mineral:saphire_gem", {
        description = S("Saphire Gem"),
        inventory_image = "mineral_saphire_gem.png",
})

minetest.register_craftitem("mineral:emerald_gem", {
        description = S("Emerald Gem"),
        inventory_image = "mineral_emerald_gem.png",
})

minetest.register_craftitem("mineral:amethyst_gem", {
        description = S("Amethyst Gem"),
        inventory_image = "mineral_amethyst_gem.png",
})

--
-- Crafting
--

minetest.register_craft({
	output = 'mineral:mithril_block',
	recipe = {
		{'mineral:mithril_ingot', 'mineral:mithril_ingot', 'mineral:mithril_ingot'},
		{'mineral:mithril_ingot', 'mineral:mithril_ingot', 'mineral:mithril_ingot'},
		{'mineral:mithril_ingot', 'mineral:mithril_ingot', 'mineral:mithril_ingot'},
	}
})

minetest.register_craft({
	output = 'mineral:mithril_ingot 9',
	recipe = {
		{'mineral:mithril_block'}
	},
})

minetest.register_craft ({
        output = 'mineral:diamond_stone',
        recipe = {
                {'mineral:diamond_gem', 'mineral:diamond_gem', 'mineral:diamond_gem'},
                {'mineral:diamond_gem', 'mineral:diamond_gem', 'mineral:diamond_gem'},
                {'mineral:diamond_gem', 'mineral:diamond_gem', 'mineral:diamond_gem'},
        }
})

minetest.register_craft({
	output = 'mineral:diamond_gem 9',
	recipe = {
		{'mineral:diamond_stone'}
	},
})

minetest.register_craft({
	output = 'mineral:tin_block',
	recipe = {
		{'mineral:tin_ingot', 'mineral:tin_ingot', 'mineral:tin_ingot'},
		{'mineral:tin_ingot', 'mineral:tin_ingot', 'mineral:tin_ingot'},
		{'mineral:tin_ingot', 'mineral:tin_ingot', 'mineral:tin_ingot'},
	}
})

minetest.register_craft({
	output = 'mineral:tin_ingot 9',
	recipe = {
		{'mineral:tin_block'}
	},
})

minetest.register_craft({
	output = 'mineral:silver_block',
	recipe = {
		{'mineral:silver_ingot', 'mineral:silver_ingot', 'mineral:silver_ingot'},
		{'mineral:silver_ingot', 'mineral:silver_ingot', 'mineral:silver_ingot'},
		{'mineral:silver_ingot', 'mineral:silver_ingot', 'mineral:silver_ingot'},
	}
})

minetest.register_craft({
	output = 'mineral:silver_ingot 9',
	recipe = {
		{'mineral:silver_block'}
	},
})

minetest.register_craft({
	output = 'mineral:bronze_block',
	recipe = {
		{'mineral:bronze_ingot', 'mineral:bronze_ingot', 'mineral:bronze_ingot'},
		{'mineral:bronze_ingot', 'mineral:bronze_ingot', 'mineral:bronze_ingot'},
		{'mineral:bronze_ingot', 'mineral:bronze_ingot', 'mineral:bronze_ingot'},
	}
})

minetest.register_craft({
	output = 'mineral:bronze_ingot 9',
	recipe = {
		{'mineral:bronze_block'}
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "mineral:bronze_ingot 3",
	recipe = {
		"mineral:tin_ingot",
		"mineral:copper_ingot",
		"mineral:copper_ingot",
	}
})

minetest.register_craft({
	output = 'mineral:copper_block',
	recipe = {
		{'mineral:copper_ingot', 'mineral:copper_ingot', 'mineral:copper_ingot'},
		{'mineral:copper_ingot', 'mineral:copper_ingot', 'mineral:copper_ingot'},
		{'mineral:copper_ingot', 'mineral:copper_ingot', 'mineral:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'mineral:copper_ingot 9',
	recipe = {
		{'mineral:copper_block'}
	},
})

minetest.register_craft({
	output = 'mineral:gold_block',
	recipe = {
		{'mineral:gold_ingot', 'mineral:gold_ingot', 'mineral:gold_ingot'},
		{'mineral:gold_ingot', 'mineral:gold_ingot', 'mineral:gold_ingot'},
		{'mineral:gold_ingot', 'mineral:gold_ingot', 'mineral:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'mineral:gold_ingot 9',
	recipe = {
		{'mineral:gold_block'}
	},
})

minetest.register_craft({
	output = 'mineral:steel_block',
	recipe = {
		{'mineral:steel_ingot', 'mineral:steel_ingot', 'mineral:steel_ingot'},
		{'mineral:steel_ingot', 'mineral:steel_ingot', 'mineral:steel_ingot'},
		{'mineral:steel_ingot', 'mineral:steel_ingot', 'mineral:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'mineral:steel_ingot 9',
	recipe = {
		{'mineral:steel_block'}
	},
})

minetest.register_craft({
	output = 'mineral:obsidian_shard 9',
	recipe = {
		{'mineral:obsidian'}
	}
})

minetest.register_craft({
	output = 'mineral:obsidian',
	recipe = {
		{'mineral:obsidian_shard', 'mineral:obsidian_shard', 'mineral:obsidian_shard'},
		{'mineral:obsidian_shard', 'mineral:obsidian_shard', 'mineral:obsidian_shard'},
		{'mineral:obsidian_shard', 'mineral:obsidian_shard', 'mineral:obsidian_shard'},
	}
})


minetest.register_craft({
	output = 'mineral:coal_block',
	recipe = {
		{'mineral:coal_lump', 'mineral:coal_lump', 'mineral:coal_lump'},
		{'mineral:coal_lump', 'mineral:coal_lump', 'mineral:coal_lump'},
		{'mineral:coal_lump', 'mineral:coal_lump', 'mineral:coal_lump'},
	}
})

minetest.register_craft({
	output = 'mineral:coal_lump 9',
	recipe = {
		{'mineral:coal_block'},
	}
})

minetest.register_craft({
	output = 'mineral:clay',
	recipe = {
		{'mineral:clay_lump', 'mineral:clay_lump'},
		{'mineral:clay_lump', 'mineral:clay_lump'},
	}
})

minetest.register_craft({
	output = 'mineral:clay_lump 4',
	recipe = {
		{'mineral:clay'},
	}
})

minetest.register_craft ({
        output = 'mineral:topaz_stone',
        recipe = {
                {'mineral:topaz_gem', 'mineral:topaz_gem', 'mineral:topaz_gem'},
                {'mineral:topaz_gem', 'mineral:topaz_gem', 'mineral:topaz_gem'},
                {'mineral:topaz_gem', 'mineral:topaz_gem', 'mineral:topaz_gem'},
        }
})

minetest.register_craft({
	output = 'mineral:topaz_gem 9',
	recipe = {
		{'mineral:topaz_stone'}
	},
})

minetest.register_craft ({
        output = 'mineral:ruby_stone',
        recipe = {
                {'mineral:ruby_gem', 'mineral:ruby_gem', 'mineral:ruby_gem'},
                {'mineral:ruby_gem', 'mineral:ruby_gem', 'mineral:ruby_gem'},
                {'mineral:ruby_gem', 'mineral:ruby_gem', 'mineral:ruby_gem'},
        }
})

minetest.register_craft({
	output = 'mineral:ruby_gem 9',
	recipe = {
		{'mineral:ruby_stone'}
	},
})

minetest.register_craft ({
        output = 'mineral:saphire_stone',
        recipe = {
                {'mineral:saphire_gem', 'mineral:saphire_gem', 'mineral:saphire_gem'},
                {'mineral:saphire_gem', 'mineral:saphire_gem', 'mineral:saphire_gem'},
                {'mineral:saphire_gem', 'mineral:saphire_gem', 'mineral:saphire_gem'},
        }
})

minetest.register_craft({
	output = 'mineral:saphire_gem 9',
	recipe = {
		{'mineral:saphire_stone'}
	},
})

minetest.register_craft ({
        output = 'mineral:emerald_stone',
        recipe = {
                {'mineral:emerald_gem', 'mineral:emerald_gem', 'mineral:emerald_gem'},
                {'mineral:emerald_gem', 'mineral:emerald_gem', 'mineral:emerald_gem'},
                {'mineral:emerald_gem', 'mineral:emerald_gem', 'mineral:emerald_gem'},
        }
})

minetest.register_craft({
	output = 'mineral:emerald_gem 9',
	recipe = {
		{'mineral:emerald_stone'}
	},
})

minetest.register_craft ({
        output = 'mineral:amethyst_stone',
        recipe = {
                {'mineral:amethyst_gem', 'mineral:amethyst_gem', 'mineral:amethyst_gem'},
                {'mineral:amethyst_gem', 'mineral:amethyst_gem', 'mineral:amethyst_gem'},
                {'mineral:amethyst_gem', 'mineral:amethyst_gem', 'mineral:amethyst_gem'},
        }
})

minetest.register_craft({
	output = 'mineral:amethyst_gem 9',
	recipe = {
		{'mineral:amethyst_stone'}
	},
})

--
-- Cooking recipes
--

minetest.register_craft({
	type = "cooking",
	output = "mineral:clay_brick",
	recipe = "mineral:clay_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "mineral:mithril_ingot",
	recipe = "mineral:mithril_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "mineral:tin_ingot",
	recipe = "mineral:tin_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "mineral:silver_ingot",
	recipe = "mineral:silver_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "mineral:copper_ingot",
	recipe = "mineral:copper_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "mineral:gold_ingot",
	recipe = "mineral:gold_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "mineral:steel_ingot",
	recipe = "mineral:iron_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "mineral:white_stone",
	recipe ="mineral:white_cobble"
})

minetest.register_craft({
	type = "cooking",
	output = "mineral:bluestone",
	recipe ="mineral:bluestone_cobble"
})

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "mineral:coal_lump",
	burntime = 40,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mineral:coal_block",
	burntime = 370,
})

dofile(minetest.get_modpath("mineral").."/shapes.lua")
dofile(minetest.get_modpath("mineral").."/aliases.lua")
dofile(minetest.get_modpath("mineral").."/mapgen.lua")

minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

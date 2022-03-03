-- Grailtest 5 --
-- mods/equipment_pack/tool/staff.lua

--
-- Staves
--

minetest.register_tool("tool:staff_wood", {
	description = "Wooden Staff",
	inventory_image = "tool_staff_wood.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	}
})

minetest.register_tool("tool:staff_diamond", {
	description = "Diamond Staff",
	inventory_image = "tool_staff_diamond.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("tool:staff_topaz", {
	description = "Topaz Staff",
	inventory_image = "tool_staff_topaz.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("tool:staff_ruby", {
	description = "Ruby Staff",
	inventory_image = "tool_staff_ruby.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("tool:staff_saphire", {
	description = "Saphire Staff",
	inventory_image = "tool_staff_turquoise.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_alias("tool:staff_turquoise", "tool:staff_saphire")

minetest.register_tool("tool:staff_emerald", {
	description = "Emerald Staff",
	inventory_image = "tool_staff_emerald.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("tool:staff_amethyst", {
	description = "Amethyst Staff",
	inventory_image = "tool_staff_amethyst.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_craft({
	output = 'tool:staff_wood',
	recipe = {
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'tool:staff_diamond',
	recipe = {
		{'mineral:diamond_gem'},
		{'tree:apple_log'},
	}
})

minetest.register_craft({
	output = 'tool:staff_topaz',
	recipe = {
		{'mineral:topaz_gem'},
		{'tree:pine_log'},
	}
})

minetest.register_craft({
	output = 'tool:staff_ruby',
	recipe = {
		{'mineral:ruby_gem'},
		{'tree:oak_log'},
	}
})

minetest.register_craft({
	output = 'tool:staff_saphire',
	recipe = {
		{'mineral:saphire_gem'},
		{'tree:birch_log'},
	}
})

minetest.register_craft({
	output = 'tool:staff_emerald',
	recipe = {
		{'mineral:emerald_gem'},
		{'tree:ash_log'},
	}
})

minetest.register_craft({
	output = 'tool:staff_amethyst',
	recipe = {
		{'mineral:amethyst_gem'},
		{'tree:willow_log'},
	}
})


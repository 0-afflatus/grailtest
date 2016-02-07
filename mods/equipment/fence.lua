--
-- Fence registration helper
--
function equipment.register_fence(name, def)
	minetest.register_craft({
		output = name .. " 6",
		recipe = {
			{ def.material, 'group:stick', def.material },
			{ def.material, 'group:stick', def.material },
		}
	})

	local fence_texture = "equipment_fence_overlay.png^" .. def.texture ..
			"^equipment_fence_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local equipment_fields = {
		paramtype = "light",
		drawtype = "fencelike",
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = { def.texture },
		sunlight_propagates = true,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
		},
		groups = {},
	}
	for k, v in pairs(equipment_fields) do
		if not def[k] then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1

	def.texture = nil
	def.material = nil

	minetest.register_node(name, def)
end

local fence_texture = "equipment_fence_overlay.png^material_wood.png^equipment_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("equipment:fence_wood", {
	description = "Wooden Fence",
	drawtype = "fencelike",
	tiles = {"material_wood.png"},
	inventory_image = fence_texture,
	wield_image = fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})


minetest.register_craft({
	output = 'equipment:fence_wood 2',
	recipe = {
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "equipment:fence_wood",
	burntime = 15,
})

local bronze_fence_texture = "equipment_fence_overlay.png^mineral_bronze_block.png^equipment_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("equipment:fence_bronze", {
	description = "bronze Fence",
	drawtype = "fencelike",
	tiles = {"mineral_bronze_block.png"},
	inventory_image = bronze_fence_texture,
	wield_image = bronze_fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {oddly_breakable_by_hand = 2, snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2},
})


minetest.register_craft({
	output = 'equipment:fence_bronze 2',
	recipe = {
		{'mineral:bronze_ingot', 'mineral:bronze_ingot', 'mineral:bronze_ingot'},
		{'mineral:bronze_ingot', 'mineral:bronze_ingot', 'mineral:bronze_ingot'},
	}
})

local copper_fence_texture = "equipment_fence_overlay.png^mineral_copper_block.png^equipment_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("equipment:fence_copper", {
	description = "copper Fence",
	drawtype = "fencelike",
	tiles = {"mineral_copper_block.png"},
	inventory_image = copper_fence_texture,
	wield_image = copper_fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {oddly_breakable_by_hand = 2, snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2},
})


minetest.register_craft({
	output = 'equipment:fence_copper 2',
	recipe = {
		{'mineral:copper_ingot', 'mineral:copper_ingot', 'mineral:copper_ingot'},
		{'mineral:copper_ingot', 'mineral:copper_ingot', 'mineral:copper_ingot'},
	}
})

local gold_fence_texture = "equipment_fence_overlay.png^mineral_gold_block.png^equipment_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("equipment:fence_gold", {
	description = "gold Fence",
	drawtype = "fencelike",
	tiles = {"mineral_gold_block.png"},
	inventory_image = gold_fence_texture,
	wield_image = gold_fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {oddly_breakable_by_hand = 2, snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2},
})


minetest.register_craft({
	output = 'equipment:fence_gold 2',
	recipe = {
		{'mineral:gold_ingot', 'mineral:gold_ingot', 'mineral:gold_ingot'},
		{'mineral:gold_ingot', 'mineral:gold_ingot', 'mineral:gold_ingot'},
	}
})

local mithril_fence_texture = "equipment_fence_overlay.png^mineral_mithril_block.png^equipment_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("equipment:fence_mithril", {
	description = "mithril Fence",
	drawtype = "fencelike",
	tiles = {"mineral_mithril_block.png"},
	inventory_image = mithril_fence_texture,
	wield_image = mithril_fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {oddly_breakable_by_hand = 2, snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2},
})


minetest.register_craft({
	output = 'equipment:fence_mithril 2',
	recipe = {
		{'mineral:mithril_ingot', 'mineral:mithril_ingot', 'mineral:mithril_ingot'},
		{'mineral:mithril_ingot', 'mineral:mithril_ingot', 'mineral:mithril_ingot'},
	}
})

local silver_fence_texture = "equipment_fence_overlay.png^mineral_silver_block.png^equipment_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("equipment:fence_silver", {
	description = "silver Fence",
	drawtype = "fencelike",
	tiles = {"mineral_silver_block.png"},
	inventory_image = silver_fence_texture,
	wield_image = silver_fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {oddly_breakable_by_hand = 2, snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2},
})


minetest.register_craft({
	output = 'equipment:fence_silver 2',
	recipe = {
		{'mineral:silver_ingot', 'mineral:silver_ingot', 'mineral:silver_ingot'},
		{'mineral:silver_ingot', 'mineral:silver_ingot', 'mineral:silver_ingot'},
	}
})

local steel_fence_texture = "equipment_fence_overlay.png^mineral_steel_block.png^equipment_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("equipment:fence_steel", {
	description = "Steel Fence",
	drawtype = "fencelike",
	tiles = {"mineral_steel_block.png"},
	inventory_image = steel_fence_texture,
	wield_image = steel_fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {oddly_breakable_by_hand = 2, snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2},
})


minetest.register_craft({
	output = 'equipment:fence_steel 2',
	recipe = {
		{'mineral:steel_ingot', 'mineral:steel_ingot', 'mineral:steel_ingot'},
		{'mineral:steel_ingot', 'mineral:steel_ingot', 'mineral:steel_ingot'},
	}
})

equipment.register_fence("equipment:fence_acacia_wood", {
	description = "Acacia Fence",
	texture = "tree_acacia_wood.png",
	material = "tree:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_junglewood", {
	description = "Junglewood Fence",
	texture = "tree_junglewood.png",
	material = "tree:junglewood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_fir_wood", {
	description = "Fir wood Fence",
	texture = "tree_pine_wood.png",
	material = "tree:pine_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_apple_wood", {
	description = "Apple wood Fence",
	texture = "tree_apple_tree_wood.png",
	material = "tree:apple_tree_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	output = 'equipment:fence_apple_wood 6',
	recipe = {
		{'moretrees:apple_tree_planks', 'group:stick', 'moretrees:apple_tree_planks'},
		{'moretrees:apple_tree_planks', 'group:stick', 'moretrees:apple_tree_planks'},
	}
})

equipment.register_fence("equipment:fence_beech_wood", {
	description = "Beech wood Fence",
	texture = "moretrees_beech_wood.png",
	material = "moretrees:beech_planks",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_birch_wood", {
	description = "Birch wood Fence",
	texture = "moretrees_birch_wood.png",
	material = "moretrees:birch_planks",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_pine_wood", {
	description = "Pine wood Fence",
	texture = "moretrees_pine_wood.png",
	material = "moretrees:pine_planks",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	output = 'equipment:fence_junglewood 6',
	recipe = {
		{'moretrees:jungletree_planks', 'group:stick', 'moretrees:jungletree_planks'},
		{'moretrees:jungletree_planks', 'group:stick', 'moretrees:jungletree_planks'},
	}
})

equipment.register_fence("equipment:fence_oak_wood", {
	description = "Oak Fence",
	texture = "moretrees_oak_wood.png",
	material = "moretrees:oak_planks",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	output = 'equipment:fence_fir_wood 6',
	recipe = {
		{'moretrees:fir_planks', 'group:stick', 'moretrees:fir_planks'},
		{'moretrees:fir_planks', 'group:stick', 'moretrees:fir_planks'},
	}
})

equipment.register_fence("equipment:fence_spruce_wood", {
	description = "Spruce wood Fence",
	texture = "moretrees_spruce_wood.png",
	material = "moretrees:spruce_planks",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_willow_wood", {
	description = "Willow Fence",
	texture = "moretrees_willow_wood.png",
	material = "moretrees:willow_planks",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})


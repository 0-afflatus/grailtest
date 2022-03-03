-- Grailtest 5 --
-- mods/equipment/fence.lua --

-- Load translation support.
local S = minetest.get_translator("equipment")

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
		--[[
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
				{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
			connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
				{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
			connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
				{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
			connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
				{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
		},
		connects_to = {"group:fence", "group:wood", "group:tree"},
		]]
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {def.texture},
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

local fence_texture = "equipment_fence_overlay.png^tree_wood.png^equipment_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("equipment:fence_wood", {
	description = S("Wooden Fence"),
	drawtype = "fencelike",
	tiles = {"tree_wood.png"},
	inventory_image = fence_texture,
	wield_image = fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults(),
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
	description = S("Bronze Fence"),
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
	description = S("Copper Fence"),
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
	description = S("Gold Fence"),
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
	description = S("Mithril Fence"),
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
	description = S("Silver Fence"),
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
	description = S("Steel Fence"),
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
	description = S("Acacia Wood Fence"),
	texture = "tree_acacia_wood.png",
	--texture = "equipment_fence_acacia_wood.png",
	material = "tree:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_jungle_wood", {
	description = S("Jungle Wood Fence"),
	texture = "tree_jungle_wood.png",
	--texture = "equipment_fence_jungle_wood.png",
	material = "tree:jungle_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_pine_wood", {
	description = S("Pine Wood Fence"),
	texture = "tree_pine_wood.png",
	--texture = "equipment_fence_fir_wood.png",
	material = "tree:pine_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_apple_wood", {
	description = S("Apple Wood Fence"),
	texture = "tree_apple_wood.png",
	--texture = "equipment_fence_apple_wood.png",
	material = "tree:apple_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_ash_wood", {
	description = S("Ash Wood Fence"),
	texture = "tree_ash_wood.png",
	material = "tree:ash_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_banana_wood", {
	description = S("Banana Wood Fence"),
	texture = "tree_banana_wood.png",
	material = "tree:banana_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_beech_wood", {
	description = S("Beech Wood Fence"),
	texture = "tree_beech_wood.png",
	--texture = "equipment_fence_beech_wood.png",
	material = "tree:beech_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_birch_wood", {
	description = S("Birch Wood Fence"),
	texture = "tree_birch_wood.png",
	--texture = "equipment_fence_birch_wood.png",
	material = "tree:birch_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})

minetest.register_craft({
	output = 'equipment:fence_jungle_wood 6',
	recipe = {
		{'tree:jungle_wood', 'group:stick', 'tree:jungle_wood'},
		{'tree:jungle_wood', 'group:stick', 'tree:jungle_wood'},
	}
})

equipment.register_fence("equipment:fence_oak_wood", {
	description = S("Oak Fence"),
	texture = "tree_oak_wood.png",
	--texture = "equipment_fence_oak_wood.png",
	material = "tree:oak_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_palm_wood", {
	description = S("Palm wood Fence"),
	texture = "tree_palm_wood.png",
	material = "tree:palm_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})

equipment.register_fence("equipment:fence_willow_wood", {
	description = S("Willow Fence"),
	texture = "tree_willow_wood.png",
	--texture = "equipment_fence_willow_wood.png",
	material = "tree:willow_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fence_post = 1},
	sounds = base.node_sound_wood_defaults()
})


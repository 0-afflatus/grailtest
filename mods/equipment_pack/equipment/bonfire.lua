-- Grailtest 5 --
-- mods/equipment/bonfire.lua

-- based on stoneage by CasimirKaPazi
-- code - GPLv3 or later
-- textures - CC-BY-SA
-- bonfire_animated and bonfire_unlit are based on
-- LPC Fireplace CC-BY Lanea Zimmerman

-- Load translation support.
local S = minetest.get_translator("equipment")

--
-- Nodes
--

minetest.register_node("equipment:bonfire_unlit", {
	description = S("Bonfire"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"equipment_bonfire_unlit.png"},
	inventory_image = "equipment_bonfire_unlit.png",
	wield_image = "equipment_bonfire_unlit.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {snappy=3,flammable=2,attached_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-1/3, -1/2, -1/3, 1/3, 1/6, 1/3},
	},
})

minetest.register_node("equipment:bonfire", {
	description = S("Bonfire (lit)"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {
		{name="equipment_bonfire_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}
	},
	inventory_image = "equipment_bonfire_unlit.png",
	wield_image = "equipment_bonfire_unlit.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drop = "",
	damage_per_second = 1,
	light_source = 12,
	groups = {dig_immediate=3,attached_node=1, hot=2},
	after_dig_node = function(pos, node, oldmetadata, puncher)
		node.name = "equipment:bonfire_unlit"
		minetest.set_node(pos, node)
	end,
	selection_box = {
		type = "fixed",
		fixed = {-1/3, -1/2, -1/3, 1/3, 1/6, 1/3},
	},
})

--
-- Crafting
--

local tinder_list = {
	"plant:fibre",
	"material:paper",
	"mineral:coal_lump",
	"plant:dry_shrub",
	"plant:hawthorn",
}

for _,tinder in ipairs(tinder_list) do
	minetest.register_craft({
		output = 'equipment:bonfire',
		recipe = {
			{'', 'material:stick', ''},
			{'material:stick', tinder, 'material:stick'},
		}
	})
end

function equipment.strike_fire(user, pointed_thing)
	if pointed_thing.type == "node" then
		--local n_pointed_above = minetest.get_node(pointed_thing.above)
		local n_pointed_under = minetest.get_node(pointed_thing.under)
		if n_pointed_under.name == "equipment:torch_unlit" then
			n_pointed_under.name = "equipment:torch"
			minetest.add_node(pointed_thing.under, n_pointed_under)
		elseif n_pointed_under.name == "equipment:bonfire_unlit" then
			minetest.add_node(pointed_thing.under, {name="equipment:bonfire"})
		end
	else
		return
	end
end


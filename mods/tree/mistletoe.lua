minetest.register_node("tree:mistletoe", {
	description = "Mistletoe",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"tree_mistletoe.png"},
	inventory_image = "tree_mistletoe.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_abm({
	nodenames = {"tree:apple_fruit"},
	interval = 23,
	chance = 443,
	catch_up = false,
	action = function(pos, node)
		if (minetest.get_node_light(pos) or 0) > 12 then
			minetest.set_node(pos, {name = "tree:mistletoe"})
		end
	end
})

minetest.register_abm({
	nodenames = {"moretrees:acorn"},
	interval = 211,
	chance = 1667,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light") and
				nodedef.liquidtype == "none" and
				(minetest.get_node_light(above) or 0) > 12 then
			minetest.set_node(pos, {name = "tree:mistletoe"})
		end
	end
})

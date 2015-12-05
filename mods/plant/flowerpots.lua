local flowers = {"dandelion_white", "dandelion_yellow", "geranium", "rose",
		"tulip", "viola"}

for _, f in pairs(flowers) do
	minetest.register_node("plant:potted_"..f, {
		description = string.gsub("Potted Flowers ("..f..")", "_", " "),
		drawtype = "plantlike",
		tiles = {"plant_"..f.."_pot.png"},
		inventory_image = "plant_"..f.."_pot.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		groups = {dig_immediate = 3, flammable = 3, plant = 1, flower = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.3, 0.5}
			},
		},
	})

	minetest.register_craft({
		output = "plant:potted_"..f,
		recipe = {
			{"default:clay_brick", "flowers:"..f, "default:clay_brick"},
			{"", "default:clay_brick", ""}
		}
	})
end

minetest.register_node("plant:ivy", {
	description = "Ivy",
	drawtype = "signlike",
	tiles = {"plant_ivy.png"},
	inventory_image = "plant_ivy.png",
	wield_image = "plant_ivy.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	groups = {dig_immediate = 3, flammable = 3, plant = 1},
	selection_box = {type="wallmounted"},
	legacy_wallmounted = true,
	sounds = default.node_sound_leaves_defaults()
})

minetest.register_craft({
	output = "plant:ivy 4",
	recipe = {
		{"group:leaves"},
		{"group:leaves"}
	}
})


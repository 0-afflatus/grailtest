-- Grailtest 5 --
-- mods/flora_pack/plant/compost.lua --

-- translation support.
local S = minetest.get_translator("plant")

minetest.register_node("plant:compost", {
	description = S("Compost"),
	tiles = {"plant_compost.png"},
	inventory_image = "plant_dirtball.png",
	wield_image = "plant_dirtball.png",
	paramtype = "light",
	buildable_to = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/16, 0.5},
		},
	},
	groups = {crumbly = 3, falling_node = 1, puts_out_fire = 1},
	sounds = base.node_sound_dirt_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(23, 123))
	end,
	on_timer = function(pos)
		pos.y = pos.y - 1
		local ground = minetest.get_node(pos)
		if minetest.get_item_group(ground.name, "soil") > 0 then
		    minetest.set_node(pos, {name = "element:soil"})
		end
		pos.y = pos.y + 1
		minetest.set_node(pos, {name = "air"})
	end,
})

local mulches = {
	"plant:hay",
	"group:flora",
	"group:plant",
	"group:salad",
}

for _, mulch in ipairs(mulches) do
	minetest.register_craft({
		output = 'plant:compost 3',
		recipe = {
			{mulch, mulch, mulch},
			{"group:leaves", "group:leaves", "group:leaves"},
			{mulch, mulch, mulch},
		}
	})
end


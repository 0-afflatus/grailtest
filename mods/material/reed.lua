-- Code by Mossmanikin
-----------------------------------------------------------------------------------------------
-- Wet Reed
-----------------------------------------------------------------------------------------------
minetest.register_node("material:wetreed", {
	description = "Wet Reed",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed_wet.png"},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Wet Reed
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- papyrus -> wetreed
	output = "material:wetreed 2",
	recipe = {
		{"plant:papyrus","plant:papyrus"},
		{"plant:papyrus","plant:papyrus"},
	}
})
minetest.register_craft({ -- reedmace_sapling -> wetreed
	output = "material:wetreed 2",
	recipe = {
		{"dryplants:reedmace_sapling","dryplants:reedmace_sapling"},
		{"dryplants:reedmace_sapling","dryplants:reedmace_sapling"},
	}
})
minetest.register_craft({ -- reedmace_top -> wetreed
	output = "material:wetreed 2",
	recipe = {
		{"dryplants:reedmace_top","dryplants:reedmace_top"},
		{"dryplants:reedmace_top","dryplants:reedmace_top"},
	}
})
minetest.register_craft({ -- reedmace -> wetreed
	output = "material:wetreed 2",
	recipe = {
		{"dryplants:reedmace","dryplants:reedmace"},
		{"dryplants:reedmace","dryplants:reedmace"},
	}
})
minetest.register_craft({ -- reedmace_bottom -> wetreed
	output = "material:wetreed 2",
	recipe = {
		{"dryplants:reedmace_bottom","dryplants:reedmace_bottom"},
		{"dryplants:reedmace_bottom","dryplants:reedmace_bottom"},
	}
})

-----------------------------------------------------------------------------------------------
-- Wet Reed becomes (dry) Reed over time
-----------------------------------------------------------------------------------------------
local REED_WILL_DRY = true

if REED_WILL_DRY == true then
	minetest.register_abm({
		nodenames = {"material:wetreed"},
		interval = 1200, -- 20 minutes: a minetest-day/night-cycle
		chance = 1,
		action = function(pos)
			local direction = minetest.get_node(pos).param2
			minetest.set_node(pos, {name="material:reed", param2=direction})
		end,
	})
end

-----------------------------------------------------------------------------------------------
-- Reed
-----------------------------------------------------------------------------------------------
minetest.register_node("material:reed", {
	description = "Reed",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"dryplants_reed.png"},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Reed
-----------------------------------------------------------------------------------------------
minetest.register_craft({ -- hay -> reed
	output = "material:reed 2",
	recipe = {
		{"plant:hay","plant:hay"},
		{"plant:hay","plant:hay"},
	}
})
--cooking
minetest.register_craft({ -- wetreed -> reed
	type = "cooking",
	output = "material:reed",
	recipe = "material:wetreed",
	cooktime = 2,
})
--fuel
minetest.register_craft({
	type = "fuel",
	recipe = "material:reed",
	burntime = 4,
})

-----------------------------------------------------------------------------------------------
-- TWiGS BLoCK
-----------------------------------------------------------------------------------------------
minetest.register_node("material:twigs", {
	description = "Twigs Block",
	paramtype2 = "facedir",
	tiles = {"trunks_twigs.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({ -- twigs --> twigs block
	output = "material:twigs",
	recipe = {
		{"trunks:twig_1","trunks:twig_1","trunks:twig_1"},
		{"trunks:twig_1",      ""       ,"trunks:twig_1"},
		{"trunks:twig_1","trunks:twig_1","trunks:twig_1"},
	}
})

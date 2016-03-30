-- Code by Mossmanikin & Neuromancer
-----------------------------------------------------------------------------------------------
-- TWiGS
-----------------------------------------------------------------------------------------------
-- For compatibility with older stuff
minetest.register_alias("trunks:twig",	"trunks:twig_1")

local flat_stick = {-1/2, -1/2, -1/2, 1/2, -7/16, 1/2}
local NoDe = { {1}, {2}, {3}, {4}, {5}, --[[{6},]] {7}, {8}, {9}, {10}, {11}, {12}, {13} }


for i in pairs(NoDe) do
	local NR = NoDe[i][1]
	local iNV = NR - 1
	minetest.register_node("trunks:twig_"..NR, {
		description = "Twig",
		inventory_image = "trunks_twig_"..NR..".png",
		wield_image = "trunks_twig_"..NR..".png",
		drawtype = "nodebox",
		tiles = { 
			"trunks_twig_"..NR..".png",
			"trunks_twig_"..NR..".png^[transformFY", -- mirror
			"trunks_twig_6.png" -- empty
		},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		sunlight_propagates = true,
		buildable_to = true,
		node_box = {type = "fixed", fixed = flat_stick},
		groups = {
			choppy=2,
			oddly_breakable_by_hand=2,
			flammable=3,
			attached_node=1,
			not_in_creative_inventory=iNV
		},
		drop = "trunks:twig_1",
		sounds = default.node_sound_leaves_defaults(),
		liquids_pointable = true,
		on_place = function(itemstack, placer, pointed_thing)
			local pt = pointed_thing
			local direction = minetest.dir_to_facedir(placer:get_look_dir())
			if minetest.get_node(pt.above).name=="air" then
				minetest.set_node(pt.above, {name="trunks:twig_"..math.random(1,4), param2=direction})
				if not minetest.setting_getbool("creative_mode") then
					itemstack:take_item()
				end
				return itemstack
			end
		end,
	})
end

-----------------------------------------------------------------------------------------------
-- MoSS
-----------------------------------------------------------------------------------------------
local flat_moss = {-1/2, -1/2, -1/2, 1/2, -15/32--[[<-flickers if smaller]], 1/2}

minetest.register_node("trunks:moss", {
	description = "Moss",
	drawtype = "nodebox",--"signlike",
	tiles = {"trunks_moss.png"},
	inventory_image = "trunks_moss.png",
	wield_image = "trunks_moss.png",
	paramtype = "light",
	paramtype2 = "facedir",--"wallmounted",
	sunlight_propagates = true,
	walkable = false,
	node_box = {type = "fixed", fixed = flat_moss},
	selection_box = {type = "fixed", fixed = flat_stick},--{type = "wallmounted"},
	groups = {snappy = 3, flammable = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- MoSS & FuNGuS
-----------------------------------------------------------------------------------------------
minetest.register_node("trunks:moss_fungus", {
	description = "Moss with Fungus",
	drawtype = "nodebox",--"signlike",
	tiles = {"trunks_moss_fungus.png"},
	inventory_image = "trunks_moss_fungus.png",
	wield_image = "trunks_moss_fungus.png",
	paramtype = "light",
	paramtype2 = "facedir",--"wallmounted",
	sunlight_propagates = true,
	walkable = false,
	node_box = {type = "fixed", fixed = flat_moss},
	selection_box = {type = "fixed", fixed = flat_stick},--{type = "wallmounted"},
	groups = {snappy = 3, flammable = 3 },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_alias("trunks:pine_trunkroot", "trunks:pine_treeroot")

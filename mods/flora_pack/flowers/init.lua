-- Grailtest 5 --
-- mods/flora_pack/flowers/init.lua
-- See README.txt for licensing and other information.

-- Namespace for functions

flowers = {}

-- Load support for MT game translation.
local S = minetest.get_translator("flowers")


-- Map Generation

dofile(minetest.get_modpath("flowers") .. "/mapgen.lua")
dofile(minetest.get_modpath("flowers") .. "/craft.lua")

--
-- Flowers
--

-- Aliases for original flowers mod

minetest.register_alias("flowers:flower_rose", "flowers:rose")
minetest.register_alias("flowers:flower_tulip", "flowers:tulip")
minetest.register_alias("flowers:flower_dandelion_yellow", "flowers:dandelion_yellow")
minetest.register_alias("flowers:flower_geranium", "flowers:geranium")
minetest.register_alias("flowers:flower_viola", "flowers:viola")
minetest.register_alias("flowers:flower_dandelion_white", "flowers:daisy_white")
minetest.register_alias("flowers:dandelion_white", "flowers:daisy_white")
minetest.register_alias("flowers:northernwillowherb", "flowers:northernbedstraw")
minetest.register_alias("flowers:meadowsweet1", "flowers:meadowsweet")
minetest.register_alias("flowers:alpinethistle", "flowers:poppy")
minetest.register_alias("flowers:sage_purple", "flowers:sage")
minetest.register_alias("rose", "flowers:rose")
minetest.register_alias("tulip", "flowers:tulip")
minetest.register_alias("tulip_black", "flowers:tulip_black")
minetest.register_alias("dandelion", "flowers:dandelion_yellow")
minetest.register_alias("geranium", "flowers:geranium")
minetest.register_alias("viola", "flowers:viola")
minetest.register_alias("yarrow", "flowers:achillea_white")
minetest.register_alias("campanula", "flowers:alpinebellflower")
minetest.register_alias("alpinethistle", "flowers:alpinethistle")
minetest.register_alias("arcticgentian", "flowers:arcticgentian")
minetest.register_alias("bellflower", "flowers:beardedbellflower")
minetest.register_alias("bugle", "flowers:bugle")
minetest.register_alias("aven", "flowers:aven")
minetest.register_alias("bistort", "flowers:bistort")
minetest.register_alias("bluebells", "flowers:bluebells")
minetest.register_alias("carnation", "flowers:carnation_pink")
minetest.register_alias("hogweed", "flowers:cowparsnip")
minetest.register_alias("daffodil", "flowers:daffodil")
minetest.register_alias("daisy", "flowers:daisy_white")
minetest.register_alias("deadnettle", "flowers:deadnettle")
minetest.register_alias("dwarfelder", "flowers:dwarfelder")
minetest.register_alias("foxglove", "flowers:foxglove")
minetest.register_alias("gentian", "flowers:greatyellowgentian")
minetest.register_alias("hawkweed", "flowers:hawkweed_orange")
minetest.register_alias("lavender", "flowers:lavender")
minetest.register_alias("fritillary", "flowers:lazarusbell")
minetest.register_alias("meadowsweet", "flowers:meadowsweet")
minetest.register_alias("mint", "flowers:mint")
minetest.register_alias("northernbedstraw", "flowers:northernbedstraw")
minetest.register_alias("pasqueflower", "flowers:pasqueflower")
minetest.register_alias("prideofmadeira", "flowers:prideofmadeira")
minetest.register_alias("rosecampion", "flowers:rosecampion")
minetest.register_alias("sage", "flowers:sage")
minetest.register_alias("sealavender", "flowers:sealavender")
minetest.register_alias("lymegrass", "flowers:sealymegrass")
minetest.register_alias("sandwort", "flowers:seasandwort")
minetest.register_alias("sedge", "flowers:sedge")
minetest.register_alias("nettle", "flowers:stingingnettle")
minetest.register_alias("asphodel", "flowers:whiteasphodel")
minetest.register_alias("wildcarrot", "flowers:wildcarrot")
minetest.register_alias("flag_yellow", "flowers:yellowflag")
minetest.register_alias("toadflax", "flowers:yellowtoadflax")
minetest.register_alias("lilyofthevalley", "flowers:lilyofthevalley")
minetest.register_alias("allium", "flowers:allium")
minetest.register_alias("cornflower", "flowers:cornflower")
minetest.register_alias("poppy", "flowers:poppy")

-- Flower registration

local function add_simple_flower(name, desc, box, f_groups)
	-- Common flowers' groups
	f_groups.snappy = 3
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	minetest.register_node("flowers:" .. name, {
		description = desc,
		drawtype = "plantlike",
		waving = 1,
		tiles = {"flowers_" .. name .. ".png"},
		inventory_image = "flowers_" .. name .. ".png",
		wield_image = "flowers_" .. name .. ".png",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		groups = f_groups,
		sounds = base.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = box
		}
	})
end

flowers.datas = {
	{"rose", "Rose", {-0.15, -0.5, -0.15, 0.15, 0.3, 0.15}, {color_red = 1}},
	{"tulip", "Tulip", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_orange = 1}},
	{"tulip_black", "Black Tulip", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_black = 1}},
	{"dandelion_yellow", "Dandelion", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_yellow = 1, vegetable = 1}},
	{"geranium", "Geranium", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_magenta = 1}},
	{"viola", "Viola", {-0.5, -0.5, -0.5, 0.5, -0.2, 0.5}, {color_violet = 1}},
	{"achillea_white", "Yarrow", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_green = 1, herb = 1}},
	{"alpinebellflower", "Campanula", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_violet = 1}},
	{"arcticgentian", "Arctic Gentian", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_white = 1}},
	{"beardedbellflower", "Bellflower", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_blue = 1}},
	{"bugle", "Bugle", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_blue = 1}},
	{"aven", "Alpine Aven", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_red = 1}},
	{"bistort", "Bistort", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_pink = 1}},
	{"bluebells", "Bluebells", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_blue = 1}},
	{"carnation_pink", "Carnation", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_pink = 1}},
	{"cowparsnip", "Hogweed", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_white = 1}},
	{"daffodil", "Daffodil", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_yellow = 1}},
	{"daisy_white", "Daisy", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_white = 1}},
	{"deadnettle", "Dead nettle", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_green = 1, vegetable = 1}},
	{"dwarfelder", "Dwarf Elder", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_red = 1}},
	{"foxglove", "Foxglove", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_magenta = 1}},
	{"greatyellowgentian", "Gentian", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_yellow = 1, herb = 1}},
	{"hawkweed_orange", "Hawkweed", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_orange = 1}},
	{"lavender", "Lavender", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_pink = 1, herb = 1}},
	{"lazarusbell", "Snake's Head Fritillary", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_magenta = 1}},
	{"meadowsweet", "Meadowsweet", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_yellow = 1, herb = 1}},
	{"mint", "Mint", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_grey = 1, herb = 1}},
	{"northernbedstraw", "Northern Bedstraw", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_white = 1}},
	{"pasqueflower", "Pasque flower", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_violet = 1}},
	{"prideofmadeira", "Pride of Madeira", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_blue = 1}},
	{"rosecampion", "Rose Campion", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_red = 1}},
	{"sage", "Sage", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_cyan = 1, herb = 1}},
	{"sealavender", "Sea Lavender", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_violet = 1}},
	{"sealymegrass", "Lyme Grass", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_grey = 1}},
	{"seasandwort", "Sea Sandwort", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_grey = 1}},
	{"sedge", "Sedge", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_grey = 1}},
	{"stingingnettle", "Stinging nettle", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_green = 1, vegetable = 1}},
	{"whiteasphodel", "Asphodel", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_white = 1}},
	{"wildcarrot", "Wild Carrot", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_white = 1}},
	{"yellowflag", "Yellow flag", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_yellow = 1}},
	{"yellowtoadflax", "Toadflax", {-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_yellow = 1}},
	{"lilyofthevalley", "Lily of the Valley",{-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_white = 1}},
	{"allium", "Allium",{-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_magenta = 1}},
	{"cornflower", "Cornflower",{-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_blue = 1, herb = 1}},
	{"poppy", "Poppy",{-0.15, -0.5, -0.15, 0.15, 0.2, 0.15}, {color_red = 1}},
}

for _,item in pairs(flowers.datas) do
	add_simple_flower(unpack(item))
end


-- Flower spread
-- Public function to enable override by mods

function flowers.flower_spread(pos, node)
	pos.y = pos.y - 1
	local under = minetest.get_node(pos)
	pos.y = pos.y + 1
	-- Replace flora with dry shrub in desert sand and silver sand,
	-- as this is the only way to generate them.
	-- However, preserve grasses in sand dune biomes.
	if minetest.get_item_group(under.name, "sand") == 1 and
			under.name ~= "default:sand" then
		minetest.set_node(pos, {name = "default:dry_shrub"})
		return
	end

	if minetest.get_item_group(under.name, "soil") == 0 then
		return
	end

	local light = minetest.get_node_light(pos)
	if not light or light < 13 then
		return
	end

	local pos0 = vector.subtract(pos, 4)
	local pos1 = vector.add(pos, 4)
	-- Testing shows that a threshold of 3 results in an appropriate maximum
	-- density of approximately 7 flora per 9x9 area.
	if #minetest.find_nodes_in_area(pos0, pos1, "group:flora") > 3 then
		return
	end

	local soils = minetest.find_nodes_in_area_under_air(
		pos0, pos1, "group:soil")
	local num_soils = #soils
	if num_soils >= 1 then
		for si = 1, math.min(3, num_soils) do
			local soil = soils[math.random(num_soils)]
			local soil_name = minetest.get_node(soil).name
			local soil_above = {x = soil.x, y = soil.y + 1, z = soil.z}
			light = minetest.get_node_light(soil_above)
			if light and light >= 13 and
					-- Only spread to same surface node
					soil_name == under.name and
					-- Desert sand is in the soil group
					soil_name ~= "element:desert_sand" then
				minetest.set_node(soil_above, {name = node.name})
			end
		end
	end
end

minetest.register_abm({
	label = "Flower spread",
	nodenames = {"group:flora"},
	interval = 13,
	chance = 300,
	action = function(...)
		flowers.flower_spread(...)
	end,
})

--
-- Mushrooms
--

minetest.register_node("flowers:mushroom_red", {
	description = S("Red Mushroom"),
	tiles = {"flowers_mushroom_red.png"},
	inventory_image = "flowers_mushroom_red.png",
	wield_image = "flowers_mushroom_red.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(-5),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
	}
})

minetest.register_node("flowers:mushroom_brown", {
	description = S("Brown Mushroom"),
	tiles = {"flowers_mushroom_brown.png"},
	inventory_image = "flowers_mushroom_brown.png",
	wield_image = "flowers_mushroom_brown.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {mushroom = 1, food_mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(1),
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16},
	}
})


-- Mushroom spread and death

function flowers.mushroom_spread(pos, node)
	if minetest.get_node_light(pos, 0.5) > 3 then
		if minetest.get_node_light(pos, nil) == 15 then
			minetest.remove_node(pos)
		end
		return
	end
	local positions = minetest.find_nodes_in_area_under_air(
		{x = pos.x - 1, y = pos.y - 2, z = pos.z - 1},
		{x = pos.x + 1, y = pos.y + 1, z = pos.z + 1},
		{"group:soil", "group:tree"})
	if #positions == 0 then
		return
	end
	local pos2 = positions[math.random(#positions)]
	pos2.y = pos2.y + 1
	if minetest.get_node_light(pos2, 0.5) <= 3 then
		minetest.set_node(pos2, {name = node.name})
	end
end

minetest.register_abm({
	label = "Mushroom spread",
	nodenames = {"flowers:mushroom_brown", "flowers:mushroom_red"},
	interval = 11,
	chance = 150,
	action = function(...)
		flowers.mushroom_spread(...)
	end,
})

-- These old mushroom related nodes can be simplified now

minetest.register_alias("flowers:mushroom_spores_brown", "flowers:mushroom_brown")
minetest.register_alias("flowers:mushroom_spores_red", "flowers:mushroom_red")
minetest.register_alias("flowers:mushroom_fertile_brown", "flowers:mushroom_brown")
minetest.register_alias("flowers:mushroom_fertile_red", "flowers:mushroom_red")
minetest.register_alias("mushroom:brown_natural", "flowers:mushroom_brown")
minetest.register_alias("mushroom:red_natural", "flowers:mushroom_red")

--
-- Waterlily
--

local waterlily_def = {
	description = S("Waterlily"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"flowers_waterlily.png", "flowers_waterlily_bottom.png"},
	inventory_image = "flowers_waterlily.png",
	wield_image = "flowers_waterlily.png",
	use_texture_alpha = "clip",
	liquids_pointable = true,
	walkable = false,
	buildable_to = true,
	floodable = true,
	groups = {snappy = 3, flower = 1, flammable = 1},
	sounds = base.node_sound_leaves_defaults(),
	node_placement_prediction = "",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -31 / 64, -0.5, 0.5, -15 / 32, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, -15 / 32, 7 / 16}
	},

	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local node = minetest.get_node(pointed_thing.under)
		local def = minetest.registered_nodes[node.name]

		if def and def.on_rightclick then
			return def.on_rightclick(pointed_thing.under, node, placer, itemstack,
					pointed_thing)
		end

		if def and def.liquidtype == "source" and
				minetest.get_item_group(node.name, "water") > 0 then
			local player_name = placer and placer:get_player_name() or ""
			if not minetest.is_protected(pos, player_name) then
				minetest.set_node(pos, {name = "flowers:waterlily" ..
					(def.waving == 3 and "_waving" or ""),
					param2 = math.random(0, 3)})
				if not (creative and creative.is_enabled_for
						and creative.is_enabled_for(player_name)) then
					itemstack:take_item()
				end
			else
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos, player_name)
			end
		end

		return itemstack
	end
}

local waterlily_waving_def = table.copy(waterlily_def)
waterlily_waving_def.waving = 3
waterlily_waving_def.drop = "flowers:waterlily"
waterlily_waving_def.groups.not_in_creative_inventory = 1

minetest.register_node("flowers:waterlily", waterlily_def)
minetest.register_node("flowers:waterlily_waving", waterlily_waving_def)


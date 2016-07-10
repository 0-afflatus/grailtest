-- Minetest 0.4 mod: columnia by Glunggi(former Stairs Copyright by(C) 2011-2012 Kahrl <kahrl@gmx.net> Copyright (C) 2011-2012 celeron55, Perttu Ahola)
-- See README.txt for licensing and other information.

columnia = {}

-- The Blueprint
minetest.register_craftitem("columnia:blueprint", {
	description = "Column Blueprint",
	inventory_image = "columnia_blueprint.png",
})

minetest.register_craft({
	output = 'columnia:blueprint',
	recipe = {
		{'default:paper', 'group:stick', 'default:paper'},
		{'default:paper', 'default:coal_lump', 'default:paper'},
		{'default:paper', 'group:stick', 'default:paper'},
	}
})

-- Bracket 
minetest.register_node("columnia:bracket",	{ 
            description = 'Bracket (Column)',
			tiles = {"columnia_rusty.png",},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
			        {-0.25, 0, 0.4375, 0.25, 0.5, 0.5},
			        {-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875},
			        {-0.0625, -0.375, -0.0625, 0.0625, 0.1875, 0.0625},
			        {-0.0625, 0.1875, -0.0625, 0.0625, 0.3125, 0.4375},
			        {-0.1875, 0.0625, 0.3125, 0.1875, 0.4375, 0.4375},
			        {-0.125, -0.375, -0.125, 0.125, -0.25, 0.125},
		        },
			},
			groups = {choppy=2, oddly_breakable_by_hand=2,},
			sounds = default.node_sound_stone_defaults(),
})
		
minetest.register_craft({
		output = 'columnia:bracket 4',
		recipe = {
			{"default:steel_ingot", "columnia:blueprint", ""},
			{"", "default:steel_ingot", ""},
			{"", "default:steel_ingot", ""},
		},
		replacements = {{"columnia:blueprint", "columnia:blueprint"}},
})

-- Lamp
minetest.register_node("columnia:lamp_ceiling", {
    description = "Ceiling Lamp (Column)",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "columnia_lamp_inv.png",
	tiles = {
	         "columnia_rusty.png", "columnia_lamp.png", "columnia_lamp.png",
		     "columnia_lamp.png", "columnia_lamp.png", "columnia_lamp.png"
	        },
	sunlight_propagates = true,
	light_source = 13,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, 0.4375, -0.1875, 0.1875, 0.5, 0.1875},
			{-0.125, 0.375, -0.125, 0.125, 0.4375, 0.125}, 
		},
	},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
		output = 'columnia:lamp_ceiling 4',
		recipe = {
			{"columnia:blueprint", "default:steel_ingot", ""},
			{"", "default:torch", ""},
			{"", "default:glass", ""},
		},
		replacements = {{"columnia:blueprint", "columnia:blueprint"}},
})

-- Rusty_Block

minetest.register_node("columnia:rusty_block", {
	description = "Rusty Block",
	tiles = {"columnia_rusty_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
		output = 'columnia:rusty_block 8',
		recipe = {
			{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
			{"default:steel_ingot", "columnia:blueprint", "default:steel_ingot"},
			{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		},
		replacements = {{"columnia:blueprint", "columnia:blueprint"}},
})

-- Now the Column
-- Node will be called columnia:column_mid_<subname>
function columnia.register_column_mid(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":columnia:column_mid_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
			     {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		    },
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- for replace ABM
	minetest.register_node(":columnia:column_mid_" .. subname.."upside_down", {
		replace_name = "columnia:column_mid_" .. subname,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'columnia:column_mid_' .. subname .. ' 2',
		recipe = {
			{"", recipeitem, ""},
			{"", "columnia:blueprint", ""},
			{"", recipeitem, ""},
		},
		replacements = {{"columnia:blueprint", "columnia:blueprint"}},
	})
end


-- Node will be called columnia:column_top_<subname>
function columnia.register_column_top(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":columnia:column_top_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
			   {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			   {-0.5, 0.25, -0.5, 0.5, 0.5, 0.5}, 
			   {-0.375, 0, -0.375, 0.375, 0.5, 0.375},
		    },
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- for replace ABM
	minetest.register_node(":columnia:column_top_" .. subname.."upside_down", {
		replace_name = "columnia:column_top_" .. subname,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'columnia:column_top_' .. subname .. ' 4',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
			{"", recipeitem, ""},
			{"", "columnia:blueprint", ""},
		},
		replacements = {{"columnia:blueprint", "columnia:blueprint"}},
	})
end

-- Node will be called columnia:column_bottom_<subname>
function columnia.register_column_bottom(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":columnia:column_bottom_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
			    {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			    {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
			    {-0.375, -0.5, -0.375, 0.375, 0, 0.375},
            },
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- for replace ABM
	minetest.register_node(":columnia:column_bottom_" .. subname.."upside_down", {
		replace_name = "columnia:column_bottom_" .. subname,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'columnia:column_bottom_' .. subname .. ' 4',
		recipe = {
			{"", "columnia:blueprint", ""},
			{"", recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
		replacements = {{"columnia:blueprint", "columnia:blueprint"}},
	})
end
-- Node will be called columnia:column_crosslink<subname>
function columnia.register_column_crosslink(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":columnia:column_crosslink_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
			   {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			   {-0.5, 0, -0.25, 0.5, 0.5, 0.25},
			   {-0.25, 0, -0.5, 0.25, 0.5, 0.5},
			   {-0.4375, 0.0625, -0.4375, 0.4375, 0.4375, 0.4375},
		    },
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- for replace ABM
	minetest.register_node(":columnia:column_crosslink_" .. subname.."upside_down", {
		replace_name = "columnia:column_crosslink_" .. subname,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'columnia:column_crosslink_' .. subname .. ' 4',
		recipe = {
			{"", recipeitem, ""},
			{recipeitem, "columnia:blueprint", recipeitem},
			{"", recipeitem, ""},
		},
		replacements = {{"columnia:blueprint", "columnia:blueprint"}},
	})
end

-- Node will be called columnia:column_link<subname>
function columnia.register_column_link(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":columnia:column_link_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
			    {-0.25, 0, -0.5, 0.25, 0.5, 0.5},
		    },
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- for replace ABM
	minetest.register_node(":columnia:column_link_" .. subname.."upside_down", {
		replace_name = "columnia:column_link_" .. subname,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'columnia:column_link_' .. subname .. ' 2',
		recipe = {
			{recipeitem, "columnia:blueprint", recipeitem},
			{"", "", ""},
			{"", "", ""},
		},
		replacements = {{"columnia:blueprint", "columnia:blueprint"}},
	})
end

-- Node will be called columnia:column_linkdown<subname>
function columnia.register_column_linkdown(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":columnia:column_linkdown_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
			   {-0.25, 0, -0.5, 0.25, 0.5, 0.5},
			   {-0.125, -0.5, -0.125, 0.125, 0, 0.125},
			   {-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875},
			   {-0.1875, -0.125, -0.1875, 0.1875, 0, 0.1875},
		    },
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	-- for replace ABM
	minetest.register_node(":columnia:column_linkdown_" .. subname.."upside_down", {
		replace_name = "columnia:column_linkdown_" .. subname,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'columnia:column_linkdown_' .. subname .. ' 3',
		recipe = {
			{recipeitem, "columnia:blueprint", recipeitem},
			{"", recipeitem, ""},
			{"", "", ""},
		},
		replacements = {{"columnia:blueprint", "columnia:blueprint"}},
	})
end


-- Nodes will be called columnia:{column}_<subname>
function columnia.register_column_ia(subname, recipeitem, groups, images, desc_column_mid, desc_column_top, desc_column_bottom, desc_column_crosslink, desc_column_link, desc_column_linkdown, sounds)
	columnia.register_column_mid(subname, recipeitem, groups, images, desc_column_mid, sounds)
	columnia.register_column_top(subname, recipeitem, groups, images, desc_column_top, sounds)
	columnia.register_column_bottom(subname, recipeitem, groups, images, desc_column_bottom, sounds)
	columnia.register_column_crosslink(subname, recipeitem, groups, images, desc_column_crosslink, sounds)
	columnia.register_column_link(subname, recipeitem, groups, images, desc_column_link, sounds)
	columnia.register_column_linkdown(subname, recipeitem, groups, images, desc_column_linkdown, sounds)
end

columnia.register_column_ia("rusty_block", "columnia:rusty_block",
		{cracky=3},
		{"columnia_rusty_block.png"},
		"Rusty Column",
		"Rusty Column Top",
		"Rusty Column Bottom",
		"Rusty Column Crosslink",
		"Rusty Column Link",
		"Rusty Column Linkdown",
		default.node_sound_stone_defaults()
        )

-- Stone

columnia.register_column_ia("stone", "default:stone",
		{cracky=3},
		{"default_stone.png"},
		"Stone Column",
		"Stone Column Top",
		"Stone Column Bottom",
		"Stone Column Crosslink",
		"Stone Column Link",
		"Stone Column Linkdown",
		default.node_sound_stone_defaults()
        )
		
columnia.register_column_ia("desert_stone", "default:desert_stone",
		{cracky=3},
		{"default_desert_stone.png"},
		"Desert Stone Column",
		"Desert Stone Column Top",
		"Desert Stone Column Bottom",
		"Desert Stone Column Crosslink",
		"Desert Stone Column Link",
		"Desert Stone Column Linkdown",
		default.node_sound_stone_defaults()
        )		
		
columnia.register_column_ia("sandstone", "default:sandstone",
		{crumbly=2,cracky=2},
		{"default_sandstone.png"},
		"Sandstone Column",
		"Sandstone Column Top",
		"Sandstone Column Bottom",
		"Sandstone Column Crosslink",
		"Sandstone Column Link",
		"Sandstone Column Linkdown",
		default.node_sound_stone_defaults()
        )
		
columnia.register_column_ia("basalt", "mineral:basalt",
		{cracky=3},
		{"mineral_basalt.png"},
		"Basalt Column",
		"Basalt Column Top",
		"Basalt Column Bottom",
		"Basalt Column Crosslink",
		"Basalt Column Link",
		"Basalt Column Linkdown",
		default.node_sound_stone_defaults()
        )
		
columnia.register_column_ia("bluestone", "mineral:bluestone",
		{cracky=3},
		{"mineral_bluestone.png"},
		"Bluestone Column",
		"Bluestone Column Top",
		"Bluestone Column Bottom",
		"Bluestone Column Crosslink",
		"Bluestone Column Link",
		"Bluestone Column Linkdown",
		default.node_sound_stone_defaults()
        )
		
columnia.register_column_ia("greenstone", "mineral:greenstone",
		{cracky=3},
		{"mineral_greenstone.png"},
		"Greenstone Column",
		"Greenstone Column Top",
		"Greenstone Column Bottom",
		"Greenstone Column Crosslink",
		"Greenstone Column Link",
		"Greenstone Column Linkdown",
		default.node_sound_stone_defaults()
        )
		
columnia.register_column_ia("white_stone", "mineral:white_stone",
		{cracky=3},
		{"mineral_white_stone.png"},
		"White Stone Column",
		"White Stone Column Top",
		"White Stone Column Bottom",
		"White Stone Column Crosslink",
		"White Stone Column Link",
		"White Stone Column Linkdown",
		default.node_sound_stone_defaults()
        )
		
columnia.register_column_ia("obsidian", "mineral:obsidian",
		{crumbly=2,cracky=2},
		{"mineral_obsidian.png"},
		"Obsidian Column",
		"Obsidian Column Top",
		"Obsidian Column Bottom",
		"Obsidian Column Crosslink",
		"Obsidian Column Link",
		"Obsidian Column Linkdown",
		default.node_sound_stone_defaults()
        )
		
local bricks = {
	{ name='stone_brick', description='Stone Brick' },
	{ name='desert_stone_brick', description='Desert Stone Brick' },
	{ name='sandstone_brick', description='Sandstone Brick' },
	{ name='bluestone_brick', description='Bluestone Brick' },
	{ name='greenstone_brick', description='Greenstone Brick' },
	{ name='whitestone_brick', description='White Stone Brick' },
	{ name='basalt_brick', description='Basalt Brick' }
}

for _,t in pairs( bricks ) do
	print('register: '.. t.name)
	columnia.register_column_ia( t.name, 'material:' .. t.name,
		{cracky = 1},
		{ 'material_' .. t.name .. '.png'  },
		t.description .. ' Column',
		t.description .. ' Column Top',
		t.description .. ' Column Bottom',
		t.description .. ' Column Crosslink',
		t.description .. ' Column Link',
		t.description .. ' Column Linkdown',
		default.node_sound_defaults())
end

columnia.register_column_ia("brick", "default:brick",
		{cracky=3},
		{"default_brick.png"},
		"Brick Column",
		"Brick Column Top",
		"Brick Column Bottom",
		"Brick Column Crosslink",
		"Brick Column Link",
		"Brick Column Linkdown",
		default.node_sound_stone_defaults()
        )	

-- Wood
			
columnia.register_column_ia("apple_wood", "tree:apple_tree_wood",
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		{"tree_apple_tree_wood.png^[transformR90"},
		"Apple Wood Column",
		"Apple Wood Column Top",
		"Apple Wood Column Bottom",
		"Apple Wood Column Crosslink",
		"Apple Wood Column Link",
		"Apple Wood Column Linkdown",
		default.node_sound_wood_defaults())

columnia.register_column_ia("junglewood", "tree:junglewood",
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		{"tree_junglewood.png^[transformR90"},
		"Junglewood Column",
		"Junglewood Column Top",
		"Junglewood Column Bottom",
		"Junglewood Column Crosslink",
		"Junglewood Column Link",
		"Junglewood Column Linkdown",
		default.node_sound_wood_defaults())

columnia.register_column_ia("pine_wood", "tree:pine_wood",
        {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
        {"tree_fir_wood.png^[transformR90"},
        "Fir Wood Column",
        "Fir Wood Column Top",
        "Fir Wood Column Bottom",
        "Fir Wood Column Crosslink",
        "Fir Wood Column Link",
        "Fir Wood Column Linkdown",
        default.node_sound_wood_defaults())

columnia.register_column_ia("acacia_wood", "tree:acacia_wood",
        {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
        {"tree_acacia_wood.png^[transformR90"},
        "Acacia Wood Column",
        "Acacia Wood Column Top",
        "Acacia Wood Column Bottom",
        "Acacia Wood Column Crosslink",
        "Acacia Wood Column Link",
        "Acacia Wood Column Linkdown",
        default.node_sound_wood_defaults())

-- Metal

local metals = {
	{ name='steel', description='Steel' },
	{ name='copper', description='Copper' },
	{ name='bronze', description='Bronze' },
	{ name='gold', description='Gold' },
	{ name='silver', description='Silver' },
	{ name='mithril', description='Mithril' }
}

for _,t in pairs( metals ) do
	print('register: '.. t.name)
	columnia.register_column_ia( t.name, 'mineral:' .. t.name ..'_block',
		{cracky = 1},
		{ 'mineral_' .. t.name .. '_block.png' },
		t.description .. ' Column',
		t.description .. ' Column Top',
		t.description .. ' Column Bottom',
		t.description .. ' Column Crosslink',
		t.description .. ' Column Link',
		t.description .. ' Column Linkdown',
		default.node_sound_defaults())
end

if core.get_modpath( 'moretrees' ) then
	local morewood = {
		{ name='beech', description='Beech Tree' },
		{ name='oak', description='Oak Tree' },
		{ name='birch', description='Birch Tree' },
		{ name='spruce', description='Spruce Tree' },
		{ name='willow', description='Willow Tree' },
		{ name='fir', description='Douglas Fir' },
		{ name='jungletree', description='Jungle Tree' }
	}
	for _,t in pairs( morewood ) do
		print('register: '.. t.name)
		columnia.register_column_ia( t.name, 'moretrees:' .. t.name ..'_planks',
			{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
			{ 'moretrees_' .. t.name .. '_wood.png^[transformR90' },
			t.description .. ' Column',
			t.description .. ' Column Top',
			t.description .. ' Column Bottom',
			t.description .. ' Column Crosslink',
			t.description .. ' Column Link',
			t.description .. ' Column Linkdown',
			default.node_sound_wood_defaults())
	end
end

if core.get_modpath('moreblocks') then
	stairsplus:register_all(
                'columnia',
                'rusty_block',
                'columnia:rusty_block',
                {
                        description = 'Rusty Block',
                        tiles = {
				'columnia_rusty_block.png'
			},
                        groups = {cracky=3},
                        sounds = default.node_sound_stone_defaults(),
                }
        )
end

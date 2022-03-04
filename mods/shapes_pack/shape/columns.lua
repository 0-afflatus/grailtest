-- Grailtest 5 --
-- mods/shape/columns.lua --

-- Node will be called columnia:column_mid_<subname>

function shape.register_column_mid(subname, recipeitem, groups, images, description, def)

	minetest.register_node(":shape:column_mid_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = def.sunlight_propagates,
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = table.copy( def.sounds ),
		node_box = {
			type = "fixed",
			fixed = {
			     {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
		    },
		},
		on_place = minetest.rotate_node,
	})

	minetest.register_craft({
		output = 'shape:column_mid_' .. subname .. ' 6',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, "", ""},
			{recipeitem, "", ""},
		},
		replacements = {{"shape:blueprint", "shape:blueprint"}},
	})

	minetest.register_craft({
		output = recipeitem,
		recipe = {
			{'shape:column_mid_' .. subname, 'shape:column_mid_' .. subname},
		},
	})
end

-- Node will be called shape:column_top_<subname>

function shape.register_column_top(subname, recipeitem, groups, images, description, def)

	minetest.register_node(":shape:column_top_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = def.sunlight_propagates,
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = table.copy( def.sounds ),
		node_box = {
			type = "fixed",
			fixed = {
			   {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			   {-0.5, 0.25, -0.5, 0.5, 0.5, 0.5},
			   {-0.375, 0, -0.375, 0.375, 0.5, 0.375},
		    },
		},
		on_place = minetest.rotate_node,
	})

	minetest.register_craft({
		output = 'shape:column_top_' .. subname .. ' 5',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
			{"", recipeitem, ""},
			{"", recipeitem, ""},
		},
		replacements = {{"shape:blueprint", "shape:blueprint"}},
	})

	minetest.register_craft({
		output = recipeitem,
		recipe = {
			{'shape:column_top_' .. subname},
		},
	})
end

-- Node will be called shape:column_bottom_<subname>

function shape.register_column_bottom(subname, recipeitem, groups, images, description, def)

	minetest.register_node(":shape:column_bottom_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = def.sunlight_propagates,
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = table.copy( def.sounds ),
		node_box = {
			type = "fixed",
			fixed = {
			    {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			    {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
			    {-0.375, -0.5, -0.375, 0.375, 0, 0.375},
            },
		},
		on_place = minetest.rotate_node,
	})

	minetest.register_craft({
		output = 'shape:column_bottom_' .. subname .. ' 5',
		recipe = {
			{"", recipeitem, ""},
			{"", recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
		replacements = {{"shape:blueprint", "shape:blueprint"}},
	})

	minetest.register_craft({
		output = recipeitem,
		recipe = {
			{'shape:column_bottom_' .. subname},
		},
	})
end

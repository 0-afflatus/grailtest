-- Grailtest 5 --
-- mods/shape/slopes.lua --

-- Node will be called shape:slope_<subname>

function shape.register_slope(subname, recipeitem, groups, images, description, def)

	minetest.register_node(":shape:slope_" .. subname, {
		description = description.." slope",
		drawtype = "mesh",
		mesh = "shape_slope.obj",
		tiles = images,
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = def.sunlight_propagates,
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = table.copy( def.sounds ),
		selection_box = {
			type = "fixed",
			fixed = {
			  {-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox1
			  {-0.5, -0.1875, -0.1875, 0.5, 0.1875, 0.5}, -- NodeBox3
			  {-0.5, 0.1875, 0.1875, 0.5, 0.5, 0.5}, -- NodeBox2
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
			  {-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox1
			  {-0.5, -0.1875, -0.1875, 0.5, 0.1875, 0.5}, -- NodeBox3
			  {-0.5, 0.1875, 0.1875, 0.5, 0.5, 0.5}, -- NodeBox2
			},
		},
		on_place = minetest.rotate_node
	})

	minetest.register_craft({
		output = 'shape:slope_' .. subname .. ' 6',
		recipe = {
			{recipeitem, "", ""},
			{ "",recipeitem, ""},
			{"","",recipeitem},
		},
	})

	minetest.register_craft({
		output = recipeitem,
		recipe = {
			{'shape:slope_' .. subname, 'shape:slope_' .. subname},
		},
	})
end

-- Node will be called shape:slopeinsidecorner_<subname>

function shape.register_slopeinsidecorner(subname, recipeitem, groups, images, description, def)

	minetest.register_node(":shape:slopeinsidecorner_" .. subname, {
		description = description.." pointy inner corner slope",
		drawtype = "mesh",
		mesh = "shape_slopeinsidecorner.obj",
		tiles = images,
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = def.sunlight_propagates,
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = table.copy( def.sounds ),
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
				{-0.5, 0, -0.5, 0, 0.5, 0},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
				{-0.5, 0, -0.5, 0, 0.5, 0},
			},
		},
		on_place = minetest.rotate_node
	})

	minetest.register_craft({
		output = 'shape:slopeinsidecorner_' .. subname .. ' 4',
		recipe = {
			{recipeitem, recipeitem, ""},
			{"", "", recipeitem},
			{"","", recipeitem},
		},
	})

	minetest.register_craft({
		output = recipeitem,
		recipe = {
			{'shape:slopeinsidecorner_' .. subname},
		},
	})
end

-- Node will be called shape:slopeinsidecorner2_<subname>

function shape.register_slopeinsidecorner2(subname, recipeitem, groups, images, description, def)

	minetest.register_node(":shape:slopeinsidecorner2_" .. subname, {
		description = description.." flat inner corner slope",
		drawtype = "mesh",
		mesh = "shape_slopeinsidecorner2.obj",
		tiles = images,
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = def.sunlight_propagates,
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = table.copy( def.sounds ),
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
				{-0.5, 0, -0.5, 0, 0.5, 0},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
				{-0.5, 0, -0.5, 0, 0.5, 0},
			},
		},
		on_place = minetest.rotate_node
	})

	minetest.register_craft({
		output = 'shape:slopeinsidecorner2_' .. subname .. ' 5',
		recipe = {
			{recipeitem, recipeitem, ""},
			{"", "", recipeitem},
			{recipeitem,"", recipeitem},
		},
	})

	minetest.register_craft({
		output = recipeitem,
		recipe = {
			{'shape:slopeinsidecorner2_' .. subname},
		},
	})
end

-- Node will be called shape:slopecorner_<subname>

function shape.register_slopecorner(subname, recipeitem, groups, images, description, def)

	minetest.register_node(":shape:slopecorner_" .. subname, {
		description = description.." pointy outer corner slope",
		drawtype = "mesh",
		mesh = "shape_slopecorner.obj",
		tiles = images,
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = def.sunlight_propagates,
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = table.copy( def.sounds ),
		selection_box = {
			type = "fixed",
			fixed = {
			  {-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox1
			  {-0.5, -0.1875, -0.1875,  0.1875, 0.1875, 0.5}, -- NodeBox3
			  {-0.5, 0.1875, 0.1875,  -0.1875, 0.5, 0.5}, -- NodeBox2
			},
		},

		collision_box = {
			type = "fixed",
			fixed = {
			  {-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox1
			  {-0.5, -0.1875, -0.1875, 0.5, 0.1875, 0.5}, -- NodeBox3
			  {-0.5, 0.1875, 0.1875, 0.5, 0.5, 0.5}, -- NodeBox2
			},
		},
		on_place = minetest.rotate_node
	})

	minetest.register_craft({
		output = 'shape:slopecorner_' .. subname .. ' 6',
		recipe = {
			{ "",recipeitem, ""},
			{recipeitem,"",recipeitem},
		},
	})

	minetest.register_craft({
		output = recipeitem,
		recipe = {
			{'shape:slopecorner_' .. subname, 'shape:slopecorner_' .. subname},
		},
	})
end

-- Node will be called shape:slopecorner_<subname>

function shape.register_slopecorner2(subname, recipeitem, groups, images, description, def)

	minetest.register_node(":shape:slopecorner2_" .. subname, {
		description = description.." flat outer corner slope",
		drawtype = "mesh",
		mesh = "shape_slopecorner2.obj",
		tiles = images,
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = def.sunlight_propagates,
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = table.copy( def.sounds ),
		selection_box = {
			type = "fixed",
			fixed = {
			  {-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox1
			  {-0.5, -0.1875, -0.1875,  0.1875, 0.1875, 0.5}, -- NodeBox3
			  {-0.5, 0.1875, 0.1875,  -0.1875, 0.5, 0.5}, -- NodeBox2
			},
		},

		collision_box = {
			type = "fixed",
			fixed = {
			  {-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox1
			  {-0.5, -0.1875, -0.1875, 0.5, 0.1875, 0.5}, -- NodeBox3
			  {-0.5, 0.1875, 0.1875, 0.5, 0.5, 0.5}, -- NodeBox2
			},
		},
		on_place = minetest.rotate_node
	})

	minetest.register_craft({
		output = 'shape:slopecorner2_' .. subname .. ' 6',
		recipe = {
			{ "",recipeitem, ""},
			{"",recipeitem,recipeitem},
		},
	})

	minetest.register_craft({
		output = recipeitem,
		recipe = {
			{'shape:slopecorner2_' .. subname, 'shape:slopecorner2_' .. subname},
		},
	})
end

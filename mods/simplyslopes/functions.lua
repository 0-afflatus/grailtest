
-- Node will be called simplyslopes:<subname>
function simplyslopes.register_slope(subname, recipeitem, groups, images, description, snds)
	
	--x=minetest.registered_nodes[1].images,
	
	minetest.register_node(":simplyslopes:" .. subname, {
		description = description.." Slope",
--		drawtype = "nodebox",
		drawtype = "mesh",
		mesh = "simplyslopes_slope.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = snds,

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
		output = 'simplyslopes:' .. subname .. ' 6',
		recipe = {
			{recipeitem, "", ""},
			{ "",recipeitem, ""},
			{"","",recipeitem},
		},
	})
	minetest.register_alias("simplyslopes:slope_" .. subname, "simplyslopes:" .. subname)
end

-- Node will be called simplyslopes:insidecorner_<subname>
function simplyslopes.register_slopeinsidecorner(subname, recipeitem, groups, images, description, snds)
	minetest.register_node(":simplyslopes:insidecorner_" .. subname, {
		description = description.." Slope inside corner",
--		drawtype = "nodebox",
		drawtype = "mesh",
		mesh = "simplyslopes_slopeinsidecorner.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = snds,

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
		output = 'simplyslopes:insidecorner_' .. subname .. ' 5',
		recipe = {
			{recipeitem, recipeitem, ""},
			{"", "", recipeitem},
			{"","", recipeitem},
		},
	})
	minetest.register_alias("simplyslopes:slopeinner_" .. subname, "simplyslopes:inner_" .. subname)
end

-- Node will be called simplyslopes:insidecorner2_<subname>
function simplyslopes.register_slopeinsidecorner2(subname, recipeitem, groups, images, description, snds)
	minetest.register_node(":simplyslopes:insidecorner2_" .. subname, {
		description = description.." Slope inside 2 corner",
--		drawtype = "nodebox",
		drawtype = "mesh",
		mesh = "simplyslopes_slopeinsidecorner2.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = snds,

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
		output = 'simplyslopes:insidecorner2_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, ""},
			{"", "", recipeitem},
			{recipeitem,"", recipeitem},
		},
	})
	minetest.register_alias("simplyslopes:slopeinsidecorner2_" .. subname, "simplyslopes:inner2_" .. subname)
end


-- Node will be called simplyslopes:corner_<subname>
function simplyslopes.register_slopecorner(subname, recipeitem, groups, images, description, snds)
	minetest.register_node(":simplyslopes:corner_" .. subname, {
		description = description.." Slope corner",
--		drawtype = "nodebox",
		drawtype = "mesh",
		mesh = "simplyslopes_slopecorner.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = snds,

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
		output = 'simplyslopes:corner_' .. subname .. ' 6',
		recipe = {
			{ "",recipeitem, ""},
			{recipeitem,"",recipeitem},
		},
	})
	minetest.register_alias("simplyslopes:slopecorner_" .. subname, "simplyslopes:outer_" .. subname)
end

-- Node will be called simplyslopes:corner_<subname>
function simplyslopes.register_slopecorner2(subname, recipeitem, groups, images, description, snds)
	minetest.register_node(":simplyslopes:corner2_" .. subname, {
		description = description.." Slope corner 2",
--		drawtype = "nodebox",
		drawtype = "mesh",
		mesh = "simplyslopes_slopecorner2.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		sunlight_propagates = true,
		groups = groups,
		sounds = snds,

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
		output = 'simplyslopes:corner2_' .. subname .. ' 6',
		recipe = {
			{ "",recipeitem, ""},
			{"",recipeitem,recipeitem},
		},
	})
	minetest.register_alias("simplyslopes:slopecorner2_" .. subname, "simplyslopes:outer2_" .. subname)
end

-- Nodes will be called simplyslopes:{"","outer",corner,invcorner}_<subname>
function simplyslopes.register_all(subname, recipeitem, groups, images, desc, snds)
	simplyslopes.register_slope(subname, recipeitem, groups, images, desc, snds)
	simplyslopes.register_slopecorner(subname, recipeitem, groups, images, desc, snds)
	simplyslopes.register_slopecorner2(subname, recipeitem, groups, images, desc, snds)
	simplyslopes.register_slopeinner(subname, recipeitem, groups, images, desc, snds)
	simplyslopes.register_slopeinner2(subname, recipeitem, groups, images, desc, snds)
end

-- Helper Functions 
local function copy1(obj)
  if type(obj) ~= 'table' then return obj end
  local res = {}
  for k, v in pairs(obj) do res[copy1(k)] = copy1(v) end
  return res
end

local function splitstring(inputstr)
	local sep = ':'
    local t={}
	local i = 1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            t[i] = str
            i = i + 1
    end
    return t
end

-- Nodes will be called simplyslopes:{stair,slab,corner,invcorner}_<subname>
function simplyslopes.register_all2(recipeitem)
	local s = splitstring(recipeitem)
	local modname=s[1]
	local subname=s[2]
	
	-- Bakedclay and wool mod name their blocks like "bakedclay:white"
	if  modname == 'bakedclay' or modname == 'wool'
	-- We must add modname to subname	
	then subname = modname .. '_' .. subname
	end
	
	--local thisnode=minetest.registered_nodes["default:wood"]
	local thisnode = copy1(minetest.registered_nodes[recipeitem])
		
	if thisnode ~= nil then
		thisnode.groups["not_in_creative_inventory"] = 1
		simplyslopes.register_slope(subname, recipeitem, thisnode.groups, thisnode.tiles, thisnode.description, thisnode.sounds)
		simplyslopes.register_slopecorner(subname, recipeitem, thisnode.groups, thisnode.tiles, thisnode.description, thisnode.sounds)		
		simplyslopes.register_slopecorner2(subname, recipeitem, thisnode.groups, thisnode.tiles, thisnode.description, thisnode.sounds)
		simplyslopes.register_slopeinsidecorner(subname, recipeitem, thisnode.groups, thisnode.tiles, thisnode.description, thisnode.sounds)
		simplyslopes.register_slopeinsidecorner2(subname, recipeitem, thisnode.groups, thisnode.tiles, thisnode.description, thisnode.sounds)
	end

end

-- Grailtest 5 --
-- mods/shape/ --

-- Global namespace

shape = {}

-- Registration Helper

-- Register slabs, slopes, stairs and columns
function shape.register_blocks(nodename)

	local def = minetest.registered_nodes[nodename]
	local subname = string.split(def.name, ":")[2]
	local recipeitem = def.name
	local material = def.description
	local groups = {}
	local images = def.tiles

	local desc_column_bottom = material.." column bottom"
	local desc_column_mid = material.." column mid"
	local desc_column_top = material.." column top"
	local desc_half_slab = material.." half-slab"
	local desc_slab = material.." slab"
	local desc_slope = material
	local desc_stair = material.." stair"

	for g,v in pairs(def.groups) do
		groups[g] = v
	end
	-- Hide recipes
	groups.mutable = 0
	groups.not_in_craft_guide = 0
	groups.not_in_creative_inventory = 0
	groups.shape = 1
	groups.wood = nil
	groups.wool = nil
	groups.stone = nil

	shape.register_column_bottom(subname, recipeitem, groups, images, desc_column_bottom, def)
	shape.register_column_mid(subname, recipeitem, groups, images, desc_column_mid, def)
	shape.register_column_top(subname, recipeitem, groups, images, desc_column_top, def)
	shape.register_half_slab(subname, recipeitem, groups, images, desc_half_slab, def)
	shape.register_slab(subname, recipeitem, groups, images, desc_slab, def)
	shape.register_slopecorner2(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_slopecorner(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_slopeinsidecorner2(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_slopeinsidecorner(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_slope(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_stair(subname, recipeitem, groups, images, desc_stair, def)
	
	pkarcs.register_node(nodename)

end

-- Just slabs, slopes and stairs
function shape.register_blocks2(nodename)

	local def = minetest.registered_nodes[nodename]
	local subname = string.split(def.name, ":")[2]
	local recipeitem = def.name
	local material = def.description
	local groups = {}
	local images = def.tiles

	--local desc_column_bottom = material.." column bottom"
	--local desc_column_mid = material.." column mid"
	--local desc_column_top = material.." column top"
	local desc_half_slab = material.." half-slab"
	local desc_slab = material.." slab"
	local desc_slope = material
	local desc_stair = material.." stair"

	for g,v in pairs(def.groups) do
		groups[g] = v
	end
	-- Hide recipes
	groups.mutable = 0
	groups.not_in_craft_guide = 0
	groups.not_in_creative_inventory = 0
	groups.shape = 1
	groups.wood = nil
	groups.wool = nil

	shape.register_half_slab(subname, recipeitem, groups, images, desc_half_slab, def)
	shape.register_slab(subname, recipeitem, groups, images, desc_slab, def)
	shape.register_slopecorner2(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_slopecorner(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_slopeinsidecorner2(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_slopeinsidecorner(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_slope(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_stair(subname, recipeitem, groups, images, desc_stair, def)

end

-- Just slabs, stairs and straight slopes
function shape.register_blocks3(nodename)

	local def = minetest.registered_nodes[nodename]
	local subname = string.split(def.name, ":")[2]
	local recipeitem = def.name
	local material = def.description
	local groups = {}
	local images = def.tiles

	--local desc_column_bottom = material.." column bottom"
	--local desc_column_mid = material.." column mid"
	--local desc_column_top = material.." column top"
	--local desc_half_slab = material.." half-slab"
	local desc_slab = material.." slab"
	local desc_slope = material
	local desc_stair = material.." stair"

	for g,v in pairs(def.groups) do
		groups[g] = v
	end
	-- Hide recipes
	groups.mutable = 0
	groups.not_in_craft_guide = 0
	groups.not_in_creative_inventory = 0
	groups.shape = 1
	groups.wood = nil
	groups.wool = nil

	shape.register_slab(subname, recipeitem, groups, images, desc_slab, def)
	shape.register_slope(subname, recipeitem, groups, images, desc_slope, def)
	shape.register_stair(subname, recipeitem, groups, images, desc_stair, def)

end

-- Files

dofile(minetest.get_modpath("shape").."/stairs.lua")
dofile(minetest.get_modpath("shape").."/slopes.lua")
dofile(minetest.get_modpath("shape").."/columns.lua")



minetest.log("action", "MOD["..minetest.get_current_modname().."]: [Loaded]")

--
-- Place seeds
--

local function place_seed(itemstack, placer, pointed_thing, plantname)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	
	local under = minetest.get_node(pt.under)
	local above = minetest.get_node(pt.above)
	
	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end
	
	-- check if pointing at the top of the node
	if pt.above.y ~= pt.under.y+1 then
		return
	end
	
	-- check if you can replace the node above the pointed node
	if not minetest.registered_nodes[above.name].buildable_to then
		return
	end
	
	-- check if pointing at soil
	if minetest.get_item_group(under.name, "soil") <= 1 then
		return
	end
	
	-- add the node and remove 1 item from the itemstack
	minetest.add_node(pt.above, {name=plantname})
	if not minetest.setting_getbool("creative_mode") then
		itemstack:take_item()
	end
	return itemstack
end

--
-- Grain
--

minetest.register_craftitem("plant:wheat_seed", {
	description = "Wheat Grains",
	inventory_image = "plant_wheat_seed.png",
	groups = {grain=1},
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "plant:wheat_1")
	end,
})

minetest.register_craftitem("plant:oats_seed", {
	description = "Oat Grains",
	inventory_image = "plant_oats_seed.png",
	groups = {grain=1},
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "plant:oats_1")
	end,
})

minetest.register_craftitem("plant:barley_seed", {
	description = "Barley Grains",
	inventory_image = "plant_barley_seed.png",
	groups = {grain=1},
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "plant:barley_1")
	end,
})

minetest.register_craftitem("plant:maize_seed", {
	description = "Maize Grains",
	inventory_image = "plant_maize_seed.png",
	groups = {grain=1},
	on_place = function(itemstack, placer, pointed_thing)
		return place_seed(itemstack, placer, pointed_thing, "plant:maize_1")
	end,
})

minetest.register_craftitem("plant:straw", {
	description = "Sheaf of Straw",
	inventory_image = "plant_straw.png",
})

minetest.register_craftitem("plant:hay", {
	description = "Sheaf of Hay",
	inventory_image = "plant_hay.png",
})

minetest.register_node("plant:straw_bale", {
        description = "Straw Bale",
        tiles = {"plant_straw_bale.png"},
	walkable = true,
	groups = {flammable=3,crumbly=3},
	sounds = default.node_sound_dirt_defaults()     
})

minetest.register_node("plant:hay_bale", {
        description = "Hay Bale",
        tiles = {"plant_hay_bale.png"},
	walkable = true,
	groups = {flammable=2,crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults()     
})

minetest.register_craft({
	output = 'plant:hay_bale',
	recipe = {
		{'plant:hay', 'plant:hay'},
		{'plant:hay', 'plant:hay'},
	}
})

minetest.register_craft({
	output = 'plant:straw_bale',
	recipe = {
		{'plant:straw', 'plant:straw'},
		{'plant:straw', 'plant:straw'},
	}
})

minetest.register_craft({
	output = 'plant:straw 4', 
	recipe = {
		{'plant:straw_bale'}
	}
})

minetest.register_craft({
	output = 'plant:hay 4', 
	recipe = {
		{'plant:hay_bale'}
	}
})

--
-- Fibre plants
--

minetest.register_craftitem("plant:fibre", {
	description = "Plant Fibre",
	inventory_image = "plant_fibre.png",
})

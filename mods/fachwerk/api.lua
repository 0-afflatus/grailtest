--[[
================================================================
** fachwerk **
By JBB

Copyright (c) 2015 JBB
(sites.google.com/site/jbbsblog)
The WTFPL applies to all code in this project.
http://www.wtfpl.net/txt/copying/
See README.txt
================================================================
--]]


fachwerk = {}

fachwerk.register_fachwerk = function( basename, texture, description, craft_from )

	local group_def = {choppy=2,oddly_breakable_by_hand=2,cracky=3};

	minetest.register_node("fachwerk:"..basename, { 
		description = "Truss with "..description,
		tiles = { texture.."^fachwerk_blank.png"},
		groups = group_def,
		sounds = default.node_sound_stone_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
	})

	minetest.register_node("fachwerk:"..basename.."_1", { 
		description = "truss with "..description.." oblique beam 1",
		tiles = {
			texture.."^fachwerk_blank.png", -- top
			texture.."^fachwerk_blank.png", -- bottom
			texture.."^fachwerk_beam_1.png",
			texture.."^fachwerk_beam_1.png^[transformFX",
			texture.."^fachwerk_beam_1.png^[transformFX",
			texture.."^fachwerk_beam_1.png" },
		groups = group_def,
		sounds = default.node_sound_stone_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
	})
	
	-- TODO: is this one really needed? the node above covers most of that already
	minetest.register_node("fachwerk:"..basename.."_2", { 
	description = "Truss with "..description.." oblique beam 2",
		tiles = {
			texture.."^fachwerk_blank.png", -- top
			texture.."^fachwerk_blank.png", -- bottom
			texture.."^fachwerk_beam_2.png",
			texture.."^fachwerk_beam_2.png^[transformFX",
			texture.."^fachwerk_beam_2.png^[transformFX",
			texture.."^fachwerk_beam_2.png" },
		groups = group_def,
		sounds = default.node_sound_stone_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
	})

	minetest.register_node("fachwerk:"..basename.."_cross", {
		description = "truss with "..description.." cross",
		tiles = {texture.."^fachwerk_cross.png"},
		groups = group_def,
		sounds = default.node_sound_stone_defaults(),
	})

	--crafting--

	-- yields 2; after all we did add a lot of wood
	minetest.register_craft({
		output = "fachwerk:"..basename.." 5",
		recipe = { { "group:stick",craft_from,"group:stick" },
			{ craft_from, craft_from,craft_from },
			{ "group:stick",craft_from,"group:stick" },
		} });
		
	minetest.register_craft({
		output = "fachwerk:"..basename.."_cross 4",
		recipe = { { "group:stick",craft_from,"group:stick" },
			{ craft_from, "group:stick",craft_from },
			{ "group:stick",craft_from,"group:stick" },
		} });
	
	minetest.register_craft({
		output = "fachwerk:"..basename.."_1 6",
		recipe = { { craft_from,"group:stick", craft_from},
			{ craft_from, craft_from, craft_from},
			{ "group:stick", craft_from, craft_from},
		} });
		
	minetest.register_craft({
		output = "fachwerk:"..basename.."_2 6",
		recipe = { { craft_from, craft_from,"group:stick"},
			{ craft_from, craft_from, craft_from },
			{  craft_from,"group:stick" ,craft_from },
		} });
	
	-- chain of craft receipes to convert nodes into each other
	--[[minetest.register_craft({
		output = "fachwerk:"..basename.."_1",
		recipe = { {"fachwerk:"..basename }} });
			 
	minetest.register_craft({
		output = "fachwerk:"..basename.."_2",
		recipe = { {"fachwerk:"..basename.."_1" }} });

	minetest.register_craft({
		output = "fachwerk:"..basename.."_cross",
		recipe = { {"fachwerk:"..basename.."_2" }} });

	minetest.register_craft({
		output = "fachwerk:"..basename,
		recipe = { {"fachwerk:"..basename.."_cross" }} });--]]

end
  

if minetest.setting_getbool("log_mods") then
	minetest.log("action", "[fachwerk] loaded.")
end

-- Code by Mossmanikin
-----------------------------------------------------------------------------------------------
-- TWiGS
-----------------------------------------------------------------------------------------------
if minetest.get_modpath("moretrees") ~= nil then
minetest.register_craft({ -- moretrees_leaves --> twigs
	output = "trunks:twig_1 2",
	recipe = {{"group:moretrees_leaves"}}
})
minetest.register_craft({ -- except moretrees:palm_leaves
	output = "moretrees:palm_leaves",
	recipe = {{"moretrees:palm_leaves"}}
})
end
if minetest.get_modpath("bushes") ~= nil then
minetest.register_craft({ -- BushLeaves --> twigs
	output = "trunks:twig_1 2",
	recipe = {{"bushes:BushLeaves1"}}
})
minetest.register_craft({
	output = "trunks:twig_1 2",
	recipe = {{"bushes:BushLeaves2"}}
})
minetest.register_craft({ -- bushbranches --> twigs
	output = "trunks:twig_1 4",
	recipe = {{"bushes:bushbranches1"}}
})
minetest.register_craft({
	output = "trunks:twig_1 4",
	recipe = {{"bushes:bushbranches2"}}
})
minetest.register_craft({
	output = "trunks:twig_1 4",
	recipe = {{"bushes:bushbranches3"}}
})
end


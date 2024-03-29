local rope = {}

-- Code by Mirko K. (modified by Temperest, Wulfsdad and kilbith) (License: GPL).
-- modified for grailtest by afflatus

minetest.register_on_punchnode(function(pos, oldnode, digger)
	if oldnode.name == "decor:rope" then
		rope.remove(pos, oldnode, digger, "decor:rope")
	end
end)

function rope.place(itemstack, _, pointed_thing)
	if pointed_thing.type == "node" then
		--local under = pointed_thing.under
		local above = pointed_thing.above
		local pos = above
		local oldnode = minetest.get_node(pos)
		local stackname = itemstack:get_name()

		while oldnode.name == "air" and not itemstack:is_empty() do
			local newnode = {name = stackname, param1 = 0}
			minetest.set_node(pos, newnode)
			itemstack:take_item()
			pos.y = pos.y - 1
			oldnode = minetest.get_node(pos)
		end
	end
	return itemstack
end

function rope.remove(pos, oldnode, digger, rope_name)
	local num = 0
	local below = {x=pos.x, y=pos.y, z=pos.z}
	local digger_inv = digger:get_inventory()

	while minetest.get_node(below).name == rope_name do
		minetest.remove_node(below)
		below.y = below.y - 1
		num = num + 1
	end
	if num == 0 then return end
	digger_inv:add_item("main", rope_name.." "..num)
	return true
end

decor.register("rope", {
	description = "Rope",
	drawtype = "plantlike",
	walkable = false,
	climbable = true,
	groups = {dig_immediate=3, flammable=3},
	tiles = {"equipment_rope.png"},
	inventory_image = "equipment_rope_inv.png",
	wield_image = "equipment_rope_inv.png",
	selection_box = {
		type = "fixed",
		fixed = {-0.15, -0.5, -0.15, 0.15, 0.5, 0.15}
	},
	on_place = rope.place
})

minetest.register_craft({
	output = "decor:rope",
	recipe = {
		{"farming:string"},
		{"farming:string"},
		{"farming:string"}
	}
})

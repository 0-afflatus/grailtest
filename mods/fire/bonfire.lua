-- mods/fire/bonfire.lua
-- based on stoneage by CasimirKaPazi
-- code - GPLv3 or later
-- textures - CC-BY-SA
-- bonfire_animated and bonfire_unlit are based on 
-- LPC Fireplace CC-BY Lanea Zimmerman

--
-- Nodes
--

minetest.register_node("fire:bonfire_unlit", {
	description = "Bonfire",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"fire_bonfire_unlit.png"},
	inventory_image = "fire_bonfire_unlit.png",
	wield_image = "fire_bonfire_unlit.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {snappy=3,flammable=2,attached_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-1/3, -1/2, -1/3, 1/3, 1/6, 1/3},
	},
})

minetest.register_node("fire:bonfire", {
	description = "Bonfire (lit)",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {
		{name="fire_bonfire_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}
	},
	inventory_image = "fire_bonfire_unlit.png",
	wield_image = "fire_bonfire_unlit.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drop = "",
	damage_per_second = 1,
	light_source = 12,
	groups = {dig_immediate=3,attached_node=1, hot=2},
	after_dig_node = function(pos, node, oldmetadata, puncher)
		node.name = "fire:bonfire_unlit"
		minetest.set_node(pos, node)
	end,
	selection_box = {
		type = "fixed",
		fixed = {-1/3, -1/2, -1/3, 1/3, 1/6, 1/3},
	},
})

--
-- Crafting
--

tinder = {
	"plant:fibre",
	"default:paper",
	"default:coal_lump",
	"plant:dry_shrub",
	"plant:hawthorn",
}

for _,tinder in ipairs(tinder) do
	minetest.register_craft({
		output = 'fire:bonfire',
		recipe = {
			{'', 'default:stick', ''},
			{'default:stick', tinder, 'default:stick'},
		}
	})
end

--[[
function fire.strike_fire(user, pointed_thing)
	if pointed_thing.type == "node" then
		local n_pointed_above = minetest.get_node(pointed_thing.above)
		local n_pointed_under = minetest.get_node(pointed_thing.under)

		--for _,tinder in ipairs(tinder) do
			--if user:get_inventory():get_stack("main", user:get_wield_index()+1):get_name() == tinder then
				--user:get_inventory():remove_item("main", tinder)
				if n_pointed_under.name == "equipment:torch_unlit" then
					n_pointed_under.name = "equipment:torch"
					minetest.add_node(pointed_thing.under, n_pointed_under)
				elseif n_pointed_under.name == "fire:bonfire_unlit" then
					minetest.add_node(pointed_thing.under, {name="fire:bonfire"})
				--elseif n_pointed_above.name == "air" then
					--minetest.add_node(pointed_thing.above, {name="fire:basic_flame"})
				end
			--end
		--end				
	else
		return
	end
end
]]

function fire.strike_fire(user, pointed_thing)
	if pointed_thing.type == "node" then
		local n_pointed_above = minetest.get_node(pointed_thing.above)
		local n_pointed_under = minetest.get_node(pointed_thing.under)
		if n_pointed_under.name == "equipment:torch_unlit" then
			n_pointed_under.name = "equipment:torch"
			minetest.add_node(pointed_thing.under, n_pointed_under)
		elseif n_pointed_under.name == "fire:bonfire_unlit" then
			minetest.add_node(pointed_thing.under, {name="fire:bonfire"})
		end			
	else
		return
	end
end

-- torchdecay
-- burntime equals half a night
-- Currently disabled

local torchdecay = false

if torchdecay then
	minetest.register_abm({
		nodenames = {"default:torch"},
		interval = 9,
		chance = 1,
		action = function(pos, node)
			local meta = minetest.get_meta(pos)
			local decay = meta:get_int("decay")
			if not decay then
				meta:set_int("decay", 1)
				return
			end
			if decay >= math.random(36, 44) then
				node.name = "default:torch_unlit"
				minetest.add_node(pos, node)
				meta:set_int("decay", 0)
				return
			end
			decay = decay + 1
			meta:set_int("decay", decay)
		end
	})

	minetest.register_abm({
		nodenames = {"fire:bonfire"},
		interval = 18,
		chance = 1,
		action = function(pos, node)
			local meta = minetest.get_meta(pos)
			local decay = meta:get_int("decay")
			if not decay then
				meta:set_int("decay", 1)
				return
			end
			if decay >= math.random(36, 44) then
				node.name = "fire:bonfire_unlit"
				minetest.add_node(pos, node)
				meta:set_int("decay", 0)
				return
			end
			decay = decay + 1
			meta:set_int("decay", decay)
		end
	})
end

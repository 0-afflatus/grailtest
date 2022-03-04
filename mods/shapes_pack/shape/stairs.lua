-- Grailtest 5 --
-- mods/shape/stairs.lua --

-- based on Minetest 0.4 mod: stairs
-- See README.txt for licensing and other information.

-- Register shape.
-- Node will be called shape:stair_<subname>

function shape.register_stair(subname, recipeitem, groups, images, description, def)

	groups.stair = 1
	minetest.register_node(":shape:stair_" .. subname, {
		description = description,
		drawtype = "mesh",
		mesh = "shape_stair.obj",
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
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = minetest.rotate_node
	})

	if recipeitem then
		minetest.register_craft({
			output = 'shape:stair_' .. subname .. ' 6',
			recipe = {
				{recipeitem, "", ""},
				{recipeitem, recipeitem, ""},
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Flipped recipe for the silly minecrafters
		minetest.register_craft({
			output = 'shape:stair_' .. subname .. ' 6',
			recipe = {
				{"", "", recipeitem},
				{"", recipeitem, recipeitem},
				{recipeitem, recipeitem, recipeitem},
			},
		})

		minetest.register_craft({
			output = recipeitem,
			recipe = {
				{'shape:stair_' .. subname},
			},
		})

		-- Fuel
		local baseburntime = minetest.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			minetest.register_craft({
				type = "fuel",
				recipe = 'shape:stair_' .. subname,
				burntime = math.floor(baseburntime * 0.75),
			})
		end
	end
end


-- Slab facedir to placement 6d matching table
local slab_trans_dir = {[0] = 8, 0, 2, 1, 3, 4}
-- Slab facedir when placing initial slab against other surface
--local slab_trans_dir_place = {[0] = 0, 20, 12, 16, 4, 8}

-- Register slabs.
-- Node will be called shape:slab_<subname>

function shape.register_slab(subname, recipeitem, groups, images, description, def)

	groups.slab = 1
	minetest.register_node(":shape:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = def.sunlight_propagates,
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = table.copy( def.sounds ),
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			local under = minetest.get_node(pointed_thing.under)
			local wield_item = itemstack:get_name()

			if under and wield_item == under.name then
				-- place slab using under node orientation
				local dir = minetest.dir_to_facedir(vector.subtract(
					pointed_thing.above, pointed_thing.under), true)

				local p2 = under.param2

				-- combine two slabs if possible
				if slab_trans_dir[math.floor(p2 / 4)] == dir then
					if not recipeitem then
						return itemstack
					end
					local player_name = placer:get_player_name()
					if minetest.is_protected(pointed_thing.under, player_name) and not
							minetest.check_player_privs(placer, "protection_bypass") then
						minetest.record_protection_violation(pointed_thing.under,
							player_name)
						return
					end
					minetest.set_node(pointed_thing.under, {name = recipeitem, param2 = p2})
					if not minetest.settings:get_bool("creative_mode") then
						itemstack:take_item()
					end
					return itemstack
				end

				-- Placing a slab on an upside down slab should make it right-side up.
				if p2 >= 20 and dir == 8 then
					p2 = p2 - 20
				-- same for the opposite case: slab below normal slab
				elseif p2 <= 3 and dir == 4 then
					p2 = p2 + 20
				end

				-- else attempt to place node with proper param2
				minetest.item_place_node(ItemStack(wield_item), placer, pointed_thing, p2)
				if not minetest.settings:get_bool("creative_mode") then
					itemstack:take_item()
				end
				return itemstack
			else
				minetest.rotate_and_place(itemstack, placer, pointed_thing,
						minetest.settings:get_bool("creative_mode"),
						{invert_wall = placer:get_player_control().sneak})
				return itemstack
			end
		end,
	})

	if recipeitem then
		minetest.register_craft({
			output = 'shape:slab_' .. subname .. ' 6',
			recipe = {
				{recipeitem, recipeitem, recipeitem},
			},
		})

		minetest.register_craft({
			output = recipeitem,
			recipe = {
				{'shape:slab_' .. subname, 'shape:slab_' .. subname},
			},
		})

		-- Fuel
		local baseburntime = minetest.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			minetest.register_craft({
				type = "fuel",
				recipe = 'shape:slab_' .. subname,
				burntime = math.floor(baseburntime * 0.5),
			})
		end
	end
end

-- Node will be called shape:half_slab_<subname>

function shape.register_half_slab(subname, recipeitem, groups, images, description, def)

	groups.half_slab = 1
	minetest.register_node(":shape:half_slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		use_texture_alpha = "clip",
		paramtype = "light",
		sunlight_propagates = def.sunlight_propagates,
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = table.copy( def.sounds ),
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			local under = minetest.get_node(pointed_thing.under)
			local wield_item = itemstack:get_name()

			if under and wield_item == under.name then
				-- place half_slab using under node orientation
				local dir = minetest.dir_to_facedir(vector.subtract(
					pointed_thing.above, pointed_thing.under), true)

				local p2 = under.param2

				-- combine two half_slabs if possible
				if slab_trans_dir[math.floor(p2 / 4)] == dir then
					if not recipeitem then
						return itemstack
					end
					local player_name = placer:get_player_name()
					if minetest.is_protected(pointed_thing.under, player_name) and not
							minetest.check_player_privs(placer, "protection_bypass") then
						minetest.record_protection_violation(pointed_thing.under,
							player_name)
						return
					end
					minetest.set_node(pointed_thing.under, {name = 'shape:slab_' .. subname, param2 = p2})
					if not minetest.settings:get_bool("creative_mode") then
						itemstack:take_item()
					end
					return itemstack
				end

				-- Placing a half_slab on an upside down half_slab should make it right-side up.
				if p2 >= 20 and dir == 8 then
					p2 = p2 - 20
				-- same for the opposite case: half_slab below normal half_slab
				elseif p2 <= 3 and dir == 4 then
					p2 = p2 + 20
				end

				-- else attempt to place node with proper param2
				minetest.item_place_node(ItemStack(wield_item), placer, pointed_thing, p2)
				if not minetest.settings:get_bool("creative_mode") then
					itemstack:take_item()
				end
				return itemstack
			else
				minetest.rotate_and_place(itemstack, placer, pointed_thing,
						minetest.settings:get_bool("creative_mode"),
						{invert_wall = placer:get_player_control().sneak})
				return itemstack
			end
		end,
	})

	if recipeitem then
		minetest.register_craft({
			output = 'shape:half_slab_' .. subname .. ' 2',
			recipe = {
				{'shape:slab_' .. subname},
			},
		})

		minetest.register_craft({
			output = 'shape:slab_' .. subname,
			recipe = {
				{'shape:half_slab_' .. subname, 'shape:half_slab_' .. subname},
			},
		})

		-- Fuel
		local baseburntime = minetest.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			minetest.register_craft({
				type = "fuel",
				recipe = 'shape:half_slab_' .. subname,
				burntime = math.floor(baseburntime * 0.25),
			})
		end
	end
end

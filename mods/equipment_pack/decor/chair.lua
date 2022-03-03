local screwdriver = {}

local function sit(pos, node, clicker)
	local player = clicker:get_player_name()
	if player_api.player_attached[player] == true then
		pos.y = pos.y - 0.5
		clicker:setpos(pos)
		clicker:set_eye_offset({x=0, y=0, z=0}, {x=0, y=0, z=0})
		clicker:set_physics_override(1, 1, 1)
		player_api.player_attached[player] = false
		player_api.set_animation(clicker, "stand", 30)
	elseif player_api.player_attached[player] ~= true and node.param2 <= 3 and
			clicker:get_player_velocity().x == 0 and
			clicker:get_player_velocity().y == 0 and
			clicker:get_player_velocity().z == 0 then

		clicker:set_eye_offset({x=0, y=-7, z=2}, {x=0, y=0, z=0})
		clicker:set_physics_override(0, 0, 0)
		clicker:setpos(pos)
		player_api.player_attached[player] = true
		player_api.set_animation(clicker, "sit", 30)

		if node.param2 == 0 then
			clicker:set_look_yaw(3.15)
		elseif node.param2 == 1 then
			clicker:set_look_yaw(7.9)
		elseif node.param2 == 2 then
			clicker:set_look_yaw(6.28)
		elseif node.param2 == 3 then
			clicker:set_look_yaw(4.75)
		end
	end
end

decor.register("chair", {
	description = "Chair",
	tiles = {"equipment_wood_panel.png"},
	sounds = base.node_sound_wood_defaults(),
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=3},
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = "fixed",
		fixed = {{-0.3125, -0.5, 0.1875, -0.1875, 0.5, 0.3125},
			{0.1875, -0.5, 0.1875, 0.3125, 0.5, 0.3125},
			{-0.1875, 0.025, 0.22, 0.1875, 0.45, 0.28},
			{-0.3125, -0.5, -0.3125, -0.1875, -0.125, -0.1875},
			{0.1875, -0.5, -0.3125, 0.3125, -0.125, -0.1875},
			{-0.3125, -0.125, -0.3125, 0.3125, 0, 0.1875}}
	},
	on_rightclick = function(pos, node, clicker)
		local objs = minetest.get_objects_inside_radius(pos, 0.5)
		for _, p in pairs(objs) do
			if p:get_player_name() ~= clicker:get_player_name() then return end
		end

		pos.y = pos.y + 0  -- Sitting position.
		sit(pos, node, clicker)
	end,
	can_dig = function(pos, player)
		local pname = player:get_player_name()
		local objs = minetest.get_objects_inside_radius(pos, 0.5)

		for _, p in pairs(objs) do
			if not player or not player:is_player() or
					p:get_player_name() ~= nil or
					player_api.player_attached[pname] == true then
				return false
			end
		end

		return true
	end
})

minetest.register_craft({
	output = "decor:chair",
	recipe = {
		{"group:stick", "", ""},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"}
	}
})

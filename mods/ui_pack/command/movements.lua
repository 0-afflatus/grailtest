minetest.register_chatcommand("sit",{
	func = function( name, param )
		local player = minetest.get_player_by_name(name)
		default.player_set_animation(player, "sit")
		player:set_eye_offset({x=0,y=-5,z=0},{x=0,y=0,z=0})
		player:set_physics_override(0,0,nil)
	end,
})

minetest.register_chatcommand("sleep",{
	func = function( name, param )
		local player = minetest.get_player_by_name(name)
		default.player_set_animation(player, "lay")
		player:set_eye_offset({x=0,y=-10,z=0},{x=0,y=0,z=0})
		player:set_physics_override(0,0,nil)
	end,
})

-- TODO: This nullifies any physics effects
-- Add func to save and restore physics state

minetest.register_chatcommand("stand",{
	func = function( name, param )
		local player = minetest.get_player_by_name(name)
		default.player_set_animation(player, "stand")
		player:set_eye_offset({x=0,y=0,z=0},{x=0,y=0,z=0})
		player:set_physics_override(1,1,nil)
	end,
})

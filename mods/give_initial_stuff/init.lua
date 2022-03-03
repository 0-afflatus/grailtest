minetest.register_on_newplayer(function(player)
	--print("on_newplayer")
	if minetest.setting_getbool("give_initial_stuff") then
		minetest.log("action", "Giving initial stuff to player "..player:get_player_name())
		player:get_inventory():add_item('main', 'tool:spork')
		player:get_inventory():add_item('main', 'equipment:torch 12')
		player:get_inventory():add_item('main', 'apple 23')
	end
end)


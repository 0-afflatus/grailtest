if minetest.setting_get_pos("static_spawnpoint") then
	minetest.register_chatcommand("spawn", {
	    description = "Teleport to spawn point.",
	    func = function(name)
        	local player = minetest.get_player_by_name(name)
        	if player == nil then
        	    -- just a check to prevent the server crashing
        	    return false
        	end
        	local spawnPoint = minetest.settings:get("static_spawnpoint") 
		minetest.get_player_by_name(name):setpos(minetest.string_to_pos(spawnPoint))
        	minetest.chat_send_player(name, "Teleported to spawn!")
	    end,
	})
end

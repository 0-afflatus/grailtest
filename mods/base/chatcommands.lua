-- Grailtest 5 --
-- mods/base/chatcommands.lua

-- support for MT game translation.
local S = base.get_translator

minetest.register_chatcommand("holding", {
	params = "",
	description = S("Display name of item in hand"),
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			minetest.log("error", "No player.")
			return false, "No player."
		end
		if player:get_wielded_item():is_empty() then
			return false, "No item in hand."
		end
		local h_thing  = player:get_wielded_item()
		local msg = "You are holding "..h_thing:get_name()
		return true, msg
	end,
})

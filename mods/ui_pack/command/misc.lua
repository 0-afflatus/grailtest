-- Grailtest 5 --
-- mods/ui_pack/command/misc.lua

minetest.register_chatcommand("cast", {
	params = "<spell>",
	description = "Cast a spell",
	func = function(name, param)
		local spells = string.split(param, " ")
		local spell = spells[1] or "Poof"
		minetest.chat_send_player(name, "You try to cast "..spell)
		command:cast(spell, name)
		minetest.log("action", name .. " cast " .. spell)
		minetest.chat_send_player(name, "Spell "..spell.." cast.")
	end,
})

function command:cast(spell, pname)
	if spell == "tunnel" then
		minetest.chat_send_player(pname, "You cast "..spell)
	end
	return true;
end


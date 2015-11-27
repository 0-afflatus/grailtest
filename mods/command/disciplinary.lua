minetest.register_chatcommand("jail", {
	params = "<player>",
	privs = { ban=true, },
	description = "Jail a player. (removes all privs but shout)",
	func = function(name, param)
		local perps = string.split(param, " ")
		local perp = perps[1] or "Crim"
		minetest.chat_send_player(name, "You send "..perp.." to jail.")
		if not command:player_exists(perp) then
			return false, "Player " .. perp .. " does not exist."
		end
		--local privs = minetest.get_player_privs(perp)
		-- jail function
		command:make_jailor(name)
		if not command:jail(perp) then
			return false, "You fail to jail "..perp
		end
		minetest.log("action", name .. " jailed " .. perp)
		minetest.chat_send_player(name, "Player "..perp.." jailed. Revoked all but shout.")
	end,
})

minetest.register_chatcommand("arrest", {
	params = "<player>",
	privs = { basic_privs=true, },
	description = "Arrest a player. (removes all privs but shout)",
	func = function(name, param)
		local perps = string.split(param, " ")
		local perp = perps[1] or "Suspect"
		minetest.chat_send_player(name, "You arrest "..perp)
		if not command:player_exists(perp) then
			return false, "Player " .. perp .. " does not exist."
		end
		--local privs = minetest.get_player_privs(perp)
		-- arrest function
		command:make_arrest(name)
		if not command:arrest(perp) then
			return false, "You fail to arrest "..perp
		end
		minetest.log("action", name .. " arrested " .. perp)
		minetest.chat_send_player(name, "Player "..perp.." arrested. Revoked all but shout.")
	end,
})

minetest.register_chatcommand("detain", {
	params = "<player>",
	privs = { basic_privs=true, },
	description = "Detain a player.",
	func = function(name, param)
		local perps = string.split(param, " ")
		local perp = perps[1] or "MissDemeanour"
		minetest.chat_send_player(name, "You send "..perp.." to the Chancellor's Office.")
		if not command:player_exists(perp) then
			return false, "Player "..perp.." does not exist."
		end
		-- detain function
		command:make_head(name)
		if not command:detain(perp) then
			return false, "You fail to detain player " .. perp
		end
		minetest.log("action", name .. " detained " .. perp)
		minetest.chat_send_player(name, "Player "..perp.." detained.")
	end,
})

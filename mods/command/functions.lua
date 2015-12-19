-- These should be set by server admin

local office = {x=-6, y=12, z=-16}
local office_admin = {x=-2, y=12, z=-16}
local court = {x=-13, y=14, z=-11}
local court_admin = {x=-22, y=14, z=-11}
local prison = {x=0, y=-23000, z=0}
local prison_admin = {x=19, y=-23000, z=19}

-- player_exists()from CommonLib
--	by Rubenwardy

function command:is_in(context, search_term)

	for k, value in ipairs(context) do 
		if value == search_term then
			return k
		end
	end
	return false
end

function command:player_exists(name)
	local privs = minetest.get_player_privs( name );
	if( not( privs )) then
		return false;
	else
		return true;
	end
end

function command:detain(playername)
	local perp = minetest.get_player_by_name(playername)
	if perp then
		perp:setpos(office)
	else
		return false;
	end
	return true;
end

function command:make_head(adminname)
	local judge = minetest.get_player_by_name(adminname)
	judge:setpos(office_admin)
	return true;
end

function command:arrest(playername)
	local perp = minetest.get_player_by_name(playername)
	--minetest.set_player_privs(perp, {shout = true})
	if perp then
		perp:setpos(court)
	else
		return false;
	end
	return true;
end

function command:make_arrest(adminname)
	local judge = minetest.get_player_by_name(adminname)
	judge:setpos(court_admin)
	return true;
end

function command:jail(playername)
	local perp = minetest.get_player_by_name(playername)
	minetest.set_player_privs(perp, {shout = true})
	if perp then
		perp:setpos(prison)
	else
		return false;
	end
	return true;
end

function command:make_jailor(adminname)
	local judge = minetest.get_player_by_name(adminname)
	judge:setpos(prison_admin)
	return true;
end

function command.welcome(player)
	local target = player:get_player_name()
	if not player then
		return false, ("There's no player named '%s'."):format(target)
	end
	local fs = { }
	local text = {"Welcome to Grail Test, "..target.."!",
			"",
			"Your journey begins in an otherworldly dark-age kingdom ",
			"that stands on the borders between the lands of the ",
			"living and the lands of the dead.",
			"",
			"Player killing isn't allowed but you have to survive against",
			"monsters, using crafting, building and your ingenuity. ",
			"Your  first task is to gather resources to build a shelter.",
			"",
			"Go find a tree and chop some wood, then you can make a ",
			"pick and go mining. There is a playguide at: ",
			"http://grailtest.pathilorra.co.uk/playguide.html",
			"",
			"Admins are called Wizards here. Hassling for privs or chat ",
			"spamming will result in gagging or toading. Griefers will ",
			"be arrested, probably without warning. Crafting, building ",
			"great public buildings and helping other players is the ",
			"best way to get player advancement and privs.",
			"",
			"If you have any problems /mail afflatus in-game or post in ",
			"the server forum at: ",
			"https://forum.minetest.net/viewtopic.php?f=10&t=13127.",}
	text = table.concat(text, "\n")
	text = minetest.formspec_escape(text)
	table.insert(fs, "size[8,11]")
	table.insert(fs, "background[0,0;8,11;ui_form_bg.png]")
	table.insert(fs, "image[6.7,0.5;1,1;ui_icon.png]")
	table.insert(fs, "image[6.7,2;1,2;character_1_preview.png]")
	table.insert(fs, "image[6.7,4.5;1,1;tree_apple_tree_sapling.png]")
	table.insert(fs, "image[6.7,6.5;1,1;tool_staff_ruby.png]")
	table.insert(fs, "image[6.7,8.5;1,1;ui_craftguide_icon.png]")
	table.insert(fs, "label[0.5,0.5;"..text.."]")
	table.insert(fs, "button_exit[3,10.2;2,0.5;ok;OK]")
	fs = table.concat(fs)
	minetest.after(0.5, function()
		minetest.show_formspec(target, "command:welcome", fs)
	end)
	return true
end

minetest.register_on_newplayer(function(player)
	command.welcome(player)
end)

--[[
minetest.register_on_joinplayer(function(player)
	command.welcome(player)
end)
]]

minetest.register_chatcommand("welcome", {
	params = "",
	privs = { },
	description = "Show the welcome screen.",
	func = function(name, params)
		local player = minetest.get_player_by_name(name)
		local ok, err = command.welcome(player)
		if not ok then
			return false, err
		end
		return true, "Hail o Valiant Grail Tester!"
	end,
})

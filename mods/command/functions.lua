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

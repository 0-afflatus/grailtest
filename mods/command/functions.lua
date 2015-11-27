-- These should be set by server admin

local office = {x=-18, y=3, z=-23}
local office_admin = {x=-23, y=3, z=-23}
local court = {x=-34, y=-2, z=-68}
local court_admin = {x=-34, y=-2, z=-68}
local prison = {x=0, y=-23000, z=0}
local prison_admin = {x=19, y=-23000, z=19}

-- player_exists()from CommonLib
--	by Rubenwardy

function command:player_exists( name )
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

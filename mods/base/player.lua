-- Grailtest 5 --
-- mods/base/player.lua
-- See README.txt for licensing and other information.

base.registered_player_models = { }

-- Local for speed.
local models = base.registered_player_models

function base.player_register_model(name, def)
	models[name] = def
end

-- GUI related stuff

base.gui_bg     = "bgcolor[#080808BB;true]"
base.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
base.gui_slots  = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"

minetest.register_on_joinplayer(function(player)
	-- Set formspec prepend
	local formspec = [[
			bgcolor[#080808BB;true]
			listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF] ]]
	local name = player:get_player_name()
	local info = minetest.get_player_information(name)
	if info.formspec_version > 1 then
		formspec = formspec .. "background9[5,5;1,1;gui_formbg.png;true;10]"
	else
		formspec = formspec .. "background[5,5;1,1;gui_formbg.png;true]"
	end
	player:set_formspec_prepend(formspec)

	-- Set hotbar textures
	player:hud_set_hotbar_image("gui_hotbar.png")
	player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")

	player:set_sky({
	    --base_color = {r=123, g=100, b=246},
	    base_color = {r=23, g=10, b=46},
	    type = "regular", -- regular, skybox or plain
	    clouds = true,
	})

	player:set_sun({
	    visible = true,
	    texture = "sun.png",
	    tonemap = "sun_tonemap.png",
	    sunrise = "sunrisebg.png",
	    sunrise_visible = true,
	    scale = 0.90,
	})
	player:set_moon({
	    visible = true,
	    texture = "moon.png",
	    tonemap = "moon_tonemap.png",
	    scale = 1.11,
	})
	player:set_stars({
	    visible = true,
	    count = 283,
	    star_color = 0xddddeeff,
	    scale = 0.5,
	})
	player:set_clouds({
	    density = 0.37,
	    color = 0xfff0f0e5,
	    ambient = 0x120713,
	    height = 123,
	    thickness = 16,
	    speed = {x=0, z=-2},
    })

end)

function base.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

base.gui_survival_form = "size[8,8.5]"..
			base.gui_bg..
			base.gui_bg_img..
			base.gui_slots..
			"list[current_player;main;0,4.25;8,1;]"..
			"list[current_player;main;0,5.5;8,3;8]"..
			"list[current_player;craft;1.75,0.5;3,3;]"..
			"list[current_player;craftpreview;5.75,1.5;1,1;]"..
			"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			base.get_hotbar_bg(0,4.25)



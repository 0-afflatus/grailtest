-----------------------------------------------------------------------------------------------
-- Fishing - Mossmanikin's version - Trophies 0.0.2
-- License (code & textures): 	WTFPL
-- Contains code from: 		default
-- modded for Grail Test by afflatus
-----------------------------------------------------------------------------------------------

local TRoPHY = {
--	  MoD						 iTeM				 NaMe				iCoN
    {"fishing",  				"fish_raw",			"Fish",				"fishing_fish.png"},
	{"fishing",  				"pike",				"Northern Pike",	"fishing_pike.png"},
	{"fishing",  				"shark",			"Shark",			"fishing_shark.png"},
}

local function has_trophy_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end

for i in pairs(TRoPHY) do
	local 	MoD = 			TRoPHY[i][1]
	local 	iTeM = 			TRoPHY[i][2]
	local 	NaMe = 			TRoPHY[i][3]
	local 	iCoN = 			TRoPHY[i][4]
	minetest.register_node("fishing:trophy_"..iTeM, {
		description = NaMe.." Trophy",
		inventory_image = "fishing_trophy.png^"..iCoN.."^fishing_trophy_label.png",
		drawtype = "nodebox",
		tiles = {
			"equipment_chest_top.png", -- top
			"equipment_chest_top.png", -- bottom
			"equipment_chest_top.png", -- right
			"equipment_chest_top.png", -- left
			"equipment_chest_top.png", -- back
			"fishing_trophy.png^"..iCoN.."^fishing_trophy_label.png", -- front
		},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		node_box = {
			type = "fixed",
			fixed = {
			--	{ left	, bottom , front  ,  right ,  top   ,  back  }
				{ -1/2  , -1/2   ,  7/16  , 1/2    ,  1/2   ,  1/2  },
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -1/2  , -1/2   ,  7/16  , 1/2    ,  1/2   ,  1/2  },
		}
		},
		groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
		sounds = default.node_sound_wood_defaults(),
		after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos)
			meta:set_string("owner", placer:get_player_name() or "")
			meta:set_string("infotext", "This Huge "..NaMe.." was caught by the Famous Angler "..
				meta:get_string("owner").."!")
		end,
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", NaMe)
			meta:set_string("owner", "")
		end,
		can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			return has_trophy_privilege(meta, player)
		end,
	})
	
	minetest.register_craft({
		type = "shapeless",
		output = "fishing:trophy_"..iTeM,
		recipe = {MoD..":"..iTeM, "default:sign_wall"},
	})
	
end

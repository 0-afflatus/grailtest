local default_can_dig = function(pos, _)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

	return inv:is_empty("main")
end

local xbg = base.gui_bg..base.gui_bg_img..base.gui_slots

local default_inventory_size = 32
local default_inventory_formspecs = {
	["8"] = "size[8,6]"..xbg..
	"list[context;main;0,0;8,1;]"..
	"list[current_player;main;0,2;8,4;]"..
	"listring[current_player;main]"..
	"listring[context;main]"..
	base.get_hotbar_bg(0, 2),

	["16"] = "size[8,7]"..xbg..
	"list[context;main;0,0;8,2;]"..
	"list[current_player;main;0,3;8,4;]"..
	"listring[current_player;main]"..
	"listring[context;main]"..
	base.get_hotbar_bg(0, 3),

	["24"] = "size[8,8]"..xbg..
	"list[context;main;0,0;8,3;]"..
	"list[current_player;main;0,4;8,4;]"..
	"listring[current_player;main]"..
	"listring[context;main]"..
	base.get_hotbar_bg(0, 4),

	["32"] = "size[8,9]"..xbg..
	"list[context;main;0,0.3;8,4;]"..
	"list[current_player;main;0,4.85;8,1;]"..
	"list[current_player;main;0,6.08;8,3;8]"..
	"listring[current_player;main]"..
	"listring[context;main]"..
	base.get_hotbar_bg(0, 4.85)
}

local function get_formspec_by_size(size)
	local formspec = default_inventory_formspecs[tostring(size)]
	return formspec or default_inventory_formspecs
end

function decor.register(name, def)
	def.drawtype = def.drawtype or (def.node_box and "nodebox")
	def.paramtype = def.paramtype or "light"
	def.use_texture_alpha = "clip"
	def.sounds = def.sounds or base.node_sound_defaults()

	if not (def.drawtype == "glasslike_framed" or
			def.drawtype == "glasslike_framed_optional" or def.drawtype == "plantlike" or
			def.drawtype == "signlike" or def.drawtype == "normal") then
		def.paramtype2 = def.paramtype2 or "facedir"
	end

	if def.drawtype == "plantlike" or def.drawtype == "torchlike" or
			def.drawtype == "signlike" or def.drawtype == "fencelike" then
		def.sunlight_propagates = true
	end

	local infotext = def.infotext
	local inventory = def.inventory
	def.inventory = nil

	if inventory then
		def.on_construct = def.on_construct or function(pos)
			local meta = minetest.get_meta(pos)
			if infotext then
				meta:set_string("infotext", infotext)
			end
			local size = inventory.size or default_inventory_size
			local inv = meta:get_inventory()
			inv:set_size("main", size)
			meta:set_string("formspec", inventory.formspec or get_formspec_by_size(size))
		end

		def.can_dig = def.can_dig or default_can_dig
	elseif infotext and not def.on_construct then
		def.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", infotext)
		end
	end

	minetest.register_node(":decor:".. name, def)
end
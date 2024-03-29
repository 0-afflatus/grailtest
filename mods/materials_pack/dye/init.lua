-- Other mods can use these for looping through available colors

dye = {}
dye.basecolors = {"white", "grey", "black", "red", "yellow", "green", "cyan", "blue", "magenta"}
dye.excolors = {"white", "lightgrey", "grey", "darkgrey", "black", "red", "orange", "yellow",
	"lime", "green", "aqua", "cyan", "sky_blue", "blue", "violet", "magenta", "red_violet"}

-- Make dye names, descriptions and colorstrings available globally

dye.dyes = {
	{"black",      "Black",      {dye=1, basecolor_black=1,   excolor_black=1,      unicolor_black=1},			"#333333"},
	{"blue",       "Blue",       {dye=1, basecolor_blue=1,    excolor_blue=1,       unicolor_blue=1},			"#6666dd"},
	{"brown",      "Brown",      {dye=1, basecolor_brown=1,   excolor_orange=1,     unicolor_dark_orange=1},	"#887755"},
	{"cyan",       "Cyan",       {dye=1, basecolor_cyan=1,    excolor_cyan=1,       unicolor_cyan=1},			"#55bbcc"},
	{"green",      "Green",      {dye=1, basecolor_green=1,   excolor_green=1,      unicolor_green=1},			"#448044"},
	{"grey",       "Grey",       {dye=1, basecolor_grey=1,    excolor_grey=1,       unicolor_grey=1},			"#999999"},
	{"magenta",    "Magenta",    {dye=1, basecolor_magenta=1, excolor_red_violet=1, unicolor_red_violet=1},		"#ee66ee"},
	{"orange",     "Orange",     {dye=1, basecolor_orange=1,  excolor_orange=1,     unicolor_orange=1},			"#ee9966"},
	{"pink",       "Pink",       {dye=1, basecolor_red=1,     excolor_red=1,        unicolor_light_red=1},		"#eebbdd"},
	{"red",        "Red",        {dye=1, basecolor_red=1,     excolor_red=1,        unicolor_red=1},			"#bb6666"},
	{"violet",     "Violet",     {dye=1, basecolor_magenta=1, excolor_violet=1,     unicolor_violet=1},			"#8866bb"},
	{"white",      "White",      {dye=1, basecolor_white=1,   excolor_white=1,      unicolor_white=1},			"#eeeeee"},
	{"yellow",     "Yellow",     {dye=1, basecolor_yellow=1,  excolor_yellow=1,     unicolor_yellow=1},			"#eecc00"},
}

--[[dye.dyes = {
	{"black",      "Black",      {dye=1, basecolor_black=1,   excolor_black=1,      unicolor_black=1},			"#333333"},
	{"blue",       "Blue",       {dye=1, basecolor_blue=1,    excolor_blue=1,       unicolor_blue=1},			"#6666ee"},
	{"brown",      "Brown",      {dye=1, basecolor_brown=1,   excolor_orange=1,     unicolor_dark_orange=1},	"#997755"},
	{"cyan",       "Cyan",       {dye=1, basecolor_cyan=1,    excolor_cyan=1,       unicolor_cyan=1},			"#66eeee"},
	{"green",      "Green",      {dye=1, basecolor_green=1,   excolor_green=1,      unicolor_green=1},			"#66cc66"},
	{"grey",       "Grey",       {dye=1, basecolor_grey=1,    excolor_grey=1,       unicolor_grey=1},			"#bbbbbb"},
	{"magenta",    "Magenta",    {dye=1, basecolor_magenta=1, excolor_red_violet=1, unicolor_red_violet=1},		"#ff66ff"},
	{"orange",     "Orange",     {dye=1, basecolor_orange=1,  excolor_orange=1,     unicolor_orange=1},			"#ffaa66"},
	{"pink",       "Pink",       {dye=1, basecolor_red=1,     excolor_red=1,        unicolor_light_red=1},		"#ffbbcc"},
	{"red",        "Red",        {dye=1, basecolor_red=1,     excolor_red=1,        unicolor_red=1},			"#cc6666"},
	{"violet",     "Violet",     {dye=1, basecolor_magenta=1, excolor_violet=1,     unicolor_violet=1},			"#cc66ff"},
	{"white",      "White",      {dye=1, basecolor_white=1,   excolor_white=1,      unicolor_white=1},			"#ffffff"},
	{"yellow",     "Yellow",     {dye=1, basecolor_yellow=1,  excolor_yellow=1,     unicolor_yellow=1},			"#ffdd33"},
}]]--

function dye.get_color( nodename )
	for _, row in ipairs( dye.dyes ) do
		local colourname = row[1]
		local blob = colourname.match( nodename, colourname )
		if blob then
			return blob
		end
	end
	return false
end

-- Define items

for _, row in ipairs(dye.dyes) do
	local name = row[1]
	local description = row[2].." dye"
	local groups = row[3]
	local colourdef = row[4]
	local item_name = "dye:" .. name
	local item_image = "dye.png^[multiply:"..colourdef
	minetest.register_craftitem(item_name, {
		inventory_image = item_image,
		description = description,
		groups = groups
	})
	minetest.register_craft({
		type = "shapeless",
		output = item_name .. " 6",
		recipe = {"group:flower,color_" .. name},
	})
end

-- Mix recipes
local dye_recipes = {
	-- src1, src2, dst
	-- RYB mixes
	{"red", "blue", "violet"}, -- "purple"
	{"yellow", "red", "orange"},
	{"yellow", "blue", "green"},
	-- RYB complementary mixes
	{"red", "green", "brown"},
	{"yellow", "violet", "brown"},
	{"blue", "orange", "brown"},
	-- CMY mixes - approximation
	{"cyan", "yellow", "green"},
	{"cyan", "magenta", "blue"},
	{"yellow", "magenta", "red"},
	-- other mixes that result in a color we have
	{"magenta", "blue", "violet"},
	{"green", "blue", "cyan"},
	{"pink", "violet", "magenta"},
	-- mixes with black
	{"white", "black", "grey"},
	{"grey", "black", "dark_grey"},
	{"green", "black", "dark_green"},
	{"orange", "black", "brown"},
	-- mixes with white
	{"white", "red", "pink"},
	{"white", "dark_grey", "grey"},
	{"white", "dark_green", "green"},
}

for _, mix in pairs(dye_recipes) do
	minetest.register_craft({
		type = "shapeless",
		output = 'dye:' .. mix[3] .. ' 2',
		recipe = {'dye:' .. mix[1], 'dye:' .. mix[2]},
	})
end

dofile(minetest.get_modpath("dye").."/crafting.lua")

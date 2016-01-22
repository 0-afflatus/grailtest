--
-- Additional slabs and stairs
--

stairs.register_stair_and_slab("beech_wood", "moretrees:beech_planks",
	{snappy=2,choppy=2,oddly_breakable_by_hand=2},
	{"moretrees_beech_wood.png"},
	"Beech wood stair",
	"Beech wood slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("pine_wood", "moretrees:pine_planks",
	{snappy=2,choppy=2,oddly_breakable_by_hand=2},
	{"moretrees_pine_wood.png"},
	"Pine wood stair",
	"Pine wood slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("fir_wood", "moretrees:fir_planks",
	{snappy=2,choppy=2,oddly_breakable_by_hand=2},
	{"moretrees_fir_wood.png"},
	"Fir wood stair",
	"Fir wood slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("willow_wood", "moretrees:willow_planks",
	{snappy=2,choppy=2,oddly_breakable_by_hand=2},
	{"moretrees_willow_wood.png"},
	"Willow wood stair",
	"Willow wood slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("spruce_wood", "moretrees:spruce_planks",
	{snappy=2,choppy=2,oddly_breakable_by_hand=2},
	{"moretrees_spruce_wood.png"},
	"Spruce wood stair",
	"Spruce wood slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("birch_wood", "moretrees:birch_planks",
	{snappy=2,choppy=2,oddly_breakable_by_hand=2},
	{"moretrees_birch_wood.png"},
	"Birch wood stair",
	"Birch wood slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("oak_wood", "moretrees:oak_planks",
	{snappy=2,choppy=2,oddly_breakable_by_hand=2},
	{"moretrees_oak_wood.png"},
	"Oak wood stair",
	"Oak wood slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("jungletree_wood", "moretrees:jungletree_planks",
	{snappy=2,choppy=2,oddly_breakable_by_hand=2},
	{"moretrees_jungletree_wood.png"},
	"jungletree wood stair",
	"jungletree wood slab",
	default.node_sound_wood_defaults())

for _, row in ipairs(material.dyes) do
	local name = row[1]
	local desc = row[2]
	local craft_color_group = row[3]
	stairs.register_stair_and_slab("wool_"..name, "wool:"..name,
	{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,fabric=1,wool=1},
	{"wool_"..name..".png"},
	desc.." sofa",
	desc.." slab")
end

stairs.register_stair_and_slab("material_glass", "material:glass",
	{cracky=3,oddly_breakable_by_hand=3},
	{"material_glass.png"},
	"Glass Stair",
	"Glass Slab",
	default.node_sound_glass_defaults())

stairs.register_stair_and_slab("material_glass_obsidian", "material:glass_obsidian",
	{cracky=3,oddly_breakable_by_hand=3},
	{"material_glass_obsidian.png"},
	"Obsidian Glass stair",
	"Obsidian Glass slab",
	default.node_sound_glass_defaults())

stairs.register_stair_and_slab("stone_tile", "material:stone_tile",
	{cracky=3},
	{"material_stone_tile.png"},
	"Stone Tile Stairs",
	"Stone Tile Slab",
	default.node_sound_stone_defaults())

stairs.register_stair_and_slab("stone_tile_split", "material:stone_tile_split",
	{cracky=3},
	{"material_stone_tile_split.png"},
	"Split Stone Tile Stairs",
	"Split Stone Tile Slab",
	default.node_sound_stone_defaults())

stairs.register_stair_and_slab("white_stone_tile", "material:white_stone_tile",
	{cracky=3},
	{"material_white_stone_tile.png"},
	"White Stone Tile Stairs",
	"White Stone Tile Slab",
	default.node_sound_stone_defaults())

stairs.register_stair_and_slab("white_stone_tile_split", "material:white_stone_tile_split",
	{cracky=3},
	{"material_white_stone_tile_split.png"},
	"Split White Stone Tile Stairs",
	"Split White Stone Tile Slab",
	default.node_sound_stone_defaults())

stairs.register_stair_and_slab("blue_stone_tile", "material:blue_stone_tile",
	{cracky=3},
	{"material_blue_stone_tile.png"},
	"Bluestone Tile Stairs",
	"Bluestone Tile Slab",
	default.node_sound_stone_defaults())

stairs.register_stair_and_slab("blue_stone_tile_split", "material:blue_stone_tile_split",
	{cracky=3},
	{"material_blue_stone_tile_split.png"},
	"Split Bluestone Tile Stairs",
	"Split Bluestone Tile Slab",
	default.node_sound_stone_defaults())

stairs.register_stair_and_slab("green_stone_tile", "material:green_stone_tile",
	{cracky=3},
	{"material_green_stone_tile.png"},
	"Greenstone Tile Stairs",
	"Greenstone Tile Slab",
	default.node_sound_stone_defaults())

stairs.register_stair_and_slab("green_stone_tile_split", "material:green_stone_tile_split",
	{cracky=3},
	{"material_green_stone_tile_split.png"},
	"Split Greenstone Tile Stairs",
	"Split Greenstone Tile Slab",
	default.node_sound_stone_defaults())

stairs.register_stair_and_slab("basalt_tile", "material:basalt_tile",
	{cracky=3},
	{"material_basalt_tile.png"},
	"Basalt Tile Stairs",
	"Basalt Tile Slab",
	default.node_sound_stone_defaults())

stairs.register_stair_and_slab("basalt_tile_split", "material:basalt_tile_split",
	{cracky=3},
	{"material_basalt_tile_split.png"},
	"Split Basalt Tile Stairs",
	"Split Basalt Tile Slab",
	default.node_sound_stone_defaults())


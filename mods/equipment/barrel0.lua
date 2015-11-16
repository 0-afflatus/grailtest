
---------------------------------------------------------------------
-- a barrel and a tub - plus a function that makes 'round' objects
---------------------------------------------------------------------
-- IMPORTANT NOTE: The barrel requires a lot of nodeboxes. That may be
--                 too much for weak hardware!
---------------------------------------------------------------------
-- Functionality: right-click to open/close a barrel;
--                punch a barrel to change between vertical/horizontal
---------------------------------------------------------------------
-- Changelog:
-- 24.03.13 Can no longer be opended/closed on rightclick because that is now used for a formspec;
--          instead, it can be filled with liquids.
--          Filled barrels will always be closed, while empty barrels will always be open.

-- pipes: table with the following entries for each pipe-part:
--    f: radius factor; if 1, it will have a radius of half a nodebox and fill the entire nodebox
--    h1, h2: height at witch the nodebox shall start and end; usually -0.5 and 0.5 for a full nodebox
--    b: make a horizontal part/shelf
-- horizontal: if 1, then x and y coordinates will be swapped

-- TODO: option so that it works without nodeboxes

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if intllib then
  S = intllib.Getter()
else
  S = function(s) return s end
end

barrel = {};

-- prepare formspec
barrel.on_construct = function( pos )

   local meta = minetest.get_meta(pos);
   local percent = math.random( 1, 100 ); -- TODO: show real filling

   meta:set_string( 'formspec', 
                               "size[8,9]"..
                                "image[2.6,2;2,3;default_sandstone.png^[lowpart:"..
                                                (100-percent)..":default_desert_stone.png]".. -- TODO: better images
                                "label[2.2,0;"..S("Pour:").."]"..
                                "list[current_name;input;3,0.5;1,1;]"..
                                "label[5,3.3;"..S("Fill:").."]"..
                                "list[current_name;output;5,3.8;1,1;]"..
                                "list[current_player;main;0,5;8,4;]");


   meta:set_string( 'liquid_type', '' ); -- which liquid is in the barrel?
   meta:set_int(    'liquid_level', 0 ); -- how much of the liquid is in there?

   local inv = meta:get_inventory()
   inv:set_size("input",     1);  -- to fill in new liquid
   inv:set_size("output",    1);  -- to extract liquid 
end


-- can only be digged if there are no more vessels/buckets in any of the slots
-- TODO: allow digging of a filled barrel? this would disallow stacking of them
barrel.can_dig = function( pos, player )
   local  meta = minetest.get_meta(pos);
   local  inv = meta:get_inventory()

   return ( inv:is_empty('input')
        and inv:is_empty('output'));
end


-- the barrel received input; either a new liquid that is to be poured in or a vessel that is to be filled
barrel.on_metadata_inventory_put = function( pos, listname, index, stack, player )
end


-- right-click to open/close barrel; punch to switch between horizontal/vertical position
        minetest.register_node("equipment:barrel", {
                description = S("barrel (closed)"),
                paramtype = "light",
                tiles = {"equipment_barrel_top.png", "equipment_barrel_top.png", "equipment_barrel_side.png",
		"equipment_barrel_side.png", "equipment_barrel_side.png", "equipment_barrel_side.png"},
                groups = { tree = 1, snappy = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2
                },
		drop = "equipment:barrel",
--                on_rightclick = function(pos, node, puncher)
--                    minetest.add_node(pos, {name = "equipment:barrel_open", param2 = node.param2})
--                end,
-- TODO: on_rightclick is no longer available - maybe open if empty and closed if full?
                on_punch      = function(pos, node, puncher)
                    minetest.add_node(pos, {name = "equipment:barrel_lying", param2 = node.param2})
                end,

                on_construct = function( pos )
                   return barrel.on_construct( pos );
                end,
                can_dig = function(pos,player)
                   return barrel.can_dig( pos, player );
                end,
                on_metadata_inventory_put = function(pos, listname, index, stack, player)
                   return barrel.on_metadata_inventory_put( pos, listname, index, stack, player );
                end,
		is_ground_content = false,

        })

        -- this barrel is opened at the top
        minetest.register_node("equipment:barrel_open", {
                description = S("barrel (open)"),
                paramtype = "light",
                tiles = {"equipment_barrel_open.png", "equipment_barrel_top.png", "equipment_barrel_side.png",
		"equipment_barrel_side.png", "equipment_barrel_side.png", "equipment_barrel_side.png"},
                groups = { tree = 1, snappy = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2
                },
		drop = "equipment:barrel",
--                on_rightclick = function(pos, node, puncher)
--                    minetest.add_node(pos, {name = "equipment:barrel", param2 = node.param2})
--                end,
                on_punch      = function(pos, node, puncher)
                    minetest.add_node(pos, {name = "equipment:barrel_lying_open", param2 = node.param2})
                end,
		is_ground_content = false,
        })

        -- horizontal barrel
        minetest.register_node("equipment:barrel_lying", {
                description = S("barrel (closed), lying somewhere"),
                paramtype = "light",
	            paramtype2 = "facedir",
                tiles = {"equipment_barrel_side.png","equipment_barrel_side.png", "equipment_barrel_side.png", 
						"equipment_barrel_side.png", "equipment_barrel_top.png", "equipment_barrel_top.png"},
                groups = { tree = 1, snappy = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2
                },
		drop = "equipment:barrel",
                on_rightclick = function(pos, node, puncher)
                    minetest.add_node(pos, {name = "equipment:barrel_lying_open", param2 = node.param2})
                end,
                on_punch      = function(pos, node, puncher)
                    if( node.param2 < 4 ) then
                       minetest.add_node(pos, {name = "equipment:barrel_lying", param2 = (node.param2+1)})
                    else
                       minetest.add_node(pos, {name = "equipment:barrel", param2 = 0})
                    end
                end,
		is_ground_content = false,
        })

        -- horizontal barrel, open
        minetest.register_node("equipment:barrel_lying_open", {
                description = S("barrel (opened), lying somewhere"),
                paramtype = "light",
	            paramtype2 = "facedir",
                tiles = {"equipment_barrel_side.png","equipment_barrel_side.png", "equipment_barrel_side.png", 
						"equipment_barrel_side.png", "equipment_barrel_open.png", "equipment_barrel_top.png"},
                groups = { tree = 1, snappy = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2
                },
		drop = "equipment:barrel",
                on_rightclick = function(pos, node, puncher)
                    minetest.add_node(pos, {name = "equipment:barrel_lying", param2 = node.param2})
                end,
                on_punch      = function(pos, node, puncher)
                    if( node.param2 < 4 ) then
                       minetest.add_node(pos, {name = "equipment:barrel_lying_open", param2 = (node.param2+1)})
                    else
                       minetest.add_node(pos, {name = "equipment:barrel_open", param2 = 0})
                    end
                end,
		is_ground_content = false,

        })
--[[
        -- let's hope "tub" is the correct english word for "bottich"
        minetest.register_node("equipment:tub", {
                description = S("tub"),
                paramtype = "light",
                drawtype = "mesh",
				mesh = "equipment_tub.obj",
                tiles = {"equipment_barrel.png" },
                groups = { tree = 1, snappy = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2
                },
		is_ground_content = false,
        })
]]

minetest.register_craft({
	output = "equipment:barrel",
	recipe = {
		{"group:wood",          "",              "group:wood" },
		{"default:steel_ingot", "",              "default:steel_ingot"},
		{"group:wood",          "group:wood",    "group:wood" },
	},
})

--[[
minetest.register_craft({
	output = "equipment:tub 2",
	recipe = {
		{"equipment:barrel"},
	},
})

minetest.register_craft({
	output = "equipment:barrel",
	recipe = {
		{"equipment:tub"},
		{"equipment:tub"},
	},
})
]]

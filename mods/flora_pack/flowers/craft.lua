-- Grailtest 5 --
-- mods/flora_pack/flowers/craft.lua

minetest.register_craft({
    type = "shapeless",
    output = 'dye:black 4',
    recipe = {
        "flowers:meadowsweet",
        "mineral:copper_lump",
    },
})

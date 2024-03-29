vines.register_vine( 'root', {
  description = "Roots",
  average_length = 9,
},{
  choose_random_wall = true,
  avoid_nodes = {"vines:root_middle"},
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 10,
  spawn_surfaces = {
    "element:dirt_with_grass",
    "element:dirt"
  },
  spawn_on_bottom = true,
  plantlife_limit = -0.6,
  humidity_min = 0.4,
})

vines.register_vine( 'vine', {
  description = "Vines",
  average_length = 5,
},{
  choose_random_wall = true,
  avoid_nodes = {"group:vines"},
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "tree:jungle_leaves",
    "moretrees:jungletree_leaves_red",
    "moretrees:jungletree_leaves_yellow",
    "moretrees:jungletree_leaves_green"
  },
  spawn_on_bottom = true,
  plantlife_limit = -0.9,
  humidity_min = 0.7,
})

vines.register_vine( 'side', {
  description = "Vines",
  average_length = 6,
},{
  avoid_nodes = {"group:vines", "tree:apple_tree"},
  choose_random_wall = true,
  avoid_radius = 3,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "tree:jungle_leaves",
    "moretrees:jungletree_leaves_red",
    "moretrees:jungletree_leaves_yellow",
    "moretrees:jungletree_leaves_green"
  },
  spawn_on_side = true,
  plantlife_limit = -0.9,
  humidity_min = 0.4,
})

vines.register_vine( "jungle", {
  description = "Jungle Vines",
  average_length = 7,
},{
  choose_random_wall = true,
  neighbors = {
    "tree:jungle_leaves",
    "moretrees:jungletree_leaves_red",
    "moretrees:jungletree_leaves_yellow",
    "moretrees:jungletree_leaves_green"
  },
  avoid_nodes = {
    "vines:jungle_middle",
    "vines:jungle_end",
  },
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "tree:jungle_trunk",
    "moretrees:jungletree_trunk"
  },
  spawn_on_side = true,
  plantlife_limit = -0.9,
  humidity_min = 0.2,
})

vines.register_vine( 'willow', {
  description = "Willow Vines",
  average_length = 9,
},{
  choose_random_wall = true,
  avoid_nodes = { "vines:willow_middle" },
  avoid_radius = 5,
  near_nodes = { 'element:water_source' },
  near_nodes_size = 1,
  near_nodes_count = 1,
  near_nodes_vertical = 7,
  plantlife_limit = -0.8,
  spawn_chance = 10,
  spawn_delay = 500,
  spawn_on_side = true,
  spawn_surfaces = {"tree:willow_leaves"},
  humidity_min = 0.5
})

minetest.register_node("vines:ivy", {
	description = "Ivy",
	drawtype = "signlike",
	tiles = {"plant_ivy.png"},
	inventory_image = "plant_ivy.png",
	wield_image = "plant_ivy.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	groups = {dig_immediate = 3, flammable = 3, plant = 1},
	selection_box = {type="wallmounted"},
	legacy_wallmounted = true,
	sounds = base.node_sound_leaves_defaults()
})

minetest.register_craft({
	output = "vines:ivy 4",
	recipe = {
		{"group:leaves"},
		{"group:leaves"}
	}
})

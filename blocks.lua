local function ore_register(color, color_capitalized)
	minetest.register_node("froager2:orb_ore_"..color, {
		description = color_capitalized .. " Orb Ore <Hidden>",
		tiles = {"default_stone.png^froager2_ore_orb_"..color..".png^froager2_outline_"..color..".png"},
		drop = {
			max_items = 1,
			items = {
			{items = {"froager2:orb_"..color}}
			}
		},
		groups = {cracky = 3},
	})
end

ore_register("green", "Green")
ore_register("blue", "Blue")
ore_register("red", "Red")
ore_register("purple", "Purple")

minetest.register_node("froager2:ore_osphor", {
	description = "Osphor Ore <Hidden>",
	tiles = {"default_stone.png^froager2_ore_osphor.png"},
	drop = {
			max_items = 3,
			items = { --from low to high drop chance
				--get from 1 up to 4 nuggets from osphor
				{items = {"froager2:osphor_nugget"},
				rarity = 20},
				{items = {"froager2:osphor_nugget 2"},
				rarity = 5},
				{items = {"froager2:osphor_nugget"}}
			}
		},
	groups = {cracky = 3},
})

--natural nodes
minetest.register_node("froager2:dirt", {
	description = "Energized Dirt",
	tiles = {"froager2_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("froager2:dirt_energized", {
	description = "Insolated Energized Dirt",
	tiles = {"froager2_dirt_energized_top.png", "froager2_dirt.png",
		{name = "froager2_dirt.png^froager2_dirt_energized_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "froager2:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("froager2:stone", {
	description = "Energized Stone",
	tiles = {"froager2_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = "froager2:cobble",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("froager2:cobble", {
	description = "Cobbled Energized Stone",
	tiles = {"froager2_cobble.png"},
	-- is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("froager2:block_osphor", {
	description = "Osphor Block",
	tiles = {"block_osphor.png"},
	groups = {cracky = 2},
})
minetest.register_node("froager2:green_orb_ore", {
    description = "Green Orb Ore <Hidden>",
    tiles = {"default_stone.png^green_orb_ore.png"}, 
    drop = {
        max_items = 1,
        items = {
            {items = {'froager2:green_orb'}}
        }
    },
    groups = {cracky = 3},
})
minetest.register_node("froager2:blue_orb_ore", {
    description = "Blue Orb Ore <Hidden>",
    tiles = {"default_stone.png^blue_orb_ore.png"}, 
    drop = {
        max_items = 1,
        items = {
            {items = {'froager2:blue_orb'}}
        }
    },
    groups = {cracky = 3},
})
minetest.register_node("froager2:red_orb_ore", {
    description = "Red Orb Ore <Hidden>",
    tiles = {"default_stone.png^red_orb_ore.png"}, 
    drop = {
        max_items = 1,
        items = {
            {items = {'froager2:red_orb'}}
        }
    },
    groups = {cracky = 3},
})
local function ore_register(color, description)
	minetest.register_node("froager2:orb_ore_"..color, {
		description = description,
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

ore_register("green", "Green Orb Ore <Hidden>")
ore_register("blue", "Blue Orb Ore <Hidden")
ore_register("red", "Red Orb Ore <Hidden>")
ore_register("purple", "Purple Orb Ore <Hidden>")
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

minetest.register_node("froager2:forge", {
	description = "Forge",
	tiles = {"missing.png"},
	groups = {cracky = 3},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local smartfs = dofile(minetest.get_modpath("froager2").."/smartfs.lua")
		local myform = smartfs.create("Forge",function(state)
			state:size(10,10)
			state:label(0,0,"label1", "Forge")
			state:inventory(0,1,100,100,"forge")
		end)
		myform:show(player:get_player_name())
	end
})

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
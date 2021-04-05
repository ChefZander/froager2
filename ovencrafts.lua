local function oven_recipe(color)
   minetest.register_craft({
    	type = "cooking",
    	recipe = "froager2:orb_"..color,
    	output = "froager2:energy_"..color,
   })
end

oven_recipe("red")
oven_recipe("green")
oven_recipe("blue")
oven_recipe("purple")

minetest.register_craft({
	type = "cooking",
	recipe = "froager2:osphor_nugget",
	output = "froager2:osphor_ingot",
})

minetest.register_craft({
	type = "cooking",
	recipe = "froager2:biomass",
	output = "froager2:material_plastic",
})

minetest.register_craft({
	type = "fuel",
	recipe = "froager2:biomass",
	burntime = 7,
})
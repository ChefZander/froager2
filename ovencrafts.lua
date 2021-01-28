local function oven_recipe(color)
   minetest.register_craft({
    	type = "cooking",
    	recipe = "froager2:" .. color .. "_orb",
    	output = "froager2:" .. color .. "_energy",
   })
end

oven_recipe("red")
oven_recipe("green")
oven_recipe("blue")

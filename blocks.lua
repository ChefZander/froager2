local function ore_register(color, description)
   minetest.register_node("froager2:" .. color .. "_orb_ore", {
      description = description,
      tiles = {"default_stone.png^" .. color .. "_orb_ore.png"},
      drop = {
         max_items = 1,
         items = {
           {items = {"froager2:" .. color .. "_orb"}}
         }
      },
      groups = {cracky = 3},
   })
end

ore_register("green", "Green Orb Ore <Hidden>")
ore_register("blue", "Blue Orb Ore <Hidden")
ore_register("red", "Red Orb Ore <Hidden>")

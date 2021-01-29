local function ore_register(color)
   minetest.register_ore({
     ore_type       = "scatter",
     ore            = "froager2:orb_ore_"..color,
     wherein        = "default:stone",
     clust_scarcity = 8*8*8,
     clust_num_ores = 3,
     clust_size     = 3,
     height_min     = -31000,
     height_max     = -10,
   })
end

ore_register("red")
ore_register("blue")
ore_register("green")
ore_register("purple")
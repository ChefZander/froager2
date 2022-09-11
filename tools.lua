local function register_energixed_supremium_pick(color, color_capitalized)
  minetest.register_tool("froager2:pick_energized_supremium_"..color, {
      description = color_capitalized.." Energized Supremium Pickaxe\n\nRARE",
      inventory_image = "froager2_pick_energized_supremium_"..color..".png",
      tool_capabilities = {
          max_drop_level=3,
          groupcaps= {
              cracky={times={[1]=1.00, [2]=0.375, [3]=0.25}, uses=170, maxlevel=3}
          }
      },
      groups = {pickaxe = 1}
  })
end

register_energixed_supremium_pick("red", "Red")
register_energixed_supremium_pick("green", "Green")
register_energixed_supremium_pick("blue", "Blue")
register_energixed_supremium_pick("purple", "Purple")

minetest.register_tool("froager2:pick_osphor", {
      description = "Osphor Pickaxe\nOnly made from the finest materials.\n\nRARE",
      inventory_image = "pickaxe_osphor.png",
      tool_capabilities = {
          max_drop_level=3,
          groupcaps= {
              cracky={times={[1]=0.5, [2]=0.75, [3]=1.00}, uses=130, maxlevel=3}
          }
      },
      groups = {pickaxe = 1}
  })

minetest.register_tool("froager2:drill", {
    description = "Drill\nThe default drill.\n\nLEGENDARY",
    inventory_image = "drill.png",
    tool_capabilities = {
		full_punch_interval = 0.9,
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=2.0, [2]=0.7, [3]=0.5}, uses=250, maxlevel=3}
        }
    },
	groups = {pickaxe = 1}
})

minetest.register_tool("froager2:drill_star_1", {
    description = "Drill (★)\nSo you found out about stars?\nWhen are you gonna find out about mythic stars?\n\nLEGENDARY",
    inventory_image = "drill.png",
    tool_capabilities = {
		full_punch_interval = 0.8,
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=1.9, [2]=0.6, [3]=0.4}, uses=250, maxlevel=3}
        }
    },
	groups = {pickaxe = 1}
})

minetest.register_tool("froager2:drill_star_2", {
    description = "Drill (★★)\nJust how much are you willing to do for a 0.1 stat increase?\n\nLEGENDARY",
    inventory_image = "drill.png",
    tool_capabilities = {
		full_punch_interval = 0.8,
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=1.8, [2]=0.5, [3]=0.3}, uses=250, maxlevel=3}
        }
    },
	groups = {pickaxe = 1}
})

minetest.register_tool("froager2:drill_star_3", {
    description = "Drill (★★★)\nWow, true dedication. Too bad you arent done yet.\n\nLEGENDARY",
    inventory_image = "drill.png",
    tool_capabilities = {
		full_punch_interval = 0.8,
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=1.7, [2]=0.4, [3]=0.2}, uses=250, maxlevel=3}
        }
    },
	groups = {pickaxe = 1}
})

minetest.register_tool("froager2:drill_star_4", {
    description = "Drill (★★★★)\nThe true op.\n\nLEGENDARY",
    inventory_image = "drill.png",
    tool_capabilities = {
		full_punch_interval = 0.8,
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=1.6, [2]=0.3, [3]=0.1}, uses=250, maxlevel=3}
        }
    },
	groups = {pickaxe = 1}
})

minetest.register_tool("froager2:drill_star_5", {
    description = "Drill (★★★★★)\nWelp, done with the normal stars!\n\nLEGENDARY",
    inventory_image = "drill.png",
    tool_capabilities = {
		full_punch_interval = 0.8,
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=1.5, [2]=0.2, [3]=0.05}, uses=250, maxlevel=3}
        }
    },
	groups = {pickaxe = 1}
})
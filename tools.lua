local function register_energixed_supremium_pick(color, description)
  minetest.register_tool("froager2:" .. color .. "_energized_supremium_pickaxe", {
      description = description,
      inventory_image = color .. "_energized_supremium_pickaxe.png",
      tool_capabilities = {
          max_drop_level=3,
          groupcaps= {
              cracky={times={[1]=1.00, [2]=0.375, [3]=0.25}, uses=170, maxlevel=1}
          }
      }
  })
end

register_energixed_supremium_pick("red", "Red Energized Supremium Pickaxe")
register_energixed_supremium_pick("green", "Green Energized Supremium Pickaxe")
register_energixed_supremium_pick("blue", "Blue Energized Supremium Pickaxe")

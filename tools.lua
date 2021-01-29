local function register_energixed_supremium_pick(color, color_capitalized)
  minetest.register_tool("froager2:pick_energized_supremium_"..color, {
      description = color_capitalized.." Energized Supremium Pickaxe",
      inventory_image = "froager2_pick_energized_supremium_"..color..".png",
      tool_capabilities = {
          max_drop_level=3,
          groupcaps= {
              cracky={times={[1]=1.00, [2]=0.375, [3]=0.25}, uses=170, maxlevel=1}
          }
      }
  })
end

register_energixed_supremium_pick("red", "Red")
register_energixed_supremium_pick("green", "Green")
register_energixed_supremium_pick("blue", "Blue")
register_energixed_supremium_pick("purple", "Purple")

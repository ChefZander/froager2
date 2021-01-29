--items
minetest.register_craftitem("froager2:fusionator", {
  description = "Fusionator",
  inventory_image = "froager2_fusionator.png",
})
--orbs
local function item_orb(color, color_capitalised)
    minetest.register_craftitem("froager2:orb_".. color, {
      description = color_capitalised .. " Orb",
      inventory_image = "froager2_orb_"..color..".png",
    })
end

item_orb("red", "Red")
item_orb("blue", "Blue")
item_orb("green", "Green")
item_orb("purple", "Purple")

--energy
local function item_energy(color, color_capitalised)
    minetest.register_craftitem("froager2:energy_"..color, {
      description = color_capitalised .. " Energy",
      inventory_image = "froager2_energy_"..color..".png",
    })
end

item_energy("red", "Red")
item_energy("blue", "Blue")
item_energy("green", "Green")
item_energy("purple", "Purple")

--ingots
minetest.register_craftitem("froager2:supremium_ingot", {
    description = "Supremium Ingot",
    inventory_image = "froager2_supremium_ingot.png",
})

--energized ingots
local function item_energized_supremium_ingot(color, color_capitalised)
    minetest.register_craftitem("froager2:energized_supremium_ingot_"..color, {
      description = color_capitalised .. " Energized Supremium Ingot",
      inventory_image = "froager2_supremium_ingot.png^froager2_outline_"..color..".png",
    })
end

item_energized_supremium_ingot("red", "Red")
item_energized_supremium_ingot("blue", "Blue")
item_energized_supremium_ingot("green", "Green")
item_energized_supremium_ingot("purple", "Purple")


--singularity
minetest.register_craftitem("froager2:supremium_singularity", {
    description = "Supremium Singularity",
    inventory_image = "froager2_supremium_singularity.png",
})
minetest.register_craftitem("froager2:steel_bar", {
  description = "Steel Bar",
  inventory_image = "froager2_steel_bar.png",
})
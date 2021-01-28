--items

local function item_orb(color, color_capitalised)
    minetest.register_craftitem("froager2:" .. color .. "_orb", {
      description = color_capitalised .. " Orb",
      inventory_image = color .. "_orb.png",
    })
end

item_orb("red", "Red")
item_orb("blue", "Blue")
item_orb("green", "Green")

local function item_energy(color, color_capitalised)
    minetest.register_craftitem("froager2:" .. color .. "_energy", { --energys
      description = color_capitalised .. " Energy",
      inventory_image = color .. "_energy.png",
    })
end

item_energy("red", "Red")
item_energy("blue", "Blue")
item_energy("green", "Green")

minetest.register_craftitem("froager2:supremium_ingot", {
    description = "Supremium Ingot",
    inventory_image = "supremium_ingot.png",
})

minetest.register_craftitem("froager2:green_energized_supremium_ingot", {
    description = "Green Energized Supremium Ingot",
    inventory_image = "green_energized_supremium_ingot.png",
})
minetest.register_craftitem("froager2:blue_energized_supremium_ingot", {
    description = "Blue Energized Supremium Ingot",
    inventory_image = "blue_energized_supremium_ingot.png",
})
minetest.register_craftitem("froager2:red_energized_supremium_ingot", {
    description = "Red Energized Supremium Ingot",
    inventory_image = "red_energized_supremium_ingot.png",
})
minetest.register_craftitem("froager2:supremium_singularity", {
    description = "Supremium Singularity",
    inventory_image = "missing.png",
})

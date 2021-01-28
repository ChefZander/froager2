--items

local function item_orb(color, color_capitalised)
    minetest.register_craftitem("froager2:" .. color .. "_orb", {
      description = color_capitalised .. " Orb",
      inventory_image = color .. "_orb.png",
    })
end

item_orb(red)
item_orb(blue)
item_orb(green)

minetest.register_craftitem("froager2:green_energy", { --energys
    description = "Green Energy",
    inventory_image = "green_energy.png",
})
minetest.register_craftitem("froager2:blue_energy", {
    description = "Blue Energy",
    inventory_image = "blue_energy.png",
})
minetest.register_craftitem("froager2:red_energy", {
    description = "Red Energy",
    inventory_image = "red_energy.png",
})

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

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

local function item_energized_supremium_ingot(color, color_capitalized)
   minetest.register_craftitem("froager2:" .. color .. "_energized_supremium_ingot", {
       description = color_apitalized .. " Energized Supremium Ingot",
       inventory_image = color .. "_energized_supremium_ingot.png",
   })
end

item_energized_supremium_ingot("red", "Red")
item_energized_supremium_ingot("green", "Green")
item_energized_supremium_ingot("blue", "Blue")

minetest.register_craftitem("froager2:supremium_singularity", {
    description = "Supremium Singularity",
    inventory_image = "missing.png",
})

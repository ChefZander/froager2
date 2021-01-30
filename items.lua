--items
minetest.register_craftitem("froager2:fusionator", {
  description = "Fusionator",
  inventory_image = "froager2_fusionator.png",
})
minetest.register_craftitem("froager2:fusioncore", {
  description = "Fusion Core",
  inventory_image = "froager2_fusioncore.png",
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

--energy (normal)
local function item_energy(color, color_capitalised)
    minetest.register_craftitem("froager2:energy_"..color, {
      description = color_capitalised .. " Energy",
      inventory_image = "froager2_energy_"..color..".png",
	  groups = {energy = 10}, -- Forge energy power (burntime)
    })
end

item_energy("red", "Red")
item_energy("blue", "Blue")
item_energy("green", "Green")
item_energy("purple", "Purple")

--energy (kinetic)
local function item_energy_kinetic(color, color_capitalised)
    minetest.register_craftitem("froager2:energy_kinetic_"..color, {
      description = color_capitalised .. " Kinetic Energy",
	  --apply the overlay as a mask (uses binary and)
	  inventory_image = "froager2_energy_"..color..".png^[mask:froager2_energy_kinetic_overlay.png", 
	  groups = {energy = 15, forgeable = 5}, -- Forge energy power (burntime)
    })
end

item_energy_kinetic("red", "Red")
item_energy_kinetic("blue", "Blue")
item_energy_kinetic("green", "Green")
item_energy_kinetic("purple", "Purple")

--ingots
minetest.register_craftitem("froager2:supremium_ingot", {
    description = "Supremium Ingot",
    inventory_image = "froager2_supremium_ingot.png",
})

minetest.register_craftitem("froager2:osphor_ingot", {
    description = "Osphor Ingot",
    inventory_image = "froager2_osphor_ingot.png",
})

minetest.register_craftitem("froager2:osphor_nugget", {
    description = "Osphor Nugget",
    inventory_image = "froager2_osphor_nugget.png",
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
minetest.register_craftitem("froager2:steel_rod", {
  description = "Steel Rod",
  inventory_image = "froager2_steel_rod.png",
})
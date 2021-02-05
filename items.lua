--items
local function craftitem_register(name, description, inv_img)
  minetest.register_craftitem("froager2:" .. name, {
    description = description,
    inventory_image = inv_img,
  })
end

craftitem_register("fusionator", "Fusionator", "froager2_fusionator.png")
craftitem_register("fusioncore", "Fusion Core", "froager2_fusioncore.png")

--orbs
local function item_orb(color, color_capitalised)
    minetest.register_craftitem("froager2:orb_" .. color, {
      description = color_capitalised .. " Orb",
      inventory_image = "froager2_orb_" .. color .. ".png",
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

craftitem_register("supremium_ingot", "Supremium Ingot", "froager2_supremium_ingot.png")
craftitem_register("osphor_ingot", "Osphor Ingot", "froager2_osphor_ingot.png")
craftitem_register("osphor_nugget", "Osphor Nugget", "froager2_osphor_nugget.png")

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
craftitem_register("supremium_singularity", "Supremium Singularity", "froager2_supremium_singularity.png")
craftitem_register("steel_rod", "Steel Rod", "froager2_steel_rod.png")

craftitem_register("biomass", "Biomass", "missing.png")
craftitem_register("biofuel", "Bio Fuel", "missing.png")
craftitem_register("compressed_leaves", "Compressed Leaves", "missing.png")
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
	  groups = {energy = 15, forgeable = 5, kinetic_energy = 1}, -- Forge energy power (burntime)
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

craftitem_register("biomass", "Biomass", "biomass.png")
craftitem_register("bottle_biofuel", "Biofuel in a bottle", "bottle_biofuel.png")

craftitem_register("compressed_leaves", "Compressed Leaves", "compressed_leaves.png")

craftitem_register("material_plastic", "Plastic", "material_plastic.png")

craftitem_register("mana_powder", "Mana Powder", "mana_powder.png")

craftitem_register("essence_agricum", "Agricum Essence", "essence_agricum.png")
craftitem_register("essence_inferium", "Inferium Essence", "essence_inferium.png")

craftitem_register("essence_dirt", "Dirt Essence", "essence_dirt.png")
craftitem_register("essence_stone", "Stone Essence", "essence_stone.png")
craftitem_register("essence_coal", "Coal Essence", "essence_coal.png")
craftitem_register("essence_iron", "Iron Essence", "essence_iron.png")
craftitem_register("essence_copper", "Copper Essence", "essence_copper.png")
craftitem_register("essence_tin", "Tin Essence", "essence_tin.png")
craftitem_register("essence_gold", "Gold Essence", "essence_gold.png")
craftitem_register("essence_mese", "Mese Essence", "essence_mese.png")
craftitem_register("essence_diamond", "Diamond Essence", "essence_diamond.png")

craftitem_register("shard_uranium", "Uranium Shard", "shard_uranium.png")
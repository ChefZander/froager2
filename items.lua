--items
local function craftitem_register(name, description, inv_img)
  minetest.register_craftitem("froager2:" .. name, {
    description = description,
    inventory_image = inv_img,
  })
end

craftitem_register("fusionator", "Fusionator\n\nRARE", "froager2_fusionator.png")
craftitem_register("ultimate_fusionator", "Ultimate Fusionator\n\nEPIC", "froager2_ultimate_fusionator.png")
craftitem_register("fusioncore", "Fusion Core\n\nRARE", "froager2_fusioncore.png")

--orbs
local function item_orb(color, color_capitalised)
    minetest.register_craftitem("froager2:orb_" .. color, {
      description = color_capitalised .. " Orb\n\nCOMMON",
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
      description = color_capitalised .. " Energy\n\nCOMMON",
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
      description = color_capitalised .. " Kinetic Energy\n\nCOMMON",
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

craftitem_register("supremium_ingot", "Supremium Ingot\n\nUNCOMMON", "froager2_supremium_ingot.png")
craftitem_register("osphor_ingot", "Osphor Ingot\n\nUNCOMMON", "froager2_osphor_ingot.png")
craftitem_register("osphor_nugget", "Osphor Nugget\n\nCOMMON", "froager2_osphor_nugget.png")

--energized ingots
local function item_energized_supremium_ingot(color, color_capitalised)
    minetest.register_craftitem("froager2:energized_supremium_ingot_"..color, {
      description = color_capitalised .. " Energized Supremium Ingot\n\nRARE",
      inventory_image = "froager2_supremium_ingot.png^froager2_outline_"..color..".png",
    })
end

item_energized_supremium_ingot("red", "Red")
item_energized_supremium_ingot("blue", "Blue")
item_energized_supremium_ingot("green", "Green")
item_energized_supremium_ingot("purple", "Purple")

minetest.register_craftitem("froager2:supremium_ingot_universal", {
  description = "Universal Supremium Ingot\n\nEPIC",
  inventory_image = "froager2_supremium_ingot.png^froager2_outline_universal.png",
})

--singularity
craftitem_register("supremium_singularity", "Supremium Singularity\n\nRARE", "froager2_supremium_singularity.png")

craftitem_register("steel_rod", "Steel Rod\n\nCOMMON", "froager2_steel_rod.png")
craftitem_register("steel_screw", "Steel Screw\n\nCOMMON", "steel_screw.png")
craftitem_register("steel_bar", "Steel Bar\n\nCOMMON", "steel_bar.png")
craftitem_register("steel_cable", "Steel Cable\n\nCOMMON", "steel_cable.png")


craftitem_register("circuit_basic", "Cirucit (Basic)\n\nUNCOMMON", "circuit_basic.png")
craftitem_register("circuit_advanced", "Cirucit (Advanced)\n\nRARE", "circuit_advanced.png")
craftitem_register("circuit_ultimate", "Cirucit (Ultimate)\n\nEPIC", "circuit_ultimate.png")

craftitem_register("drill_controller", "Drill Controller\n\nEPIC", "drill_controller.png")

craftitem_register("biomass", "Biomass\n\nCOMMON", "biomass.png")
craftitem_register("bottle_biofuel", "Biofuel in a bottle\n\nCOMMON", "bottle_biofuel.png")

craftitem_register("compressed_leaves", "Compressed Leaves\n\nCOMMON", "compressed_leaves.png")

craftitem_register("material_plastic", "Plastic\n\nCOMMON", "material_plastic.png")

craftitem_register("mana_powder", "Mana Powder\n\nUNCOMMON", "mana_powder.png")

craftitem_register("essence_agricum", "Agricum Essence\n\nUNCOMMON", "essence_agricum.png")
craftitem_register("essence_inferium", "Inferium Essence\n\nUNCOMMON", "essence_inferium.png")

--vanilla essences
craftitem_register("essence_dirt", "Dirt Essence\n\nCOMMON", "essence_dirt.png")
craftitem_register("essence_stone", "Stone Essence\n\nCOMMON", "essence_stone.png")
craftitem_register("essence_coal", "Coal Essence\n\nCOMMON", "essence_coal.png")
craftitem_register("essence_iron", "Iron Essence\n\nCOMMON", "essence_iron.png")
craftitem_register("essence_copper", "Copper Essence\n\nCOMMON", "essence_copper.png")
craftitem_register("essence_tin", "Tin Essence\n\nCOMMON", "essence_tin.png")
craftitem_register("essence_gold", "Gold Essence\n\nCOMMON", "essence_gold.png")
craftitem_register("essence_mese", "Mese Essence\n\nCOMMON", "essence_mese.png")
craftitem_register("essence_diamond", "Diamond Essence\n\nCOMMON", "essence_diamond.png")

--uranium
craftitem_register("essence_uranium", "Uranium Essence\n\nUNCOMMON", "essence_uranium.png")
craftitem_register("shard_uranium", "Uranium Shard\n\nUNCOMMON", "shard_uranium.png")
craftitem_register("ingot_uranium", "Uranium Ingot\n\nUNCOMMON", "ingot_uranium.png")

--lithium
craftitem_register("essence_lithium", "Lithium Essence\n\nUNCOMMON", "essence_lithium.png")
craftitem_register("shard_lithium", "Lithium Shard\n\nUNCOMMON", "shard_lithium.png")
craftitem_register("ingot_lithium", "Lithium Ingot\n\nUNCOMMON", "ingot_lithium.png")

-- the end
craftitem_register("infinity_catalyst", "Infinity Catalyst\nSo guys, we did it!\n\nLEGENDARY", "infinity_catalyst.png")
craftitem_register("infinity_essence", "Infinity Essence\n\nLEGENDARY", "essence_infinity.png")
craftitem_register("infinity_energy", "Infinity Energy\n\nLEGENDARY", "energy_infinity.png")

craftitem_register("upgrade_star", "Upgrade Star\n\nLEGENDARY", "upgrade_star.png") -- ★
craftitem_register("mythical_star", "Mythical Upgrade Star\n\nMYTHIC", "mythical_star.png") -- ✪

-- permaflight
minetest.register_craftitem("froager2:angels_ring", {
    description = "Angel's Ring\nLeft-Click: Enable flight.\n\nRARE",
    inventory_image = "angels_ring.png",
    on_use = function(itemstack, user, pointed_thing)
        local privs = minetest.get_player_privs(user:get_player_name())
        privs.fly = true
        minetest.set_player_privs(user:get_player_name(), privs)
        return itemstack
    end
})
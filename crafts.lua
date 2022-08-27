minetest.register_craft({
	output = "froager2:supremium_ingot",
	recipe = {
	{"default:glass", "default:glass", "default:glass"},
	{"default:glass", "default:mese", "default:glass"},
	{"default:glass", "default:glass", "default:glass"},
	}
})

local function craft_energized_supremium_ingot(color)
	local m = "froager2:energy_"..color
	minetest.register_craft({
    	output = "froager2:energized_supremium_ingot_"..color,
    	recipe = {
		{m,m,m},
		{m,"froager2:supremium_ingot",m},
		{m,m,m},
		}
	})
end

minetest.register_craft({
	output = "froager2:supremium_ingot_universal",
	recipe = {
		{"", "froager2:energized_supremium_ingot_red", ""},
		{"froager2:energized_supremium_ingot_green", "froager2:fusionator", "froager2:energized_supremium_ingot_blue"},
		{"", "froager2:energized_supremium_ingot_purple", ""},
	}
})

craft_energized_supremium_ingot("red")
craft_energized_supremium_ingot("blue")
craft_energized_supremium_ingot("green")
craft_energized_supremium_ingot("purple")

local function craft_energized_supremium_pick(color)
	local material = "froager2:energized_supremium_ingot_"..color
	minetest.register_craft({
		output = "froager2:pick_energized_supremium_"..color,
		recipe = {
		{material, material, material},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
		}
	})
end

craft_energized_supremium_pick("red")
craft_energized_supremium_pick("blue")
craft_energized_supremium_pick("green")
craft_energized_supremium_pick("purple")

minetest.register_craft({
	output = "froager2:supremium_singularity",
	recipe = {
		{"", "froager2:energized_supremium_ingot_red", ""},
		{"froager2:energized_supremium_ingot_green", "froager2:fusionator", "froager2:energized_supremium_ingot_blue"},
		{"", "froager2:energized_supremium_ingot_purple", ""},
	},
})

minetest.register_craft({
	output = "froager2:fusionator",
	recipe = {
		{"", "froager2:steel_rod", ""},
		{"froager2:steel_rod", "froager2:fusioncore", "froager2:steel_rod"},
		{"", "froager2:steel_rod", ""},
	}
})
minetest.register_craft({
	output = "froager2:steel_rod",
	recipe = {
		{"", "", "default:steel_ingot"},
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", ""},
	},
})

minetest.register_craft({
	output = "froager2:fusioncore",
	recipe = {
		{"", "froager2:energy_kinetic_red", ""},
		{"froager2:energy_kinetic_green", "froager2:steel_rod", "froager2:energy_kinetic_blue"},
		{"", "froager2:energy_kinetic_purple", ""},
	}
})

minetest.register_craft({
	output = "froager2:forge",
	recipe = {
		{"", "froager2:hammer", ""},
		{"default:steelblock", "default:steelblock", "default:steelblock"},
		{"default:steelblock", "default:furnace", "default:steelblock"},
	}
})

minetest.register_craft({
	output = "froager2:hammer",
	recipe = {
		{"default:steelblock", "default:steelblock", "default:steelblock"},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "froager2:block_osphor",
	recipe = {
		{"osphor_ingot", "osphor_ingot", "osphor_ingot"},
		{"osphor_ingot", "osphor_ingot", "osphor_ingot"},
		{"osphor_ingot", "osphor_ingot", "osphor_ingot"},
	}
})

minetest.register_craft({
	output = "froager2:compressed_leaves",
	recipe = {
		{"", "group:leaves", ""},
		{"group:leaves", "group:leaves", "group:leaves"},
		{"", "group:leaves", ""},
	}
})

minetest.register_craft({
	output = "froager2:biomass",
	recipe = {
		{"", "froager2:compressed_leaves", ""},
		{"froager2:compressed_leaves", "default:stick", "froager2:compressed_leaves"},
		{"", "froager2:compressed_leaves", ""},
	}
})

minetest.register_craft({
	output = "froager2:essence_agricum",
	recipe = {
		{"", "froager2:mana_powder", ""},
		{"froager2:mana_powder", "froager2:fusionator", "froager2:mana_powder"},
		{"", "froager2:mana_powder", ""},
	}
})

minetest.register_craft({
	output = "froager2:essence_inferium",
	recipe = {
		{"", "froager2:essence_agricum", ""},
		{"froager2:essence_agricum", "froager2:fusionator", "froager2:essence_agricum"},
		{"", "froager2:essence_agricum", ""},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "froager2:ingot_uranium",
	recipe = {"froager2:shard_uranium", "froager2:shard_uranium", "froager2:shard_uranium", "froager2:shard_uranium", "froager2:shard_uranium", "froager2:shard_uranium"},
})

minetest.register_craft({
	type = "shapeless",
	output = "froager2:shard_uranium 6",
	recipe = {"froager2:ingot_uranium"},
})
-- {"", "", ""},
minetest.register_craft({
	output = 'froager2:supremium_ingot',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:mese', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_craft({
	output = 'froager2:green_energized_supremium_ingot',
	recipe = {
		{'froager2:green_energy', 'froager2:green_energy', 'froager2:green_energy'},
		{'froager2:green_energy', 'froager2:supremium_ingot', 'froager2:green_energy'},
		{'froager2:green_energy', 'froager2:green_energy', 'froager2:green_energy'},
	}
})
minetest.register_craft({
	output = 'froager2:blue_energized_supremium_ingot',
	recipe = {
		{'froager2:blue_energy', 'froager2:blue_energy', 'froager2:blue_energy'},
		{'froager2:blue_energy', 'froager2:supremium_ingot', 'froager2:blue_energy'},
		{'froager2:blue_energy', 'default:glass', 'froager2:blue_energy'},
	}
})
minetest.register_craft({
	output = 'froager2:red_energized_supremium_ingot',
	recipe = {
		{'froager2:red_energy', 'froager2:red_energy', 'froager2:red_energy'},
		{'froager2:red_energy', 'froager2:supremium_ingot', 'froager2:red_energy'},
		{'froager2:red_energy', 'froager2:red_energy', 'froager2:red_energy'},
	}
})

local function craft_energized_supremium_pick(color)
   minetest.register_craft({
      output = "froager2:" .. color .."_energized_supremium_pickaxe",
      recipe = {
		{"froager2:" .. color .. "_energized_supremium_ingot", "froager2:" .. color .. "_energized_supremium_ingot", "froager2:" .. color .. "_energized_supremium_ingot"},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	  }
   })
end

craft_energized_supremium_pick(red)
craft_energized_supremium_pick(blue)
craft_energized_supremium_pick(green)

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
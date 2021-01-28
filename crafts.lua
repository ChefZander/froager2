minetest.register_craft({
	output = 'froager2:supremium_ingot',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:glass', 'default:mese', 'default:glass'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

local function craft_energized_supremium_ingot(color)
  minetest.register_craft({
    	output = "froager2:" .. color .. "_energized_supremium_ingot",
    	recipe = {
	    	{"froager2:" .. color .. "_energy", "froager2:" .. color .. "_energy", "froager2:" .. color .. "_energy"},
		    {"froager2:" .. color .. "_energy", "froager2:" .. color .. "_energy", "froager2:" .. color .. "_energy"},
		    {"froager2:" .. color .. "_energy", "froager2:" .. color .. "_energy", "froager2:" .. color .. "_energy"},
     	}
  })
end

craft_energized_supremium_ingot(red)
craft_energized_supremium_ingot(blue)
craft_energized_supremium_ingot(green)

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

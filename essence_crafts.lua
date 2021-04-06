minetest.register_craft({
    output = "froager2:essence_dirt",
    recipe = {
        {"default:dirt", "default:dirt", "default:dirt"},
        {"default:dirt", "group:kinetic_energy", "default:dirt"},
        {"default:dirt", "default:dirt", "default:dirt"},
    }
})

minetest.register_craft({
    output = "froager2:essence_stone",
    recipe = {
        {"group:stone", "group:stone", "group:stone"},
        {"group:stone", "group:kinetic_energy", "group:stone"},
        {"group:stone", "group:stone", "group:stone"},
    }
})

minetest.register_craft({
    output = "froager2:essence_coal",
    recipe = {
        {"group:coal", "group:coal", "group:coal"},
        {"group:coal", "group:kinetic_energy", "group:coal"},
        {"group:coal", "group:coal", "group:coal"},
    }
})

minetest.register_craft({
    output = "froager2:essence_iron",
    recipe = {
        {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
        {"default:steel_ingot", "group:kinetic_energy", "default:steel_ingot"},
        {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
    }
})

-- {"", "", ""},
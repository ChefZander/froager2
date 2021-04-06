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

-- {"", "", ""},
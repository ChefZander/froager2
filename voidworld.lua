minetest.register_node("froager2:spacestation_controller_fueled", {
	description = "Space Station Controller (Fueled)",
	tiles = {
        "spacestation_controller_top.png",    -- y+
        "spacestation_controller_top.png",  -- y-
        "spacestation_controller_side.png", -- x+
        "spacestation_controller_side.png",  -- x-
        "spacestation_controller_side.png",  -- z+
        "spacestation_controller_side.png", -- z-
    },
	groups = {cracky = 3},
    light_source = minetest.LIGHT_MAX,
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if clicker:is_player() then
            if clicker:get_pos().y > 29000 then
                -- is in space
                minetest.chat_send_player(clicker:get_player_name(), "Deorbiting...")
                local ppos = clicker:get_pos()
                local spawnFound = false
                local spawnRes = nil
                local yIncrement = 0
                while not spawnFound do
                    local searchPos = {x=ppos.x, y=yIncrement, z=ppos.z}
                    minetest.load_area(searchPos)
                    if minetest.get_node(searchPos).name == "air" then
                        spawnRes = searchPos
                        spawnFound = true
                    else
                        yIncrement = yIncrement + 1
                    end
                end

                clicker:move_to(spawnRes, false)
                minetest.set_node(pos, {name = "froager2:spacestation_controller"})
            else
                -- not in space
                minetest.chat_send_player(clicker:get_player_name(), "Launching...")
                local ppos = clicker:get_pos()
                minetest.load_area({x=ppos.x, y=30000, z=ppos.z})
                local node = minetest.get_node({x=ppos.x, y=30000, z=ppos.z})
                if node.name == "air" then
                    minetest.set_node({x=ppos.x, y=30000, z=ppos.z}, { name = "default:cobble" })
                end
                clicker:move_to({x=ppos.x, y=30001, z=ppos.z}, false)
                minetest.set_node(pos, {name = "froager2:spacestation_controller"})
            end
        end
    end,
})

minetest.register_node("froager2:spacestation_controller", {
    description = "Space Station Controller",
	tiles = {
        "spacestation_controller_top_nofuel.png",    -- y+
        "spacestation_controller_top_nofuel.png",  -- y-
        "spacestation_controller_side.png", -- x+
        "spacestation_controller_side.png",  -- x-
        "spacestation_controller_side.png",  -- z+
        "spacestation_controller_side.png", -- z-
    },
	groups = {cracky = 3},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if clicker:is_player() then
            local ppos = clicker:get_pos()
            local port1 = minetest.get_node({x=pos.x + 1, y=pos.y, z=pos.z})
            local port2 = minetest.get_node({x=pos.x - 1, y=pos.y, z=pos.z})
            local port3 = minetest.get_node({x=pos.x, y=pos.y, z=pos.z + 1})
            local port4 = minetest.get_node({x=pos.x, y=pos.y, z=pos.z - 1})
            if port1.name == "froager2:fuel_spacestation" then
                minetest.remove_node({x=pos.x + 1, y=pos.y, z=pos.z})
                minetest.set_node(pos, {name = "froager2:spacestation_controller_fueled"})
            elseif port2.name == "froager2:fuel_spacestation" then
                minetest.remove_node({x=pos.x - 1, y=pos.y, z=pos.z})
                minetest.set_node(pos, {name = "froager2:spacestation_controller_fueled"})
            elseif port3.name == "froager2:fuel_spacestation" then
                minetest.remove_node({x=pos.x, y=pos.y, z=pos.z + 1})
                minetest.set_node(pos, {name = "froager2:spacestation_controller_fueled"})
            elseif port4.name == "froager2:fuel_spacestation" then
                minetest.remove_node({x=pos.x, y=pos.y, z=pos.z - 1})
                minetest.set_node(pos, {name = "froager2:spacestation_controller_fueled"})
            else
                minetest.chat_send_player(clicker:get_player_name(), "The teleporter needs space station fuel!")
            end
        end
    end,
})

minetest.register_globalstep(function(dtime)
    for _, player in ipairs(minetest.get_connected_players()) do
        if player:get_pos().y > 29000 then
            minetest.chat_send_player(player:get_player_name(), "U IN SPACE WTFFF")
        end
    end
end)
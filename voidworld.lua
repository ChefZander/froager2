minetest.register_node("froager2:spacestation_controller", {
	description = "Space Station Controller",
	tiles = {"missing.png"},
	groups = {cracky = 3},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if clicker:is_player() then
            local ppos = clicker:get_pos()
            minetest.load_area({x=ppos.x, y=30000, z=ppos.z})
            local node = minetest.get_node({x=ppos.x, y=30000, z=ppos.z})
            if node.name == "air" then
                minetest.set_node({x=ppos.x, y=30000, z=ppos.z}, { name = "default:cobble" })
            end
            clicker:move_to({x=ppos.x, y=30001, z=ppos.z}, false)
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
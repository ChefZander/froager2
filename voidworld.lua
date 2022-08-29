minetest.register_node("froager2:spacestation_controller", {
	description = "Space Station Controller",
	tiles = {"missing.png"},
	groups = {cracky = 3},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if clicker:is_player() then
            local ppos = clicker:get_pos()
            local node = minetest.get_node({x=ppos.x, y=30000, z=ppos.z})
            if node.name == "air" then
                minetest.set_node({x=ppos.x, y=30000, z=ppos.z}, { name = "default:cobble" })
            end

        end
    end,
})

minetest.register_globalstep(function(dtime)
    
end)
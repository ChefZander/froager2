-- hammer

minetest.register_node("froager2:hammer", {
	description = "Iron Hammer",
	drawtype = "mesh",
	mesh = "froager2_hammer.obj",
	inventory_image = "froager2_hammer.png",
	wield_image = "froager2_hammer.png",
	tiles = {{ name = "froager2_hammer_model.png"}},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_facedir_simple = true,
	sunlight_propagates = true,
	liquids_pointable = false,
	walkable = false,
	light_source = 2,
	groups = {choppy=2, dig_immediate=3, attached_node=1},
	drop = "froager2:hammer",
	selection_box = {
		type = "fixed",
		fixed = {1/16, -8/16, -5/16, 6/16, -5/16, 4/16}, --xyzxyz
	},
	collision_box = {
		type = "fixed",
		fixed = {1/16, -8/16, -5/16, 6/16, -5/16, 4/16}, --xyzxyz
	},
	sounds = default.node_sound_wood_defaults(),
	
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 1 then
			fakestack:set_name("froager2:hammer")
		else
			fakestack:set_name("froager2:hammer_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("froager2:hammer")

		return itemstack
	end,
})

minetest.register_node("froager2:hammer_wall", {
	drawtype = "mesh",
	mesh = "froager2_hammer_wall.obj",
	tiles = {{ name = "froager2_hammer_wall_model.png",}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 2,
	groups = {choppy=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1},
	drop = "froager2:hammer",
	selection_box = {
		type = "wallmounted",
		wall_side = {-8/16, -5/16, 1/16, -5/16, 4/16, 6/16},
	},
	sounds = default.node_sound_wood_defaults()
})
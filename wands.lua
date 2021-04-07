local FIREBALL_ENTITY = {
    hp_max = 1,
    physical = true,
    weight = 5,
    collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
    visual = "cube",
    visual_size = {x=1, y=1},
    mesh = "model",
    textures = {"Fire.png"}, -- number of required textures depends on visual
    colors = {}, -- number of required colors depends on visual
    spritediv = {x=1, y=1},
    initial_sprite_basepos = {x=0, y=0},
    is_visible = true,
    makes_footstep_sound = false,
    automatic_rotate = false,
}

minetest.register_entity("froager2:fireball", FIREBALL_ENTITY)

local spawn_fireball = function(player)
	local obj = minetest.add_entity(vector.add(player:get_pos(), {x = 0, y = 1.5, z = 0}), "froager2:fireball")
	local yaw = player:get_look_horizontal()
	local dir = player:get_look_dir()
	if obj then
		obj:set_velocity(vector.multiply(dir, 20))
		obj:set_yaw(yaw)
	end
end

minetest.register_craftitem("froager2:fire_wand", {
	description = "Fire wand",
	inventory_image = "default_stick.png",
	stack_max = 1,
    on_place = function(itemstack, placer, pointed_thing)
      spawn_fireball(placer)
    end,
    on_secondary_use = function(itemstack, user, pointed_thing)
    	spawn_fireball(user)
    end
})
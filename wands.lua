local cooldown = {}

minetest.register_on_joinplayer(function(player)
	cooldown[player:get_player_name()] = false
end)

minetest.register_on_leaveplayer(function(player)
	cooldown[player:get_player_name()] = false
end)

local FIREBALL_ENTITY = {
    hp_max = 1,
    physical = false,
    weight = 5,
    collisionbox = {-0.25,-0.25,-0.25, 0.25,0.25,0.25},
    visual = "cube",
    visual_size = {x=0.5, y=0.5},
    mesh = "model",
    textures = {"fireball.png", "fireball.png", "fireball.png", "fireball.png", "fireball.png", "fireball.png"}, -- number of required textures depends on visual
    colors = {}, -- number of required colors depends on visual
    spritediv = {x=1, y=1},
    initial_sprite_basepos = {x=0, y=0},
    is_visible = true,
    makes_footstep_sound = false,
    automatic_rotate = 0,
}

minetest.register_entity("froager2:fireball", FIREBALL_ENTITY)

local spawn_fireball = function(player)
	if cooldown[player:get_player_name()] then
		minetest.chat_send_player(player:get_player_name(), "Please wait for your 3 second cooldown to end")
		return
	end
	cooldown[player:get_player_name()] = true
	minetest.after(3, function()
		cooldown[player:get_player_name()] = false
	end)
	local obj = minetest.add_entity(vector.add(player:get_pos(), {x = 0, y = 1.5, z = 0}), "froager2:fireball")
	local yaw = player:get_look_horizontal()
	local dir = player:get_look_dir()
	if obj then
		obj:set_velocity(vector.multiply(dir, 5))
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

local on_collide = function(self, pos)
	self.object:remove()
	local minp = vector.add(pos, {x = -1, y = -1, z = -1})
	local maxp = vector.add(pos, {x = 1, y = 1, z = 1})
	for _,airpos in ipairs(minetest.find_nodes_in_area(minp, maxp, "air")) do
		minetest.set_node(airpos, {name="fire:basic_flame"})
	end
end

local fireballtimer = {}
FIREBALL_ENTITY.on_step = function(self, dtime)
	if not fireballtimer[self] then
		fireballtimer[self] = 0
	end
	fireballtimer[self] = fireballtimer[self]+dtime
	if fireballtimer[self] >= 1 then
		local objects = minetest.get_objects_inside_radius(self.object:get_pos(), 0.75)
		for _,obj in ipairs(objects) do
			if obj:is_player() then--damage to players
				local hp = obj:get_hp()
				obj:set_hp(hp-4)
				self.object:remove()
			end
		end
	end
	--checks for collisions with nodes
	local pos = self.object:get_pos()
	local node = minetest.get_node(pos)
	if node.name == "air" then return end
	if node.name == "default:water_source" then return end
	on_collide(self, pos)
end

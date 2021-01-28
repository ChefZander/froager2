local path = minetest.get_modpath("froager2")

minetest.register_on_joinplayer(function(ObjectRef)
    minetest.chat_send_player(ObjectRef:get_player_name(), "Froager 2 - by Zander_200")
    minetest.chat_send_player(ObjectRef:get_player_name(), "Report bugs and request features in my discord server: https://discord.gg/MmdyHUHUuZ")
end)

--items
dofile(path.."/items.lua")
--crafts
dofile(path.."/crafts.lua")
--oven
dofile(path.."/ovencrafts.lua")
--weapons
dofile(path.."/weapons.lua")
--tools
dofile(path.."/tools.lua")
--blocks
dofile(path.."/blocks.lua")
--ores
dofile(path.."/ores.lua")
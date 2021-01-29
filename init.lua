local modpath = minetest.get_modpath("froager2")
local smartfs = dofile(minetest.get_modpath(minetest.get_current_modname()).."/smartfs.lua")

minetest.register_on_joinplayer(function(ObjectRef)
    minetest.chat_send_player(ObjectRef:get_player_name(), "Froager 2 - by Zander_200")
    minetest.chat_send_player(ObjectRef:get_player_name(), "Report bugs and request features in my discord server: https://discord.gg/MmdyHUHUuZ")
end)

local modules = {"items", "crafts", "ovencrafts", "weapons", "tools", "blocks", "ores"}

for _, module in pairs(modules) do
    dofile(modpath .. "/" .. module .. ".lua")
end

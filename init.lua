local modpath = minetest.get_modpath("froager2")

minetest.register_on_joinplayer(function(ObjectRef)
    minetest.chat_send_player(ObjectRef:get_player_name(), "Froager 2 - by Zander, j45 and Nop")
    minetest.chat_send_player(ObjectRef:get_player_name(), "Report bugs and request features in my discord server: https://discord.gg/MmdyHUHUuZ")
end)

local modules = {
    "items", 
    "crafts", 
    "ovencrafts", 
    "weapons", 
    "tools", 
    "blocks", 
    "ores", 
    "biomes", 
    "forge", 
    "hammer", 
    "essence_crafts", 
    "wands", 
    "voidworld"
}

for _, module in pairs(modules) do
    dofile(modpath .. "/" .. module .. ".lua")
end

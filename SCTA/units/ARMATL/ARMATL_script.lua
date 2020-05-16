#ARM Advanced Torpedo Launcher - Advanced Torpedo Launcher
#ARMATL
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMATL = Class(TAunit) {

    Weapons = {
         ARMATL_TORPEDO = Class(TAweapon) {},
    },

}

TypeClass = ARMATL
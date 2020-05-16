#CORE Torpedo Launcher - Torpedo Launcher
#CORTL
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORTL = Class(TAunit) {

    Weapons = {
         COAX_TORPEDO = Class(TAweapon) {},
    },

}

TypeClass = CORTL
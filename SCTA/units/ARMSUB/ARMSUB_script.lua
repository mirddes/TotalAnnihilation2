#ARM Lurker - Submarine
#ARMCRUS
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMSUB = Class(TAunit) {
    Weapons = {
        ARM_TORPEDO = Class(TAweapon) {
	},
    },
}


TypeClass = ARMSUB
#CORE Shark - Submarine Killer
#CORSHARK
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORSHARK = Class(TAunit) {
    Weapons = {
        CORSMART_TORPEDO = Class(TAweapon) {
	},
    },
}


TypeClass = CORSHARK
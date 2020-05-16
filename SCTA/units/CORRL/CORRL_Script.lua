#CORE Pulverizer - Missile Tower
#CORRL
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORRL = Class(TAunit) {

	Weapons = {
		CORRL_MISSILE = Class(TAweapon) {},
	},
}

TypeClass = CORRL

#ARM Panther - Lightning Tank
#ARMLATNK
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMLATNK = Class(TAunit) {
	Weapons = {
		ARMKBOT_MISSILE = Class(TAweapon) {},
		ARMLATNK_WEAPON = Class(TAweapon) {},
	},
}

TypeClass = ARMLATNK

#ARM Conqueror - Cruiser
#ARMCRUS
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMCRUS = Class(TAunit) {
	Weapons = {
		ARM_CRUS = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
		ARMDEPTHCHARGE = Class(TAweapon) {},
	},
}

TypeClass = ARMCRUS

#CORE Enforcer - Destroyer
#CORROY
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORROY = Class(TAunit) {
	Weapons = {
		CORE_ROY = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
		COREDEPTHCHARGE = Class(TAweapon) {},
	},
}

TypeClass = CORROY

#ARM Skeeter - Scout Ship
#ARMPT
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMPT = Class(TAunit) {
	Weapons = {
		ARMPT_LASER = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
		ARMKBOT_MISSILE = Class(TAweapon) {},
	},
}

TypeClass = ARMPT

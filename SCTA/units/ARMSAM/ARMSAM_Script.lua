#ARM Samson - Mobile Missile Launcher
#ARMSAM
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMSAM = Class(TAunit) {
	Weapons = {
		ARMTRUCK_MISSILE = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
	},
}

TypeClass = ARMSAM

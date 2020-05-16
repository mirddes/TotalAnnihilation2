#ARM Stumpy - Medium Assault Tank
#ARMSTUMP
#
#Blueprint created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMSTUMP = Class(TAunit) {

	Weapons = {
		ARM_LIGHTCANNON = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15) #check flare time
			end,
		},
	},
}
TypeClass = ARMSTUMP
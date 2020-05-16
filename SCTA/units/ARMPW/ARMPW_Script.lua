#ARM Peewee - Infantry Kbot
#ARMFLASH
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMPW = Class(TAunit) {
	
	Weapons = {
		EMG = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.1)
			end,
		},
	},
}

TypeClass = ARMPW

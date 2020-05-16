#ARM Flea - Fast Light Scout Kbot
#ARMFLEA
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMFLEA = Class(TAunit) {
	
	Weapons = {
		ARMFLEA_WEAPON = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.1)
			end,
		},
	},
}

TypeClass = ARMFLEA

#ARM Flash - Fast Assault Tank
#ARMFLASH
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local Projectile = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

ARMFLASH = Class(TAunit) {
	Weapons = {
		EMG = Class(Projectile) {
			OnWeaponFired = function(self)
				Projectile.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
	},
}

TypeClass = ARMFLASH

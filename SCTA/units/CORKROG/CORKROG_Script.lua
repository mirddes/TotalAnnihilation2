#CORE Krogoth - Experimental Kbot
#CORKROG
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local Projectile = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORKROG = Class(TAunit) {
	
	Weapons = {
		CORKROG_FIRE = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
		CORKROG_HEAD = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
		CORKROG_ROCKET = Class(TAweapon) {},
	},
}

TypeClass = CORKROG

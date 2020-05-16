#ARM Zeus - Assault Kbot
#ARMZEUS
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMZEUS = Class(TAunit) {

	Weapons = {
		LIGHTNING = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,

			PlayFxWeaponUnpackSequence = function(self)
				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,	

			PlayFxWeaponPackSequence = function(self)
				TAweapon.PlayFxWeaponPackSequence(self)
			end,	
		},
	},
}
TypeClass = ARMZEUS
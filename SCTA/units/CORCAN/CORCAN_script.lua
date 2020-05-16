#CORE The Can - Armored Assault Kbot
#CORCAN
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORCAN = Class(TAunit) {

	Weapons = {
		CORE_CANLASER = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15) #check flare time
			end,
		},
	},
}
TypeClass = CORCAN
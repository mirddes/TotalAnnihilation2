#CORE Thud - Artillery Kbot
#CORTHUD
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORTHUD = Class(TAunit) {
	

	Weapons = {
		CORE_THUD = Class(TAweapon) {

			OnWeaponFired = function(self)
				TAunit.ShowMuzzleFlare(self, 0.1)
				TAweapon.OnWeaponFired(self)
			end,
		},
	},
}

TypeClass = CORTHUD
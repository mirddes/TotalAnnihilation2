#CORE Leveler - Riot Tank
#CORLEVLR
#
#Blueprint created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORLEVLR = Class(TAunit) {

	Weapons = {
		CORLEVLR_WEAPON = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
	},
}
TypeClass = CORLEVLR
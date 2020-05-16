#CORE Raider - Medium Assault Tank
#CORRAID
#
#Blueprint created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORRAID = Class(TAunit) {

	Weapons = {
		CORE_LIGHTCANNON = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
	},
}
TypeClass = CORRAID
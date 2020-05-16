#ARM Invader - Crawling Bomb
#ARMVADER
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMVADER = Class(TAunit) {
	attacked = false,

	Weapons = {
		CRAWL_BLAST = Class(TAweapon) {
			OnWeaponFired = function(self)
				self.unit.attacked = true
				self.unit:Kill()
			end,
		},
	},

	OnKilled = function(self, instigator, type, overkillRatio)
		if self.attacked == true then
			instigator = self
		end
		TAunit.OnKilled(self, instigator, type, overkillRatio)
		
	end,
}
TypeClass = ARMVADER
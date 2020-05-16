#ARM Defender - NS - Missile Tower - Naval Series
#ARMFRT
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMFRT = Class(TAunit) {
	currentBarrel = 0,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			barrel = CreateRotator(self, 'barrel', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		ARMFRT_MISSILE = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
				self.unit.currentBarrel = self.unit.currentBarrel + 1
				if self.unit.currentBarrel == 3 then
					self.unit.currentBarrel = 0
				end

				--TURN barrel to z-axis <119.99> SPEED <400.09>; (for each turn)
				self.unit.Spinners.barrel:SetGoal(-120 * self.unit.currentBarrel)
				self.unit.Spinners.barrel:SetSpeed(400)
			end,
		},
	},
}

TypeClass = ARMFRT

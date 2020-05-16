#CORE Gaat Gun - Heavy Laser Tower
#CORHLT
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORHLT = Class(TAunit) {
	currentBarrel = 0,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			spindle = CreateRotator(self, 'spindle', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		CORE_LASERH1 = Class(TAweapon) 
		{
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
				self.unit.currentBarrel = self.unit.currentBarrel + 1
				if self.unit.currentBarrel == 3 then
					self.unit.currentBarrel = 0
				end

				self.unit.Spinners.spindle:SetGoal(-120 * self.unit.currentBarrel)
				self.unit.Spinners.spindle:SetSpeed(200)
			end,

		},
	},
}

TypeClass = CORHLT

#ARM Zipper - Fast Attack Kbot
#ARMFAST
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMFAST = Class(TAunit) {

	OnCreate = function(self)
		self.Spinners = {
			rloarm = CreateRotator(self, 'Recoil', 'x', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		TAunit.OnCreate(self)
	end,

	Weapons = {
		ARM_FAST = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.1)
				ForkThread(self.RecoilThread,self)
			end,

			RecoilThread = function(self)
				--TURN rloarm to x-axis <-49.99> NOW;
				self.unit.Spinners.rloarm:SetGoal(-50)
				self.unit.Spinners.rloarm:SetSpeed(5000)
				WaitFor(self.unit.Spinners.rloarm)
				self.unit.Spinners.rloarm:SetGoal(0)
				self.unit.Spinners.rloarm:SetSpeed(200)
			end,
		},
	},
}
TypeClass = ARMFAST
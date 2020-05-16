#ARM Jethro - Anti-Air Kbot
#ARMJETH
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMJETH = Class(TAunit) {
	
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			luparm = CreateRotator(self, 'LeftArm', 'z', nil, 0, 0, 0),
			lloarm = CreateRotator(self, 'LeftGun', 'z', nil, 0, 0, 0),
			ruparm = CreateRotator(self, 'RightArm', 'z', nil, 0, 0, 0),
			rloarm = CreateRotator(self, 'RightGun', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		ARMKBOT_MISSILE = Class(TAweapon) {

			OnWeaponFired = function(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
				TAweapon.OnWeaponFired(self)
			end,

			PlayFxWeaponUnpackSequence = function(self)

				--TURN luparm to z-axis <-73.47> SPEED <212.40>
				self.unit.Spinners.luparm:SetGoal(75.5)
				self.unit.Spinners.luparm:SetSpeed(218.50)

				--TURN lloarm to z-axis <90.00> SPEED <260.17>
				self.unit.Spinners.lloarm:SetGoal(-90)
				self.unit.Spinners.lloarm:SetSpeed(260.17)

				--TURN rloarm to z-axis <-90.00> SPEED <260.17>
				self.unit.Spinners.rloarm:SetGoal(90)
				self.unit.Spinners.rloarm:SetSpeed(260.17)

				--TURN ruparm to z-axis <75.58> SPEED <218.50>
				self.unit.Spinners.ruparm:SetGoal(-75.5)
				self.unit.Spinners.ruparm:SetSpeed(218.50)

				--SLEEP <346>
				WaitSeconds(0.35)

				--SLEEP <354>
				WaitSeconds(0.35)

				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,

			PlayFxWeaponPackSequence = function(self)
				--TURN luparm to z-axis <0> SPEED <66.99>
				self.unit.Spinners.luparm:SetGoal(0)
				self.unit.Spinners.luparm:SetSpeed(67)

				--TURN lloarm to z-axis <0> SPEED <82.06>
				self.unit.Spinners.lloarm:SetGoal(0)
				self.unit.Spinners.lloarm:SetSpeed(82.067)
	
				--TURN rloarm to z-axis <0> SPEED <82.06>
				self.unit.Spinners.rloarm:SetGoal(0)
				self.unit.Spinners.rloarm:SetSpeed(82.06)

				--TURN ruparm to z-axis <0> SPEED <68.91>
				self.unit.Spinners.ruparm:SetGoal(0)
				self.unit.Spinners.ruparm:SetSpeed(67)

				TAweapon.PlayFxWeaponPackSequence(self)
			end,
		},
	},
}

TypeClass = ARMJETH

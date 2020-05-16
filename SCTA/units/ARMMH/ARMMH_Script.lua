#ARM Wombat - Hovercraft Rocket Launcher
#ARMMH
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMMH = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			box = CreateRotator(self, 'box', 'x', nil, 0, 0, 0),
			base = CreateRotator(self, 'ARMMH', 'x', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		ARMMH_WEAPON = Class(TAweapon) {

			PlayFxWeaponUnpackSequence = function(self)

				--TURN base to x-axis <1.05> SPEED <2.99>
				self.unit.Spinners.base:SetGoal(1.05)
				self.unit.Spinners.base:SetSpeed(2.99)

				--TURN box to x-axis <-20.39> SPEED <57.93>
				self.unit.Spinners.box:SetGoal(-20.39)
				self.unit.Spinners.box:SetSpeed(57.93)

				--SLEEP <352>
				WaitSeconds(0.35)

				--TURN base to x-axis <0> SPEED <2.97>
				self.unit.Spinners.base:SetGoal(0)
				self.unit.Spinners.base:SetSpeed(2.97)

				--TURN box to x-axis <-70.31> SPEED <141.05>
				self.unit.Spinners.box:SetGoal(-70.31)
				self.unit.Spinners.box:SetSpeed(141.05)

				--SLEEP <354>
				WaitSeconds(0.35)

				--TURN base to x-axis <-3.15> SPEED <8.96>
				self.unit.Spinners.base:SetGoal(-3.15)
				self.unit.Spinners.base:SetSpeed(8.96)

				--TURN box to x-axis <-93.15> SPEED <64.74>
				self.unit.Spinners.box:SetGoal(-93.15)
				self.unit.Spinners.box:SetSpeed(64.74)

				--SLEEP <353>
				WaitSeconds(0.35)

				WaitFor(self.unit.Spinners.box)

				--TURN base to x-axis <0> SPEED <8.91>
				self.unit.Spinners.base:SetGoal(0)
				self.unit.Spinners.base:SetSpeed(8.91)

				--TURN box to x-axis <-90.00> SPEED <8.91>
				self.unit.Spinners.box:SetGoal(-90.00)
				self.unit.Spinners.box:SetSpeed(8.91)

				--SLEEP <355>
				WaitSeconds(0.35)

				WaitFor(self.unit.Spinners.box)

				--SLEEP <16>

				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,

			PlayFxWeaponPackSequence = function(self)

				--TURN base to x-axis <-3.15> SPEED <12.07>
				self.unit.Spinners.base:SetGoal(-3.15)
				self.unit.Spinners.base:SetSpeed(12.07)

				--TURN box to x-axis <-93.15> SPEED <12.07>
				self.unit.Spinners.box:SetGoal(-93.15)
				self.unit.Spinners.box:SetSpeed(12.07)

				--SLEEP <262>
				WaitSeconds(0.25)

				--TURN base to x-axis <0> SPEED <11.89>
				self.unit.Spinners.base:SetGoal(0)
				self.unit.Spinners.base:SetSpeed(11.89)

				--TURN box to x-axis <-70.31> SPEED <85.92>
				self.unit.Spinners.box:SetGoal(-70.31)
				self.unit.Spinners.box:SetSpeed(85.92)

				--SLEEP <266>
				WaitSeconds(0.25)

				--TURN base to x-axis <1.05> SPEED <3.99>
				self.unit.Spinners.base:SetGoal(1.05)
				self.unit.Spinners.base:SetSpeed(3.99)

				--TURN box to x-axis <-20.39> SPEED <189.14>
				self.unit.Spinners.box:SetGoal(-20.39)
				self.unit.Spinners.box:SetSpeed(189.14)

				--SLEEP <264>
				WaitSeconds(0.25)

				--TURN base to x-axis <0> SPEED <3.95>
				self.unit.Spinners.base:SetGoal(0)
				self.unit.Spinners.base:SetSpeed(3.95)

				--TURN box to x-axis <0> SPEED <76.38>
				self.unit.Spinners.box:SetGoal(0)
				self.unit.Spinners.box:SetSpeed(76.38)

				--SLEEP <267>
				WaitSeconds(0.25)

				WaitFor(self.unit.Spinners.box)

				--SLEEP <13>

				TAweapon.PlayFxWeaponPackSequence(self)
			end,
		},
	},
}

TypeClass = ARMMH

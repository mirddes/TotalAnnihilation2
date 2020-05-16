#ARM Swatter - Anti-Air Hovercraft
#ARMAH
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMAH = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Sliders = {
			box = CreateSlider(self, 'box'),
		}
		self.Spinners = {
			box = CreateRotator(self, 'box', 'x', nil, 0, 0, 0),
			base = CreateRotator(self, 'ARMAH', 'x', nil, 0, 0, 0),
		}
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		ARMAH_WEAPON = Class(TAweapon) {

			PlayFxWeaponUnpackSequence = function(self)

				--MOVE Box to y-axis <1.95> SPEED <14.00>
				--MOVE Box to z-axis <-0.60> SPEED <4.00>
				self.unit.Sliders.box:SetGoal(0,1.95,-0.6)
				self.unit.Sliders.box:SetSpeed(14)

				--TURN Box to x-axis <23.55> SPEED <174.51>
				self.unit.Spinners.box:SetGoal(-23.55)
				self.unit.Spinners.box:SetSpeed(174.51)

				--TURN base to x-axis <-2.07> SPEED <15.41>
				self.unit.Spinners.base:SetGoal(-2.07)
				self.unit.Spinners.base:SetSpeed(15.41)

				--SLEEP <135>
				WaitSeconds(0.1)

				--MOVE Box to y-axis <2.9> SPEED <6.00>
				self.unit.Sliders.box:SetGoal(0,2.9,-0.6)
				self.unit.Sliders.box:SetSpeed(6)

				--TURN Box to x-axis <0> SPEED <171.97>
				self.unit.Spinners.box:SetGoal(0)
				self.unit.Spinners.box:SetSpeed(171.97)

				--TURN base to x-axis <0> SPEED <15.19>
				self.unit.Spinners.base:SetGoal(0)
				self.unit.Spinners.base:SetSpeed(15.19)

				--SLEEP <137>
				WaitSeconds(0.1)

				--MOVE Box to y-axis <3.35> SPEED <3.00>
				--MOVE Box to z-axis <2.24> SPEED <20.00>
				self.unit.Sliders.box:SetGoal(0,3.35,2.24)
				self.unit.Sliders.box:SetSpeed(10)

				--SLEEP <7>

				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,

			PlayFxWeaponPackSequence = function(self)

				--MOVE Box to y-axis <2.9> SPEED <3.00>
				--MOVE Box to z-axis <-0.6> SPEED <18.00>
				self.unit.Sliders.box:SetGoal(0,2.9,-0.6)
				self.unit.Sliders.box:SetSpeed(10)

				--SLEEP <150>
				WaitSeconds(0.15)

				--MOVE Box to y-axis <1.95> SPEED <6.00>
				self.unit.Sliders.box:SetGoal(0,1.95,-0.6)
				self.unit.Sliders.box:SetSpeed(6)

				--TURN Box to x-axis <23.55> SPEED <157.06>
				self.unit.Spinners.box:SetGoal(23.55)
				self.unit.Spinners.box:SetSpeed(157.06)

				--TURN base to x-axis <-2.07> SPEED <13.87>
				self.unit.Spinners.base:SetGoal(-2.07)
				self.unit.Spinners.base:SetSpeed(13.87)

				--SLEEP <150>
				WaitSeconds(0.15)

				--MOVE Box to y-axis <0> SPEED <12.00>
				--MOVE Box to z-axis <0> SPEED <3.00>
				self.unit.Sliders.box:SetGoal(0,0,0)
				self.unit.Sliders.box:SetSpeed(9)

				--TURN Box to x-axis <0> SPEED <156.02>
				self.unit.Spinners.box:SetGoal(0)
				self.unit.Spinners.box:SetSpeed(156.02)

				--TURN base to x-axis <0> SPEED <13.78>
				self.unit.Spinners.base:SetGoal(0)
				self.unit.Spinners.base:SetSpeed(13.78)

				--SLEEP <7>
				TAweapon.PlayFxWeaponPackSequence(self)
			end,
},
	},
}

TypeClass = ARMAH

#CORE Fortitude Missile Defense - Anti Missile Defense System
#CORFMD
#
#Script created by Raevn

local TAnoassistbuild = import('/mods/SCTA/lua/TAnoassistbuild.lua').TAnoassistbuild
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORFMD = Class(TAnoassistbuild) {
	currentRound = 1,
	PackTime = 0,

	OnCreate = function(self)
		TAnoassistbuild.OnCreate(self)
		self.Sliders = {
			dummy = CreateSlider(self, 'dummy'),
			drawer = CreateSlider(self, 'drawer'),
			wedge = CreateSlider(self, 'wedge'),
		}
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		FMD_ROCKET = Class(TAweapon) {

			OnWeaponFired = function(self)
				--HIDE dummy;
				self.unit:HideBone('dummy', true)

				#Can this be put into HideBone or somesuch in the blueprint instead
				TAweapon.OnWeaponFired(self)
			end,

    			PlayFxRackReloadSequence = function(self)
				--SLEEP <1000>;
				WaitSeconds(1.0)

				--MOVE dummy to x-axis <0.25> SPEED <391.00>;
				self.unit.Sliders.dummy:SetGoal(0.25,0,0)
				self.unit.Sliders.dummy:SetSpeed(391)

				--SLEEP <6>;

				--MOVE drawer to y-axis <0> SPEED <16.00>;
				self.unit.Sliders.drawer:SetGoal(0,0,0)
				self.unit.Sliders.drawer:SetSpeed(16)

				--SLEEP <567>;
				--SLEEP <4>;
				--SLEEP <1000>;
				#WaitSeconds(1.6)

				--MOVE drawer to y-axis <9.40> SPEED <22.00>;
				self.unit.Sliders.drawer:SetGoal(0,9.4,0)
				self.unit.Sliders.drawer:SetSpeed(22)

				--SLEEP <427>;
				#WaitSeconds(0.4)

				--MOVE dummy to x-axis <-2.04> SPEED <7.00>;
				self.unit.Sliders.dummy:SetGoal(-2.04,0,0)
				self.unit.Sliders.dummy:SetSpeed(7)

				--SLEEP <316>;
				--SLEEP <4>;
				--SLEEP <1000>;
				#WaitSeconds(1.3)

				#Show dummy?
				self.unit:ShowBone('dummy', true)

				TAunit.PlayFxRackReloadSequence(self)
			end,

			PlayFxWeaponUnpackSequence = function(self)

				--MOVE wedge to x-axis <2.29> SPEED <2.00>;
				self.unit.Sliders.wedge:SetGoal(2.29,0,0)
				self.unit.Sliders.wedge:SetSpeed(2)

				--SLEEP <907>;
				#WaitSeconds(0.9)

				--MOVE drawer to y-axis <9.40> SPEED <16.00>;
				self.unit.Sliders.drawer:SetGoal(0,9.4,0)
				self.unit.Sliders.drawer:SetSpeed(16)

				--SLEEP <584>;
				#WaitSeconds(0.6)

				--MOVE dummy to x-axis <-2.09> SPEED <4.00>;
				self.unit.Sliders.dummy:SetGoal(-2.09,0,0)
				self.unit.Sliders.dummy:SetSpeed(4)

				--SLEEP <440>;
				--SLEEP <5>;
				#WaitSeconds(0.4)

				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,


			PlayFxWeaponPackSequence = function(self)
				--MOVE dummy to x-axis <0> SPEED <139.00>;
				self.unit.Sliders.dummy:SetGoal(0,0,0)
				self.unit.Sliders.dummy:SetSpeed(139)

				--SLEEP <15>;

				--MOVE drawer to y-axis <0> SPEED <14.00>;
				self.unit.Sliders.drawer:SetGoal(0,0,0)
				self.unit.Sliders.drawer:SetSpeed(14)

				--SLEEP <645>;
				#WaitSeconds(0.6)

				--MOVE wedge to x-axis <0> SPEED <1.00>;
				self.unit.Sliders.wedge:SetGoal(0,0,0)
				self.unit.Sliders.wedge:SetSpeed(1)

				--SLEEP <1262>;
				--SLEEP <6>;
				#WaitSeconds(1.3)

				TAweapon.PlayFxWeaponPackSequence(self)
			end,
		},
	},
}

TypeClass = CORFMD

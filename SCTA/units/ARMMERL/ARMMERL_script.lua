#ARM Merl - Mobile Rocket Launcher
#ARMMERL
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMMERL = Class(TAunit) {
	
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			door1 = CreateRotator(self, 'Door_01', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'Door_02', 'z', nil, 0, 0, 0),
			arm = CreateRotator(self, 'Arm', 'x', nil, 0, 0, 0),
		}
		self.Sliders = {
			door1 = CreateSlider(self, 'Door_01'),
			door2 = CreateSlider(self, 'Door_02'),
			plate = CreateSlider(self, 'Plate'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		ARMTRUCK_ROCKET = Class(TAweapon) {

    			PlayFxRackReloadSequence = function(self)

				--TURN arm to x-axis <0> SPEED <175.41>;
				self.unit.Spinners.arm:SetGoal(0)
				self.unit.Spinners.arm:SetSpeed(175.41)

				--SLEEP <512>;
				WaitSeconds(0.5)

				--MOVE plate to y-axis <0> SPEED <5.00>;
				self.unit.Sliders.plate:SetGoal(0,0,0)
				self.unit.Sliders.plate:SetSpeed(5)

				--SLEEP <518>;
				WaitSeconds(0.5)

				--MOVE door1 to y-axis <0> SPEED <4.00>;
				self.unit.Sliders.door1:SetGoal(0,0,0)
				self.unit.Sliders.door1:SetSpeed(4)

				--MOVE door2 to y-axis <0> SPEED <5.00>;
				self.unit.Sliders.door2:SetGoal(0,0,0)
				self.unit.Sliders.door2:SetSpeed(4)

				--SLEEP <520>;
				WaitSeconds(0.5)

				--TURN door1 to z-axis <0> SPEED <171.71>;
				self.unit.Spinners.door1:SetGoal(0)
				self.unit.Spinners.door1:SetSpeed(172)

				--TURN door2 to z-axis <0> SPEED <173.45>;
				self.unit.Spinners.door2:SetGoal(0)
				self.unit.Spinners.door2:SetSpeed(172)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--SLEEP <25>;
				WaitSeconds(0.025)

				self.unit:ShowBone('Muzzle', true)

				--TURN door1 to z-axis <-89.09> SPEED <143.51>;
				self.unit.Spinners.door1:SetGoal(90)
				self.unit.Spinners.door1:SetSpeed(145)

				--TURN door2 to z-axis <90.00> SPEED <144.96>;
				self.unit.Spinners.door2:SetGoal(-90)
				self.unit.Spinners.door2:SetSpeed(145)

				--SLEEP <621>;
				WaitSeconds(0.6)

				--MOVE door1 to y-axis <-2.55> SPEED <4.00>;
				self.unit.Sliders.door1:SetGoal(-2.6,0,0)
				self.unit.Sliders.door1:SetSpeed(4)

				--MOVE door2 to y-axis <-2.60> SPEED <4.00>;
				self.unit.Sliders.door2:SetGoal(2.6,0,0)
				self.unit.Sliders.door2:SetSpeed(4)

				--SLEEP <627>;
				WaitSeconds(0.65)

				--MOVE plate to y-axis <3.10> SPEED <4.00>;
				self.unit.Sliders.plate:SetGoal(0,3.1,0)
				self.unit.Sliders.plate:SetSpeed(4)

				--SLEEP <628>;
				WaitSeconds(0.65)

				--TURN arm to x-axis <-89.98> SPEED <143.31>;
				self.unit.Spinners.arm:SetGoal(-90)
				self.unit.Spinners.arm:SetSpeed(143.31)

				--SLEEP <628>;
				WaitSeconds(0.65)

				TAweapon.PlayFxRackReloadSequence(self)
			end,

			PlayFxWeaponUnpackSequence = function(self)
				--TURN door1 to z-axis <-89.09> SPEED <143.51>;
				self.unit.Spinners.door1:SetGoal(90)
				self.unit.Spinners.door1:SetSpeed(145)

				--TURN door2 to z-axis <90.00> SPEED <144.96>;
				self.unit.Spinners.door2:SetGoal(-90)
				self.unit.Spinners.door2:SetSpeed(145)

				--SLEEP <621>;
				WaitSeconds(0.6)

				--MOVE door1 to y-axis <-2.55> SPEED <4.00>;
				self.unit.Sliders.door1:SetGoal(-2.6,0,0)
				self.unit.Sliders.door1:SetSpeed(4)

				--MOVE door2 to y-axis <-2.60> SPEED <4.00>;
				self.unit.Sliders.door2:SetGoal(2.6,0,0)
				self.unit.Sliders.door2:SetSpeed(4)

				--SLEEP <627>;
				WaitSeconds(0.65)

				--MOVE plate to y-axis <3.10> SPEED <4.00>;
				self.unit.Sliders.plate:SetGoal(0,3.1,0)
				self.unit.Sliders.plate:SetSpeed(4)

				--SLEEP <628>;
				WaitSeconds(0.65)

				--TURN arm to x-axis <-89.98> SPEED <143.31>;
				self.unit.Spinners.arm:SetGoal(-90)
				self.unit.Spinners.arm:SetSpeed(143.31)

				--SLEEP <628>;
				WaitSeconds(0.65)
				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,

			PlayFxWeaponPackSequence = function(self)
				--TURN arm to x-axis <0> SPEED <175.41>;
				self.unit.Spinners.arm:SetGoal(0)
				self.unit.Spinners.arm:SetSpeed(175.41)

				--SLEEP <512>;
				WaitSeconds(0.5)

				--MOVE plate to y-axis <0> SPEED <5.00>;
				self.unit.Sliders.plate:SetGoal(0,0,0)
				self.unit.Sliders.plate:SetSpeed(5)

				--SLEEP <518>;
				WaitSeconds(0.5)

				--MOVE door1 to y-axis <0> SPEED <4.00>;
				self.unit.Sliders.door1:SetGoal(0,0,0)
				self.unit.Sliders.door1:SetSpeed(4)

				--MOVE door2 to y-axis <0> SPEED <5.00>;
				self.unit.Sliders.door2:SetGoal(0,0,0)
				self.unit.Sliders.door2:SetSpeed(4)

				--SLEEP <520>;
				WaitSeconds(0.5)

				--TURN door1 to z-axis <0> SPEED <171.71>;
				self.unit.Spinners.door1:SetGoal(0)
				self.unit.Spinners.door1:SetSpeed(172)

				--TURN door2 to z-axis <0> SPEED <173.45>;
				self.unit.Spinners.door2:SetGoal(0)
				self.unit.Spinners.door2:SetSpeed(172)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--SLEEP <25>;

				TAweapon.PlayFxWeaponPackSequence(self)
			end,
		},
	},
}
TypeClass = ARMMERL

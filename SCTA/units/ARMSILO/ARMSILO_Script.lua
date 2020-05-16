#ARM Retaliator - Nuclear Missile Launcher
#ARMSILO
#
#Script created by Raevn

local TAnoassistbuild = import('/mods/SCTA/lua/TAnoassistbuild.lua').TAnoassistbuild
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMSILO = Class(TAnoassistbuild) {
	
	OnCreate = function(self)
		TAnoassistbuild.OnCreate(self)
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
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		NUCLEAR_MISSILE = Class(TAweapon) {
			PlayFxWeaponUnpackSequence = function(self)

				--TURN door1 to z-axis <-89.54> SPEED <47.14>;
				self.unit.Spinners.door1:SetGoal(90)
				self.unit.Spinners.door1:SetSpeed(47.37)

				--TURN door2 to z-axis <90.00> SPEED <47.37>;
				self.unit.Spinners.door2:SetGoal(-90)
				self.unit.Spinners.door2:SetSpeed(47.37)

				--SLEEP <1900>
				WaitSeconds(1.9)

				--MOVE door1 to y-axis <-6.09> SPEED <3.00>;
				self.unit.Sliders.door1:SetGoal(-6,0,0)
				self.unit.Sliders.door1:SetSpeed(3)

				--MOVE door2 to y-axis <-6.10> SPEED <3.00>;
				self.unit.Sliders.door2:SetGoal(6,0,0)
				self.unit.Sliders.door2:SetSpeed(3)

				--SLEEP <1950>
				WaitSeconds(2)

				--MOVE plate to y-axis <8.00> SPEED <4.00>;
				self.unit.Sliders.plate:SetGoal(0,8,0)
				self.unit.Sliders.plate:SetSpeed(4)

				--SLEEP <1970>
				WaitSeconds(2)

				--TURN arm to x-axis <-90.00> SPEED <45.55>;
				self.unit.Spinners.arm:SetGoal(-90)
				self.unit.Spinners.arm:SetSpeed(45.55)

				--SLEEP <1976>
				WaitSeconds(2)

				--SLEEP <114>
				WaitSeconds(0.1)

				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,

			PlayFxWeaponPackSequence = function(self)
				--TURN arm to x-axis <0> SPEED <47.37>;
				self.unit.Spinners.arm:SetGoal(0)
				self.unit.Spinners.arm:SetSpeed(47.37)

				--SLEEP <1900>;
				WaitSeconds(1.9)

				--MOVE plate to y-axis <0> SPEED <4.00>;
				self.unit.Sliders.plate:SetGoal(0,0,0)
				self.unit.Sliders.plate:SetSpeed(4)

				--SLEEP <1960>;
				WaitSeconds(2)

				--MOVE door1 to y-axis <0> SPEED <3.00>;
				self.unit.Sliders.door1:SetGoal(0,0,0)
				self.unit.Sliders.door1:SetSpeed(3)

				--MOVE door2 to y-axis <0> SPEED <3.00>;
				self.unit.Sliders.door2:SetGoal(0,0,0)
				self.unit.Sliders.door2:SetSpeed(3)

				--SLEEP <1968>;
				WaitSeconds(2)

				--TURN door1 to z-axis <0> SPEED <45.41>;
				self.unit.Spinners.door1:SetGoal(0)
				self.unit.Spinners.door1:SetSpeed(45.5)

				--TURN door2 to z-axis <0> SPEED <45.64>;
				self.unit.Spinners.door2:SetGoal(0)
				self.unit.Spinners.door2:SetSpeed(45.5)

				--SLEEP <1972>;
				WaitSeconds(2)

				--SLEEP <110>;
				WaitSeconds(0.1)

				TAweapon.PlayFxWeaponPackSequence(self)
			end,
		},
	},
}

TypeClass = ARMSILO

#CORE Silencer - Nuclear Missile Launcher
#CORSILO
#
#Script created by Raevn

local TAnoassistbuild = import('/mods/SCTA/lua/TAnoassistbuild.lua').TAnoassistbuild
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORSILO = Class(TAnoassistbuild) {
	
	OnCreate = function(self)
		TAnoassistbuild.OnCreate(self)
		self.Spinners = {
			doorb1 = CreateRotator(self, 'doorb1', 'x', nil, 0, 0, 0),
			doorb2 = CreateRotator(self, 'doorb2', 'x', nil, 0, 0, 0),
			doorb3 = CreateRotator(self, 'doorb3', 'x', nil, 0, 0, 0),
			doorb4 = CreateRotator(self, 'doorb4', 'x', nil, 0, 0, 0),
			doorb5 = CreateRotator(self, 'doorb5', 'z', nil, 0, 0, 0),
			doorb6 = CreateRotator(self, 'doorb6', 'z', nil, 0, 0, 0),
		}
		self.Sliders = {
			doora1 = CreateSlider(self, 'doora1'),
			doora2 = CreateSlider(self, 'doora2'),
			collar = CreateSlider(self, 'collar'),
			lnchpad = CreateSlider(self, 'lnchpad'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		CRBLMSSL = Class(TAweapon) {
			PlayFxWeaponUnpackSequence = function(self)

				--MOVE doora1 to x-axis <4.50> SPEED <4.00>;
				self.unit.Sliders.doora1:SetGoal(-4.5,0,0)
				self.unit.Sliders.doora1:SetSpeed(4)

				--MOVE doora2 to x-axis <-4.50> SPEED <4.00>;
				self.unit.Sliders.doora2:SetGoal(4.5,0,0)
				self.unit.Sliders.doora2:SetSpeed(4)

				--SLEEP <941>;
				WaitSeconds(0.9)

				--MOVE collar to y-axis <5.34> SPEED <6.00>;
				self.unit.Sliders.collar:SetGoal(0,5.34,0)
				self.unit.Sliders.collar:SetSpeed(6)

				--SLEEP <802>;
				WaitSeconds(0.8)

				--TURN doorb5 to z-axis <89.39> SPEED <150.52>;
				self.unit.Spinners.doorb5:SetGoal(90)
				self.unit.Spinners.doorb5:SetSpeed(150)

				--TURN doorb6 to z-axis <-90.00> SPEED <151.54>;
				self.unit.Spinners.doorb6:SetGoal(-90)
				self.unit.Spinners.doorb6:SetSpeed(150)

				--TURN doorb2 to x-axis <-181.33> SPEED <305.35>;
				self.unit.Spinners.doorb2:SetGoal(-180)
				self.unit.Spinners.doorb2:SetSpeed(305)

				--TURN doorb4 to x-axis <180.57> SPEED <304.06>;
				self.unit.Spinners.doorb4:SetGoal(180)
				self.unit.Spinners.doorb4:SetSpeed(305)

				--TURN doorb1 to x-axis <-180.95> SPEED <304.70>;
				self.unit.Spinners.doorb1:SetGoal(-180)
				self.unit.Spinners.doorb1:SetSpeed(305)

				--TURN doorb3 to x-axis <179.80> SPEED <302.78>;
				self.unit.Spinners.doorb3:SetGoal(180)
				self.unit.Spinners.doorb3:SetSpeed(305)

				--SLEEP <594>;
				WaitSeconds(0.6)

				--MOVE lnchpad to y-axis <14.40> SPEED <9.00>;
				self.unit.Sliders.lnchpad:SetGoal(0,14.4,0)
				self.unit.Sliders.lnchpad:SetSpeed(9)

				--SLEEP <1591>;
				--SLEEP <28>;
				WaitSeconds(1.6)

				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,

			PlayFxWeaponPackSequence = function(self)
	
				--MOVE lnchpad to y-axis <0> SPEED <8.00>;
				self.unit.Sliders.lnchpad:SetGoal(0,0,0)
				self.unit.Sliders.lnchpad:SetSpeed(8)

				--SLEEP <1746>;
				WaitSeconds(1.8)

				--TURN doorb5 to z-axis <0> SPEED <190.64>;
				self.unit.Spinners.doorb5:SetGoal(0)
				self.unit.Spinners.doorb5:SetSpeed(190)

				--TURN doorb6 to z-axis <0> SPEED <191.93>;
				self.unit.Spinners.doorb6:SetGoal(0)
				self.unit.Spinners.doorb6:SetSpeed(190)

				--TURN doorb2 to x-axis <0> SPEED <386.73>;
				self.unit.Spinners.doorb2:SetGoal(0)
				self.unit.Spinners.doorb2:SetSpeed(385)

				--TURN doorb4 to x-axis <0> SPEED <385.10>;
				self.unit.Spinners.doorb4:SetGoal(0)
				self.unit.Spinners.doorb4:SetSpeed(385)

				--TURN doorb1 to x-axis <0> SPEED <385.92>;
				self.unit.Spinners.doorb1:SetGoal(0)
				self.unit.Spinners.doorb1:SetSpeed(385)

				--TURN doorb3 to x-axis <0> SPEED <383.47>;
				self.unit.Spinners.doorb3:SetGoal(0)
				self.unit.Spinners.doorb3:SetSpeed(385)

				--SLEEP <469>;
				WaitSeconds(0.5)

				--MOVE collar to y-axis <0> SPEED <6.00>;
				self.unit.Sliders.collar:SetGoal(0,0,0)
				self.unit.Sliders.collar:SetSpeed(6)

				--SLEEP <836>;
				WaitSeconds(0.8)

				--MOVE doora1 to x-axis <0> SPEED <7.00>;
				self.unit.Sliders.doora1:SetGoal(0,0,0)
				self.unit.Sliders.doora1:SetSpeed(7)

				--MOVE doora2 to x-axis <0> SPEED <7.00>;
				self.unit.Sliders.doora2:SetGoal(0,0,0)
				self.unit.Sliders.doora2:SetSpeed(7)

				--SLEEP <576>;
				--SLEEP <49>;
				WaitSeconds(0.6)

				TAweapon.PlayFxWeaponPackSequence(self)
			end,
		},
	},
}

TypeClass = CORSILO

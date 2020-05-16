#ARM Annihilator - Energy Weapon
#ARMANNI
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMANNI = Class(TAunit) {
	damageReduction = 1,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			case2 = CreateRotator(self, 'Case_01', 'z', nil, 0, 0, 0),
			case1 = CreateRotator(self, 'Case_02', 'z', nil, 0, 0, 0),
			case3 = CreateRotator(self, 'Case_03', 'z', nil, 0, 0, 0),
			case4 = CreateRotator(self, 'Case_04', 'z', nil, 0, 0, 0),
			container1 = CreateRotator(self, 'Container_01', 'z', nil, 0, 0, 0),
			container2 = CreateRotator(self, 'Container_02', 'z', nil, 0, 0, 0),
			door1 = CreateRotator(self, 'Door_01', 'y', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'Door_02', 'z', nil, 0, 0, 0),
			radar = CreateRotator(self, 'Radar', 'x', nil, 0, 0, 0),
		}
		self.Sliders = {
			door1 = CreateSlider(self, 'Door_01'),
			door2 = CreateSlider(self, 'Door_02'),
			case5 = CreateSlider(self, 'Case_05'),
			case6 = CreateSlider(self, 'Case_06'),
			plate1 = CreateSlider(self, 'Plate'),
			arm = CreateSlider(self, 'Turret'),
			barrel = CreateSlider(self, 'Barrel'),
			container1 = CreateSlider(self, 'Container_01'),
			container2 = CreateSlider(self, 'Container_02'),
			energy = CreateSlider(self, 'Energy'),
			plate2 = CreateSlider(self, 'Radar_Base'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	OnDamage = function(self, instigator, amount, vector, damageType)
		TAunit.OnDamage(self, instigator, amount * self.damageReduction, vector, damageType) 
		#Has Damage Reduction
	end,

	Weapons = {
		ARM_TOTAL_ANNIHILATOR = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,

			PlayFxWeaponUnpackSequence = function(self)
				self.unit.damageReduction = 1

				--MOVE case5 to y-axis <-7.30> SPEED <14.00>;
				self.unit.Sliders.case5:SetGoal(0,-7.3,0)
				self.unit.Sliders.case5:SetSpeed(14)

				--MOVE case6 to y-axis <-7.35> SPEED <14.00>;
				self.unit.Sliders.case6:SetGoal(0,-7.3,0)
				self.unit.Sliders.case6:SetSpeed(14)

				--SLEEP <514>;
				WaitSeconds(0.5)

				--TURN case1 to z-axis <89.39> SPEED <172.60>;
				self.unit.Spinners.case1:SetGoal(-89)
				self.unit.Spinners.case1:SetSpeed(173)

				--SLEEP <518>;
				WaitSeconds(0.5)

				--TURN case2 to z-axis <-90.00> SPEED <173.45>;
				self.unit.Spinners.case2:SetGoal(89)
				self.unit.Spinners.case2:SetSpeed(173)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--TURN case4 to z-axis <89.39> SPEED <172.28>;
				self.unit.Spinners.case4:SetGoal(-89)
				self.unit.Spinners.case4:SetSpeed(173)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--TURN case3 to z-axis <-90.00> SPEED <172.78>;
				self.unit.Spinners.case3:SetGoal(89)
				self.unit.Spinners.case3:SetSpeed(173)

				--SLEEP <521>;
				WaitSeconds(0.5)

				--MOVE plate1 to y-axis <6.30> SPEED <12.00>;
				self.unit.Sliders.plate1:SetGoal(0,6.3,0)
				self.unit.Sliders.plate1:SetSpeed(12)

				--SLEEP <516>;
				WaitSeconds(0.5)

				--MOVE arm to y-axis <5.60> SPEED <10.00>;
				self.unit.Sliders.arm:SetGoal(0,5.6,0)
				self.unit.Sliders.arm:SetSpeed(10)

				--SLEEP <518>;
				WaitSeconds(0.5)

				--TURN container1 to z-axis <90.60> SPEED <174.62>;
				self.unit.Spinners.container1:SetGoal(-90)
				self.unit.Spinners.container1:SetSpeed(174)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--TURN container2 to z-axis <-90.00> SPEED <173.78>;
				self.unit.Spinners.container2:SetGoal(90)
				self.unit.Spinners.container2:SetSpeed(174)

				--SLEEP <518>;
				WaitSeconds(0.5)

				--MOVE container1 to x-axis <2.05> SPEED <3.00>;
				self.unit.Sliders.container1:SetGoal(0,-2,0)
				self.unit.Sliders.container1:SetSpeed(3)

				--MOVE container2 to x-axis <-1.90> SPEED <3.00>;
				self.unit.Sliders.container2:SetGoal(0,-2,0)
				self.unit.Sliders.container2:SetSpeed(3)

				--SLEEP <522>;
				WaitSeconds(0.5)

				--TURN door1 to x-axis <87.56> SPEED <169.08>;
				self.unit.Spinners.door1:SetGoal(90)
				self.unit.Spinners.door1:SetSpeed(170)

				--SLEEP <518>;
				WaitSeconds(0.5)

				--MOVE door1 to z-axis <-1.64> SPEED <3.00>;
				self.unit.Sliders.door1:SetGoal(1.6,0,0)
				self.unit.Sliders.door1:SetSpeed(3)


				--SLEEP <519>;
				WaitSeconds(0.5)

				--MOVE barrel to z-axis <9.69> SPEED <18.00>;
				self.unit.Sliders.barrel:SetGoal(0,0,10)
				self.unit.Sliders.barrel:SetSpeed(18)

				--MOVE energy to z-axis <3.24> SPEED <6.00>;
				self.unit.Sliders.energy:SetGoal(0,0,3.24)
				self.unit.Sliders.energy:SetSpeed(6)

				--SLEEP <518>;
				WaitSeconds(0.5)

				--TURN door2 to z-axis <91.82> SPEED <177.99>;
				self.unit.Spinners.door2:SetGoal(90)
				self.unit.Spinners.door2:SetSpeed(178)

				--SLEEP <516>;
				WaitSeconds(0.5)

				--MOVE door2 to x-axis <1.60> SPEED <3.00>;
				self.unit.Sliders.door2:SetGoal(0,1.6,0)
				self.unit.Sliders.door2:SetSpeed(3)


				--SLEEP <523>;
				WaitSeconds(0.5)

				--MOVE plate2 to x-axis <-2.35> SPEED <4.00>;
				self.unit.Sliders.plate2:SetGoal(2.35,0,0)
				self.unit.Sliders.plate2:SetSpeed(4)

				--SLEEP <517>;
				WaitSeconds(0.5)

				--TURN radar to x-axis <93.03> SPEED <179.30>;
				self.unit.Spinners.radar:SetGoal(90)
				self.unit.Spinners.radar:SetSpeed(178)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--SLEEP <169>;
				WaitSeconds(0.1)

				--SPIN radar around x-axis  SPEED <100.02>;
				self.unit.Spinners.radar:ClearGoal()
				self.unit.Spinners.radar:SetSpeed(100)

				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,	

			PlayFxWeaponPackSequence = function(self)
				self.unit.damageReduction = 0.5

				--TURN radar to x-axis <0> SPEED <182.11>;
				self.unit.Spinners.radar:SetGoal(0)
				self.unit.Spinners.radar:SetSpeed(182.11)

				--SLEEP <511>;
				WaitSeconds(0.5)

				--MOVE plate2 to x-axis <0> SPEED <4.00>;
				self.unit.Sliders.plate2:SetGoal(0,0,0)
				self.unit.Sliders.plate2:SetSpeed(4)

				--SLEEP <518>;
				WaitSeconds(0.5)

				--MOVE door2 to x-axis <0> SPEED <3.00>;
				self.unit.Sliders.door2:SetGoal(0,0,0)
				self.unit.Sliders.door2:SetSpeed(3)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--TURN door2 to z-axis <0> SPEED <176.96>;
				self.unit.Spinners.door2:SetGoal(0)
				self.unit.Spinners.door2:SetSpeed(176.96)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--MOVE barrel to z-axis <0> SPEED <18.00>;
				self.unit.Sliders.barrel:SetGoal(0,0,0)
				self.unit.Sliders.barrel:SetSpeed(18)

				--MOVE energy to z-axis <0> SPEED <6.00>;
				self.unit.Sliders.energy:SetGoal(0,0,0)
				self.unit.Sliders.energy:SetSpeed(6)

				--SLEEP <522>;
				WaitSeconds(0.5)

				--MOVE door1 to z-axis <0> SPEED <3.00>;
				self.unit.Sliders.door1:SetGoal(0,0,0)
				self.unit.Sliders.door1:SetSpeed(3)

				--SLEEP <514>;
				WaitSeconds(0.5)

				--TURN door1 to x-axis <0> SPEED <169.08>;
				self.unit.Spinners.door1:SetGoal(0)
				self.unit.Spinners.door1:SetSpeed(169.08)

				--SLEEP <518>;
				WaitSeconds(0.5)

				--MOVE container1 to x-axis <0> SPEED <3.00>;
				self.unit.Sliders.container1:SetGoal(0,0,0)
				self.unit.Sliders.container1:SetSpeed(3)

				--MOVE container2 to x-axis <0> SPEED <3.00>;
				self.unit.Sliders.container2:SetGoal(0,0,0)
				self.unit.Sliders.container2:SetSpeed(3)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--TURN container2 to z-axis <0> SPEED <173.45>;
				self.unit.Spinners.container2:SetGoal(0)
				self.unit.Spinners.container2:SetSpeed(173.45)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--TURN container1 to z-axis <0> SPEED <173.95>;
				self.unit.Spinners.container1:SetGoal(0)
				self.unit.Spinners.container1:SetSpeed(173.95)

				--SLEEP <521>;
				WaitSeconds(0.5)

				--MOVE arm to y-axis <0> SPEED <10.00>;
				self.unit.Sliders.arm:SetGoal(0,0,0)
				self.unit.Sliders.arm:SetSpeed(10)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--MOVE plate1 to y-axis <0> SPEED <12.00>;
				self.unit.Sliders.plate1:SetGoal(0,0,0)
				self.unit.Sliders.plate1:SetSpeed(12)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--TURN case3 to z-axis <0> SPEED <174.12>;
				self.unit.Spinners.case3:SetGoal(0)
				self.unit.Spinners.case3:SetSpeed(173)

				--SLEEP <517>;
				WaitSeconds(0.5)

				--TURN case4 to z-axis <0> SPEED <172.94>;
				self.unit.Spinners.case4:SetGoal(0)
				self.unit.Spinners.case4:SetSpeed(173)

				--SLEEP <517>;
				WaitSeconds(0.5)

				--TURN case2 to z-axis <0> SPEED <172.12>;
				self.unit.Spinners.case2:SetGoal(0)
				self.unit.Spinners.case2:SetSpeed(173)

				--SLEEP <523>;
				WaitSeconds(0.5)

				--TURN case1 to z-axis <0> SPEED <173.28>;
				self.unit.Spinners.case1:SetGoal(0)
				self.unit.Spinners.case1:SetSpeed(173)

				--SLEEP <516>;
				WaitSeconds(0.5)

				--MOVE case5 to y-axis <0> SPEED <14.00>;
				self.unit.Sliders.case5:SetGoal(0,0,0)
				self.unit.Sliders.case5:SetSpeed(14)

				--MOVE case6 to y-axis <0> SPEED <14.00>;
				self.unit.Sliders.case6:SetGoal(0,0,0)
				self.unit.Sliders.case6:SetSpeed(14)

				--SLEEP <519>;
				WaitSeconds(0.5)

				--SLEEP <160>;
				WaitSeconds(0.15)
				
				TAweapon.PlayFxWeaponPackSequence(self)
			end,	
		},
	},
}

TypeClass = ARMANNI

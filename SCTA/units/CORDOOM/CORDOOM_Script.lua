#CORE Doomsday Machine - Energy Weapon
#CORDOOM
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORDOOM = Class(TAunit) {
	damageReduction = 1,
	unpacked = false,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			hatch = CreateRotator(self, 'hatch', 'z', nil, 0, 0, 0),
			hatchb = CreateRotator(self, 'hatchb', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			hatch = CreateSlider(self, 'hatch'),
			shell1a = CreateSlider(self, 'shell1a'),
			shell2a = CreateSlider(self, 'shell2a'),
			shell3a = CreateSlider(self, 'shell3a'),
			shell4a = CreateSlider(self, 'shell4a'),
			shell1b = CreateSlider(self, 'shell1b'),
			shell2b = CreateSlider(self, 'shell2b'),
			shell3b = CreateSlider(self, 'shell3b'),
			shell4b = CreateSlider(self, 'shell4b'),
			turreta = CreateSlider(self, 'turreta'),
			turretb = CreateSlider(self, 'turretb'),
			turretc = CreateSlider(self, 'turretc'),
			hatchb = CreateSlider(self, 'hatchb'),
			hatchc = CreateSlider(self, 'hatchc'),
			barrela = CreateSlider(self, 'barrela'),
			barrelb = CreateSlider(self, 'barrelb'),
			barrelc1 = CreateSlider(self, 'barrelc1'),
			barrelc2 = CreateSlider(self, 'barrelc2'),
			collarb = CreateSlider(self, 'collarb'),
			sleevec = CreateSlider(self, 'sleevec'),
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
		CORE_DOOMSDAY = Class(TAweapon) {

			PlayFxWeaponUnpackSequence = function(self)
				self.unit.damageReduction = 1

				#Altered to work in FA
				--TURN hatch to z-axis <-31.58> SPEED <47.01>;
				self.unit.Spinners.hatch:SetGoal(180)
				self.unit.Spinners.hatch:SetSpeed(47)

				--SLEEP <672>;
				WaitSeconds(0.7)

				#Altered to work in FA
				--MOVE hatch to x-axis <3.20> SPEED <4.00>;
				--MOVE hatch to y-axis <-3.65> SPEED <5.00>;
				#self.unit.Sliders.hatch:SetGoal(0,-3.65,0)
				#self.unit.Sliders.hatch:SetSpeed(4.5)

				#Altered to work in FA
				--TURN hatch to z-axis <-49.23> SPEED <26.23>;
				self.unit.Spinners.hatch:SetGoal(229)
				self.unit.Spinners.hatch:SetSpeed(26)

				--SLEEP <673>;
				WaitSeconds(0.7)

				--MOVE shell4b to x-axis <-4.15> SPEED <6.00>;
				self.unit.Sliders.shell4b:SetGoal(4,0,0)
				self.unit.Sliders.shell4b:SetSpeed(6)

				--MOVE shell3b to z-axis <-4.05> SPEED <6.00>;
				self.unit.Sliders.shell3b:SetGoal(0,0,-4)
				self.unit.Sliders.shell3b:SetSpeed(6)

				--MOVE shell2b to x-axis <4.00> SPEED <5.00>;
				self.unit.Sliders.shell2b:SetGoal(-4,0,0)
				self.unit.Sliders.shell2b:SetSpeed(5)

				--MOVE shell1b to z-axis <3.94> SPEED <5.00>;
				self.unit.Sliders.shell1b:SetGoal(0,0,4)
				self.unit.Sliders.shell1b:SetSpeed(5)

				--SLEEP <673>;
				WaitSeconds(0.7)

				--MOVE shell1a to x-axis <3.30> SPEED <4.00>;
				self.unit.Sliders.shell1a:SetGoal(-3.3,0,0)
				self.unit.Sliders.shell1a:SetSpeed(4)

				--MOVE shell2a to z-axis <-3.30> SPEED <4.00>;
				self.unit.Sliders.shell2a:SetGoal(0,0,-3.3)
				self.unit.Sliders.shell2a:SetSpeed(4)

				--MOVE shell3a to x-axis <-3.30> SPEED <4.00>;
				self.unit.Sliders.shell3a:SetGoal(3.3,0,0)
				self.unit.Sliders.shell3a:SetSpeed(4)

				--MOVE shell4a to z-axis <3.30> SPEED <4.00>;
				self.unit.Sliders.shell4a:SetGoal(0,0,3.3)
				self.unit.Sliders.shell4a:SetSpeed(4)

				--SLEEP <663>;
				WaitSeconds(0.7)

				--MOVE shell1a to y-axis <-11.45> SPEED <17.00>;
				self.unit.Sliders.shell1a:SetGoal(-3.3,-11.4,0)
				self.unit.Sliders.shell1a:SetSpeed(17)

				--MOVE shell2a to y-axis <-11.45> SPEED <17.00>;
				self.unit.Sliders.shell2a:SetGoal(0,-11.4,-3.3)
				self.unit.Sliders.shell2a:SetSpeed(17)

				--MOVE shell3a to y-axis <-11.40> SPEED <16.00>;
				self.unit.Sliders.shell3a:SetGoal(3.3,-11.4,0)
				self.unit.Sliders.shell3a:SetSpeed(16)

				--MOVE shell4a to y-axis <-11.40> SPEED <16.00>;
				self.unit.Sliders.shell4a:SetGoal(0,-11.4,3.3)
				self.unit.Sliders.shell4a:SetSpeed(16)

				--SLEEP <673>;
				--SLEEP <223>;
				WaitSeconds(0.9)

				--MOVE turreta to y-axis <4.30> SPEED <6.00>;
				self.unit.Sliders.turreta:SetGoal(0,4.3,0)
				self.unit.Sliders.turreta:SetSpeed(6)

				--SLEEP <633>;
				WaitSeconds(0.6)

				--MOVE turreta to y-axis <8.85> SPEED <6.00>;
				self.unit.Sliders.turreta:SetGoal(0,8.85,0)
				self.unit.Sliders.turreta:SetSpeed(6)

				--MOVE turretb to y-axis <4.45> SPEED <6.00>;
				self.unit.Sliders.turretb:SetGoal(0,4.45,0)
				self.unit.Sliders.turretb:SetSpeed(6)

				--SLEEP <673>;
				WaitSeconds(0.7)

				--MOVE turreta to y-axis <11.54> SPEED <4.00>;
				self.unit.Sliders.turreta:SetGoal(0,11.54,0)
				self.unit.Sliders.turreta:SetSpeed(4)

				--MOVE turretb to y-axis <7.10> SPEED <3.00>;
				self.unit.Sliders.turretb:SetGoal(0,7.1,0)
				self.unit.Sliders.turretb:SetSpeed(3)

				--MOVE turretc to y-axis <2.65> SPEED <3.00>;
				self.unit.Sliders.turretc:SetGoal(0,2.65,0)
				self.unit.Sliders.turretc:SetSpeed(3)

				--SLEEP <673>;
				WaitSeconds(0.7)

				--MOVE hatchc to y-axis <1.70> SPEED <2.00>;
				--MOVE hatchc to z-axis <-0.69> SPEED <1.00>;
				self.unit.Sliders.hatchc:SetGoal(0,1.7,-0.69)
				self.unit.Sliders.hatchc:SetSpeed(1.5)

				--SLEEP <673>;
				WaitSeconds(0.7)

				--MOVE sleevec to z-axis <4.10> SPEED <6.00>;
				self.unit.Sliders.sleevec:SetGoal(0,0,4.1)
				self.unit.Sliders.sleevec:SetSpeed(6)

				--MOVE hatchb to x-axis <2.95> SPEED <4.00>;
				--MOVE hatchb to z-axis <-3.35> SPEED <4.00>;
				self.unit.Sliders.hatchb:SetGoal(2.95,0,-3.35)
				self.unit.Sliders.hatchb:SetSpeed(4)

				--TURN hatchb to y-axis <-46.91> SPEED <68.70>;
				self.unit.Spinners.hatchb:SetGoal(-47)
				self.unit.Spinners.hatchb:SetSpeed(69)

				--SLEEP <683>;
				WaitSeconds(0.7)

				--MOVE barrelc1 to z-axis <3.15> SPEED <4.00>;
				self.unit.Sliders.barrelc1:SetGoal(0,0,3.15)
				self.unit.Sliders.barrelc1:SetSpeed(4)

				--MOVE barrelc2 to z-axis <3.14> SPEED <4.00>;
				self.unit.Sliders.barrelc2:SetGoal(0,0,3.15)
				self.unit.Sliders.barrelc2:SetSpeed(4)

				--MOVE collarb to z-axis <3.40> SPEED <4.00>;
				self.unit.Sliders.collarb:SetGoal(0,0,3.4)
				self.unit.Sliders.collarb:SetSpeed(4)

				--SLEEP <683>;
				WaitSeconds(0.7)

				--MOVE barrelb to z-axis <3.50> SPEED <5.00>;
				self.unit.Sliders.barrelb:SetGoal(0,0,3.5)
				self.unit.Sliders.barrelb:SetSpeed(5)

				--SLEEP <683>;
				WaitSeconds(0.7)

				--MOVE barrela to z-axis <3.64> SPEED <5.00>;
				self.unit.Sliders.barrela:SetGoal(0,0,3.64)
				self.unit.Sliders.barrela:SetSpeed(5)

				--SLEEP <683>;
				--SLEEP <43>;
				WaitSeconds(0.7)

				self.unit.unpacked = true
				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,	

			PlayFxWeaponPackSequence = function(self)
				self.unit.damageReduction = 0.5
				self.unit.unpacked = false

				--MOVE barrela to z-axis <0> SPEED <5.00>;
				self.unit.Sliders.barrela:SetGoal(0,0,0)
				self.unit.Sliders.barrela:SetSpeed(5) 

				--SLEEP <672>;
				WaitSeconds(0.7)

				--MOVE barrelb to z-axis <0> SPEED <5.00>;
				self.unit.Sliders.barrelb:SetGoal(0,0,0)
				self.unit.Sliders.barrelb:SetSpeed(5) 

				--SLEEP <678>;
				WaitSeconds(0.7)

				--MOVE barrelc1 to z-axis <0> SPEED <4.00>;
				self.unit.Sliders.barrelc1:SetGoal(0,0,0)
				self.unit.Sliders.barrelc1:SetSpeed(4)

				--MOVE barrelc2 to z-axis <0> SPEED <4.00>;
				self.unit.Sliders.barrelc2:SetGoal(0,0,0)
				self.unit.Sliders.barrelc2:SetSpeed(4)

				--MOVE collarb to z-axis <0> SPEED <4.00>;
				self.unit.Sliders.collarb:SetGoal(0,0,0)
				self.unit.Sliders.collarb:SetSpeed(4)

				--SLEEP <681>;
				WaitSeconds(0.7)

				--MOVE sleevec to z-axis <0> SPEED <6.00>;
				self.unit.Sliders.sleevec:SetGoal(0,0,0)
				self.unit.Sliders.sleevec:SetSpeed(6)

				--MOVE hatchb to x-axis <0> SPEED <4.00>;
				--MOVE hatchb to z-axis <0> SPEED <4.00>;
				self.unit.Sliders.hatchb:SetGoal(0,0,0)
				self.unit.Sliders.hatchb:SetSpeed(4)

				--TURN hatchb to y-axis <0> SPEED <68.90>;
				self.unit.Spinners.hatchb:SetGoal(0)
				self.unit.Spinners.hatchb:SetSpeed(69)

				--SLEEP <681>;
				WaitSeconds(0.7)

				--MOVE hatchc to y-axis <0> SPEED <2.00>;
				--MOVE hatchc to z-axis <0> SPEED <1.00>;
				self.unit.Sliders.hatchc:SetGoal(0,0,0)
				self.unit.Sliders.hatchc:SetSpeed(1.5)

				--SLEEP <684>;
				WaitSeconds(0.7)

				--MOVE turreta to y-axis <8.85> SPEED <4.00>;
				self.unit.Sliders.turreta:SetGoal(0,8.85,0)
				self.unit.Sliders.turreta:SetSpeed(4)

				--MOVE turretb to y-axis <4.45> SPEED <4.00>;
				self.unit.Sliders.turretb:SetGoal(0,4.45,0)
				self.unit.Sliders.turretb:SetSpeed(4)

				--MOVE turretc to y-axis <0> SPEED <4.00>;
				self.unit.Sliders.turretc:SetGoal(0,0,0)
				self.unit.Sliders.turretc:SetSpeed(4)

				--SLEEP <655>;
				WaitSeconds(0.7)

				--MOVE turreta to y-axis <4.30> SPEED <6.00>;
				self.unit.Sliders.turreta:SetGoal(0,4.3,0)
				self.unit.Sliders.turreta:SetSpeed(6)

				--MOVE turretb to y-axis <0> SPEED <6.00>;
				self.unit.Sliders.turretb:SetGoal(0,0,0)
				self.unit.Sliders.turretb:SetSpeed(6)

				--SLEEP <660>;
				WaitSeconds(0.7)

				--MOVE turreta to y-axis <0> SPEED <6.00>;
				self.unit.Sliders.turreta:SetGoal(0,0,0)
				self.unit.Sliders.turreta:SetSpeed(6)

				--SLEEP <661>;
				--SLEEP <296>;
				WaitSeconds(1.0)

				--MOVE shell1a to y-axis <0> SPEED <17.00>;
				self.unit.Sliders.shell1a:SetGoal(-3.3,0,0)
				self.unit.Sliders.shell1a:SetSpeed(17)

				--MOVE shell2a to y-axis <0> SPEED <17.00>;
				self.unit.Sliders.shell2a:SetGoal(0,0,-3.3)
				self.unit.Sliders.shell2a:SetSpeed(17)

				--MOVE shell3a to y-axis <0> SPEED <17.00>;
				self.unit.Sliders.shell3a:SetGoal(3.3,0,0)
				self.unit.Sliders.shell3a:SetSpeed(17)

				--MOVE shell4a to y-axis <0> SPEED <17.00>;
				self.unit.Sliders.shell4a:SetGoal(0,0,3.3)
				self.unit.Sliders.shell4a:SetSpeed(17)

				--SLEEP <655>;
				WaitSeconds(0.7)

				--MOVE shell1a to x-axis <0> SPEED <5.00>;
				self.unit.Sliders.shell1a:SetGoal(0,0,0)
				self.unit.Sliders.shell1a:SetSpeed(5)

				--MOVE shell2a to z-axis <0> SPEED <5.00>;
				self.unit.Sliders.shell2a:SetGoal(0,0,0)
				self.unit.Sliders.shell2a:SetSpeed(5)

				--MOVE shell3a to x-axis <0> SPEED <5.00>;
				self.unit.Sliders.shell3a:SetGoal(0,0,0)
				self.unit.Sliders.shell3a:SetSpeed(5)

				--MOVE shell4a to z-axis <0> SPEED <5.00>;
				self.unit.Sliders.shell4a:SetGoal(0,0,0)
				self.unit.Sliders.shell4a:SetSpeed(5)

				--SLEEP <649>;
				WaitSeconds(0.7)

				--MOVE shell4b to x-axis <0> SPEED <6.00>;
				self.unit.Sliders.shell4b:SetGoal(0,0,0)
				self.unit.Sliders.shell4b:SetSpeed(6)

				--MOVE shell3b to z-axis <0> SPEED <6.00>;
				self.unit.Sliders.shell3b:SetGoal(0,0,0)
				self.unit.Sliders.shell3b:SetSpeed(6)

				--MOVE shell2b to x-axis <0> SPEED <6.00>;
				self.unit.Sliders.shell2b:SetGoal(0,0,0)
				self.unit.Sliders.shell2b:SetSpeed(6)

				--MOVE shell1b to z-axis <0> SPEED <5.00>;
				self.unit.Sliders.shell1b:SetGoal(0,0,0)
				self.unit.Sliders.shell1b:SetSpeed(6)

				--SLEEP <661>;
				WaitSeconds(0.7)

				--MOVE hatch to x-axis <0> SPEED <4.00>;
				--MOVE hatch to y-axis <0> SPEED <5.00>;
				self.unit.Sliders.hatch:SetGoal(0,0,0)
				self.unit.Sliders.hatch:SetSpeed(5)

				#Not needed?
				--TURN hatch to z-axis <-31.58> SPEED <26.79>;
				#self.unit.Spinners.hatch:SetGoal(32)
				#self.unit.Spinners.hatch:SetSpeed(27)

				--SLEEP <659>;
				WaitSeconds(0.7)

				--TURN hatch to z-axis <0> SPEED <48.08>;
				self.unit.Spinners.hatch:SetGoal(0)
				self.unit.Spinners.hatch:SetSpeed(48)

				--SLEEP <657>;
				--SLEEP <54>;
				WaitSeconds(0.7)
	
				TAweapon.PlayFxWeaponPackSequence(self)
			end,	
		},
		CORE_LIGHTLASER = Class(TAweapon) {
			PlayFxWeaponUnpackSequence = function(self)
				while (self.unit.unpacked == false) do
					WaitSeconds(0.2)
				end
				TAweapon.PlayFxWeaponUnpackSequence(self)
                        end,
                },

		CORE_LASERH1 = Class(TAweapon) {
			PlayFxWeaponUnpackSequence = function(self)
				while (self.unit.unpacked == false) do
					WaitSeconds(0.2)
				end
				TAweapon.PlayFxWeaponUnpackSequence(self)
                        end,
                },

	},
}

TypeClass = CORDOOM

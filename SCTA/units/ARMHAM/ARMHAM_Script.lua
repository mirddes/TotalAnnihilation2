#ARM Hammer - Artillery Kbot
#ARMHAM
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMHAM = Class(TAunit) {
	

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			upcase2 = CreateRotator(self, 'UpperSleeves', 'x', nil, 0, 0, 0),
			locase = CreateRotator(self, 'LowerSleeves', 'x', nil, 0, 0, 0),
		}
		self.Sliders = {
			upcase2 = CreateSlider(self, 'UpperSleeveSlider'),
			locase = CreateSlider(self, 'LowerSleeves'),
		}
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,
	
	Weapons = {
		ARM_HAM = Class(TAweapon) {

			OnWeaponFired = function(self)
				TAunit.ShowMuzzleFlare(self, 0.1)
				TAweapon.OnWeaponFired(self)
			end,

			PlayFxWeaponUnpackSequence = function(self)
				--TURN upcase2 to x-axis <-43.93> SPEED <55.85>
				self.unit.Spinners.upcase2:SetGoal(-43.93)
				self.unit.Spinners.upcase2:SetSpeed(55.85)
	
				--TURN locase to x-axis <61.52> SPEED <78.19>
				self.unit.Spinners.locase:SetGoal(-61.52)
				self.unit.Spinners.locase:SetSpeed(78.19)
	
				--SLEEP <787>;
				WaitSeconds(0.8)
	
				--MOVE upcase2 to z-axis <-4.39> SPEED <44.00>;
				self.unit.Sliders.upcase2:SetGoal(0,0,-4.39)
				self.unit.Sliders.upcase2:SetSpeed(44)

				--TURN upcase2 to x-axis <-47.10> SPEED <31.96>;
				self.unit.Spinners.locase:SetGoal(47.10)
				self.unit.Spinners.locase:SetSpeed(31.96)
	
				--SLEEP <99>;
				WaitSeconds(0.1)
	
				--TURN upcase2 to x-axis <-121.99> SPEED <687.16>;
				self.unit.Spinners.locase:SetGoal(121.9)
				self.unit.Spinners.locase:SetSpeed(687.16)
	
				--SLEEP <109>;
				WaitSeconds(0.1)
	
				--TURN upcase2 to x-axis <-45.70> SPEED <451.52>;
				self.unit.Spinners.locase:SetGoal(45.70)
				self.unit.Spinners.locase:SetSpeed(451.52)
	
				--SLEEP <169>;
				WaitSeconds(0.15)
	
				--TURN upcase2 to x-axis <-19.68> SPEED <377.12>;
				self.unit.Spinners.locase:SetGoal(19.68)
				self.unit.Spinners.locase:SetSpeed(377.12)
	
				--SLEEP <69>;
				WaitSeconds(0.05)
	
				--TURN upcase2 to x-axis <-47.10> SPEED <1443.60>;
				self.unit.Spinners.locase:SetGoal(47.10)
				self.unit.Spinners.locase:SetSpeed(1443.60)

				--SLEEP <19>;

				--SLEEP <19>;
				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,

			PlayFxWeaponPackSequence = function(self)
				--MOVE upcase2 to z-axis <0.95> SPEED <11.00>;
				self.unit.Sliders.upcase2:SetGoal(0,0,0.95)
				self.unit.Sliders.upcase2:SetSpeed(11)
	
				--SLEEP <457>;
				WaitSeconds(0.45)

				--MOVE upcase2 to z-axis <1.70> SPEED <7.00>;
				self.unit.Sliders.upcase2:SetGoal(0,0,1.70)
				self.unit.Sliders.upcase2:SetSpeed(7)

				--TURN upcase2 to x-axis <-41.13> SPEED <55.86>;
				self.unit.Spinners.upcase2:SetGoal(41.13)
				self.unit.Spinners.upcase2:SetSpeed(55.86)

				--SLEEP <107>;
				WaitSeconds(0.1)

				--MOVE upcase2 to z-axis <0> SPEED <100.00>;
				self.unit.Sliders.upcase2:SetGoal(0,0,0)
				self.unit.Sliders.upcase2:SetSpeed(100)

				--MOVE locase to z-axis <0> SPEED <44.00>;
				self.unit.Sliders.locase:SetGoal(0,0,0)
				self.unit.Sliders.locase:SetSpeed(44)

				--TURN upcase2 to x-axis <0> SPEED <2420.16>;
				self.unit.Spinners.upcase2:SetGoal(0)
				self.unit.Spinners.upcase2:SetSpeed(2420.16)

				--TURN locase to x-axis <0> SPEED <3619.90>;
				self.unit.Spinners.locase:SetGoal(0)
				self.unit.Spinners.locase:SetSpeed(3619.90)

				--SLEEP <17>;

				--SLEEP <9>;

				TAweapon.PlayFxWeaponPackSequence(self)
			end,
		},
	},
}

TypeClass = ARMHAM

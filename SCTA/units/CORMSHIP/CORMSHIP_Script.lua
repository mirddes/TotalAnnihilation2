#CORE Hydra - Missile Ship
#CORMSHIP
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORMSHIP = Class(TAunit) {
	currentShot = 0,

	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			dish = CreateRotator(self, 'dish', 'y', nil, 0, 0, 0),
			hamper = CreateRotator(self, 'hamper', 'x', nil, 0, 0, 0),
		}

		self.Sliders = {
			platform = CreateSlider(self, 'platform'),
			stand = CreateSlider(self, 'stand'),
			door1a = CreateSlider(self, 'door1a'),
			door2a = CreateSlider(self, 'door2a'),
			door1b = CreateSlider(self, 'door1b'),
			door2b = CreateSlider(self, 'door2b'),
		}
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		self.Spinners.dish:SetSpeed(150)
	end,
	Weapons = {
		CORMSHIP_ROCKET = Class(TAweapon) {
    			PlayFxRackReloadSequence = function(self)
				self.unit.currentShot = self.unit.currentShot + 1
				if self.unit.currentShot == 2 then

					--TURN hamper to x-axis <0> SPEED <159.60>;
					self.unit.Spinners.hamper:SetGoal(0)
					self.unit.Spinners.hamper:SetSpeed(160)

					--SLEEP <564>;
					WaitSeconds(0.6)

					--MOVE stand to y-axis <0> SPEED <7.00>;
					self.unit.Sliders.stand:SetGoal(0,0,0)
					self.unit.Sliders.stand:SetSpeed(7)

					--SLEEP <564>;
					WaitSeconds(0.6)

					--MOVE platform to y-axis <0> SPEED <6.00>;
					self.unit.Sliders.platform:SetGoal(0,0,0)
					self.unit.Sliders.platform:SetSpeed(6)

					--SLEEP <758>;
					WaitSeconds(0.8)

					--MOVE door1a to z-axis <0> SPEED <7.00>;
					self.unit.Sliders.door1a:SetGoal(0,0,0)
					self.unit.Sliders.door1a:SetSpeed(6)

					--MOVE door2a to z-axis <0> SPEED <6.00>;
					self.unit.Sliders.door2a:SetGoal(0,0,0)
					self.unit.Sliders.door2a:SetSpeed(6)

					--SLEEP <573>;
					WaitSeconds(0.6)

					--MOVE door2b to z-axis <0> SPEED <6.00>;
					self.unit.Sliders.door2b:SetGoal(0,0,0)
					self.unit.Sliders.door2b:SetSpeed(6)

					--MOVE door1b to z-axis <0> SPEED <6.00>;
					self.unit.Sliders.door1b:SetGoal(0,0,0)
					self.unit.Sliders.door1b:SetSpeed(6)

					--SLEEP <529>;
					WaitSeconds(0.5)

					self.unit:ShowBone('rocket1',true)
					self.unit:ShowBone('rocket2',true)
	

					--MOVE door2b to z-axis <3.60> SPEED <9.00>;
					self.unit.Sliders.door2b:SetGoal(0,0,3.6)
					self.unit.Sliders.door2b:SetSpeed(9)

					--MOVE door1b to z-axis <-3.70> SPEED <9.00>;
					self.unit.Sliders.door1b:SetGoal(0,0,-3.7)
					self.unit.Sliders.door1b:SetSpeed(9)

					--SLEEP <371>;
					WaitSeconds(0.4)

					--MOVE door1a to z-axis <-4.30> SPEED <9.00>;
					self.unit.Sliders.door1a:SetGoal(0,0,-4.3)
					self.unit.Sliders.door1a:SetSpeed(9)

					--MOVE door2a to z-axis <3.95> SPEED <8.00>;
					self.unit.Sliders.door2a:SetGoal(0,0,3.95)
					self.unit.Sliders.door2a:SetSpeed(9)

					--SLEEP <467>;
					WaitSeconds(0.5)

					--MOVE platform to y-axis <4.64> SPEED <5.00>;
					self.unit.Sliders.platform:SetGoal(0,4.64,0)
					self.unit.Sliders.platform:SetSpeed(5)

					--SLEEP <859>;
					--SLEEP <162>;
					WaitSeconds(1.0)
	
					--MOVE stand to y-axis <4.39> SPEED <7.00>;
					self.unit.Sliders.stand:SetGoal(0,4.39,0)
					self.unit.Sliders.stand:SetSpeed(7)

					--SLEEP <572>;
					WaitSeconds(0.6)

					--TURN hamper to x-axis <-90.00> SPEED <159.89>;
					self.unit.Spinners.hamper:SetGoal(-90)
					self.unit.Spinners.hamper:SetSpeed(160)

					--SLEEP <563>;
					WaitSeconds(0.6)

					self.unit.currentShot = 0
				end
				TAweapon.PlayFxRackReloadSequence(self)
			end,

			PlayFxWeaponUnpackSequence = function(self)
				--MOVE door2b to z-axis <3.60> SPEED <9.00>;
				self.unit.Sliders.door2b:SetGoal(0,0,3.6)
				self.unit.Sliders.door2b:SetSpeed(9)

				--MOVE door1b to z-axis <-3.70> SPEED <9.00>;
				self.unit.Sliders.door1b:SetGoal(0,0,-3.7)
				self.unit.Sliders.door1b:SetSpeed(9)

				--SLEEP <371>;
				WaitSeconds(0.4)

				--MOVE door1a to z-axis <-4.30> SPEED <9.00>;
				self.unit.Sliders.door1a:SetGoal(0,0,-4.3)
				self.unit.Sliders.door1a:SetSpeed(9)

				--MOVE door2a to z-axis <3.95> SPEED <8.00>;
				self.unit.Sliders.door2a:SetGoal(0,0,3.95)
				self.unit.Sliders.door2a:SetSpeed(9)

				--SLEEP <467>;
				WaitSeconds(0.5)

				--MOVE platform to y-axis <4.64> SPEED <5.00>;
				self.unit.Sliders.platform:SetGoal(0,4.64,0)
				self.unit.Sliders.platform:SetSpeed(5)

				--SLEEP <859>;
				--SLEEP <162>;
				WaitSeconds(1.0)

				--MOVE stand to y-axis <4.39> SPEED <7.00>;
				self.unit.Sliders.stand:SetGoal(0,4.39,0)
				self.unit.Sliders.stand:SetSpeed(7)

				--SLEEP <572>;
				WaitSeconds(0.6)

				--TURN hamper to x-axis <-90.00> SPEED <159.89>;
				self.unit.Spinners.hamper:SetGoal(-90)
				self.unit.Spinners.hamper:SetSpeed(160)

				--SLEEP <563>;
				WaitSeconds(0.6)

				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,	

			PlayFxWeaponPackSequence = function(self)

				--TURN hamper to x-axis <0> SPEED <159.60>;
				self.unit.Spinners.hamper:SetGoal(0)
				self.unit.Spinners.hamper:SetSpeed(160)

				--SLEEP <564>;
				WaitSeconds(0.6)

				--MOVE stand to y-axis <0> SPEED <7.00>;
				self.unit.Sliders.stand:SetGoal(0,0,0)
				self.unit.Sliders.stand:SetSpeed(7)

				--SLEEP <564>;
				WaitSeconds(0.6)

				--MOVE platform to y-axis <0> SPEED <6.00>;
				self.unit.Sliders.platform:SetGoal(0,0,0)
				self.unit.Sliders.platform:SetSpeed(6)

				--SLEEP <758>;
				WaitSeconds(0.8)

				--MOVE door1a to z-axis <0> SPEED <7.00>;
				self.unit.Sliders.door1a:SetGoal(0,0,0)
				self.unit.Sliders.door1a:SetSpeed(6)

				--MOVE door2a to z-axis <0> SPEED <6.00>;
				self.unit.Sliders.door2a:SetGoal(0,0,0)
				self.unit.Sliders.door2a:SetSpeed(6)

				--SLEEP <573>;
				WaitSeconds(0.6)

				--MOVE door2b to z-axis <0> SPEED <6.00>;
				self.unit.Sliders.door2b:SetGoal(0,0,0)
				self.unit.Sliders.door2b:SetSpeed(6)

				--MOVE door1b to z-axis <0> SPEED <6.00>;
				self.unit.Sliders.door1b:SetGoal(0,0,0)
				self.unit.Sliders.door1b:SetSpeed(6)

				--SLEEP <529>;
				WaitSeconds(0.5)

				TAweapon.PlayFxWeaponPackSequence(self)
			end,	
		},
		CORSHIP_MISSILE = Class(TAweapon) {},
	},
}

TypeClass = CORMSHIP

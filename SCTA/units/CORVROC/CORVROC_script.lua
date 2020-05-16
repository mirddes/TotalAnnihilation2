#CORE Diplomat - Mobile Rocket Launcher
#CORVROC
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORVROC = Class(TAunit) {
	
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			cradle = CreateRotator(self, 'cradle', 'x', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	Weapons = {
		CORTRUCK_ROCKET = Class(TAweapon) {

    			PlayFxRackReloadSequence = function(self)

				--TURN cradle to x-axis <0> SPEED <45.09>;
				self.unit.Spinners.cradle:SetGoal(0)
				self.unit.Spinners.cradle:SetSpeed(45)

				self.unit:ShowBone('dummy', true)

				--TURN cradle to x-axis <-90.00> SPEED <45.39>;
				self.unit.Spinners.cradle:SetGoal(-90)
				self.unit.Spinners.cradle:SetSpeed(45)

				WaitFor(self.Spinners.cradle)

				TAweapon.PlayFxRackReloadSequence(self)
			end,

			PlayFxWeaponUnpackSequence = function(self)

				--TURN cradle to x-axis <-90.00> SPEED <45.39>;
				self.unit.Spinners.cradle:SetGoal(-90)
				self.unit.Spinners.cradle:SetSpeed(45)

				WaitFor(self.unit.Spinners.cradle)

				TAweapon.PlayFxWeaponUnpackSequence(self)
			end,

			PlayFxWeaponPackSequence = function(self)
				--TURN cradle to x-axis <0> SPEED <45.09>;
				self.unit.Spinners.cradle:SetGoal(0)
				self.unit.Spinners.cradle:SetSpeed(45)

				TAweapon.PlayFxWeaponPackSequence(self)
			end,
		},
	},
}
TypeClass = CORVROC

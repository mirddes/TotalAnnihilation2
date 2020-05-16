#ARM Atlas - Air Transport
#ARMATLAS
#
#Script created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair

ARMATLAS = Class(TAair) {
	OnCreate = function(self)
		TAair.OnCreate(self)
		self.Sliders = {
			arm1 = CreateSlider(self, 'Arm_01'),
			arm2 = CreateSlider(self, 'Arm_02'),
			arm3 = CreateSlider(self, 'Arm_03'),
		}
		self.Spinners = {
			arm1 = CreateRotator(self, 'Arm_01', 'y', nil, 0, 0, 0),
			arm2 = CreateRotator(self, 'Arm_02', 'y', nil, 0, 0, 0),
		}
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OpenWings = function(self)
		--MOVE arm1 to x-axis <-3.40> SPEED <3.00>;
		self.Sliders.arm1:SetGoal(3.40,0,0)
		self.Sliders.arm1:SetSpeed(3)

		--MOVE arm2 to x-axis <3.40> SPEED <3.00>;
		self.Sliders.arm2:SetGoal(-3.40,0,0)
		self.Sliders.arm2:SetSpeed(3)

		--MOVE arm3 to z-axis <-4.80> SPEED <4.00>;
		self.Sliders.arm3:SetGoal(0,0,-4.80)
		self.Sliders.arm3:SetSpeed(4)

		--TURN arm1 to y-axis <-21.14> SPEED <21.19>;
		self.Spinners.arm1:SetGoal(-21.14)
		self.Spinners.arm1:SetSpeed(21.19)

		--TURN arm2 to y-axis <21.14> SPEED <21.19>;
		self.Spinners.arm2:SetGoal(21.14)
		self.Spinners.arm2:SetSpeed(21.19)
	end,

	CloseWings = function(self)
		--MOVE arm1 to x-axis <0> SPEED <3.00>;
		self.Sliders.arm1:SetGoal(0.40,0,0)
		self.Sliders.arm1:SetSpeed(3)

		--MOVE arm2 to x-axis <0> SPEED <3.00>;
		self.Sliders.arm2:SetGoal(0,0,0)
		self.Sliders.arm2:SetSpeed(3)

		--MOVE arm3 to z-axis <0> SPEED <4.00>;
		self.Sliders.arm3:SetGoal(0,0,0)
		self.Sliders.arm3:SetSpeed(4)

		--TURN arm1 to y-axis <0> SPEED <21.19>;
		self.Spinners.arm1:SetGoal(0)
		self.Spinners.arm1:SetSpeed(21.19)

		--TURN arm2 to y-axis <0> SPEED <21.19>;
		self.Spinners.arm2:SetGoal(0)
		self.Spinners.arm2:SetSpeed(21.19)
	end,
}

TypeClass = ARMATLAS
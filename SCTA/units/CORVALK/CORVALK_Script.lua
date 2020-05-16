#CORE Valyrie - Air Transport
#CORVALK
#
#Script created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair

CORVALK = Class(TAair) {
	OnCreate = function(self)
		TAair.OnCreate(self)
		self.Spinners = {
			arm1 = CreateRotator(self, 'arm1', 'y', nil, 0, 0, 0),
			arm2 = CreateRotator(self, 'arm2', 'y', nil, 0, 0, 0),
			arm3 = CreateRotator(self, 'arm3', 'y', nil, 0, 0, 0),
			arm4 = CreateRotator(self, 'arm4', 'y', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OpenWings = function(self)

		--TURN arm1 to y-axis <54.72> SPEED <41.28>;
		self.Spinners.arm1:SetGoal(54)
		self.Spinners.arm1:SetSpeed(40)

		--TURN arm2 to y-axis <-52.29> SPEED <39.44>;
		self.Spinners.arm2:SetGoal(-54)
		self.Spinners.arm2:SetSpeed(40)

		--TURN arm3 to y-axis <-54.72> SPEED <41.28>;
		self.Spinners.arm3:SetGoal(-54)
		self.Spinners.arm3:SetSpeed(40)

		--TURN arm4 to y-axis <54.11> SPEED <40.82>;
		self.Spinners.arm4:SetGoal(54)
		self.Spinners.arm4:SetSpeed(40)

		--SLEEP <1326>;

	end,

	CloseWings = function(self)
		--TURN arm1 to y-axis <0> SPEED <41.31>;
		self.Spinners.arm1:SetGoal(0)
		self.Spinners.arm1:SetSpeed(40)

		--TURN arm2 to y-axis <0> SPEED <39.47>;
		self.Spinners.arm2:SetGoal(0)
		self.Spinners.arm2:SetSpeed(40)

		--TURN arm3 to y-axis <0> SPEED <41.31>;
		self.Spinners.arm3:SetGoal(0)
		self.Spinners.arm3:SetSpeed(40)

		--TURN arm4 to y-axis <0> SPEED <40.85>;
		self.Spinners.arm4:SetGoal(0)
		self.Spinners.arm4:SetSpeed(40)

		--SLEEP <1325>;

	end,
}

TypeClass = CORVALK
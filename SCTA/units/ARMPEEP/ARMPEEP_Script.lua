#ARM Peeper - Air Scout
#ARMPEEP
#
#Script created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair

ARMPEEP = Class(TAair) {

	OnCreate = function(self)
		TAair.OnCreate(self)
		self.Spinners = {
			wingp1 = CreateRotator(self, 'Wing_01', 'y', nil, 0, 0, 0),
			wingp2 = CreateRotator(self, 'Wing_02', 'y', nil, 0, 0, 0),
			wing1 = CreateRotator(self, 'Wing_01', 'x', nil, 0, 0, 0),
			wing2 = CreateRotator(self, 'Wing_02', 'x', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OpenWings = function(self)

		--TURN wingp1 to y-axis <51.63> SPEED <38.94>;
		self.Spinners.wingp1:SetGoal(-50)
		self.Spinners.wingp1:SetSpeed(39)

		--TURN wingp2 to y-axis <-51.15> SPEED <38.58>;
		self.Spinners.wingp2:SetGoal(50)
		self.Spinners.wingp2:SetSpeed(39)

		--TURN wing2 to x-axis <-8.12> SPEED <6.12>;
		self.Spinners.wing2:SetGoal(-8.60)
		self.Spinners.wing2:SetSpeed(6.12)

		--TURN wing1 to x-axis <-8.60> SPEED <6.48>;
		self.Spinners.wing1:SetGoal(-8.60)
		self.Spinners.wing1:SetSpeed(6.12)
	end,

	CloseWings = function(self)
		--TURN wingp1 to y-axis <0> SPEED <38.94>;
		self.Spinners.wingp1:SetGoal(0)
		self.Spinners.wingp1:SetSpeed(39)

		--TURN wingp2 to y-axis <0> SPEED <38.58>;
		self.Spinners.wingp2:SetGoal(0)
		self.Spinners.wingp2:SetSpeed(39)

		--TURN wing2 to x-axis <0> SPEED <6.12>;
		self.Spinners.wing2:SetGoal(0)
		self.Spinners.wing2:SetSpeed(6.12)

		--TURN wing1 to x-axis <0> SPEED <6.48>;
		self.Spinners.wing1:SetGoal(0)
		self.Spinners.wing1:SetSpeed(6.12)
	end,
}

TypeClass = ARMPEEP
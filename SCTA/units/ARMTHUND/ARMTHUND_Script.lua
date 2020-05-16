#ARM Thunder - Bomber
#ARMTHUND
#
#Blueprint created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMTHUND = Class(TAair) {

	OnCreate = function(self)
		TAair.OnCreate(self)
		self.Spinners = {
			jets = CreateRotator(self, 'Jets', 'x', nil, 0, 0, 0),
			wing1 = CreateRotator(self, 'Wing_01', 'y', nil, 0, 0, 0),
			wing2 = CreateRotator(self, 'Wing_02', 'y', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OpenWings = function(self)
		--TURN jets to x-axis <89.62> SPEED <61.52>;
		self.Spinners.jets:SetGoal(90)
		self.Spinners.jets:SetSpeed(62)

		--TURN wing1 to y-axis <-90.93> SPEED <62.43>;
		self.Spinners.wing1:SetGoal(-90)
		self.Spinners.wing1:SetSpeed(62)

		--TURN wing2 to y-axis <90.18> SPEED <61.90>;
		self.Spinners.wing2:SetGoal(90)
		self.Spinners.wing2:SetSpeed(62)
		
	end,

	CloseWings = function(self)
		--TURN jets to x-axis <0> SPEED <61.98>;
		self.Spinners.jets:SetGoal(0)
		self.Spinners.jets:SetSpeed(62)

		--TURN wing1 to y-axis <0> SPEED <62.90>;
		self.Spinners.wing1:SetGoal(0)
		self.Spinners.wing1:SetSpeed(62)

		--TURN wing2 to y-axis <0> SPEED <62.37>;
		self.Spinners.wing2:SetGoal(0)
		self.Spinners.wing2:SetSpeed(62)
	end,

	Weapons = {
		ARMBOMB = Class(TAweapon) {},
		AUTO_ATTACK = Class(TAweapon) {},
	},
}

TypeClass = ARMTHUND
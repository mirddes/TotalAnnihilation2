#CORE Fink - Air Scout
#CORFINK
#
#Script created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair

CORFINK = Class(TAair) {

	OnCreate = function(self)
		TAair.OnCreate(self)
		self.Spinners = {
			winga = CreateRotator(self, 'winga', 'z', nil, 0, 0, 0),
			wingb = CreateRotator(self, 'wingb', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OpenWings = function(self)
		--TURN winga to z-axis <-90> SPEED <61.95>;
		self.Spinners.winga:SetGoal(90)
		self.Spinners.winga:SetSpeed(62)

		--TURN wingb to y-axis <90> SPEED <61.95>;
		self.Spinners.wingb:SetGoal(-90)
		self.Spinners.wingb:SetSpeed(62)
	end,

	CloseWings = function(self)
		--TURN winga to z-axis <0> SPEED <62.64>;
		self.Spinners.winga:SetGoal(0)
		self.Spinners.winga:SetSpeed(63)

		--TURN wingb to z-axis <0> SPEED <62.64>;
		self.Spinners.wingb:SetGoal(0)
		self.Spinners.wingb:SetSpeed(63)
	end,
}

TypeClass = CORFINK
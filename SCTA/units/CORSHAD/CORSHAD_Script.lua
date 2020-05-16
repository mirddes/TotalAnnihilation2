#CORE Shadow - Bomber
#CORSHAD
#
#Blueprint created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORSHAD = Class(TAair) {

	OnCreate = function(self)
		TAair.OnCreate(self)
		self.Spinners = {
			wingsa = CreateRotator(self, 'winga', 'z', nil, 0, 0, 0),
			wingsb = CreateRotator(self, 'wingb', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OpenWings = function(self)

		--TURN wingsa to z-axis <-90.00> SPEED <60.01>;
		self.Spinners.wingsa:SetGoal(90)
		self.Spinners.wingsa:SetSpeed(60)

		--TURN wingsb to z-axis <90.00> SPEED <60.01>;
		self.Spinners.wingsb:SetGoal(-90)
		self.Spinners.wingsb:SetSpeed(60)
	end,

	CloseWings = function(self)
		--TURN wingsa to z-axis <0.00> SPEED <20.00>;
		self.Spinners.wingsa:SetGoal(0)
		self.Spinners.wingsa:SetSpeed(20)

		--TURN wingsb to z-axis <0.00> SPEED <20.00>;
		self.Spinners.wingsb:SetGoal(0)
		self.Spinners.wingsb:SetSpeed(20)
	end,

	Weapons = {
		CORBOMB = Class(TAweapon) {},
		AUTO_ATTACK = Class(TAweapon) {},
	},
}

TypeClass = CORSHAD
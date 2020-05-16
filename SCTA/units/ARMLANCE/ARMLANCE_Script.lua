#ARM Lancet - Torpedo Bomber
#ARMLANCE
#
#Script created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

ARMLANCE = Class(TAair) {

	OnCreate = function(self)
		TAair.OnCreate(self)
		self.Sliders = {
			wing1 = CreateSlider(self, 'Wing_01'),
			wing2 = CreateSlider(self, 'Wing_02'),
			wing1b = CreateSlider(self, 'Wing_01'),
			wing2b = CreateSlider(self, 'Wing_02'),
			tail1 = CreateSlider(self, 'Tail_01'),
			tail2 = CreateSlider(self, 'Tail_02'),
		}
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	OpenWings = function(self)
		--MOVE wing1 to x-axis <2.60> SPEED <3.00>;
		self.Sliders.wing1:SetGoal(-2.7,0,0)
		self.Sliders.wing1:SetSpeed(3)

		--MOVE wing1 to z-axis <-5.09> SPEED <6.00>;
		self.Sliders.wing1b:SetGoal(0,0,-5)
		self.Sliders.wing1b:SetSpeed(6)

		--MOVE wing2 to x-axis <-2.70> SPEED <3.00>;
		self.Sliders.wing2:SetGoal(2.7,0,0)
		self.Sliders.wing2:SetSpeed(3)

		--MOVE wing2 to z-axis <-5.20> SPEED <6.00>;
		self.Sliders.wing2b:SetGoal(0,0,-5)
		self.Sliders.wing2b:SetSpeed(6)

		--SLEEP <750>;

		--MOVE tail1 to x-axis <1.84> SPEED <2.00>;
		self.Sliders.tail1:SetGoal(-2,0,0)
		self.Sliders.tail1:SetSpeed(2)

		--MOVE tail2 to x-axis <-2.00> SPEED <2.00>;
		self.Sliders.tail2:SetGoal(2,0,0)
		self.Sliders.tail2:SetSpeed(2)
	end,

	CloseWings = function(self)

		--MOVE tail1 to x-axis <0> SPEED <2.00>;
		self.Sliders.tail1:SetGoal(0,0,0)
		self.Sliders.tail1:SetSpeed(2)

		--MOVE tail2 to x-axis <0> SPEED <2.00>;
		self.Sliders.tail2:SetGoal(0,0,0)
		self.Sliders.tail2:SetSpeed(2)

		--SLEEP <750>;

		--MOVE wing1 to x-axis <0> SPEED <3.00>;
		self.Sliders.wing1:SetGoal(0,0,0)
		self.Sliders.wing1:SetSpeed(3)

		--MOVE wing1 to z-axis <0> SPEED <7.00>;
		self.Sliders.wing1b:SetGoal(0,0,0)
		self.Sliders.wing1b:SetSpeed(7)

		--MOVE wing2 to x-axis <0> SPEED <3.00>;
		self.Sliders.wing2:SetGoal(0,0,0)
		self.Sliders.wing2:SetSpeed(3)

		--MOVE wing2 to z-axis <0> SPEED <7.00>;
		self.Sliders.wing2b:SetGoal(0,0,0)
		self.Sliders.wing2b:SetSpeed(7)
	end,

	Weapons = {
		ARMAIR_TORPEDO = Class(TAweapon) {},
		AUTO_ATTACK = Class(TAweapon) {},
	},
}

TypeClass = ARMLANCE
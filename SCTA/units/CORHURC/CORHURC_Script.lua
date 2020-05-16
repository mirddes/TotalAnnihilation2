#CORE Hurricane - Strategic Bomber
#CORHURC
#
#Script created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORHURC = Class(TAair) {

	OnCreate = function(self)
		TAair.OnCreate(self)
		self.Spinners = {
			wing1 = CreateRotator(self, 'wing1', 'z', nil, 0, 0, 0),
			wing2 = CreateRotator(self, 'wing2', 'z', nil, 0, 0, 0),
			tail1 = CreateRotator(self, 'tail1', 'z', nil, 0, 0, 0),
			tail2 = CreateRotator(self, 'tail2', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	OpenWings = function(self)
		--TURN wing1 to z-axis <-90.00> SPEED <75.64>;
		self.Spinners.wing1:SetGoal(90)
		self.Spinners.wing1:SetSpeed(75)

		--TURN wing2 to z-axis <90.00> SPEED <75.64>;
		self.Spinners.wing2:SetGoal(-90)
		self.Spinners.wing2:SetSpeed(75)

		--TURN tail1 to z-axis <-30.23> SPEED <25.41>;
		self.Spinners.tail1:SetGoal(-30)
		self.Spinners.tail1:SetSpeed(25)

		--TURN tail2 to z-axis <30.23> SPEED <25.41>;
		self.Spinners.tail2:SetGoal(30)
		self.Spinners.tail2:SetSpeed(25)
	end,

	CloseWings = function(self)
		--TURN wing1 to z-axis <0> SPEED <75.64>;
		self.Spinners.wing1:SetGoal(0)
		self.Spinners.wing1:SetSpeed(75)

		--TURN wing2 to z-axis <0> SPEED <75.64>;
		self.Spinners.wing2:SetGoal(0)
		self.Spinners.wing2:SetSpeed(75)

		--TURN tail1 to z-axis <0> SPEED <25.41>;
		self.Spinners.tail1:SetGoal(0)
		self.Spinners.tail1:SetSpeed(25)

		--TURN tail2 to z-axis <0> SPEED <25.41>;
		self.Spinners.tail2:SetGoal(0)
		self.Spinners.tail2:SetSpeed(25)
	end,

	Weapons = {
		CORADVBOMB = Class(TAweapon) {},
		CORAIR2AIRLASER = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAair.ShowMuzzleFlare(self, 0.15)
			end,
		},
		AUTO_ATTACK = Class(TAweapon) {},
	},
}

TypeClass = CORHURC
#CORE Avenger - Fighter
#CORVENG
#
#Script created by Raevn

local TAair = import('/mods/SCTA/lua/TAair.lua').TAair
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon

CORVENG = Class(TAair) {
	moving = false,

	OnCreate = function(self)
		TAair.OnCreate(self)
		self:SetConsumptionActive(true)
		self.Spinners = {
			base = CreateRotator(self, 0, 'z', nil, 0, 0, 0),
			winga = CreateRotator(self, 'winga', 'z', nil, 0, 0, 0),
			wingb = CreateRotator(self, 'wingb', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		ForkThread(self.RollThread, self)
	end,

	RollThread = function(self)
		while not IsDestroyed(self) do
			if self.moving == true then
				if math.random(10) == 5 then
					--TURN base to z-axis <239.99> SPEED <120.02>
					self.Spinners.base:SetGoal(240)
					self.Spinners.base:SetSpeed(120)

					WaitFor(self.Spinners.base)

					--TURN base to z-axis <119.99> SPEED <180.04>
					self.Spinners.base:SetGoal(120)
					self.Spinners.base:SetSpeed(120)

					WaitFor(self.Spinners.base)

					--TURN base to z-axis <0> SPEED <120.02>
					self.Spinners.base:SetGoal(0)
					self.Spinners.base:SetSpeed(120)

					WaitFor(self.Spinners.base)

					self.Spinners.base:SetSpeed(0)
					self.Spinners.base:ClearGoal()	
				end
			end
			WaitSeconds(2)
		end
	end,

	OpenWings = function(self)
		--TURN winga to z-axis <-91.21> SPEED <63.22>;
		self.Spinners.winga:SetGoal(90)
		self.Spinners.winga:SetSpeed(63)

		--TURN wingb to z-axis <91.21> SPEED <63.22>;
		self.Spinners.wingb:SetGoal(-90)
		self.Spinners.wingb:SetSpeed(63)

		self.moving = true
	end,

	CloseWings = function(self)
		self.moving = false

		--TURN winga to z-axis <0> SPEED <63.13>;
		self.Spinners.winga:SetGoal(0)
		self.Spinners.winga:SetSpeed(63)

		--TURN wingb to z-axis <0> SPEED <63.13>;
		self.Spinners.wingb:SetGoal(0)
		self.Spinners.wingb:SetSpeed(63)
	end,

	Weapons = {
		CORVTOL_MISSILE = Class(TAweapon) {},
		AUTO_ATTACK = Class(TAweapon) {},
	},
}

TypeClass = CORVENG
#CORE Shipyard - Produces Ships
#CORSY
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor

CORSY = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,

	OnCreate = function(self)
		TAconstructor.OnCreate(self)
		self.Spinners = {
			turreta = CreateRotator(self, 'turreta', 'y', nil, 0, 0, 0),
			turretb = CreateRotator(self, 'turretb', 'y', nil, 0, 0, 0),
			gunax = CreateRotator(self, 'guna', 'x', nil, 0, 0, 0),
			--gunaz = CreateRotator(self, 'guna', 'z', nil, 0, 0, 0),
			gunbx = CreateRotator(self, 'gunb', 'x', nil, 0, 0, 0),
			--gunbz = CreateRotator(self, 'gunb', 'z', nil, 0, 0, 0),
		}
		self.Sliders = {
			turreta = CreateSlider(self, 'turreta'),
			turretb = CreateSlider(self, 'turretb'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	Open = function(self)

		--MOVE turreta to y-axis <6.89> SPEED <5.00>;
		self.Sliders.turreta:SetGoal(0,6.9,0)
		self.Sliders.turreta:SetSpeed(5)

		--MOVE turretb to y-axis <6.94> SPEED <5.00>;
		self.Sliders.turretb:SetGoal(0,6.9,0)
		self.Sliders.turretb:SetSpeed(5)

		--SLEEP <1177>;
		WaitSeconds(1.2)

		--TURN turreta to y-axis <-33.98> SPEED <47.07>;
		self.Spinners.turreta:SetGoal(-34)
		self.Spinners.turreta:SetSpeed(47)

		--TURN turretb to y-axis <-43.00> SPEED <59.58>;
		self.Spinners.turretb:SetGoal(-43)
		self.Spinners.turretb:SetSpeed(60)

		--TURN gunb to x-axis <-71.68> SPEED <99.30>;
		self.Spinners.gunbx:SetGoal(-72)
		self.Spinners.gunbx:SetSpeed(99)

		--TURN gunb to z-axis <28.66> SPEED <39.71>;
		--self.Spinners.gunbz:SetGoal(28.66)
		--self.Spinners.gunbz:SetSpeed(39.71)

		--TURN guna to x-axis <66.90> SPEED <92.68>;
		self.Spinners.gunax:SetGoal(66.90)
		self.Spinners.gunax:SetSpeed(92.68)

		--TURN guna to z-axis <-28.66> SPEED <39.71>;
		--self.Spinners.gunaz:SetGoal(-28.66)
		--self.Spinners.gunaz:SetSpeed(39.71)

		--SLEEP <722>;
		WaitSeconds(0.7)

		--SLEEP <11>;

		TAconstructor.Open(self)
	end,


	Close = function(self)

		--TURN turreta to y-axis <0> SPEED <50.28>;
		self.Spinners.turreta:SetGoal(0)
		self.Spinners.turreta:SetSpeed(50.28)

		--TURN turretb to y-axis <0> SPEED <63.63>;
		self.Spinners.turretb:SetGoal(0)
		self.Spinners.turretb:SetSpeed(63.63)

		--TURN gunb to x-axis <0> SPEED <106.06>;
		self.Spinners.gunbx:SetGoal(0)
		self.Spinners.gunbx:SetSpeed(106.06)

		--TURN gunb to z-axis <0> SPEED <42.42>;
		--self.Spinners.gunbz:SetGoal(0)
		--self.Spinners.gunbz:SetSpeed(42.42)

		--TURN guna to x-axis <0> SPEED <98.98>;
		self.Spinners.gunax:SetGoal(0)
		self.Spinners.gunax:SetSpeed(98.98)

		--TURN guna to z-axis <0> SPEED <42.42>;
		--self.Spinners.gunaz:SetGoal(0)
		--self.Spinners.gunaz:SetSpeed(42.42)

		--SLEEP <676>;
		WaitSeconds(0.7)

		--MOVE turreta to y-axis <0> SPEED <5.00>;
		self.Sliders.turreta:SetGoal(0,0,0)
		self.Sliders.turreta:SetSpeed(5)

		--MOVE turretb to y-axis <0> SPEED <5.00>;
		self.Sliders.turretb:SetGoal(0,0,0)
		self.Sliders.turretb:SetSpeed(5)

		--SLEEP <1222>;
		WaitSeconds(1.2)
		--SLEEP <7>;

		TAconstructor.Close(self)
	end,
}

TypeClass = CORSY
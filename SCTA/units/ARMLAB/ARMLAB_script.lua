#ARM Kbot Lab - Produces Kbots
#ARMLAB
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor

ARMLAB = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = true,

	OnCreate = function(self)
		self.Spinners = {
			stand1 = CreateRotator(self, 'Stand_02', 'z', nil, 0, 0, 0),
			stand2 = CreateRotator(self, 'Stand_01', 'z', nil, 0, 0, 0),
			nano1 = CreateRotator(self, 'Build_Nozzle_01', 'z', nil, 0, 0, 0),
			nano2 = CreateRotator(self, 'Build_Nozzle_02', 'z', nil, 0, 0, 0),
			nano1aim = CreateRotator(self, 'Nozzle_01', 'y', -90, 3600, 0, 0),
			nano2aim = CreateRotator(self, 'Nozzle_02', 'y', 90, 3600, 0, 0),
			pad = CreateRotator(self, 'BasePlate', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			door1A = CreateSlider(self, 'Door_01a'),
			door2A = CreateSlider(self, 'Door_02a'),
			door3A = CreateSlider(self, 'Door_03a'),
			door4A = CreateSlider(self, 'Door_04a'),
			door1 = CreateSlider(self, 'Door_01'),
			door2 = CreateSlider(self, 'Door_02'),
			door3 = CreateSlider(self, 'Door_03'),
			door4 = CreateSlider(self, 'Door_04'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		TAconstructor.OnCreate(self)
	end,


	Open = function(self)

		--MOVE door4A to z-axis <-9.60> SPEED <9.00>
		self.Sliders.door4A:SetGoal(0,0,9.5)
		self.Sliders.door4A:SetSpeed(9)

		--MOVE door3A to z-axis <-9.50> SPEED <9.00>
		self.Sliders.door3A:SetGoal(0,0,9.5)
		self.Sliders.door3A:SetSpeed(9)

		--MOVE door2A to z-axis <10.00> SPEED <10.00>
		self.Sliders.door2A:SetGoal(0,0,-9.5)
		self.Sliders.door2A:SetSpeed(9)

		--MOVE door1A to z-axis <9.90> SPEED <9.00>
		self.Sliders.door1A:SetGoal(0,0,-9.5)
		self.Sliders.door1A:SetSpeed(9)

		--TURN stand1 to z-axis <35.09> SPEED <35.17>
		self.Spinners.stand1:SetGoal(35)
		self.Spinners.stand1:SetSpeed(35.5)

		--TURN stand2 to z-axis <-35.54> SPEED <35.62>
		self.Spinners.stand2:SetGoal(-35)
		self.Spinners.stand2:SetSpeed(35.5)

		--TURN nano2 to z-axis <102.14> SPEED <102.37>
		self.Spinners.nano2:SetGoal(100)
		self.Spinners.nano2:SetSpeed(100)

		--TURN nano1 to z-axis <-100.79> SPEED <101.02>
		self.Spinners.nano1:SetGoal(-100)
		self.Spinners.nano1:SetSpeed(100)

		--SLEEP <998>
		WaitSeconds(1)

		--MOVE door1 to x-axis <7.50> SPEED <7.00>;
		self.Sliders.door1:SetGoal(7.5,0,0)
		self.Sliders.door1:SetSpeed(7)

		--MOVE door2 to x-axis <-7.50> SPEED <7.00>;
		self.Sliders.door2:SetGoal(-7.5,0,0)
		self.Sliders.door2:SetSpeed(7)

		--MOVE door3 to x-axis <7.50> SPEED <7.00>;
		self.Sliders.door3:SetGoal(7.5,0,0)
		self.Sliders.door3:SetSpeed(7)

		--MOVE door4 to x-axis <-7.50> SPEED <7.00>;
		self.Sliders.door4:SetGoal(-7.5,0,0)
		self.Sliders.door4:SetSpeed(7)

		--SLEEP <1008>;
		WaitSeconds(1.)

		--SLEEP <48>;

		--SPIN pad around y-axis  SPEED <30.00>
		self.Spinners.pad:SetSpeed(30)

		TAconstructor.Open(self)
	end,

	Close = function(self)
		#Needs to be moved
		--STOP-SPIN pad around y-axis 
		self.Spinners.pad:SetSpeed(0)

		--MOVE door1 to x-axis <0> SPEED <7.00>;
		self.Sliders.door1:SetGoal(0,0,0)
		self.Sliders.door1:SetSpeed(7)

		--MOVE door2 to x-axis <0> SPEED <7.00>;
		self.Sliders.door2:SetGoal(0,0,0)
		self.Sliders.door2:SetSpeed(7)

		--MOVE door3 to x-axis <0> SPEED <7.00>;
		self.Sliders.door3:SetGoal(0,0,0)
		self.Sliders.door3:SetSpeed(7)

		--MOVE door4 to x-axis <0> SPEED <7.00>;
		self.Sliders.door4:SetGoal(0,0,0)
		self.Sliders.door4:SetSpeed(7)

		--SLEEP <998>;
		WaitSeconds(1)

		--MOVE door4A to z-axis <0> SPEED <9.00>;
		self.Sliders.door4A:SetGoal(0,0,0)
		self.Sliders.door4A:SetSpeed(9)

		--MOVE door3A to z-axis <0> SPEED <9.00>;
		self.Sliders.door3A:SetGoal(0,0,0)
		self.Sliders.door3A:SetSpeed(9)

		--MOVE door2A to z-axis <0> SPEED <9.00>;
		self.Sliders.door2A:SetGoal(0,0,0)
		self.Sliders.door2A:SetSpeed(9)

		--MOVE door1A to z-axis <0> SPEED <9.00>;
		self.Sliders.door1A:SetGoal(0,0,0)
		self.Sliders.door1A:SetSpeed(9)

		--TURN stand1 to z-axis <0> SPEED <34.82>;
		self.Spinners.stand1:SetGoal(0)
		self.Spinners.stand1:SetSpeed(35.27)

		--TURN stand2 to z-axis <0> SPEED <35.27>;
		self.Spinners.stand2:SetGoal(0)
		self.Spinners.stand2:SetSpeed(35.27)

		--TURN nano2 to z-axis <0> SPEED <101.36>;
		self.Spinners.nano2:SetGoal(0)
		self.Spinners.nano2:SetSpeed(100)

		--TURN nano1 to z-axis <0> SPEED <100.02>;
		self.Spinners.nano1:SetGoal(0)
		self.Spinners.nano1:SetSpeed(100)

		--SLEEP <1008>;
		WaitSeconds(1)

		--SLEEP <48>;

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMLAB
#CORE Adv. Vehicle Plant - Produces Vehicles
#CORAVP
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor

CORAVP = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = true,

	OnCreate = function(self)
		self.Spinners = {
			wing1 = CreateRotator(self, 'wing1', 'z', nil, 0, 0, 0),
			wing2 = CreateRotator(self, 'wing2', 'x', nil, 0, 0, 0),
			wing3 = CreateRotator(self, 'wing3', 'z', nil, 0, 0, 0),
			pad = CreateRotator(self, 'pad', 'y', nil, 0, 0, 0),
			muzzle1 = CreateRotator(self, 'muzzle1', 'y', 40, 999, 0, 0),
			muzzle2 = CreateRotator(self, 'muzzle2', 'y', -40, 999, 0, 0),
			muzzle1x = CreateRotator(self, 'muzzle1', 'x', 25, 999, 0, 0),
			muzzle2x = CreateRotator(self, 'muzzle2', 'x', 25, 999, 0, 0),
		}
		self.Sliders = {
			drawer1 = CreateSlider(self, 'drawer1'),
			drawer2 = CreateSlider(self, 'drawer2'),
			gun1 = CreateSlider(self, 'gun1'),
			gun2 = CreateSlider(self, 'gun2'),
			pad = CreateSlider(self, 'padmover'),
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

		--TURN wing1 to z-axis <-90.00> SPEED <180.76>;
		self.Spinners.wing1:SetGoal(90)
		self.Spinners.wing1:SetSpeed(180)

		--TURN wing2 to x-axis <-90.00> SPEED <180.76>;
		self.Spinners.wing2:SetGoal(-90)
		self.Spinners.wing2:SetSpeed(180)

		--TURN wing3 to z-axis <90.00> SPEED <180.76>;
		self.Spinners.wing3:SetGoal(-90)
		self.Spinners.wing3:SetSpeed(180)

		--SLEEP <498>;
		WaitSeconds(0.5)

		--TURN wing1 to z-axis <-180.00> SPEED <180.76>;
		self.Spinners.wing1:SetGoal(180)
		self.Spinners.wing1:SetSpeed(180)

		--TURN wing2 to x-axis <-179.45> SPEED <179.68>;
		self.Spinners.wing2:SetGoal(180)
		self.Spinners.wing2:SetSpeed(180)

		--TURN wing3 to z-axis <179.45> SPEED <179.68>;
		self.Spinners.wing3:SetGoal(-180)
		self.Spinners.wing3:SetSpeed(180)

		--SLEEP <498>;
		WaitSeconds(0.5)
			
		--MOVE drawer1 to y-axis <8.25> SPEED <13.00>;
		self.Sliders.drawer1:SetGoal(0,8.25,0)
		self.Sliders.drawer1:SetSpeed(13)

		--MOVE drawer2 to y-axis <8.20> SPEED <13.00>;
		self.Sliders.drawer2:SetGoal(0,8.25,0)
		self.Sliders.drawer2:SetSpeed(13)

		--MOVE pad to z-axis <9.20> SPEED <14.00>;
		self.Sliders.pad:SetGoal(0,0,9.20)
		self.Sliders.pad:SetSpeed(14)

		--SLEEP <628>;
		WaitSeconds(0.6)

		--MOVE gun2 to x-axis <3.10> SPEED <6.00>;
		--MOVE gun2 to z-axis <3.10> SPEED <6.00>;
		self.Sliders.gun2:SetGoal(-3.1,0,3.1)
		self.Sliders.gun2:SetSpeed(6)

		--MOVE gun1 to x-axis <-3.10> SPEED <6.00>;
		--MOVE gun1 to z-axis <3.15> SPEED <6.00>;
		self.Sliders.gun1:SetGoal(3.1,0,3.1)
		self.Sliders.gun1:SetSpeed(6)
			
		--SLEEP <470>;
		WaitSeconds(0.475)

		--SLEEP <6>

		--SPIN pad around y-axis  SPEED <30.00>
		self.Spinners.pad:SetSpeed(30)

		TAconstructor.Open(self)
	end,

	Close = function(self)
		#Needs to be moved
		--STOP-SPIN pad around y-axis 
		self.Spinners.pad:SetSpeed(0)

		--MOVE gun2 to x-axis <0> SPEED <3.00>;
		--MOVE gun2 to z-axis <0> SPEED <3.00>;
		self.Sliders.gun2:SetGoal(0,0,0)
		self.Sliders.gun2:SetSpeed(3)

		--MOVE gun1 to x-axis <0> SPEED <3.00>;
		--MOVE gun1 to z-axis <0> SPEED <3.00>;
		self.Sliders.gun1:SetGoal(0,0,0)
		self.Sliders.gun1:SetSpeed(3)

		--SLEEP <968>;
		WaitSeconds(1.1) #made longer

		--MOVE drawer1 to y-axis <0> SPEED <13.00>;
		self.Sliders.drawer1:SetGoal(0,0,0)
		self.Sliders.drawer1:SetSpeed(13)

		--MOVE drawer2 to y-axis <0> SPEED <13.00>;
		self.Sliders.drawer2:SetGoal(0,0,0)
		self.Sliders.drawer2:SetSpeed(13)

		--MOVE pad to z-axis <0> SPEED <14.00>;
		self.Sliders.pad:SetGoal(0,0,0)
		self.Sliders.pad:SetSpeed(14)

		--SLEEP <631>;
		WaitSeconds(0.6)

		--TURN wing1 to z-axis <-90.00> SPEED <358.64>;
		self.Spinners.wing1:SetGoal(90)
		self.Spinners.wing1:SetSpeed(356)

		--TURN wing2 to x-axis <-90.00> SPEED <356.50>;
		self.Spinners.wing2:SetGoal(-90)
		self.Spinners.wing2:SetSpeed(358)

		--TURN wing3 to z-axis <90.00> SPEED <356.50>;
		self.Spinners.wing3:SetGoal(-90)
		self.Spinners.wing3:SetSpeed(358)

		--SLEEP <251>;
		WaitSeconds(0.25)

		--TURN wing1 to z-axis <0> SPEED <358.64>;
		self.Spinners.wing1:SetGoal(0)
		self.Spinners.wing1:SetSpeed(358)

		--TURN wing2 to x-axis <0> SPEED <358.64>;
		self.Spinners.wing2:SetGoal(0)
		self.Spinners.wing2:SetSpeed(358)

		--TURN wing3 to z-axis <0> SPEED <358.64>;
		self.Spinners.wing3:SetGoal(0)
		self.Spinners.wing3:SetSpeed(358)

		--SLEEP <251>;
		WaitSeconds(0.25)

		--SLEEP <20>;

		TAconstructor.Close(self)
	end,
}

TypeClass = CORAVP
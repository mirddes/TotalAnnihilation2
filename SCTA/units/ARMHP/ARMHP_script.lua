#ARM Hovercraft Platform - Builds Hovercraft
#ARMHP
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor

ARMVP = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = true,

	OnCreate = function(self)
		self.Spinners = {
			door1 = CreateRotator(self, 'door1', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'door2', 'z', nil, 0, 0, 0),
			post1 = CreateRotator(self, 'post1', 'x', nil, 0, 0, 0),
			post2 = CreateRotator(self, 'post2', 'x', nil, 0, 0, 0),
			post1x = CreateRotator(self, 'post1', 'z', nil, 0, 0, 0),
			post2x = CreateRotator(self, 'post2', 'z', nil, 0, 0, 0),
			nano1 = CreateRotator(self, 'nano1', 'x', nil, 0, 0, 0),
			nano2 = CreateRotator(self, 'nano2', 'x', nil, 0, 0, 0),
			pad = CreateRotator(self, 'pad', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			door1 = CreateSlider(self, 'door1'),
			door2 = CreateSlider(self, 'door2'),
			plate1 = CreateSlider(self, 'plate2'),
			plate2 = CreateSlider(self, 'plate1'),
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

		--TURN door1 to z-axis <-90.00> SPEED <175.13>;
		self.Spinners.door1:SetGoal(-90)
		self.Spinners.door1:SetSpeed(175)

		--TURN door2 to z-axis <90.00> SPEED <175.13>;
		self.Spinners.door2:SetGoal(90)
		self.Spinners.door2:SetSpeed(175)

		--SLEEP <514>
		WaitSeconds(0.5)

		--MOVE door1 to y-axis <-5.25> SPEED <10.00>;
		self.Sliders.door1:SetGoal(5.25,0,0)
		self.Sliders.door1:SetSpeed(10)

		--MOVE door2 to y-axis <-5.85> SPEED <11.00>;
		self.Sliders.door2:SetGoal(-5.25,0,0)
		self.Sliders.door2:SetSpeed(10)

		--SLEEP <518>
		WaitSeconds(0.5)

		--MOVE plate1 to y-axis <4.05> SPEED <7.00>;
		self.Sliders.plate1:SetGoal(0,3.75,0) #Stuck out
		self.Sliders.plate1:SetSpeed(7)

		--MOVE plate2 to y-axis <4.15> SPEED <7.00>;
		self.Sliders.plate2:SetGoal(0,3.75,0) #Stuck out
		self.Sliders.plate2:SetSpeed(7)

		--SLEEP <519>
		WaitSeconds(0.5)

		#Not in TA
		self.Spinners.post2:SetGoal(90)
		self.Spinners.post2:SetSpeed(173.45)

		self.Spinners.post1:SetGoal(90)
		self.Spinners.post1:SetSpeed(173.45)

		--TURN nano2 to y-axis <-90.00> SPEED <173.45>;
		self.Spinners.nano2:SetGoal(-65) #Changed to aim better
		self.Spinners.nano2:SetSpeed(173.45)

		--TURN nano1 to y-axis <90.00> SPEED <173.45>;
		self.Spinners.nano1:SetGoal(-65) #Changed to aim better
		self.Spinners.nano1:SetSpeed(173.45)

		--SLEEP <519>
		WaitSeconds(0.5)

		#Not in TA
		self.Spinners.post2x:SetGoal(90)
		self.Spinners.post2x:SetSpeed(173.45)

		self.Spinners.post1x:SetGoal(-90)
		self.Spinners.post1x:SetSpeed(173.45)

		--SLEEP <519>
		WaitSeconds(0.7) #Needed a bit more time

		--SLEEP <13>

		#Needs to be moved
		--SPIN pad around y-axis  SPEED <30.00>
		self.Spinners.pad:SetSpeed(30)

		TAconstructor.Open(self)
	end,

	Close = function(self)
		#Needs to be moved
		--STOP-SPIN pad around y-axis 
		self.Spinners.pad:SetSpeed(0)

		#Not in TA
		self.Spinners.post2x:SetGoal(0)
		self.Spinners.post2x:SetSpeed(173.45)

		self.Spinners.post1x:SetGoal(0)
		self.Spinners.post1x:SetSpeed(173.45)

		--SLEEP <519>
		WaitSeconds(0.5)

		--TURN nano2 to y-axis <0> SPEED <173.45>;
		self.Spinners.nano2:SetGoal(0)
		self.Spinners.nano2:SetSpeed(173.45)

		--TURN nano1 to y-axis <0> SPEED <173.45>;
		self.Spinners.nano1:SetGoal(0)
		self.Spinners.nano1:SetSpeed(173.45)

		#Not in TA
		self.Spinners.post2:SetGoal(0)
		self.Spinners.post2:SetSpeed(173.45)

		self.Spinners.post1:SetGoal(0)
		self.Spinners.post1:SetSpeed(173.45)

		--SLEEP <518>
		WaitSeconds(0.5)

		--MOVE plate1 to y-axis <0> SPEED <7.00>;
		self.Sliders.plate1:SetGoal(0,0,0)
		self.Sliders.plate1:SetSpeed(7)

		--MOVE plate2 to y-axis <0> SPEED <7.00>;
		self.Sliders.plate2:SetGoal(0,0,0)
		self.Sliders.plate2:SetSpeed(7)

		--SLEEP <519>
		WaitSeconds(0.5)


		--MOVE door1 to y-axis <0> SPEED <10.00>;
		self.Sliders.door1:SetGoal(0,0,0)
		self.Sliders.door1:SetSpeed(10)

		--MOVE door2 to y-axis <0> SPEED <11.00>;
		self.Sliders.door2:SetGoal(0,0,0)
		self.Sliders.door2:SetSpeed(10)

		--SLEEP <520>
		WaitSeconds(0.5)


		--TURN door1 to z-axis <0> SPEED <175.13>;
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(175)

		--TURN door2 to z-axis <0> SPEED <175.13>;
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(175)

		--SLEEP <520>
		WaitSeconds(0.5)

		--SLEEP <23>;

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMVP
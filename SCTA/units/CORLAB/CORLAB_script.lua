#CORE Kbot Lab - Produces Kbots
#CORLAB
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
			upper1 = CreateRotator(self, 'upper1', 'x', nil, 0, 0, 0),
			upper2 = CreateRotator(self, 'upper2', 'x', nil, 0, 0, 0),
			ugun1 = CreateRotator(self, 'ugun1', 'y', nil, 0, 0, 0),
			ugun2 = CreateRotator(self, 'ugun2', 'y', nil, 0, 0, 0),
			muzzle1 = CreateRotator(self, 'muzzle1', 'y', 180, 3600, 0, 0),
			muzzle2 = CreateRotator(self, 'muzzle2', 'y', 180, 3600, 0, 0),
			muzzle1z = CreateRotator(self, 'muzzle1', 'z', -15, 3600, 0, 0),
			muzzle2z = CreateRotator(self, 'muzzle2', 'z', -15, 3600, 0, 0),
			pad = CreateRotator(self, 'pad', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			padmover = CreateSlider(self, 'padmover'),
			lower1 = CreateSlider(self, 'lower1'),
			lower2 = CreateSlider(self, 'lower2'),
			upper1 = CreateSlider(self, 'upper1'),
			upper2 = CreateSlider(self, 'upper2'),
			ldoor1 = CreateSlider(self, 'ldoor1'),
			ldoor2 = CreateSlider(self, 'ldoor2'),
			udoor1 = CreateSlider(self, 'udoor1'),
			udoor2 = CreateSlider(self, 'udoor2'),
			lbox1 = CreateSlider(self, 'lbox1'),
			lbox2 = CreateSlider(self, 'lbox2'),
			ubox1 = CreateSlider(self, 'ubox1'),
			ubox2 = CreateSlider(self, 'ubox2'),
			ugun1 = CreateSlider(self, 'ugun1'),
			ugun2 = CreateSlider(self, 'ugun2'),
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
			--TURN upper2 to x-axis <180.00> SPEED <194.63>;
			self.Spinners.upper2:SetGoal(180)
			self.Spinners.upper2:SetSpeed(194.63)

			--TURN upper1 to x-axis <180.00> SPEED <194.63>;
			self.Spinners.upper1:SetGoal(180)
			self.Spinners.upper1:SetSpeed(194.63)

			--SLEEP <925>;
			WaitSeconds(0.925)

			--MOVE lower1 to x-axis <8.90> SPEED <8.00>;
			self.Sliders.lower1:SetGoal(-8.9,0,0)
			self.Sliders.lower1:SetSpeed(8)

			--MOVE lower2 to x-axis <-8.95> SPEED <9.00>;
			self.Sliders.lower2:SetGoal(8.9,0,0)
			self.Sliders.lower2:SetSpeed(8)

			--SLEEP <990>;
			WaitSeconds(0.99)

			--MOVE ldoor2 to y-axis <-0.15> SPEED <1.00>;
			self.Sliders.ldoor2:SetGoal(0,-0.15,0)
			self.Sliders.ldoor2:SetSpeed(1)

			--MOVE udoor2 to y-axis <0.15> SPEED <1.00>;
			self.Sliders.udoor2:SetGoal(0,0.15,0)
			self.Sliders.udoor2:SetSpeed(1)

			--MOVE ldoor1 to y-axis <-0.15> SPEED <1.00>;
			self.Sliders.ldoor1:SetGoal(0,-0.15,0)
			self.Sliders.ldoor1:SetSpeed(1)

			--MOVE udoor1 to y-axis <0.15> SPEED <1.00>;
			self.Sliders.udoor1:SetGoal(0,0.15,0)
			self.Sliders.udoor1:SetSpeed(1)

			#--TURN udoor1 to y-axis <0.60> SPEED <7.50>;
			#self.Spinners.udoor1:SetGoal(0.6)
			#self.Spinners.udoor1:SetSpeed(7.5)

			--SLEEP <81>;
			WaitSeconds(0.081)

			--MOVE ldoor2 to x-axis <-3.65> SPEED <7.00>;
			self.Sliders.ldoor2:SetGoal(3.65,0,0)
			self.Sliders.ldoor2:SetSpeed(7)

			--MOVE udoor2 to x-axis <-3.64> SPEED <7.00>;
			self.Sliders.udoor2:SetGoal(3.65,0,0)
			self.Sliders.udoor2:SetSpeed(7)

			--MOVE ldoor1 to x-axis <3.65> SPEED <7.00>;
			self.Sliders.ldoor1:SetGoal(-3.65,0,0)
			self.Sliders.ldoor1:SetSpeed(7)

			--MOVE udoor1 to x-axis <3.69> SPEED <7.00>;
			self.Sliders.udoor1:SetGoal(-3.65,0,0)
			self.Sliders.udoor1:SetSpeed(7)

			--SLEEP <476>;
			WaitSeconds(0.476)

			--MOVE pad to z-axis <6.25> SPEED <10.00>;
			self.Sliders.padmover:SetGoal(0,0,6.25)
			self.Sliders.padmover:SetSpeed(10)

			--MOVE lbox2 to y-axis <4.45> SPEED <7.00>;
			self.Sliders.lbox2:SetGoal(0,4.45,0)
			self.Sliders.lbox2:SetSpeed(7)

			--MOVE ubox2 to y-axis <-4.45> SPEED <7.00>;
			self.Sliders.ubox2:SetGoal(0,-4.45,0)
			self.Sliders.ubox2:SetSpeed(7)

			--MOVE lbox1 to y-axis <4.45> SPEED <7.00>;
			self.Sliders.lbox1:SetGoal(0,4.45,0)
			self.Sliders.lbox1:SetSpeed(7)

			--MOVE ubox1 to y-axis <-4.44> SPEED <7.00>;
			self.Sliders.ubox1:SetGoal(0,-4.45,0)
			self.Sliders.ubox1:SetSpeed(7)

			--SLEEP <574>;
			WaitSeconds(0.574)

			--MOVE gun2 to z-axis <1.10> SPEED <1.00>;
			self.Sliders.ugun2:SetGoal(-1.1,0,0)
			self.Sliders.ugun2:SetSpeed(1)

			--MOVE gun1 to z-axis <1.10> SPEED <1.00>;
			self.Sliders.ugun1:SetGoal(1.1,0,0)
			self.Sliders.ugun1:SetSpeed(1)

			--TURN gun2 to y-axis <90.00> SPEED <158.20>;
			self.Spinners.ugun2:SetGoal(90)
			self.Spinners.ugun2:SetSpeed(158.2)

			--TURN gun1 to y-axis <-90.00> SPEED <158.20>;
			self.Spinners.ugun1:SetGoal(-90)
			self.Spinners.ugun1:SetSpeed(158.2)

			--SLEEP <569>;
			WaitSeconds(0.569)

			--SLEEP <29>;

			--SPIN pad around y-axis  SPEED <30.00>
			self.Spinners.pad:SetSpeed(30)
			TAconstructor.Open(self)
		end,


	Close = function(self)
			#Needs to be moved
			--STOP-SPIN pad around y-axis 
			self.Spinners.pad:SetSpeed(0)

			--MOVE gun2 to z-axis <0> SPEED <1.00>;
			self.Sliders.ugun2:SetGoal(0,0,0)
			self.Sliders.ugun2:SetSpeed(1)

			--MOVE gun1 to z-axis <0> SPEED <1.00>;
			self.Sliders.ugun1:SetGoal(0,0,0)
			self.Sliders.ugun1:SetSpeed(1)

			--TURN gun2 to y-axis <0> SPEED <160.18>;
			self.Spinners.ugun2:SetGoal(0)
			self.Spinners.ugun2:SetSpeed(160)

			--TURN gun1 to y-axis <0> SPEED <160.18>;
			self.Spinners.ugun1:SetGoal(0)
			self.Spinners.ugun1:SetSpeed(160)

			--SLEEP <562>;
			WaitSeconds(0.562)

			--MOVE pad to z-axis <0> SPEED <10.00>;
			self.Sliders.padmover:SetGoal(0,0,0)
			self.Sliders.padmover:SetSpeed(10)

			--MOVE lbox2 to y-axis <0> SPEED <7.00>;
			self.Sliders.lbox2:SetGoal(0,0,0)
			self.Sliders.lbox2:SetSpeed(7)

			--MOVE ubox2 to y-axis <0> SPEED <7.00>;
			self.Sliders.ubox2:SetGoal(0,0,0)
			self.Sliders.ubox2:SetSpeed(7)

			--MOVE lbox1 to y-axis <0> SPEED <7.00>;
			self.Sliders.lbox1:SetGoal(0,0,0)
			self.Sliders.lbox1:SetSpeed(7)

			--MOVE ubox1 to y-axis <0> SPEED <7.00>;
			self.Sliders.ubox1:SetGoal(0,0,0)
			self.Sliders.ubox1:SetSpeed(7)

			--SLEEP <570>;
			WaitSeconds(0.57)

			--MOVE ldoor2 to x-axis <0> SPEED <6.00>;
			self.Sliders.ldoor2:SetGoal(0,0,0)
			self.Sliders.ldoor2:SetSpeed(7)

			--MOVE udoor2 to x-axis <0> SPEED <6.00>;
			self.Sliders.udoor2:SetGoal(0,0,0)
			self.Sliders.udoor2:SetSpeed(7)

			--MOVE ldoor1 to x-axis <0> SPEED <6.00>;
			self.Sliders.ldoor1:SetGoal(0,0,0)
			self.Sliders.ldoor1:SetSpeed(7)

			--MOVE udoor1 to x-axis <0> SPEED <6.00>;
			self.Sliders.udoor1:SetGoal(0,0,0)
			self.Sliders.udoor1:SetSpeed(7)

			--SLEEP <572>;
			WaitSeconds(0.572)

			--MOVE ldoor2 to y-axis <0> SPEED <1.00>;
			self.Sliders.ldoor2:SetGoal(0,0,0)
			self.Sliders.ldoor2:SetSpeed(1)

			--MOVE udoor2 to y-axis <0> SPEED <1.00>;
			self.Sliders.udoor2:SetGoal(0,0,0)
			self.Sliders.udoor2:SetSpeed(1)

			--MOVE ldoor1 to y-axis <0> SPEED <1.00>;
			self.Sliders.ldoor1:SetGoal(0,0,0)
			self.Sliders.ldoor1:SetSpeed(1)

			--MOVE udoor1 to y-axis <0> SPEED <1.00>;
			self.Sliders.udoor1:SetGoal(0,0,0)
			self.Sliders.udoor1:SetSpeed(1)

			#--TURN udoor1 to y-axis <0> SPEED <5.06>;
			#self.Spinners.udoor1:SetGoal(0)
			#self.Spinners.udoor1:SetSpeed(6.06)

			--SLEEP <120>;
			WaitSeconds(0.12)

			--MOVE lower1 to x-axis <0> SPEED <10.00>;
			self.Sliders.lower1:SetGoal(0,0,0)
			self.Sliders.lower1:SetSpeed(10)

			--MOVE lower2 to x-axis <0> SPEED <10.00>;
			self.Sliders.lower2:SetGoal(0,0,0)
			self.Sliders.lower2:SetSpeed(10)

			--SLEEP <874>;
			WaitSeconds(0.874)

			--TURN upper2 to x-axis <0> SPEED <188.32>;
			self.Spinners.upper2:SetGoal(0)
			self.Spinners.upper2:SetSpeed(188.32)

			--TURN upper1 to x-axis <0> SPEED <188.32>;
			self.Spinners.upper1:SetGoal(0)
			self.Spinners.upper1:SetSpeed(188.32)

			--SLEEP <956>;
			WaitSeconds(0.956)

			--SLEEP <31>;

			TAconstructor.Close(self)
		end,
}

TypeClass = ARMLAB
#CORE Adv. Kbot Lab - Produces Kbots
#CORALAB
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor

CORALAB = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = true,

	OnCreate = function(self)
		self.Spinners = {
			pad = CreateRotator(self, 'pad', 'y', nil, 0, 0, 0),
			guna = CreateRotator(self, 'guna', 'x', nil, 0, 0, 0),
			gunb = CreateRotator(self, 'gunb', 'x', nil, 0, 0, 0),
		}
		self.Sliders = {
			maina = CreateSlider(self, 'maina'),
			mainb = CreateSlider(self, 'mainb'),
			stepb1 = CreateSlider(self, 'stepb1'),
			stepb2 = CreateSlider(self, 'stepb2'),
			stepb3 = CreateSlider(self, 'stepb3'),
			stepa2 = CreateSlider(self, 'stepa2'),
			stepa3 = CreateSlider(self, 'stepa3'),
		}
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		TAconstructor.OnCreate(self)
	end,


	Open = function(self)
		--MOVE maina to x-axis <9.75> SPEED <10.00>;
		self.Sliders.maina:SetGoal(-9.75,0,0)
		self.Sliders.maina:SetSpeed(10)

		--MOVE mainb to x-axis <-9.75> SPEED <10.00>;
		self.Sliders.mainb:SetGoal(9.75,0,0)
		self.Sliders.mainb:SetSpeed(10)

		--SLEEP <908>;
		WaitSeconds(0.9)

		--MOVE stepb1 to y-axis <-2.30> SPEED <2.00>;
		self.Sliders.stepb1:SetGoal(0,-2.3,0)
		self.Sliders.stepb1:SetSpeed(2)

		--MOVE stepb2 to y-axis <-4.59> SPEED <5.00>;
		self.Sliders.stepb2:SetGoal(0,-4.59,0)
		self.Sliders.stepb2:SetSpeed(5)

		--MOVE stepb3 to y-axis <-6.79> SPEED <8.00>;
		self.Sliders.stepb3:SetGoal(0,-6.79,0)
		self.Sliders.stepb3:SetSpeed(8)

		--MOVE stepa2 to y-axis <-2.25> SPEED <2.00>;
		self.Sliders.stepa2:SetGoal(0,-2.25,0)
		self.Sliders.stepa2:SetSpeed(2)

		--MOVE stepa3 to y-axis <-4.49> SPEED <5.00>;
		self.Sliders.stepa3:SetGoal(0,-4.49,0)
		self.Sliders.stepa3:SetSpeed(5)

		--SLEEP <828>;
		WaitSeconds(0.8)

		--TURN guna to x-axis <121.61> SPEED <286.23>;
		self.Spinners.guna:SetGoal(121)
		self.Spinners.guna:SetSpeed(285)

		--TURN gunb to x-axis <121.00> SPEED <284.80>;
		self.Spinners.gunb:SetGoal(121)
		self.Spinners.gunb:SetSpeed(285)

		--SLEEP <425>;
		--SLEEP <29>;
		WaitSeconds(0.5)

		--SPIN pad around y-axis  SPEED <30.00>
		self.Spinners.pad:SetSpeed(30)

		TAconstructor.Open(self)
	end,

	Close = function(self)
		--STOP-SPIN pad around y-axis 
		self.Spinners.pad:SetSpeed(0)

		--TURN guna to x-axis <0> SPEED <282.25>;
		self.Spinners.guna:SetGoal(0)
		self.Spinners.guna:SetSpeed(281)

		--TURN gunb to x-axis <0> SPEED <280.84>;
		self.Spinners.gunb:SetGoal(0)
		self.Spinners.gunb:SetSpeed(281)

		--SLEEP <431>;
		WaitSeconds(0.4)

		--MOVE stepb1 to y-axis <0> SPEED <2.00>;
		self.Sliders.stepb1:SetGoal(0,0,0)
		self.Sliders.stepb1:SetSpeed(2)

		--MOVE stepb2 to y-axis <0> SPEED <5.00>;
		self.Sliders.stepb2:SetGoal(0,0,0)
		self.Sliders.stepb2:SetSpeed(5)

		--MOVE stepb3 to y-axis <0> SPEED <8.00>;
		self.Sliders.stepb3:SetGoal(0,0,0)
		self.Sliders.stepb3:SetSpeed(8)

		--MOVE stepa2 to y-axis <0> SPEED <2.00>;
		self.Sliders.stepa2:SetGoal(0,0,0)
		self.Sliders.stepa2:SetSpeed(2)

		--MOVE stepa3 to y-axis <0> SPEED <5.00>;
		self.Sliders.stepa3:SetGoal(0,0,0)
		self.Sliders.stepa3:SetSpeed(5)

		--SLEEP <768>;
		WaitSeconds(0.8)

		--MOVE maina to x-axis <0> SPEED <10.00>;
		self.Sliders.maina:SetGoal(0,0,0)
		self.Sliders.maina:SetSpeed(10)

		--MOVE mainb to x-axis <0> SPEED <10.00>;
		self.Sliders.mainb:SetGoal(0,0,0)
		self.Sliders.mainb:SetSpeed(10)

		--SLEEP <960>;
		--SLEEP <30>;
		WaitSeconds(1.0)

		TAconstructor.Close(self)
	end,
}

TypeClass = CORALAB
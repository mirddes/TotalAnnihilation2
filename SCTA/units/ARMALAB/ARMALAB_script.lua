#ARM Adv. Kbot Lab - Produces Kbots
#ARMALAB
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor

ARMALAB = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = true,

	OnCreate = function(self)
		self.Spinners = {
			pad = CreateRotator(self, 'pad', 'y', nil, 0, 0, 0),
			nozzle1 = CreateRotator(self, 'Nozzle_01', 'y', 90, 160, 0, 0),
			nozzle2 = CreateRotator(self, 'Nozzle_02', 'y', -90, 160, 0, 0),
		}
		self.Sliders = {
			centerbar1 = CreateSlider(self, 'centerbar1'),
			centerbar2 = CreateSlider(self, 'centerbar2'),
			quarter1 = CreateSlider(self, 'quarter1'),
			quarter2 = CreateSlider(self, 'quarter2'),
			quarter3 = CreateSlider(self, 'quarter3'),
			quarter4 = CreateSlider(self, 'quarter4'),
			nano1 = CreateSlider(self, 'nano1'),
			nano2 = CreateSlider(self, 'nano2'),
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

		--MOVE centerbar1 to x-axis <8.00> SPEED <11.00>;
		self.Sliders.centerbar1:SetGoal(-8,0,0)
		self.Sliders.centerbar1:SetSpeed(11)

		--MOVE centerbar2 to x-axis <-7.95> SPEED <11.00>;
		self.Sliders.centerbar2:SetGoal(8,0,0)
		self.Sliders.centerbar2:SetSpeed(11)

		--SLEEP <683>;
		WaitSeconds(0.7)

		--MOVE quarter3 to z-axis <6.40> SPEED <9.00>;
		self.Sliders.quarter3:SetGoal(0,0,6.5)
		self.Sliders.quarter3:SetSpeed(9)

		--MOVE quarter4 to z-axis <-5.95> SPEED <8.00>;
		self.Sliders.quarter4:SetGoal(0,0,-6)
		self.Sliders.quarter4:SetSpeed(8)
			
		--MOVE quarter1 to z-axis <-5.85> SPEED <8.00>;
		self.Sliders.quarter1:SetGoal(0,0,-6)
		self.Sliders.quarter1:SetSpeed(8)

		--MOVE quarter2 to z-axis <6.45> SPEED <9.00>;
		self.Sliders.quarter2:SetGoal(0,0,6.5)
		self.Sliders.quarter2:SetSpeed(9)

		--SLEEP <689>;
		WaitSeconds(0.7)

		--MOVE nano2 to x-axis <4.05> SPEED <5.00>;
		self.Sliders.nano2:SetGoal(-4,0,0)
		self.Sliders.nano2:SetSpeed(5)

		--MOVE nano1 to x-axis <-4.00> SPEED <5.00>;
		self.Sliders.nano1:SetGoal(4,0,0)
		self.Sliders.nano1:SetSpeed(5)

		--SLEEP <691>;
		WaitSeconds(0.7)

		--SLEEP <34>;

		#Needs to be moved
		--SPIN pad around y-axis  SPEED <30.00>
		self.Spinners.pad:SetSpeed(30)

		TAconstructor.Open(self)
	end,

	Close = function(self)
		#Needs to be moved

		--STOP-SPIN pad around y-axis 
		self.Spinners.pad:SetSpeed(0)

		--MOVE nano2 to x-axis <0> SPEED <5.00>;
		self.Sliders.nano2:SetGoal(0,0,0)
		self.Sliders.nano2:SetSpeed(5)

		--MOVE nano1 to x-axis <0> SPEED <5.00>;
		self.Sliders.nano1:SetGoal(0,0,0)
		self.Sliders.nano1:SetSpeed(5)

		--SLEEP <683>;
		WaitSeconds(0.7)

		--MOVE quarter3 to z-axis <0> SPEED <9.00>;
		self.Sliders.quarter3:SetGoal(0,0,0)
		self.Sliders.quarter3:SetSpeed(9)

		--MOVE quarter4 to z-axis <0> SPEED <8.00>;
		self.Sliders.quarter4:SetGoal(0,0,0)
		self.Sliders.quarter4:SetSpeed(8)

		--MOVE quarter1 to z-axis <0> SPEED <8.00>;
		self.Sliders.quarter1:SetGoal(0,0,0)
		self.Sliders.quarter1:SetSpeed(8)

		--MOVE quarter2 to z-axis <0> SPEED <9.00>;
		self.Sliders.quarter2:SetGoal(0,0,0)
		self.Sliders.quarter2:SetSpeed(9)

		--SLEEP <689>;
		WaitSeconds(0.7)

		--MOVE centerbar1 to x-axis <0> SPEED <11.00>;
		self.Sliders.centerbar1:SetGoal(0,0,0)
		self.Sliders.centerbar1:SetSpeed(11)

		--MOVE centerbar2 to x-axis <0> SPEED <11.00>;
		self.Sliders.centerbar2:SetGoal(0,0,0)
		self.Sliders.centerbar2:SetSpeed(11)

		--SLEEP <691>;
		WaitSeconds(0.7)

		--SLEEP <34>;

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMALAB
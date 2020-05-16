#ARM Eraser - Mobile Radar Jammer
#ARMASER
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

ARMASER = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			ltong = CreateRotator(self, 'LeftFork', 'y', nil, 0, 0, 0),
			rtong = CreateRotator(self, 'RightFork', 'y', nil, 0, 0, 0),
			tongpivot = CreateRotator(self, 'ForkPivot', 'z', nil, 0, 0, 0),
		}
		self.Sliders = {
			ltong = CreateSlider(self, 'LeftFork'),
			rtong = CreateSlider(self, 'RightFork'),
			tongend = CreateSlider(self, 'ForkEnd'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
	end,

	Close = function(self)

		self:PlayUnitSound('Deactivate')

		--TURN tongpivot to z-axis <0> SPEED <-100.02>;
		self.Spinners.tongpivot:SetSpeed(100)
		self.Spinners.tongpivot:SetGoal(0)
		WaitFor(self.Spinners.tongpivot)

		--TURN ltong to y-axis <0> SPEED <174.54>;
		self.Spinners.ltong:SetGoal(0)
		self.Spinners.ltong:SetSpeed(171)

		--TURN rtong to y-axis <-0.3> SPEED <170.98>;
		self.Spinners.rtong:SetGoal(0)
		self.Spinners.rtong:SetSpeed(171)

		--SLEEP <683>;
		WaitSeconds(0.7)

		--MOVE tongend to y-axis <0> SPEED <4.00>;
		self.Sliders.tongend:SetGoal(0,0,0)
		self.Sliders.tongend:SetSpeed(4)

		--MOVE ltong to y-axis <0> SPEED <4.00>;
		self.Sliders.ltong:SetGoal(0,0,0)
		self.Sliders.ltong:SetSpeed(4)

		--MOVE rtong to y-axis <0> SPEED <4.00>;
		self.Sliders.rtong:SetGoal(0,0,0)
		self.Sliders.rtong:SetSpeed(4)

		--TURN ltong to y-axis <0> SPEED <0.1>;
		self.Spinners.ltong:SetGoal(0)
		self.Spinners.ltong:SetSpeed(0.75)

		--TURN rtong to y-axis <0> SPEED <0.5>;
		self.Spinners.rtong:SetGoal(0)
		self.Spinners.rtong:SetSpeed(0.75)

		--SLEEP <689>;
		WaitSeconds(0.7)

		--SLEEP <21>;
	end,

	Open = function(self)

		self:PlayUnitSound('Activate')

		--MOVE tongend to y-axis <-2.99> SPEED <3.00>;
		self.Sliders.tongend:SetGoal(0,-3,0)
		self.Sliders.tongend:SetSpeed(3)

		--MOVE ltong to y-axis <-2.99> SPEED <3.00>;
		self.Sliders.ltong:SetGoal(0,-3,0)
		self.Sliders.ltong:SetSpeed(3)

		--MOVE rtong to y-axis <-2.99> SPEED <3.00>;
		self.Sliders.rtong:SetGoal(0,-3,0)
		self.Sliders.rtong:SetSpeed(3)

		--SLEEP <751>;
		WaitSeconds(0.75)

		--TURN ltong to y-axis <-119.17> SPEED <157.26>;
		self.Spinners.ltong:SetGoal(-118)
		self.Spinners.ltong:SetSpeed(155)

		--TURN rtong to y-axis <116.71> SPEED <154.01>;
		self.Spinners.rtong:SetGoal(118)
		self.Spinners.rtong:SetSpeed(155)

		--SLEEP <758>;
		WaitSeconds(0.75)

		--SLEEP <17>;

		--SPIN tongpivot around z-axis  SPEED <100.02>
		self.Spinners.tongpivot:SetSpeed(100)
		self.Spinners.tongpivot:ClearGoal()
	end,

	OnIntelDisabled = function(self)
		TAunit.OnIntelDisabled(self)
		ForkThread(self.Close, self)
	end,

	OnIntelEnabled = function(self)
		TAunit.OnIntelEnabled(self)
		ForkThread(self.Open, self)
		
	end,
}
TypeClass = ARMASER
#CORE Spectre - Radar Jammer
#CORSPEC
#
#Script created by Raevn

local TAunit = import('/mods/SCTA/lua/TAunit.lua').TAunit

CORSPEC = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)

		self.Spinners = {
			ltong = CreateRotator(self, 'ltong', 'x', nil, 0, 0, 0),
			rtong = CreateRotator(self, 'rtong', 'x', nil, 0, 0, 0),
			tongspivot = CreateRotator(self, 'tongspivot', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
	end,

	Close = function(self)
		self:PlayUnitSound('Deactivate')

		--TURN tongspivot to z-axis <0> SPEED <-100.02>;
		self.Spinners.tongspivot:SetGoal(0)

		WaitFor(self.Spinners.tongspivot);

		--TURN ltong to x-axis <0> SPEED <180.04>;
		self.Spinners.ltong:SetGoal(0)
		self.Spinners.ltong:SetSpeed(180)

		--TURN rtong to x-axis <0> SPEED <180.40>;
		self.Spinners.rtong:SetGoal(0)
		self.Spinners.rtong:SetSpeed(180)

		--SLEEP <998>;
		WaitSeconds(1.0)
	end,

	Open = function(self)
		self:PlayUnitSound('Activate')

		--TURN ltong to x-axis <180.00> SPEED <316.97>;
		self.Spinners.ltong:SetGoal(180)
		self.Spinners.ltong:SetSpeed(317)

		--TURN rtong to x-axis <180.00> SPEED <316.97>;
		self.Spinners.rtong:SetGoal(180)
		self.Spinners.rtong:SetSpeed(317)

		--SLEEP <568>;
		WaitSeconds(0.6)

		--SPIN tongspivot around z-axis SPEED <100.02>;
		self.Spinners.tongspivot:SetSpeed(100)
		self.Spinners.tongspivot:ClearGoal()
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
TypeClass = CORSPEC
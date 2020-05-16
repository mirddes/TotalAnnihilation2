#ARM FARK - Fast Assist-Repair Kbot
#ARMFARK
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMFARK = Class(TAconstructor) {

	OnCreate = function(self)
		self.Spinners = {
			Lshoulder = CreateRotator(self, 'Lshoulder', 'x', nil, 0, 0, 0),
			Rshoulder = CreateRotator(self, 'Rshoulder', 'x', nil, 0, 0, 0),
			Larmx = CreateRotator(self, 'Larm', 'x', nil, 0, 0, 0),
			Rarmx = CreateRotator(self, 'Rarm', 'x', nil, 0, 0, 0),
			torsox = CreateRotator(self, 'torso', 'z', nil, 0, 0, 0),
			torsoy = CreateRotator(self, 'torso', 'y', nil, 0, 0, 0),

			Larmz = CreateRotator(self, 'Larm', 'z', nil, 0, 0, 0),
			Rarmz = CreateRotator(self, 'Rarm', 'z', nil, 0, 0, 0),
			Llathe = CreateRotator(self, 'Llathe', 'z', nil, 0, 0, 0),
			Rlathe = CreateRotator(self, 'Rlathe', 'z', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		TAconstructor.OnCreate(self)
	end,

	Open = function(self)
		--TURN Lshoulder to x-axis <-10.94> SPEED <59.18>;
		self.Spinners.Lshoulder:SetGoal(-10)
		self.Spinners.Lshoulder:SetSpeed(60)

		--TURN Rshoulder to x-axis <-10.64> SPEED <57.53>;
		self.Spinners.Rshoulder:SetGoal(-10)
		self.Spinners.Rshoulder:SetSpeed(60)

		--TURN Rarm to x-axis <-22.19> SPEED <120.00>;
		self.Spinners.Rarmx:SetGoal(-22)
		self.Spinners.Rarmx:SetSpeed(120)

		--TURN Larm to x-axis <-22.19> SPEED <120.00>;
		self.Spinners.Larmx:SetGoal(-22)
		self.Spinners.Larmx:SetSpeed(120)

		--SLEEP <185>;
		WaitSeconds(0.2)

		--TURN Lshoulder to x-axis <-21.89> SPEED <48.65>;
		self.Spinners.Lshoulder:SetGoal(-22)
		self.Spinners.Lshoulder:SetSpeed(49)

		--TURN Rshoulder to x-axis <-21.28> SPEED <47.30>;
		self.Spinners.Rshoulder:SetGoal(-22)
		self.Spinners.Rshoulder:SetSpeed(49)

		--TURN Rarm to x-axis <-44.39> SPEED <98.67>;
		self.Spinners.Rarmx:SetGoal(-44)
		self.Spinners.Rarmx:SetSpeed(99)

		--TURN Larm to x-axis <-44.39> SPEED <98.67>;
		self.Spinners.Larmx:SetGoal(-44)
		self.Spinners.Larmx:SetSpeed(99)

		--SLEEP <225>;
		WaitSeconds(0.2)

		--TURN Rarm to z-axis <33.44> SPEED <145.45>;
		self.Spinners.Rarmz:SetGoal(33)
		self.Spinners.Rarmz:SetSpeed(145)

		--TURN rlathe to z-axis <-63.84> SPEED <277.68>;
		self.Spinners.Rlathe:SetGoal(-64)
		self.Spinners.Rlathe:SetSpeed(277)

		--TURN Larm to z-axis <-33.44> SPEED <145.45>;
		self.Spinners.Larmz:SetGoal(-33)
		self.Spinners.Larmz:SetSpeed(145)

		--TURN llathe to z-axis <62.63> SPEED <272.39>;
		self.Spinners.Llathe:SetGoal(64)
		self.Spinners.Llathe:SetSpeed(277)

		--SLEEP <230>;
		WaitSeconds(0.2)

		--TURN torso to x-axis <27.97> SPEED <121.64>;
		self.Spinners.torsox:SetGoal(28)
		self.Spinners.torsox:SetSpeed(120)

		--TURN Rarm to z-axis <20.06> SPEED <58.17>;
		self.Spinners.Rarmz:SetGoal(20)
		self.Spinners.Rarmz:SetSpeed(60)

		--TURN Larm to z-axis <-20.06> SPEED <58.17>;
		self.Spinners.Larmz:SetGoal(-20)
		self.Spinners.Larmz:SetSpeed(60)

		--SLEEP <230>;
		--SLEEP <10>;
		WaitSeconds(0.2)

		TAconstructor.Open(self)
	end,

	Aim = function(self, target)
		local selfPosition = self:GetPosition('torso') 
		local targetPosition = target:GetPosition()
			
		--TURN torso to y-axis buildheading SPEED <160.03>;
		self.Spinners.torsoy:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.torsoy:SetSpeed(160.03)
		WaitFor(self.Spinners.torsoy)
--[[
		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('Joint') 

		self.Spinners.Rarmx:SetGoal(159.97 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y) - 90)
		self.Spinners.Rarmx:SetSpeed(45.01)

		WaitFor(self.Spinners.nanojoint)
--]]
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)

		self.Spinners.torsoy:SetGoal(0)

		--TURN torso to x-axis <0> SPEED <139.89>;
		self.Spinners.torsox:SetGoal(0)
		self.Spinners.torsox:SetSpeed(140)

		--TURN Rarm to z-axis <33.44> SPEED <66.90>;
		self.Spinners.Rarmz:SetGoal(33)
		self.Spinners.Rarmz:SetSpeed(67)

		--TURN Larm to z-axis <-33.44> SPEED <66.90>;
		self.Spinners.Larmz:SetGoal(-33)
		self.Spinners.Larmz:SetSpeed(67)

		--SLEEP <200>;
		WaitSeconds(0.2)

		--TURN Rarm to z-axis <0> SPEED <167.26>;
		self.Spinners.Rarmz:SetGoal(0)
		self.Spinners.Rarmz:SetSpeed(167)

		--TURN rlathe to z-axis <0> SPEED <319.32>;
		self.Spinners.Rlathe:SetGoal(0)
		self.Spinners.Rlathe:SetSpeed(320)

		--TURN Larm to z-axis <0> SPEED <167.26>;
		self.Spinners.Larmz:SetGoal(0)
		self.Spinners.Larmz:SetSpeed(167)

		--TURN llathe to z-axis <0> SPEED <313.24>;
		self.Spinners.Llathe:SetGoal(0)
		self.Spinners.Llathe:SetSpeed(320)

		--SLEEP <200>;
		WaitSeconds(0.2)

		--TURN Lshoulder to x-axis <-10.94> SPEED <54.74>;
		self.Spinners.Lshoulder:SetGoal(-10)
		self.Spinners.Lshoulder:SetSpeed(55)

		--TURN Rshoulder to x-axis <-10.64> SPEED <53.21>;
		self.Spinners.Rshoulder:SetGoal(-10)
		self.Spinners.Rshoulder:SetSpeed(55)

		--TURN Rarm to x-axis <-22.19> SPEED <111.00>;
		self.Spinners.Rarmx:SetGoal(-22)
		self.Spinners.Rarmx:SetSpeed(111)

		--TURN Larm to x-axis <-22.19> SPEED <111.00>;
		self.Spinners.Larmx:SetGoal(-22)
		self.Spinners.Larmx:SetSpeed(111)

		--SLEEP <200>;
		WaitSeconds(0.2)

		--TURN Lshoulder to x-axis <0> SPEED <54.74>;
		self.Spinners.Lshoulder:SetGoal(0)
		self.Spinners.Lshoulder:SetSpeed(55)

		--TURN Rshoulder to x-axis <0> SPEED <53.21>;
		self.Spinners.Rshoulder:SetGoal(0)
		self.Spinners.Rshoulder:SetSpeed(55)

		--TURN Rarm to x-axis <0> SPEED <111.00>;
		self.Spinners.Rarmx:SetGoal(0)
		self.Spinners.Rarmx:SetSpeed(111)

		--TURN Larm to x-axis <0> SPEED <111.00>;
		self.Spinners.Larmx:SetGoal(0)
		self.Spinners.Larmx:SetSpeed(111)

		--SLEEP <200>;
		--SLEEP <10>;
		WaitSeconds(0.2)

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMFARK
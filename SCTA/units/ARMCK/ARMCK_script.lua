#ARM Construction Kbot - Tech Level 1
#ARMCK
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMCK = Class(TAconstructor) {

	OnCreate = function(self)
		self.Spinners = {
			rflap = CreateRotator(self, 'RightFlap', 'z', nil, 0, 0, 0),
			lflap = CreateRotator(self, 'LeftFlap', 'z', nil, 0, 0, 0),
			guncover = CreateRotator(self, 'Cap', 'x', nil, 0, 0, 0),
			arms = CreateRotator(self, 'Arms', 'x', nil, 0, 0, 0),
			nanobody2 = CreateRotator(self, 'Nozzle', 'x', nil, 0, 0, 0),
			torso = CreateRotator(self, 'Torso', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			nozzle = CreateSlider(self, 'NozzleTip'),			
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

		--TURN lflap to z-axis <97.90> SPEED <190.52>;
		self.Spinners.lflap:SetGoal(-97.90)
		self.Spinners.lflap:SetSpeed(190.52)

		--TURN rflap to z-axis <-97.90> SPEED <190.52>;
		self.Spinners.rflap:SetGoal(97.90)
		self.Spinners.rflap:SetSpeed(190.52)

		--SLEEP <514>;
		WaitSeconds(0.5)

		--TURN guncover to x-axis <126.90> SPEED <245.06>;
		self.Spinners.guncover:SetGoal(126.90)
		self.Spinners.guncover:SetSpeed(245.06)

		--SLEEP <518>;
		WaitSeconds(0.5)

		--TURN arms to x-axis <90.00> SPEED <169.52>;
		self.Spinners.arms:SetGoal(90)
		self.Spinners.arms:SetSpeed(169.52)

		--TURN nanobody2 to x-axis <-90.00> SPEED <169.52>;
		self.Spinners.nanobody2:SetGoal(-90)
		self.Spinners.nanobody2:SetSpeed(169.52)

		--SLEEP <531>;
		WaitSeconds(0.55)

		--MOVE nozzle to z-axis <4.40> SPEED <8.00>;
		self.Sliders.nozzle:SetGoal(0,0,4.4)
		self.Sliders.nozzle:SetSpeed(8)

		--SLEEP <530>;
		WaitSeconds(0.5)

		--SLEEP <529>;
		WaitSeconds(0.5)

		TAconstructor.Open(self)
	end,

	Aim = function(self,target)
		#Aim at build job
		local selfPosition = self:GetPosition('Torso') 
		local targetPosition = target:GetPosition()
			
		--TURN torso to y-axis buildheading SPEED <160.03>;
		self.Spinners.torso:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.torso:SetSpeed(160.03)
		WaitFor(self.Spinners.torso)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('NozzleTip') 

		self.Spinners.nanobody2:SetGoal(-180 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y))
		self.Spinners.nanobody2:SetSpeed(45.01)

		WaitFor(self.Spinners.nanobody2)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)
		self.Spinners.torso:SetGoal(0)
		self.Spinners.torso:SetSpeed(160.03)
		WaitFor(self.Spinners.torso)

		--MOVE nozzle to z-axis <-0.20> SPEED <4.00>;
		self.Sliders.nozzle:SetGoal(0,0,0)
		self.Sliders.nozzle:SetSpeed(4)

		--SLEEP <997>;
		WaitSeconds(1)

		--TURN arms to x-axis <0> SPEED <89.30>;
		self.Spinners.arms:SetGoal(0)
		self.Spinners.arms:SetSpeed(89.302)

		--TURN nanobody2 to x-axis <-40.07> SPEED <49.53>;
		self.Spinners.nanobody2:SetGoal(-40.07)
		self.Spinners.nanobody2:SetSpeed(49.53)

		--SLEEP <1008>;
		WaitSeconds(1)

		--TURN nanobody2 to x-axis <0> SPEED <39.76>;
		self.Spinners.nanobody2:SetGoal(0)
		self.Spinners.nanobody2:SetSpeed(39.76)

		--SLEEP <1008>;
		WaitSeconds(1)

		--TURN guncover to x-axis <0> SPEED <125.93>;
		self.Spinners.guncover:SetGoal(0)
		self.Spinners.guncover:SetSpeed(125.93)

		--SLEEP <1008>;
		WaitSeconds(1)

		--TURN lflap to z-axis <0> SPEED <97.14>;
		self.Spinners.lflap:SetGoal(0)
		self.Spinners.lflap:SetSpeed(97.14)

		--TURN rflap to z-axis <0> SPEED <97.14>;
		self.Spinners.rflap:SetGoal(0)
		self.Spinners.rflap:SetSpeed(97.14)

		--SLEEP <1008>;
		WaitSeconds(1)

		--SLEEP <1008>;
		WaitSeconds(1)

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMCK
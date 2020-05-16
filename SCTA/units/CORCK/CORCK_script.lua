#CORE Construction Kbot - Tech Level 1
#CORCK
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORCK = Class(TAconstructor) {
	spinUnit = false,

	OnCreate = function(self)
		self.Spinners = {
			gunclamp = CreateRotator(self, 'gunclamp', 'y', nil, 0, 0, 0),
			torso = CreateRotator(self, 'torso', 'y', nil, 0, 0, 0),
			nanogun = CreateRotator(self, 'nanogun', 'z', nil, 0, 0, 0),
		}
		self.Sliders = {
			nozzle = CreateSlider(self, 'nozzle'),			
			guncover = CreateSlider(self, 'guncover'),			
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
		--MOVE guncover to x-axis <-0.94> SPEED <2.00>;
		self.Sliders.guncover:SetGoal(-0.94,0,0)
		self.Sliders.guncover:SetSpeed(2)

		--SLEEP <426>;
		WaitSeconds(0.4)

		--TURN nanogun to z-axis <-90.00> SPEED <210.32>;
		self.Spinners.nanogun:SetGoal(90)
		self.Spinners.nanogun:SetSpeed(210.32)

		--SLEEP <428>;
		WaitSeconds(0.4)

		--TURN gunclamp to y-axis <90.00> SPEED <210.32>;
		self.Spinners.gunclamp:SetGoal(90)
		self.Spinners.gunclamp:SetSpeed(210.32)

		--SLEEP <428>;
		WaitSeconds(0.4)

		--TURN nanogun to z-axis <-180.00> SPEED <209.84>;
		self.Spinners.nanogun:SetGoal(-180)
		self.Spinners.nanogun:SetSpeed(209.384)

		--SLEEP <429>;
		WaitSeconds(0.4)

		--MOVE nozzle to x-axis <-3.85> SPEED <6.00>;
		self.Sliders.nozzle:SetGoal(3.85,0,0)
		self.Sliders.nozzle:SetSpeed(6)

		--SLEEP <631>;
		WaitSeconds(0.6)

		--SLEEP <71>;

		TAconstructor.Open(self)
	end,

	Aim = function(self,target)
		#Aim at build job
		local selfPosition = self:GetPosition('torso') 
		local targetPosition = target:GetPosition()
			
		--TURN torso to y-axis buildheading SPEED <160.03>;
		self.Spinners.torso:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.torso:SetSpeed(160.03)
		WaitFor(self.Spinners.torso)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('BuildNozzle') 

		self.Spinners.nanogun:SetGoal(90 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y))
		self.Spinners.nanogun:SetSpeed(45.01)

		WaitFor(self.Spinners.nanogun)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)
		self.Spinners.torso:SetGoal(0)
		self.Spinners.torso:SetSpeed(160.03)
		WaitFor(self.Spinners.torso)

		--MOVE nozzle to x-axis <0> SPEED <8.00>;
		self.Sliders.nozzle:SetGoal(0,0,0)
		self.Sliders.nozzle:SetSpeed(8)

		--SLEEP <463>;
		WaitSeconds(0.4)

		--TURN nanogun to z-axis <-90.00> SPEED <190.31>;
		self.Spinners.nanogun:SetGoal(-90)
		self.Spinners.nanogun:SetSpeed(190.31)

		--SLEEP <473>;
		WaitSeconds(0.4)

		--TURN gunclamp to y-axis <0> SPEED <191.93>;
		self.Spinners.gunclamp:SetGoal(0)
		self.Spinners.gunclamp:SetSpeed(191.93)

		--SLEEP <469>;
		WaitSeconds(0.4)

		--TURN nanogun to z-axis <0> SPEED <190.71>;
		self.Spinners.nanogun:SetGoal(0)
		self.Spinners.nanogun:SetSpeed(190.71)

		--SLEEP <472>;
		WaitSeconds(0.4)

		--MOVE guncover to x-axis <0> SPEED <2.00>;
		self.Sliders.guncover:SetGoal(0,0,0)
		self.Sliders.guncover:SetSpeed(2)

		--SLEEP <474>;
		WaitSeconds(0.4)

		--SLEEP <470>;

		TAconstructor.Close(self)
	end,
}

TypeClass = CORCK
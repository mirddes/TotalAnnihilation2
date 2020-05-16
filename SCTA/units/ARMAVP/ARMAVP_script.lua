#ARM Adv. Vehicle Plant - Produces Vehicles
#ARMAVP
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMAVP = Class(TAconstructor) {
	pauseTime = 5,
	hideUnit = true,
	isFactory = true,
	spinUnit = true,

	OnCreate = function(self)
		self.Spinners = {
			nano1 = CreateRotator(self, 'LeftNozzle', 'z', nil, 0, 0, 0),
			nano2 = CreateRotator(self, 'RightNozzle', 'z', nil, 0, 0, 0),
			nanoAim1 = CreateRotator(self, 'LeftBuildMuzzle', 'z', nil, 0, 0, 0),
			nanoAim2 = CreateRotator(self, 'RightBuildMuzzle', 'z', nil, 0, 0, 0),
			nanoAim1x = CreateRotator(self, 'LeftBuildMuzzle', 'x', 90, 160, 0, 0),
			nanoAim2x = CreateRotator(self, 'RightBuildMuzzle', 'x', -90, 160, 0, 0),
			cylinder5 = CreateRotator(self, 'UpperLeftCylinder', 'y', nil, 0, 0, 0),
			cylinder6 = CreateRotator(self, 'UpperRightCylinder', 'y', nil, 0, 0, 0),
			pad = CreateRotator(self, 'BuildPlate', 'y', nil, 0, 0, 0),
		}
		self.Sliders = {
			cylinder1 = CreateSlider(self, 'BottomLeftCylinder'),
			cylinder2 = CreateSlider(self, 'BottomRightCylinder'),
			cylinder3 = CreateSlider(self, 'MiddleLeftCylinder'),
			cylinder4 = CreateSlider(self, 'MiddleRightCylinder'),
			cylinder5 = CreateSlider(self, 'UpperLeftCylinder'),
			cylinder6 = CreateSlider(self, 'UpperRightCylinder'),
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

		--MOVE cylinder1 to x-axis <10.84> SPEED <35.00>;
		self.Sliders.cylinder1:SetGoal(-10.94,0,0)
		self.Sliders.cylinder1:SetSpeed(35)

		--MOVE cylinder2 to x-axis <-10.34> SPEED <33.00>;
		self.Sliders.cylinder2:SetGoal(10.94,0,0)
		self.Sliders.cylinder2:SetSpeed(35)

		--SLEEP <307>;
		WaitSeconds(0.3)
			
		--MOVE cylinder3 to x-axis <10.94> SPEED <36.00>;
		self.Sliders.cylinder3:SetGoal(-10.94,0,0)
		self.Sliders.cylinder3:SetSpeed(35)

		--MOVE cylinder4 to x-axis <-10.54> SPEED <35.00>;
		self.Sliders.cylinder4:SetGoal(10.94,0,0)
		self.Sliders.cylinder4:SetSpeed(35)

		--SLEEP <299>;
		WaitSeconds(0.3)
			
		--MOVE cylinder5 to x-axis <10.84> SPEED <32.00>;
		self.Sliders.cylinder5:SetGoal(-10.94,0,0)
		self.Sliders.cylinder5:SetSpeed(32)

		--MOVE cylinder6 to x-axis <-10.55> SPEED <32.00>;
		self.Sliders.cylinder6:SetGoal(10.94,0,0)
		self.Sliders.cylinder6:SetSpeed(32)

		--SLEEP <329>;
		WaitSeconds(0.35)

		--TURN cylinder5 to y-axis <96.74> SPEED <241.93>;
		self.Spinners.cylinder5:SetGoal(100)
		self.Spinners.cylinder5:SetSpeed(250.93)

		--TURN cylinder6 to y-axis <100.34> SPEED <250.93>;
		self.Spinners.cylinder6:SetGoal(100)
		self.Spinners.cylinder6:SetSpeed(250.93)
			
		--SLEEP <400>;
		WaitSeconds(0.4)

		--TURN nano2 to z-axis <116.99> SPEED <182.28>;
		self.Spinners.nano2:SetGoal(-116.99)
		self.Spinners.nano2:SetSpeed(182.28)

		--TURN nano1 to z-axis <-116.99> SPEED <182.28>;
		self.Spinners.nano1:SetGoal(116.99)
		self.Spinners.nano1:SetSpeed(182.28)
			
		--SLEEP <642>;
		WaitSeconds(0.65)

		--SLEEP <17>

		--SPIN pad around y-axis  SPEED <30.00>
		self.Spinners.pad:SetSpeed(30)

		TAconstructor.Open(self)
	end,

	Aim = function(self,target)
		local targetPosition = target:GetPosition()

		local selfPosition = self:GetPosition('LeftBuildMuzzle') 
		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		self.Spinners.nanoAim1:SetGoal(-TAutils.GetAngle(0, targetPosition.y, distance, selfPosition.y))
		self.Spinners.nanoAim1:SetSpeed(3600)

		selfPosition = self:GetPosition('RightBuildMuzzle') 
		self.Spinners.nanoAim2:SetGoal(270-TAutils.GetAngle(0, targetPosition.y, distance, selfPosition.y))
		self.Spinners.nanoAim2:SetSpeed(3600)

		WaitFor(self.Spinners.nanoAim1)
		WaitFor(self.Spinners.nanoAim2)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)
		#Needs to be moved
		--STOP-SPIN pad around y-axis 
		self.Spinners.pad:SetSpeed(0)

		--TURN nano2 to z-axis <0> SPEED <301.61>;
		self.Spinners.nano2:SetGoal(0)
		self.Spinners.nano2:SetSpeed(301.61)

		--TURN nano1 to z-axis <0> SPEED <301.61>;
		self.Spinners.nano1:SetGoal(0)
		self.Spinners.nano1:SetSpeed(301.61)

		--SLEEP <388>;
		WaitSeconds(0.4)

		--TURN cylinder5 to y-axis <0> SPEED <167.13>;
		self.Spinners.cylinder5:SetGoal(0)
		self.Spinners.cylinder5:SetSpeed(170)

		--TURN cylinder6 to y-axis <0> SPEED <173.35>;
		self.Spinners.cylinder6:SetGoal(0)
		self.Spinners.cylinder6:SetSpeed(170)

		--SLEEP <579>;
		WaitSeconds(0.6)

		--MOVE cylinder1 to x-axis <0.39> SPEED <37.00>;
		self.Sliders.cylinder1:SetGoal(0,0,0)
		self.Sliders.cylinder1:SetSpeed(37)

		--MOVE cylinder2 to x-axis <0.35> SPEED <38.00>;
		self.Sliders.cylinder2:SetGoal(0,0,0)
		self.Sliders.cylinder2:SetSpeed(37)

		--SLEEP <281>;
		WaitSeconds(0.3)

		--MOVE cylinder3 to x-axis <0.29> SPEED <39.00>;
		self.Sliders.cylinder3:SetGoal(0,0,0)
		self.Sliders.cylinder3:SetSpeed(39)

		--MOVE cylinder4 to x-axis <0.20> SPEED <39.00>;
		self.Sliders.cylinder4:SetGoal(0,0,0)
		self.Sliders.cylinder4:SetSpeed(39)

		--SLEEP <269>;
		WaitSeconds(0.25)

		--MOVE cylinder5 to x-axis <0.24> SPEED <40.00>;
		self.Sliders.cylinder5:SetGoal(0,0,0)
		self.Sliders.cylinder5:SetSpeed(40)

		--MOVE cylinder6 to x-axis <0.34> SPEED <41.00>;
		self.Sliders.cylinder6:SetGoal(0,0,0)
		self.Sliders.cylinder6:SetSpeed(40)

		--SLEEP <260>;
		WaitSeconds(0.25)

		--SLEEP <20>;
		TAconstructor.Close(self)
	end,
}

TypeClass = ARMAVP
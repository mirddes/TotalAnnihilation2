#ARM Podger - Mine Layer Vehicle
#ARMMLV
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMMLV = Class(TAconstructor) {

	OnCreate = function(self)
		self.Spinners = {
			Tires1 = CreateRotator(self, 'Tires1', 'x', nil, 0, 0, 0),
			Tires2 = CreateRotator(self, 'Tires2', 'x', nil, 0, 0, 0),
			door1 = CreateRotator(self, 'door1', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'door2', 'z', nil, 0, 0, 0),
			post = CreateRotator(self, 'post', 'y', nil, 0, 0, 0),
			nanogun = CreateRotator(self, 'nanogun', 'x', nil, 0, 0, 0),
		}
		self.Sliders = {
			plate = CreateSlider(self, 'plate'),
			door1 = CreateSlider(self, 'door1'),
			door2 = CreateSlider(self, 'door2'),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		for k, v in self.Sliders do
			self.Trash:Add(v)
		end
		TAconstructor.OnCreate(self)
	end,

	OnMotionHorzEventChange = function(self, new, old )
		TAconstructor.OnMotionHorzEventChange(self, new, old)
		if (new == 'Cruise') then
			self.Spinners.Tires1:SetSpeed(150)
			self.Spinners.Tires2:SetSpeed(150)
		elseif (new == 'Stopped') then
			self.Spinners.Tires1:SetSpeed(0)
			self.Spinners.Tires2:SetSpeed(0)
		end
	end,

	Open = function(self)

		--TURN door1 to z-axis <-91.33> SPEED <195.20>;
		self.Spinners.door1:SetGoal(90)
		self.Spinners.door1:SetSpeed(193.5)

		--TURN door2 to z-axis <90.09> SPEED <192.57>;
		self.Spinners.door2:SetGoal(-90)
		self.Spinners.door2:SetSpeed(193.5)

		--SLEEP <468>;
		WaitSeconds(0.45)

		--MOVE door1 to y-axis <-1.85> SPEED <3.00>;
		self.Sliders.door1:SetGoal(-1.9,0,0)
		self.Sliders.door1:SetSpeed(3.5)

		--MOVE door2 to y-axis <-1.95> SPEED <4.00>;
		self.Sliders.door2:SetGoal(1.9,0,0)
		self.Sliders.door2:SetSpeed(3.5)

		--SLEEP <471>;
		WaitSeconds(0.45)

		--MOVE plate to y-axis <2.95> SPEED <6.00>;
		self.Sliders.plate:SetGoal(0,2.95,0)
		self.Sliders.plate:SetSpeed(6)

		--SLEEP <471>;
		WaitSeconds(0.45)

		--SLEEP <24>;

		TAconstructor.Open(self)
	end,

	Aim = function(self,target)
		local selfPosition = self:GetPosition('post') 
		local targetPosition = target:GetPosition()
			
		--TURN gun to y-axis buildheading SPEED <160.03>;
		self.Spinners.post:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.post:SetSpeed(160.03)
		WaitFor(self.Spinners.post)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('Muzzle') 

		self.Spinners.nanogun:SetGoal(TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y) + 270)
		self.Spinners.nanogun:SetSpeed(160.03)
		WaitFor(self.Spinners.nanogun)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)

		self.Spinners.post:SetGoal(0)
		self.Spinners.post:SetSpeed(160.03)
		WaitFor(self.Spinners.post)

		--TURN gun to y-axis <0> SPEED <160.03>;
		self.Spinners.nanogun:SetGoal(0)
		self.Spinners.nanogun:SetSpeed(160.03)

		--MOVE plate to y-axis <0> SPEED <6.00>;
		self.Sliders.plate:SetGoal(0,0,0)
		self.Sliders.plate:SetSpeed(6)

		--SLEEP <426>;
		WaitSeconds(0.4)

		--MOVE door1 to y-axis <0> SPEED <4.00>;
		self.Sliders.door1:SetGoal(0,0,0)
		self.Sliders.door1:SetSpeed(4)

		--MOVE door2 to y-axis <0> SPEED <4.00>;
		self.Sliders.door2:SetGoal(0,0,0)
		self.Sliders.door2:SetSpeed(4)

		--SLEEP <428>;
		WaitSeconds(0.4)

		--TURN door1 to z-axis <0> SPEED <213.45>;
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(211)

		--TURN door2 to z-axis <0> SPEED <210.57>;
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(211)

		--SLEEP <428>
		WaitSeconds(0.4)

		--SLEEP <22>

		TAconstructor.Close(self)
	end,
}
TypeClass = ARMMLV
#ARM Construction Hovercraft - Tech Level 1
#ARMCH
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMCH = Class(TAconstructor) {

	OnCreate = function(self)
		self.Spinners = {
			door1 = CreateRotator(self, 'door1', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'door2', 'z', nil, 0, 0, 0),
			nanogun = CreateRotator(self, 'nanogun', 'x', nil, 0, 0, 0),
			turret = CreateRotator(self, 'turret', 'y', nil, 0, 0, 0),
			post = CreateRotator(self, 'post', 'x', nil, 0, 0, 0),
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

	Open = function(self)

		--TURN door1 to z-axis <-67.14> SPEED <99.20>;
		self.Spinners.door1:SetGoal(67.14)
		self.Spinners.door1:SetSpeed(99.20)

		--TURN door2 to z-axis <67.14> SPEED <99.20>;
		self.Spinners.door2:SetGoal(-67.14)
		self.Spinners.door2:SetSpeed(99.20)

		--SLEEP <677>;
		WaitSeconds(0.7)

		--MOVE door1 to y-axis <-2.00> SPEED <2.00>;
		self.Sliders.door1:SetGoal(-2,-0.75,0)
		self.Sliders.door1:SetSpeed(2)

		--MOVE door2 to y-axis <-2.00> SPEED <2.00>;
		self.Sliders.door2:SetGoal(2,-0.75,0)
		self.Sliders.door2:SetSpeed(2)

		--MOVE plate to y-axis <3.99> SPEED <5.00>;
		self.Sliders.plate:SetGoal(0,3.5,0) #too high
		self.Sliders.plate:SetSpeed(5)

		--SLEEP <688>;
		WaitSeconds(0.7)

		--TURN post to x-axis <90.00> SPEED <131.03>;
		self.Spinners.post:SetGoal(90)
		self.Spinners.post:SetSpeed(131.03)

		--TURN nanogun to x-axis <-90.00> SPEED <160.03>;
		self.Spinners.nanogun:SetGoal(-90)
		self.Spinners.nanogun:SetSpeed(160.03)

		--SLEEP <687>;
		WaitSeconds(0.7)

		--SLEEP <39>;
		TAconstructor.Open(self)
	end,

	Aim = function(self,target)
		#Aim at build job
		local selfPosition = self:GetPosition('turret') 
		local targetPosition = target:GetPosition()
			
		--TURN turret to y-axis buildheading SPEED <160.03>;
		self.Spinners.turret:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.turret:SetSpeed(160.03)
		WaitFor(self.Spinners.turret)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('muzzle') 

		self.Spinners.nanogun:SetGoal(-180 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y))
		self.Spinners.nanogun:SetSpeed(45.01)

		WaitFor(self.Spinners.nanogun)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)
			
		self.Spinners.turret:SetGoal(0)
		self.Spinners.turret:SetSpeed(160.03)
		WaitFor(self.Spinners.turret)

		--TURN post to x-axis <0> SPEED <196.98>;
		self.Spinners.post:SetGoal(0)
		self.Spinners.post:SetSpeed(196.98)

		--TURN nanogun to x-axis <0> SPEED <196.98>;
		self.Spinners.nanogun:SetGoal(0)
		self.Spinners.nanogun:SetSpeed(196.98)

		--SLEEP <457>;
		WaitSeconds(0.45)

		--MOVE door1 to y-axis <0> SPEED <4.00>;
		self.Sliders.door1:SetGoal(0,0,0)
		self.Sliders.door1:SetSpeed(4)

		--MOVE door2 to y-axis <0> SPEED <4.00>;
		self.Sliders.door2:SetGoal(0,0,0)
		self.Sliders.door2:SetSpeed(4)

		--MOVE plate to y-axis <0> SPEED <8.00>;
		self.Sliders.plate:SetGoal(0,0,0)
		self.Sliders.plate:SetSpeed(8)

		--SLEEP <471>;
		WaitSeconds(0.45)

		--TURN door1 to z-axis <0> SPEED <143.20>;
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(143.20)

		--TURN door2 to z-axis <0> SPEED <143.20>;
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(143.20)

		--SLEEP <469>;
		WaitSeconds(0.45)

		--SLEEP <27>;
		TAconstructor.Close(self)
	end,
}

TypeClass = ARMCH
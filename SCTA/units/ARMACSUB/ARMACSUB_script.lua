#ARM Advanced Construction Sub - Tech Level 2
#ARMACSUB
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

ARMACSUB = Class(TAconstructor) {

	OnCreate = function(self)
		self.Spinners = {
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

	Open = function(self)

		--TURN door1 to z-axis <-67.41> SPEED <108.58>;
		self.Spinners.door1:SetGoal(67.41)
		self.Spinners.door1:SetSpeed(108.58)

		--TURN door2 to z-axis <67.41> SPEED <108.58>;
		self.Spinners.door2:SetGoal(-67.41)
		self.Spinners.door2:SetSpeed(108.58)

		--SLEEP <621>;
		WaitSeconds(0.6)

		--MOVE door1 to y-axis <-3.14> SPEED <5.00>;
		self.Sliders.door1:SetGoal(-3.10,0,0)
		self.Sliders.door1:SetSpeed(4.5)

		--MOVE door1 to y-axis <-3.10> SPEED <4.00>;
		self.Sliders.door2:SetGoal(3.10,0,0)
		self.Sliders.door2:SetSpeed(4.5)

		--SLEEP <627>;
		WaitSeconds(0.6)

		--MOVE plate to y-axis <5.65> SPEED <8.00>;
		self.Sliders.plate:SetGoal(0,5,0) #5.65 is too high
		self.Sliders.plate:SetSpeed(8)

		--SLEEP <628>;
		WaitSeconds(0.6)

		--SLEEP <31>;

		TAconstructor.Open(self)
	end,

	Aim = function(self,target)
		local selfPosition = self:GetPosition('post') 
		local targetPosition = target:GetPosition()
			
		--TURN post to y-axis buildheading SPEED <160.03>;
		self.Spinners.post:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.post:SetSpeed(160.03)
		WaitFor(self.Spinners.post)
		
		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('muzzle') 

		self.Spinners.nanogun:SetGoal(-90 + TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y))
		self.Spinners.nanogun:SetSpeed(160.03)
		WaitFor(self.Spinners.nanogun)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)

		self.Spinners.post:SetGoal(0)
		self.Spinners.post:SetSpeed(160.03)

		self.Spinners.nanogun:SetGoal(0)
		self.Spinners.nanogun:SetSpeed(160.03)
		WaitFor(self.Spinners.nanogun)
		WaitFor(self.Spinners.post)

		--MOVE plate to y-axis <0> SPEED <9.00>;
		self.Sliders.plate:SetGoal(0,0,0)

		self.Sliders.plate:SetSpeed(9)
		--SLEEP <621>;
		WaitSeconds(0.6)

		--MOVE door1 to y-axis <0> SPEED <5.00>;
		self.Sliders.door1:SetGoal(0,0,0)
		self.Sliders.door1:SetSpeed(4.5)

		--MOVE door2 to y-axis <0> SPEED <4.00>;
		self.Sliders.door2:SetGoal(0,0,0)
		self.Sliders.door2:SetSpeed(4.5)

		--SLEEP <627>;
		WaitSeconds(0.6)

		--TURN door1 to z-axis <0> SPEED <107.37>;
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(107.37)

		--TURN door2 to z-axis <0> SPEED <107.37>;
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(107.37)

		--SLEEP <628>
		WaitSeconds(0.6)

		--SLEEP <31>

		TAconstructor.Close(self)
	end,
}

TypeClass = ARMACSUB
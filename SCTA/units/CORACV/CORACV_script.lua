#CORE Adv. Construction Vehicle - Tech Level 2
#CORACV
#
#Blueprint created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORACV = Class(TAconstructor) {

	OnCreate = function(self)

		self.Spinners = {
			door1 = CreateRotator(self, 'door1', 'z', nil, 0, 0, 0),
			door2 = CreateRotator(self, 'door2', 'z', nil, 0, 0, 0),
			stand = CreateRotator(self, 'stand', 'y', nil, 0, 0, 0),
			gun = CreateRotator(self, 'gun', 'x', nil, 0, 0, 0),
		}
		self.Sliders = {
			stand = CreateSlider(self, 'stand'),
			gun = CreateSlider(self, 'gun'),
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
		--TURN door1 to z-axis <-103.89> SPEED <101.97>;
		self.Spinners.door1:SetGoal(104)
		self.Spinners.door1:SetSpeed(102)

		--TURN door2 to z-axis <103.73> SPEED <101.82>;
		self.Spinners.door2:SetGoal(-104)
		self.Spinners.door2:SetSpeed(102)

		--SLEEP <1019>;
		WaitSeconds(1)

		--TURN door1 to z-axis <-206.54> SPEED <308.35>;
		self.Spinners.door1:SetGoal(207)
		self.Spinners.door1:SetSpeed(308)

		--TURN door2 to z-axis <207.44> SPEED <311.51>;
		self.Spinners.door2:SetGoal(-207)
		self.Spinners.door2:SetSpeed(308)

		--SLEEP <333>;
		WaitSeconds(0.3)

		--MOVE stand to y-axis <4.09> SPEED <12.00>;
		self.Sliders.stand:SetGoal(0,4.1,0)
		self.Sliders.stand:SetSpeed(12)

		--MOVE gun to y-axis <0.70> SPEED <2.00>;
		self.Sliders.gun:SetGoal(0,0.7,0)
		self.Sliders.gun:SetSpeed(2)

		--SLEEP <333>;
		WaitSeconds(0.3)

		--SLEEP <12>;
		TAconstructor.Open(self)
	end,

	Aim = function(self,target)
		local selfPosition = self:GetPosition('stand') 
		local targetPosition = target:GetPosition()
			
		--TURN turret to y-axis buildheading SPEED <160.03>;
		self.Spinners.stand:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.stand:SetSpeed(160.03)
		WaitFor(self.Spinners.stand)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('gun') 

		self.Spinners.gun:SetGoal(TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y) + 270)
		self.Spinners.gun:SetSpeed(160.03)
		WaitFor(self.Spinners.gun)
		TAconstructor.Aim(self, target)
	end,

	Close = function(self)
		self.Spinners.gun:SetGoal(0)
		self.Spinners.gun:SetSpeed(160.03)

		self.Spinners.stand:SetGoal(0)
		self.Spinners.stand:SetSpeed(160.03)

		WaitFor(self.Spinners.gun)
		WaitFor(self.Spinners.stand)

		--MOVE stand to y-axis <0> SPEED <5.00>;
		self.Sliders.stand:SetGoal(0,0,0)
		self.Sliders.stand:SetSpeed(5)

		--MOVE gun to y-axis <0> SPEED <0>;
		self.Sliders.gun:SetGoal(0,0,0)
		self.Sliders.gun:SetSpeed(2)

		--SLEEP <718>;
		WaitSeconds(0.7)

		--TURN door1 to z-axis <-103.89> SPEED <210.41>;
		self.Spinners.door1:SetGoal(104)
		self.Spinners.door1:SetSpeed(210)

		--TURN door2 to z-axis <103.73> SPEED <212.57>;
		self.Spinners.door2:SetGoal(-104)
		self.Spinners.door2:SetSpeed(210)

		--SLEEP <488>;
		WaitSeconds(0.5)

		--TURN door1 to z-axis <0> SPEED <212.94>;
		self.Spinners.door1:SetGoal(0)
		self.Spinners.door1:SetSpeed(213)

		--TURN door2 to z-axis <0> SPEED <212.63>;
		self.Spinners.door2:SetGoal(0)
		self.Spinners.door2:SetSpeed(213)

		--SLEEP <488>;
		WaitSeconds(0.5)

		--SLEEP <8>;

		TAconstructor.Close(self)
	end,
}

TypeClass = CORACV